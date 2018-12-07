<?php
/**
 * Created by PhpStorm.
 * User: gaoxi
 * Date: 2017-09-04
 * Time: 0:25
 */
namespace Pay\Controller;

use Common\Service\UpstreamNotifyLogService;


/**
 * 第三方接口开发示例控制器
 * Class DemoController
 * @package Pay\Controller
 *
 */

class KltwyController extends PayController
{

    const CONTROLLER_NAME = 'Kltwy';

    const WY_PAY_TYPE = 1;

    /**
     *  发起支付
     */
    public function Pay($array)
    {
        $body    = I('request.pay_productname');
        $money = intval(I('request.pay_amount')) * 100;
        $data    = $this->getParameter('开联通网银直连', $array, __CLASS__, 100);
        //$notifyurl = $this->_site . 'Pay_Kltwy_notifyurl.html';
        //!使用代理服务器执行回调
        $notifyurl = 'http://47.92.69.102/kltwy/notify';
        $callbackurl = $this->_site . 'Pay_Kltwy_callbackurl.html';
        $parameter = [
            'inputCharset' => '1',
            'pickupUrl' => $callbackurl,
            'receiveUrl' => $notifyurl,
            'version' => 'v1.0',
            'language' => '1',
            'signType' => '0',
            'merchantId' => $data['mch_id'],

            'payerName' => $_REQUEST['payerName']?: '',
            'payerEmail' => $_REQUEST['payerEmail']?: '',
            'payerTelephone' => $_REQUEST['payerTelephone']?: '',
            'payerAcctNo' => $_REQUEST['payerAcctNo']?: '',

            'orderNo' => $data['orderid'],
            'orderAmount' =>$money, 
            'orderCurrency' => '156',
            'orderDatetime' => date("YmdHis", $data['timestamp']), //日期格式YmdHis
            'orderExpireDatetime' => '10',
            'productName' => (string)$body, 

            'productPrice' => $_REQUEST['productPrice']?: '',
            'productNum' => $_REQUEST['productNum']?: '1',
            'productId' => $_REQUEST['productId']?: '',
            'productDesc' => $_REQUEST['productDesc']?: '',
            'ext1' => $_REQUEST['ext1']?: '',
            'ext2' => $_REQUEST['ext2']?: '',
            'extTL' => $_REQUEST['extTL']?: '',

            'payType' => self::WY_PAY_TYPE,
        ];
        $key = $data['signkey'];
        $sign = $this->sign($parameter,$key);
        $parameter['sign'] = $sign;
        echo $this->createHtml($parameter, $data['gateway']);
    }


    public function sign($params,$apikey)
    {
        ksort($params);
        $sign = '';
        foreach ($params as $k => $v) {
            if($v===''){
                continue;
            }
            $sign = $sign . $k . '=' . $v . '&';
        }
        //var_dump($sign);die;
        $sign = strtoupper(md5($sign . 'key=' . $apikey));
        return $sign;
    }


    public function createHtml($params, $url)
    {
        $html = '<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body onload="javascript:document.pay_form.submit();">
            <form id="pay_form" name="pay_form" action="' . $url . '" method="post">';
        foreach ($params as $key => $value) {
            $html .= "<input type=\"hidden\" name=\"{$key}\" id=\"{$key}\" value='{$value}' />\n";
        }
        $html .= '<!-- <input type="submit" type="hidden">--></form></body></html>';
        return $html;
    }

    /**
     * 页面通知
     */
    public function callbackurl()
    {
        $Order = M("Order");
        $typename = $this->typename;
        //$pay_status = $Order->where("pay_orderid = '" . $_REQUEST["orderid"] . "'")->getField("pay_status");
        if (1) {
            echo "支付成功";die;
            //$this->EditMoney($_REQUEST["orderid"], $typename, 1);
        } else {
            exit("error");
        }
    }

    /**
     *  服务器通知
     */
    public function notifyurl()
    {
        $orderno = $_POST['orderNo'];

        $log = new UpstreamNotifyLogService();
        $ident = $log->autochaname(__CLASS__, __FUNCTION__, UpstreamNotifyLogService::CHA_TRIM_CONTROLLER);
        $log->paylog($orderno, NULL, $ident);
        

        if ($_POST['payResult'] != 1) {
            log_nonsuc_notify($orderno, file_get_contents("php://input"), self::CONTROLLER_NAME);
            exit;
        }

        $orderInfo = M("Order")->where(['pay_orderid'=>$orderno])->field("key,pay_orderid")->find();
        $apikey = $orderInfo['key'];
        
        //klt这里的数据传递有bug
        //估计是klt用的是application/json头，但php转成支持的application/x-www-form-urlencode
        $post = $_POST;
        foreach ($post as $k => $v) {
            if ($v == 'null')
                unset($post[$k]);
        }

        unset($post['sign']);
        $str = strtoupper(self::sign($post, $apikey));

        $sign = $_POST['sign'];
        if ($sign == $str) {
            $res = $this->EditMoney($orderInfo["pay_orderid"], self::CONTROLLER_NAME, 0);
            ob_clean();
            F("gaga", false == $res? 'error': 'success');
            echo false == $res? 'error': 'success';

            exit;
        } else {
            ob_clean();
            \Think\Log::write(self::CONTROLLER_NAME." notify callback failed[sign failed]. info:". file_get_contents("php://input"), 'ALERT');
            echo "error";
            exit;
        }

    }


    public function query($order, $conf) 
    {
        
        $apikey = $conf['signkey'];
        $queurl = $conf['queryreturn'];

        $body['orderNo'] = $order['orderNo'];
        $body['orderDateTime'] = date("YmdHis", $order['searchtime']);
        $body['queryDateTime'] = date("YmdHis");

        $head['version'] = '18';
        $head['merchantId'] = $conf['mch_id'];
        $head['signType'] = '1';
        
        $contents = array_merge($head,$body);

        $str = self::arrayToString($contents);
        $sign = strtoupper(md5($str.'&key='.$apikey));

        //3.拼装发送信息
        $data = array();
        $head['sign'] = $sign;
        $data['head'] = $head;
        $data['content'] = $body;

        $json = self::send_post_curl($queurl, $data);

        $log = new UpstreamNotifyLogService();
        $ident = $log->autochaname(__CLASS__, __FUNCTION__, UpstreamNotifyLogService::CHA_TRIM_CONTROLLER);
        $log->paylog($order['orderNo'], $json, $ident);
        
        echo $json;exit;
    }

    //签名前数组转字符串
    private static function arrayToString($data) {
        ksort($data);
        $query = '';
        foreach ($data as $key => $value) {
            if ($key=='sign' || $key == 'signMsg' || $value === '' || $value === null ) {
                continue;
            }
            $query .= $key."=".$value."&";
        }
        return substr($query, 0, -1);
    }

    private static function send_post_curl($url,$data = []){
        $data = json_encode($data);

        $ch = curl_init();
        //设置选项，包括URL
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-type: application/json;charset=UTF-8','Content-Length: ' . strlen($data)));
        curl_setopt($ch,CURLOPT_TIMEOUT,5);
        // POST数据
        curl_setopt($ch, CURLOPT_POST, 1);
        // 把post的变量加上
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        //执行并获取url地址的内容
        $output = curl_exec($ch);
        $header = curl_getinfo($ch);
        $http_code = $header['http_code'];
        //释放curl句柄
        curl_close($ch);
        if(200 != $http_code) {
            $log['output'] = $output;
            $log['requestData'] = $data;
            $log['curl_header'] = $header;
            //记日志哈
            return null;
        }
        return $output;
    }

}
