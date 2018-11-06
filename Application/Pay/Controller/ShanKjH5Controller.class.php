<?php
/**
 * Created by PhpStorm.
 * User: gaoxi
 * Date: 2017-09-04
 * Time: 0:25
 */
namespace Pay\Controller;

/**
 * 第三方接口开发示例控制器
 * Class DemoController
 * @package Pay\Controller
 *
 * 三方通道接口开发说明：
 * 1. 管理员登录网站后台，供应商管理添加通道，通道英文代码即接口类名称
 * 2. 用户管理-》通道-》指定该通道（独立或轮询）
 * 3. 用户费率优先通道费率
 * 4. 用户通道指定优先系统默认支持产品通道指定
 * 5. 三方回调地址URL写法，如本接口 ：
 *    异步地址：http://www.yourdomain.com/Pay_Demo_notifyurl.html
 *    跳转地址：http://www.yourdomain.com/Pay_Demo_callbackurl.html
 *
 *    注：下游对接请查看商户API对接文档部分.
 */

class ShanKjH5Controller extends PayController
{
    protected $publicCertPath = './cert/sandpay/sand.cer';

    /**
     *  发起支付
     */
    public function Pay($array)
    {
        $orderid = I("request.pay_orderid");
        $body    = I('request.pay_productname');
        $data    = $this->getParameter('杉德(快捷H5)', $array, __CLASS__, 100);
        //获取私钥，公钥
        $prikey = $this->loadPk12Cert($data['appid'], $data['appsecret']);
        $pubkey = $this->loadX509Cert($data['signkey']);

        $jsonData = [
            'head' => [
                'version'     => '1.0',
                'method'      => 'sandpay.trade.pay',
                'productId'   => '00000008',
                'accessType'  => '1',
                'mid'         => $data['mch_id'],
                'channelType' => '07',
                'reqTime'     => date('YmdHis'),
            ],

            'body' => [
                'orderCode'   => $data['orderid'],
                'totalAmount' => str_pad($data['amount'], 12, '0', STR_PAD_LEFT),
                'subject'     => 'pay',
                'body'        => 'pay',
                'payMode'     => 'sand_h5',
                'payExtra'    => '',
                'clientIp'    => getIP(),
                'notifyUrl'   => $data['notifyurl'],
                'frontUrl'    => $data['callbackurl'],
            ],
        ];

        $jsonData = json_encode($jsonData);
        $sign     = rsaEncryptVerify($jsonData, $prikey);

        $params = [
            'charset'  => 'utf-8',
            'signType' => '01',
            'data'     => $jsonData,
            'sign'     => $sign,
        ];
        $respond = curlPost($data['gateway'], http_build_query($params), ['Content-Type: application/x-www-form-urlencoded']);
        parse_str(urldecode($respond), $arr);

        $arr['data'] = str_replace(array("  ", "\t", "\n", "\r"), array('', '', '', ''), $arr['data']);

        $data = json_decode($arr['data'], 320);
        if ($data['head']['respCode'] == "000000") {
            $credential = str_replace(array('"{', '}"'), array('{', '}'), stripslashes($data['body']['credential']));
            $cutStr     = $this->cut("id='signature' value='", "==", $credential);
            $newStr     = str_replace(' ', '+', $cutStr);
            $credential = str_replace($cutStr, $newStr, $credential);
            echo $credential;
        } else {
            print_r($arr['data']);
        }

    }

    /**
     * 页面通知
     */
    public function callbackurl()
    {
        $Order = M("Order");
 
        $data       = json_decode($_REQUEST['data'], true);
        
        $pay_status = $Order->where(['pay_orderid' => $data['body']['orderCode']])->getField("pay_status");
        if ($pay_status != 0) {
            $this->EditMoney($data['body']['orderCode'], '', 1);
        } else {
            exit("error");
        }
    }

