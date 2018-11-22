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

        $params['orderNo'] = $data['orderid'];                          
        $params['totalFee'] = $money;               
        //$params['defaultbank'] = "QUICKPAY";         
        $params['title'] = (string)$body;                              
        //$params['paymethod'] = 'directPay';             
        $params['paymethod'] = 'bankPay';             
        $params['service'] = "online_pay";             
        $params['paymentType'] = "1";                  
        $params['merchantId'] = $data['mch_id'];       
        $params['returnUrl'] = $callbackurl;         
        $params['notifyUrl'] = $notifyurl;  
        $params['charset'] = "utf-8";                           
        $params['body'] = (string)$body;                        

        $params['isApp'] = self::getAppType();                     //接入方式

        $baseUri = $this->gateway.$params['merchantId'].'-'.$params['orderNo'];
        $params['sign'] = self::sign($params,$apikey);
        $params['signType'] = "SHA";

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
            throw new \Exception("无法识别的数据类型【PostArry】");
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
        $content = file_get_contents("php://input");
        parse_str($content,$data);
        
        foreach ($data as $key => $value){
            $params[$key] = $value;
        }
        unset($params['sign']);
        unset($params['signType']);

        $orderInfo = M("Order")->where(['pay_orderid'=>$_POST["order_no"]])->field("key,pay_orderid")->find();
        $apikey = $orderInfo['key'];
        $str = self::sign($params,$apikey);

        $sign = $_POST['sign'];
        if ($sign == $str){
             $this->EditMoney($orderInfo["pay_orderid"], $this->typename, 1);
            exit;
        } else
            \Think\Log::write($this->typename." callback sign failed. info:".$content,'ALERT');
    }

    private static function debug()
    {
        var_dump(F("blb_notify_test"));exit;
        $content = file_get_contents("php://input");
        $info = [];
        if (F("blb_notify_test"))
        {
            $info = F("blb_notify_test");
        }

        //var_dump($info);

        $info[] = $content;

        F("blb_notify_test", $info);

    }

    public function notifyurl()
    {
        //self::debug();

        $content = file_get_contents("php://input");

        //参数进行转换
        parse_str($content,$data);
        //参数转换成K->V
        foreach ($data as $key => $value){
            $params[$key] = $value;
        }
        unset($params['sign']);
        unset($params['signType']);

        $orderInfo = M("Order")->where(['pay_orderid'=>$_POST["order_no"]])->field("key,pay_orderid")->find();
        $apikey = $orderInfo['key'];
        $str = self::sign($params,$apikey);

        $sign = $_POST['sign'];
        if ($sign == $str){
            $this->EditMoney($orderInfo["pay_orderid"], $this->typename, 0);
            ob_clean();
            echo "success";
            exit;
        } else {
            ob_clean();
            \Think\Log::write($this->typename." notify callback failed. info:".$content,'ALERT');
            echo "error";
        }
    }

public static function curl_get($url, $data = array(), $timeout = 10) {
        if($url == "" || $timeout <= 0){
            return false;
        }
        if($data != array()) {
            $url = $url . '?' . http_build_query($data);
        }
        $con = curl_init((string)$url);
        curl_setopt($con, CURLOPT_HEADER, false);
        curl_setopt($con, CURLOPT_RETURNTRANSFER,true);
        curl_setopt($con, CURLOPT_TIMEOUT, (int)$timeout);
        curl_setopt($con, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($con, CURLOPT_SSL_VERIFYHOST, false);
        return curl_exec($con);
    }


    public function query($data, $conf)
    {
        $orderNo = $data['orderNo'];

        $params['orderNo'] = $orderNo;                             //商户订单号
        $params['charset'] = "utf-8";                                       //编码
        $params['merchantId'] = $conf['mch_id'];                                //商户号
        $params['sign'] = self::sign($params,$conf['signkey']);
        $params['signType'] = "SHA";                                        //signType不参与加密，所以要放在最后

        $baseUri = $this->gateway. $conf['mch_id']. '-'. $orderNo;

        $json = self::curl_get($baseUri, $params);
        echo $json;exit;

    }

}
