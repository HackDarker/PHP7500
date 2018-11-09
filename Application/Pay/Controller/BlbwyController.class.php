<?php
/**
 * User: guopong
 * Date: 2017-11-8
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

class BlbwyController extends PayController
{

    const ISAPP_DEFAULT = 'web';

    private static $isapp_types = ['app', 'web', 'H5'];

    private $gateway = 'https://ebank.nfoooo.com/payment/v1/order/';
    private $typename = 'Blbwy';
    

    public function __construct()
    {
        parent::__construct();   
    }

    /**
     *  发起支付
     */
    public function Pay($array)
    {
        $orderid = I("request.pay_orderid");
        $body    = I('request.pay_productname');
        $money = intval(I('request.pay_amount'));
        $data    = $this->getParameter('百乐宝网银支付', $array, __CLASS__, 1);
        $notifyurl = $this->_site . 'Pay_Blbwy_notifyurl.html';
        $callbackurl = $this->_site . 'Pay_Blbwy_callbackurl.html';
        
        $apikey = $data['signkey'];
        
        $params['orderNo'] = $orderid;                          //商户订单号，务必确保在系统中唯一，必填
        $params['totalFee'] = $money;               //订单金额，单位为RMB元，必填
        //$params['defaultbank'] = "QUICKPAY";         //网银代码，当支付方式为bankPay时，该值为空；支付方式为directPay时该值必传
        $params['title'] = (string)$body;                              //商品的名称，请勿包含字符，选填
        //$params['paymethod'] = 'directPay';             //支付方式，directPay：直连模式；bankPay：收银台模式，必填
        $params['paymethod'] = 'bankPay';             //支付方式，directPay：直连模式；bankPay：收银台模式，必填
        $params['service'] = "online_pay";                      //固定值online_pay，表示网上支付，必填
        $params['paymentType'] = "1";                           //支付类型，固定值为1，必填
        $params['merchantId'] = $data['mch_id'];                    //支付平台分配的商户ID，必填
        $params['returnUrl'] = $callbackurl;         //支付成功跳转URL，仅适用于支付成功后立即返回商户界面，必填
        $params['notifyUrl'] = $notifyurl;          //商户支付成功后，该地址将收到支付成功的异步通知信息，该地址收到的异步通知作为发货依据，必填
        $params['charset'] = "utf-8";                           //参数编码字符集，必填
        $params['body'] = (string)$body;                               //商品的具体描述，选填

        $params['isApp'] = self::getAppType();                     //接入方式
 
        $baseUri = $this->gateway.$params['merchantId'].'-'.$params['orderNo'];
        $params['sign'] = self::sign($params,$apikey);
        $params['signType'] = "SHA";//signType不参与加密，所以要放在最后
        //此处提供hmtl和模拟post两种方式，网银和H5需要html方式提交,采用扫码获取链接时可以用模拟Post连接获取交易地址。
        //curl_Post   and   HtmlPost
        $HtmlStr = self::postHtml($baseUri, $params);
        echo $HtmlStr; 
    }

    private static function getAppType()
    {
        $type = $_REQUEST['isApp'];
        if (empty($type) || !in_array($type, self::isapp_types))
            return self::ISAPP_DEFAULT;

        return $type;
    }


    private static function sign($params, $apiKey)
    {
        ksort($params);
        $string = "";
        foreach ($params as $name => $value) {
            $string .= $name . '=' . $value . '&';
        }
        $string = substr($string, 0, strlen($string) -1 );
        $string .= $apiKey;
        return strtoupper(sha1($string));
    }

    private static function postHtml($Url, $PostArry){
        if(!is_array($PostArry)){
            throw new Exception("无法识别的数据类型【PostArry】");
        }
        $FormString = "<body onLoad=\"document.actform.submit()\">正在处理，请稍候.....................<form  id=\"actform\" name=\"actform\" method=\"post\" action=\"" . $Url . "\">";
        foreach($PostArry as $key => $value){
            $FormString .="<input name=\"" . $key . "\" type=\"hidden\" value='" . $value . "'>\r\n";
        }
        $FormString .="</form></body>";
        return $FormString;
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


    public function notifyurl()
    {
        $content = file_get_contents("php://input");
        //参数进行转换
        parse_str($content,$data);
        //参数转换成K->V
        foreach ($data as $key => $value){
            $params[$key] = $value;
        }
        unset($params['sign']);
        unset($params['signType']);
        
        $orderInfo = M("Order")->where(['out_trade_id'=>$_POST["orderNo"]])->field("key")->find();
        $apikey = $orderInfo['key'];
        $str = self::sign($params,$apikey);
        
        //进行签名匹配 匹配返回 success 即可  其他失败处理  根据商户系统进行设置
        $sign = $_POST['sign'];
        if ($sign == $str){
            $this->EditMoney($orderInfo["pay_orderid"], $this->typename, 0);
            echo "success";
            exit;
        }
    }

}
