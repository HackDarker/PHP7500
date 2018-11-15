<?php
namespace Payment\Controller;

class HydfController extends PaymentController
{

    const CURRENCY_CODE_DEF = 156;      //默认币种
    
    const NOTIFY_CODE_SUC = '00';  

    const ORDER_TYPE_DEF = 'DT';        //默认订单类型

    const ACCOUNT_TYPE_DEF = '01';      //默认账户类型

    const PRODUCT_TYPE_DEF = '100002';

    const SIGN_FIELD_SORT = 'insCode|insMerchantCode|hpMerCode|orderNo|orderDate|orderTime|currencyCode|orderAmount|orderType|accountType|accountName|accountNumber|nonceStr|signKey';

    const SIGN_FIELD_SORT_RET = 'insCode|insMerchantCode|hpMerCode|orderNo|orderDate|orderTime|currencyCode|orderAmount|actualAmount|orderType|accountType|accountName|accountNumber|statusCode|statusMsg|signKey';


    const SIGN_QUERY_FIELD_SORT = 'insCode|insMerchantCode|hpMerCode|orderNo|transDate|transSeq|productType|paymentType|nonceStr|signKey';

    const SIGN_QUERY_FIELD_SORT_RET = 'insCode|insMerchantCode|hpMerCode|orderNo|transDate|transStatus|transAmount|actualAmount|transSeq|statusCode|statusMsg|signKey';

    private $orderTypeCode = [];

    public function __construct()
    {
        parent::__construct();

        $this->orderTypeCode = [
            'D0' => 2007,
            'T1' => 2023,
            'DT' => 2007,
            'DF' => 2012
        ];
    }


    /**
     * 代付接口
     * @param array $data 订单相关信息
     * @param array $config klt通道商户相关信息
     * 
     * @return array
     */
    public function PaymentExec($data, $config)
    {
        $posturl = $config['exec_gateway'];

        $insCode = $config['appid'];
        $insMerchantCode = $config['appsecret'];

        $merchantId = $config['mch_id'];
        $key = $config['signkey'];

        $amt = $data['money'];

        $post['insCode'] = $insCode;
        $post['insMerchantCode'] = $insMerchantCode;
        $post['hpMerCode'] = $merchantId;

        $post['orderNo'] = $data['orderid'];
        $post['orderDate'] = date('Ymd');
        $post['orderTime'] = date('YmdHis');
        $post['currencyCode'] = self::CURRENCY_CODE_DEF;

        $post['orderAmount'] = $amt * 100;

        $post['orderType'] = self::ORDER_TYPE_DEF;

        $post['certType'] = '';
        $post['certNumber'] = '';
        $post['accountType'] = self::ACCOUNT_TYPE_DEF;

        $post['accountName'] = $data['bankfullname'];
        $post['accountNumber'] = $data['banknumber'];
        
        $post['mainBankName'] = $data['bankName'];
        $post['mainBankCode'] = '';
        $post['attach'] = '';
        $post['nonceStr'] = randpw(18);

        $post['signature'] = self::sign($post, $key, self::SIGN_FIELD_SORT);

        $json = self::send_post_curl($posturl, $post);

        $return = [];

        if($json == null)
            return ['status' => 3, 'msg' => '网络延迟，请稍后再试！'];

        $resultData = json_decode($json,true);
        
        //验签
        $signMsg = $resultData['signature'];
        $sign = self::sign($resultData, $key, self::SIGN_FIELD_SORT_RET);

        if ($resultData['statusCode'] != self::NOTIFY_CODE_SUC)
            return ['status' => 3, 'msg' => $resultData['statusMsg'] ?: '代付创建失败'];

        if($sign != $signMsg)
            return ['status' => 3, 'msg' => '验签失败！'];

        
        if ($resultData['transStatus'] == "01")
            return ["status" => 3, 'msg' => $resultData['responseMsg']?: '代付失败'];
        
        return ["status" => 1, "msg"=>'申请代付成功'];
    }


    private static function sign($data, $key, $fieldsort)
    {
        $data['signKey'] = $key;
        $signkeys = explode('|', $fieldsort);

        $signData = [];
        foreach ($signkeys as $v) {
            $signData[] = $data[$v];    
        }

        return md5(implode('|', $signData));
        
    }


    /**
     * 单笔代付查询
     * @param array $data 订单相关数据
     * @param array $config klt商户相关信息
     * 
     * @return array
     */
    public function PaymentQuery($data, $config)
    {
        $queryurl = $config['query_gateway'];
        $insCode = $config['appid'];
        $insMerchantCode = $config['appsecret'];

        $merchantId = $config['mch_id'];
        $key = $config['signkey'];

        $orderDate = date("YmdHis", strtotime($data['sqdatetime']));

        $post['insCode'] = $insCode;
        $post['insMerchantCode'] = $insMerchantCode;
        $post['hpMerCode'] = $merchantId;

        $post['orderNo'] = $data['orderid'];

        $post['transDate'] = $orderDate;

        $post['transSeq'] = '';

        $post['productType'] = self::PRODUCT_TYPE_DEF;
        $post['paymentType'] = $this->orderTypeCode[self::ORDER_TYPE_DEF];

        $post['nonceStr'] = randpw(18);

        $post['signature'] = self::sign($post, $key, self::SIGN_QUERY_FIELD_SORT);

        $json = self::send_post_curl(self::$queryurl, $post);

        $return = [];

        if(!$json)
            return ['status' => 3, 'msg' => '网络延迟，请稍后再试！'];

        $resultData = json_decode($json,true);
    
        //验签
        $signMsg = $resultData['signature'];

        if ($resultData['statusCode'] != self::NOTIFY_CODE_SUC)
            return ['status' => 3, 'msg' => $resultData['statusMsg'] ?: '查询失败'];

        $sign = self::sign($resultData, $key, self::SIGN_QUERY_FIELD_SORT_RET);

        if ($sign != $signMsg)
            return ['status' => 3, 'msg' => '验签失败！'];

        switch ($resultData['transStatus']) {
            case self::NOTIFY_CODE_SUC: return ['status' => 2, "msg" => "交易完成"];
            case '02':  return ['status' => 1, "msg" => "交易处理中"]; 
            case '01':  return ['status' => 3, "msg" => "交易失败"]; 
        } 
        
    }


    private static function send_post_curl($url,$data = array()){
        $ch = curl_init();
        //设置选项，包括URL
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-type: application/x-www-form-urlencoded;charset=UTF-8'));
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
            return null;
        }
        return $output;
    }



    /**
     * hanyin不支持回调
     */
    public function notifyurl()
    {
       echo "success";

    }

    public function queryBalance()
    {

    }
}