    /**
     *  服务器通知
     */
    public function notifyurl()
    {

        file_put_contents('./Data/notify.txt', "【" . date('Y-m-d H:i:s') . "】\r\n" . file_get_contents("php://input") . "\r\n\r\n", FILE_APPEND);
        if ($_POST) {
            $pubkey = $this->loadX509Cert($this->publicCertPath);
            $sign   = base64_decode($_POST['sign']); //签名
            $data   = stripslashes($_POST['data']); //支付数据
            $result = json_decode($data, true); //data数据

            if (rsaEncryptVerify($data, $pubkey, $sign) && $result['body']['orderStatus'] == 1) {
                //签名验证成功
                $this->EditMoney($result['body']["orderCode"], '', 0);
                echo "respCode=000000";
                exit;
            } else {
                //签名验证失败
                exit;
            }

        }

    }

    /********************************************辅助方法**************************************************/

    public function cut($begin, $end, $str)
    {
        $b = mb_strpos($str, $begin) + mb_strlen($begin);
        $e = mb_strpos($str, $end) - $b;

        return mb_substr($str, $b, $e);
    }

    /**
     *获取公钥
     *@param  [$path]
     *@return [mixed]
     *@throws [\Exception]
     */
    protected function loadX509Cert($path)
    {
        $file   = file_get_contents($path);
        $cert   = chunk_split(base64_encode($file), 64, "\n");
        $cert   = "-----BEGIN CERTIFICATE-----\n" . $cert . "-----END CERTIFICATE-----\n";
        $res    = openssl_pkey_get_public($cert);
        $detail = openssl_pkey_get_details($res);
        openssl_free_key($res);
        return $detail['key'];
    }

    /**
     * 获取私钥
     * @param  [$path]
     * @param  [$pwd]
     * @return [mixed]
     * @throws [\Exception]
     */
    protected function loadPk12Cert($path, $pwd)
    {
        $file = file_get_contents($path);
        openssl_pkcs12_read($file, $cert, $pwd);
        return $cert['pkey'];
    }

    /**
     * 对数组变量进行JSON编码，为了（本系统的PHP版本为5.3.0）解决PHP5.4.0以上才支持的JSON_UNESCAPED_UNICODE参数
     *@param mixed array 待编码的 array （除了resource 类型之外，可以为任何数据类型，改函数只能接受 UTF-8 编码的数据）
     *@return  string （返回 array 值的 JSON 形式）
     *@author
     * @d/t     2017-07-17
     */
    protected function json_encodes($array)
    {

        if (version_compare(PHP_VERSION, '5.4.0', '<')) {
            $str = json_encode($array);
            $str = preg_replace_callback("#\\\u([0-9a-f]{4})#i", function ($matchs) {
                return iconv('UCS-2BE', 'UTF-8', pack('H4', $matchs[1]));
            }, $str);
            return $str;
        } else {
            return json_encode($array, 320);
        }
    }

    /**
     * 分割字符串
     * @param String $str  要分割的字符串
     * @param int $length  指定的长度
     * @param String $end  在分割后的字符串块追加的内容
     */
    protected function mb_chunk_split($string, $length, $end, $once = false)
    {
        $string = iconv('gb2312', 'utf-8//ignore', $string);
        $array  = array();
        $strlen = mb_strlen($string);
        while ($strlen) {
            $array[] = mb_substr($string, 0, $length, "utf-8");
            if ($once) {
                return $array[0] . $end;
            }

            $string = mb_substr($string, $length, $strlen, "utf-8");
            $strlen = mb_strlen($string);
        }
        $str = implode($end, $array);
        return $str . '%0A';
    }

    protected function mb_array_chunk($arr)
    {

        $credential                   = json_decode($arr['body']['credential'], true);
        $credential['params']['orig'] = $this->mb_chunk_split($credential['params']['orig'], 76, '%0A');
        $credential['params']['sign'] = $this->mb_chunk_split($credential['params']['sign'], 76, '%0A');
        $arr['body']['credential']    = str_replace(array('==', '+', '='), array('%3D%3D', '%2B', '%3D'), $this->json_encodes($credential));

        return $this->json_encodes($arr);

    }

}
