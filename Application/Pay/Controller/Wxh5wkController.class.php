<?php
namespace Pay\Controller;

class Wxh5wkController extends PayController{

    private $inst_id;
    private $trade_type;
    private $sign_type;
    private $key;
    private $url;
	public function __construct(){
		parent::__construct();
        $this->inst_id = '20000004';
        $this->sign_type = 'MD5';
        $this->trade_type = 'MWEB';
        $this->key = 'XX35C1ABCA863318E7D530DDDA2F9EDE';//'19f9e5492177434c7c46212656cae745';
        $this->url = 'http://pay.efr360.cn/Channel/WxPay/wxPayOrder.do';

	}

	
	public function Pay($array){
        $orderid = I("request.pay_orderid");   
        $body = I('request.pay_productname');
        $money = intval(I('request.pay_amount'));
        $notifyurl = $this->_site . 'Pay_Wxh5wk_notifyurl.html';
        //$callbackurl = $this->_site . 'Pay_Wxh5wk_callbackurl.html';

        $order = array(
            'code' => 'Wxh5wk',
            'title' => '官方微信h5（张）',
            'exchange' => 100, // 金额比例
            'gateway' => '',
            'orderid'=>'',
            'out_trade_id' => $orderid, //外部订单号
            'channel'=>$array,
            'body'=>(string)$body
        );
        // 订单号，可以为空，如果为空，由系统统一的生成
        $return = $this->orderadd($order);
      
        //如果生成错误，自动跳转错误页面
        $return["status"] == "error" && $this->showmessage($return["errorcontent"]);

        $parameter = array(
            'inst_id' => $this->inst_id,//系统接入方
            //'sign' => '',//签名字符串
            'sign_type' => $this->sign_type, //签名算法
            'notify_url' => $notifyurl,//通知地址
            'out_trade_no' => $orderid, //流水号
            'total_fee'=>$money*100,//交易金额
            'body'=>(string)$body,//订单描述
            'spbill_create_ip'=>'47.244.39.234',//$_SERVER['REMOTE_ADDR'],//用户端ip
            'trade_type' => $this->trade_type,//pc端扫码
        );
        $key = $this->key;
        $sign = $this->sign($parameter,$key);
        $parameter['sign'] = $sign;
        $parameter = $this->signString($parameter);
        $url = $this->url;
        $result = $this->http_post($url,$parameter);
        $result = json_decode($result,true);
        $result['time'] = date('Y-m-d H:i:s');
        $result['body'] = $body;
        //echo "<pre>";
        //var_dump($parameter);
        //var_dump($result);die;
        //返回字符串json
        //{"device_info":null,"out_trade_no":"E20181101003214786850","code_url":"weixin://wxpay/bizpayurl?pr=zGSe58T","total_fee":"1000","sign":"E98AD49A8E96079C6C5FE41493729B3B","trade_type":"NATIVE","inst_id":"20000004","return_msg":"OK","result_code":"SUCCESS","return_code":"SUCCESS","sign_type":"MD5","prepay_id":"wx01003523880592af9c81218a0520441590"}
        if($result['return_msg'] == 'OK' && $result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS' && $result["mweb_url"]){
            echo "<script>
                    window.location.href = ('{$result['mweb_url']}');
                </script>
            ";die;
        }else{
            $this->showmessage($result['return_msg']);
        }
    }

    public function notifyurl()//文档没有签名 以后看到的人自己加
    {
        $parameter = I();
        if( $this->inst_id == $parameter['inst_id'] && 'SUCCESS' == $parameter['return_code'] && $parameter['out_trade_no'])
        {
            if($data['status'] == 0 && $respSign == $sign){
                $this->EditMoney($parameter["out_trade_no"], 'Wxh5wk', 0);
                exit('success');
            }
           
        }
        exit('fail');
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
        $sign = strtoupper(md5($sign . 'key=' . $apikey));
        return $sign;
    }

    public function signString($params)
    {
        ksort($params);
        $sign = '';
        foreach ($params as $k => $v) {
            if($v===''){
                continue;
            }
            $sign = $sign . $k . '=' . urlencode($v) . '&';
        }

        return substr($sign, 0,-1);
    }

    public function http_post($url, $data) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER,array("content-type: application/x-www-form-urlencoded;charset=UTF-8"));
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

}