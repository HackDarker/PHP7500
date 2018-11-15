<?php
/**
 * User: guopong
 * Date: 2018-11-15
 */
namespace Pay\Controller;

class HykjController extends PayController
{

    const CONTROLLER_NAME = "Hykj";  //类名 考虑到使用R直接调用的情况，这里不能使用CONTROLLER_NAME

    const PAYMENT_TYPE_DEF = 2000;    //支付类型 B2C-2000; B2B-2025

    const CURRENCY_CODE_DEF = 156;

    const PRODUCT_TYPE_DEF = 100000;

    const BANK_CODE_DEF = 'unionACPB2C';   //正式环境应填写真实地址

    const SIGN_FIELD_SORT = 'insCode|insMerchantCode|hpMerCode|orderNo|orderTime|orderAmount|name|idNumber|accNo|telNo|productType|paymentType|nonceStr|signKey';

    const SIGN_NOTIFY_FIELD_SORT = 'hpMerCode|orderNo|transDate|transStatus|transAmount|actualAmount|transSeq|statusCode|statusMsg|signKey';

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
        $data    = $this->getParameter('瀚银网银支付', $array, __CLASS__, 1);

        $apikey = $data['signkey'];

        $params['insCode'] = $data['appid'];
        $params['insMerchantCode'] = $data['appsecret'];
        $params['hpMerCode'] = $data['mch_id'];

        $params['orderNo'] = $orderid;
        $params['orderTime'] = date("YmdHis");
        $params['currencyCode'] = self::CURRENCY_CODE_DEF;
        $params['orderAmount'] = intval($money * 100);

        $params['name'] = '全渠道';
        $params['idNumber'] = '341126197709218366';
        $params['accNo'] = '6216261000000000018';
        $params['telNo'] = '13552535506';
        
        $params['productType'] = self::PRODUCT_TYPE_DEF;
        $params['paymentType'] = self::PAYMENT_TYPE_DEF;
        
        $params['merGroup'] = '';
        $params['nonceStr'] = randpw(18);

        $params['frontUrl'] = $this->_site . 'Pay_'. self::CONTROLLER_NAME. '_callbackurl.html';
        $params['backUrl'] = $this->_site . 'Pay_'. self::CONTROLLER_NAME. '_notifyurl.html';

        $params['orderReceiveTimeOut'] = 600;
        $params['paymentTimeOut'] = 600;

        $params['paymentChannel'] = self::BANK_CODE_DEF;

        $params['signature'] = self::sign($params, $apikey, self::SIGN_FIELD_SORT);

        $HtmlStr = self::postHtml($data['gateway'], $params);
        echo $HtmlStr;
            
    }

    /**
     * 签名
     * @param array $data 签名数据
     * @param string $key 商户key
     * 
     * @return string
     */
    private static function sign($data, $key, $fieldsort)
    {   

        $data['signKey'] = $key;
        $signkeys = explode('|', $fieldsort);

        $signData = [];
        foreach ($signkeys as $v) {
            $signData[] = $data[trim($v)];    
        }

        return (md5(implode('|', $signData)));   
    }


    private static function postHtml($url, $fields)
    {
        if(!is_array($fields)){
            throw new \Exception("无法识别的数据类型【PostArry】");
        }
        $FormString = "<body onLoad=\"document.actform.submit()\">正在处理，请稍候.....................<form  id=\"actform\" name=\"actform\" method=\"post\" action=\"" . $url . "\">";
        foreach($fields as $key => $value){
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
        echo "success";
    }

    public function notifyurl()
    {

        $orderno = $_POST['orderNo'];

        $orderInfo = M("Order")->where(['out_trade_id'=>$_POST["order_no"]])->field("key,pay_orderid")->find();
        $apikey = $orderInfo['key'];
        $str = self::sign($_POST, $apikey, self::SIGN_NOTIFY_FIELD_SORT);

        $sign = $_POST['signature'];
        if ($sign == $str) {
            $res = $this->EditMoney($orderInfo["pay_orderid"], $this->typename, 0);
            ob_clean();

            if (false == $res) {
                \Think\Log::write($this->typename." notify callback failed. (handle database or downstream notify failed) info:".$content,'ERR');  
                echo "error";    
            } else 
                echo "success";
            
            exit;
        } else {
            ob_clean();
            \Think\Log::write($this->typename." notify callback failed. info:".$content,'ALERT');
            echo "error";
            exit;
        }
    }

}
