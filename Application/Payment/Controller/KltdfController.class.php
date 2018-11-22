<?php
namespace Payment\Controller;

class KltdfController extends PaymentController
{
    const PRIVATE_BANK_NO = "000000000000";  //对私电子联行号值

    const NOTIFY_CODE_SUC = "000000";   //回调成功状态值

    const ACC_BUS = 2;      //企业帐户类型
    const ACC_PER = 1;      //个人帐户类型

    const PURPOSE_DEF = "pay for another"; 
    
    private static $notifyUrl = "";
    private static $callbackUrl = "";

    public function __construct()
    {
        parent::__construct();

        self::$notifyUrl = $this->_site . "/Payment_Kltdf_notifyurl";
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
        $merchantId = $config['mch_id'];
        $key = $config['signkey'];
        
        $date = date("YmdHis");

        $accountType = $_REQUEST['accountType']? $_REQUEST['accountType']: self::ACC_PER;

        $amt = $data['money'];

        //1.参数准备
        $head = array(
            "version" => '18',
            "merchantId" => $merchantId,
            "sign" => null,
            "signType" => '1'
        );

        $content = array(
            "mchtOrderNo" => $data['orderid'],
            "orderDateTime" => $date,

            "accountNo" => $data['banknumber'],//认证支付付款人卡号
            "accountName" => $data["bankfullname"],
            "accountType" => $accountType,
            "bankNo" => $_REQUEST['bankNo']? $_REQUEST['bankNo']: self::PRIVATE_BANK_NO,
            "bankName" => $data["bankname"] . ($accountType == self::ACC_PER? "": $data["bankzhiname"].$data["sheng"].$data["shi"]),

            "amt" => self::transMoney($amt),
            "purpose" => self::PURPOSE_DEF,
            "remark" => self::PURPOSE_DEF,
            "notifyUrl" => self::$notifyUrl,
        );

        //2.参数进行md5加密码
        $contents = array_merge($head,$content);

        $str = self::arrayToString($contents);
        $sign = strtoupper(md5($str.'&key='.$key));

        //3.拼装发送信息
        $data = array();
        $head['sign'] = $sign;
        $data['head'] = $head;
        $data['content'] = $content;

        $send_contents = json_encode($data);
        $json = self::send_post_curl($config['exec_gateway'], $send_contents);

        $return = [];

        if($json == null)
            return ['status' => 3, 'msg' => '网络延迟，请稍后再试！'];

        $resultData = json_decode($json,true);
        
        //验签
        $signMsg = $resultData['signMsg'];
        $str2 = self::arrayToString($resultData);
        $sign = strtoupper(md5($str2.'&key='.$key));

        if ($resultData['responseCode'] != self::NOTIFY_CODE_SUC)
            return ['status' => 3, 'msg' => $resultData['responseMsg'] ?: '代付创建失败'];

        if($sign != $signMsg)
            return ['status' => 3, 'msg' => '验签失败！'];
        
        if ($resultData['orderState'] == "FAIL")
            return ["status" => 3, 'msg' => $resultData['responseMsg']?: '代付失败'];
            
        return ["status" => 1, "msg"=>$resultData['responseMsg']];

    }

