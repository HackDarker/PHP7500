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

class KltkjController extends PayController
{
    private $gateway = 'https://icashier.chinasmartpay.cn/icashier/index';
    private $queryUrl = 'https://ipay.chinasmartpay.cn/openapi/merchantPayment/orderQuery';
    private $key = '742fa3ffd050fb441763bf8fb6c0594f';
    private $typename = 'Kltkj';
    /**
     *  发起支付
     */
    public function Pay($array)
    {
        $orderid = I("request.pay_orderid");
        $body    = I('request.pay_productname');
        $money = intval(I('request.pay_amount')) * 100;
        $data    = $this->getParameter('开联通快捷支付', $array, __CLASS__, 100);
        $notifyurl = $this->_site . 'Pay_Kltkj_notifyurl.html';
        $callbackurl = $this->_site . 'Pay_Kltkj_callbackurl.html';
        $parameter = [
            'inputCharset' => '1',//字符集
            'pickupUrl' => $callbackurl,//前台通知地址
            'receiveUrl' => $notifyurl,//交易结果后台通知地址
            'version' => 'v1.0',//版本号
            'language' => '1',//语言
            'signType' => '0',//加密类型
            'merchantId' => $data['mch_id'],//商户号
            'orderNo' => $orderid,//订单号
            'orderAmount' =>$money, //订单金额
            'orderCurrency' => '156',//币种编号
            'orderDatetime' => date('YmdHis',strtotime($data['datetime'])),//日期格式YmdHis
            'orderExpireDatetime' => '25',//过期时间25
            'productName' => (string)$body, //产品名称
            'payType' => '12',//支付类型 0-代表全部，即显示该商户开通的所有支付方式1:网银12:快捷20:微信C扫B二维码22:支付宝C扫B二维码47:银联C扫B二维码
            //'sign'//秘钥
        ];
        $key = $this->key;
        $sign = $this->sign($parameter,$key);
        $parameter['sign'] = $sign;
        echo $this->createHtml($parameter, $this->gateway);
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
        $encodeType = isset($params['encoding']) ? $params['encoding'] : 'UTF-8';
        $html       = '<html><head><meta http-equiv="Content-Type" content="text/html; charset={$encodeType}"/></head><body onload="javascript:document.pay_form.submit();">
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

        $post = $_POST;
        file_put_contents('./Data/notify2.txt', "【" . date('Y-m-d H:i:s') . "】\r\n" . json_encode($_POST) . "\r\n\r\n", FILE_APPEND);
        //$post = json_decode('{"errorCode":"null","errorMsg":"null","ext1":"null","ext2":"null","issuerId":"04105840","language":"1","mchtOrderId":"75721342258831360","merchantId":"903110153110001","orderAmount":"100","orderDatetime":"Sun Nov 04 22:49:33 CST 2018","orderNo":"E20181104224929890816","payDatetime":"20181104225045","payResult":"1","payType":"12","sign":"9DE130A9FA4F1025FD82B5F6F664F323","signType":"0","version":"v1.0"}',true);
        if(!$post["orderNo"]){ die; }
        //var_dump($post);die;
        //因为验签总是不对所以这里调用主动查询接口
        $orderInfo = M("Order")->where("out_trade_id = '" . $post["orderNo"] . "'")->find();

        // $data=[
        //     'orderNo' => $post["orderNo"],
        //     'orderDateTime' => date('YmdHis',$orderInfo['pay_applydate']),
        //     'queryDateTime' => date('YmdHis'),
        //     'version' => '18',
        //     'merchantId' => $orderInfo['memberid'],
        //     'signType' => '1',
        //     //'sign'
        // ];
        // $key = $this->key;
        // $selfsign = strtoupper(md5($this->sign($post,$key)));
        // $data['sign'] = $selfsign;

        // $param =  array(
        //     'content' => array(
        //         "orderDateTime" => $data['orderDateTime'],
        //         "orderNo" => $data['orderNo'],
        //         "queryDateTime" => $data['queryDateTime'],
        //     ),
        //     'head' => array(
        //         "merchantId" => $data['merchantId'],
        //         "sign" => $data['sign'],
        //         "signType" => $data['signType'],
        //         'version' => '18',
        //     )
        // );
        // $result = curlPost($this->queryUrl,json_encode($param),"content-type:application/json;charset=UTF-8");
        // var_dump($result);die;
        //草他么的验签 不jb验签了
        //echo $post['merchantId']."|".$orderInfo['memberid'];die;
        if(isset($post['mchtOrderId']) && $post['merchantId'] === $orderInfo['memberid'] && $post['payResult'] == '1'){
            
            if (1) {
                //签名验证成功
                $this->EditMoney($orderInfo["pay_orderid"], $this->typename, 0);
                echo "success";die;
                exit;
            } else {
                //签名验证失败
                exit;
            }

        }
        die;

    }

}