    /**
     * curl_get
     * @param $url
     * @param array $data
     * @param int $timeout
     * @return bool|mixed
     */
    private static function curl_get($url, $data = array(), $timeout = 10) {
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

    /**
     * 单笔代付查询
     * @param array $data 订单相关数据
     * @param array $config klt商户相关信息
     * 
     * @return array
     */
    public function PaymentQuery($data, $config)
    {
        $apiKey = $config['signkey'];
        $orderDate = date("Ymd", strtotime($data['searchtime']));

        $head = [
            'version' => "",
            'merchantId' => $config['mch_id'],
            'transactType' => "",
            'signType' => 1,
            'sign' => null,
        ];

        $content = [
            'mchtOrderNo' => $data['orderid'],
            'paymentBusinessType' => 'SINGLE_PAY',
            'orderDate' => $orderDate,
        ];

        $contents = array_merge($head,$content);

        $str = self::arrayToString($contents);
        $sign = strtoupper(md5($str.'&key='.$apiKey));

        $data = array();
        $head['sign'] = $sign;
        $data['head'] = $head;
        $data['content'] = $content;

        $send_contents = json_encode($data);
        $json = self::send_post_curl($config['query_gateway'], $send_contents);

        $return = [];

        if(!$json)
            return ['status' => 3, 'msg' => '网络延迟，请稍后再试！'];

        $resultData = json_decode($json,true);
    
        //验签
        $signMsg = $resultData['signMsg'];
        $str2 = self::arrayToString($resultData);
        $sign = strtoupper(md5($str2.'&key='.$apiKey));

        if($sign != $signMsg)
            return ['status' => 3, 'msg' => '验签失败！'];

        if ($resultData['responseCode'] != self::NOTIFY_CODE_SUC)
            return ['status' => 3, 'msg' => $resultData['responseMsg']?: "_订单不存在"];  
        
        switch ($resultData['orderState']) {
            case "FAIL":
                return ['status' => 3, 'msg' => "代付单失败"];
            case "REFUSE":
                return ['status' => 3, 'msg' => "拒绝交易"];
            case "CREATE":
                return ['status' => 1, 'msg'=> "已受理"];
            case "IN_PROCESS":
                return ['status' => 1, "msg" => "处理中"];
            case "SUCCESS":
                return ['status' => 2, "msg" => "交易完成"]; 
        }
        
    }

    //将元转成分并去掉小数
    private static function transMoney($amt)
    {
        $money = $amt * 100;
        $money = intval($money);
        return $money;
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

    private static function send_post_curl($url,$data = array()){
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
        //"{"responseCode":"000000","responseMsg":"短信发送成功！","requestId":"0d6f13ffcf95418fb08b47f8549d9a1d","mchtId":"903110153110001","signMsg":"01304476E4E3EB0BB68259A924445ADE","signType":"1","orderNo":"wx201808161629"}"
    }



    /**
     * klt异步通知特殊
     *  # 如果本地业务处理失败，则必须返回success,表未本次通知成功，会有后续通知。
     *  # 如果本地业务处理成功，则返回finish(或除success的任意字符串)。
     */
    public function notifyurl()
    {
        //self::debug("Kltdf");

        $resData = $_POST;
        $orderno = $resData['merchantOrderId'];
        $sign = $resData['sign'];

        $orderInfo = M("wttklist")->alias('a')
            ->join("pay_pay_for_another as b on a.df_id = b.id")
            ->where(['a.orderid'=>$orderno])
            ->field("b.signkey `key`,b.code,a.id,b.title")
            ->find();

        ob_clean();

        if (empty($orderInfo)) {
            $this->log($orderInfo['code']. " notify callback failed. not find [pay_for_another] info, return data:".http_build_query($_POST));
            echo "success";
            exit;
        }

        $mysign = strtoupper(md5(self::arrayToString($resData). '&key='.$orderInfo['key']));
        if ($sign != $mysign) {
            $this->log($orderInfo['code']." notify callback failed[sign error]. info:".http_build_query($_POST));
            echo "success";
            exit;
        }

        $status ;
        $msg = '';

        switch ((int)$resData['orderStatus']) {
            case 0:
                $status = 1;
                $msg = "申请成功";
                break;

            case 1:
                $status = 2;
                $msg = "已完成";
                break;

            default:
                $status = 3;
                $msg = "代付失败".$resData['errorMsg'];
                break;
        }

        $other = ['code' => $orderInfo['code'], 'df_name' => $orderInfo['title'], 'msg'=>$msg];

        $result = $this->handle($orderInfo['id'], $status, $other);

        if (empty($result)) {
            $this->log($orderInfo['code']." notify callback failed[db save error]. info:".http_build_query($_POST));
            echo "success";
            exit;   
        }

        exit("finish");

    }

    public function queryBalance()
    {
        $id = I('post.id', '');
        $conf = $this->findPaymentType($id);

        $signkey = $conf['signkey'];

        $head = [
            'version' => '',
            'merchantId' => $conf['mch_id'], //$conf['mch_id'],
            'transactType' => '',
            'signType' => '1',
        ];

        $content = [];

        $contents = array_merge($head,$content);

        $str = self::arrayToString($contents);  
        echo $str.'&key='. $signkey;
        $sign = strtoupper(md5($str.'&key='. $signkey));

        echo PHP_EOL;
        echo $sign;
        echo PHP_EOL;
        echo PHP_EOL;

        //3.拼装发送信息
        $data = array();
        $head['sign'] = $sign;
        $data['head'] = $head;
        $data['content'] = $content;

        $send_contents = json_encode($data);
        echo $send_contents;
        echo PHP_EOL;
        echo PHP_EOL;
        $json = self::send_post_curl($conf['balance_gateway'], $send_contents);
        echo $json;exit;

        $result = json_decode($result, true);

        $status = substr($result['statusCode'], 0, 2);         

        if ('00' == $status) {
            $data = [
                ['key' => '账户可用余额', 'value' => $result['balanceAmount'] / 100 . '元'],
                ['key' => '账户类型', 'value' => $result['accountType']],
            ];
            $this->assign('data',$data);
            $html = $this->fetch('Public/queryBalance');
            $this->ajaxReturn(['status' => 1, 'msg' => '成功', 'data' => $html]);
        }
        $this->ajaxReturn(['status'=>0,'msg'=>'网络延迟']);
    

    }
}
