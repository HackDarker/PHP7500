<?php
namespace Payment\Controller;

class BlbdfController extends PaymentController
{

    private static $siteurl = "https://client.nfoooo.com/agentPay/v1/batch/";
    private static $queryurl = "https://client.nfoooo.com/agentPay/v1/batch/";

    public function __construct()
    {
        parent::__construct();
    }

    public function PaymentExec($data, $config)
    {
        $date = date('Ymd');
        $batchDate = $date;

        $batchAmount = $data['money'];
        $batchNo = $data['orderid'];

        $params = [
            "merchantId" => $config['mch_id'],                //商户号 ID
            "batchVersion" => "00",                     //版本号，固定值为00
            "batchBiztype" => "00000",                  //提交批次类型，默认00000
            "batchDate" => $batchDate,                  //提交日期
            "batchNo" => $batchNo,                      //批次号，不能重复
            "charset" => "utf8",                        //输入编码：GBK，UTF-8
            "batchCount" => "1",                        //总笔数
            "batchAmount" => $batchAmount               //总金额
        ];

        $batchContent = [
            $data['banknumber'],                      //银行账户
            $data["bankfullname"],                  //开户名
            $data["bankname"],                             //银行名称
            $data["bankzhiname"],                       //分行
            $data["bankzhiname"],                    //支行
            "私",                                       //业务类型
            $batchAmount,                               //金额
            "CNY",                                      //币种
            $data["sheng"],                         //省
            $data['shi'],                             //市
            "13888888888",                              //手机
            "身份证",                                   //身份类型
            "123456789123456789",                       //身份证号码
            "123456",                                   //用户协议号
            $batchNo,                                   //商户订单号
            "OK"                                        //备注
        ];

        $apikey = $config['signkey'];

        $string = "1";
        foreach ($batchContent as $value) {
            $string .= ',' . $value;
        }
        $batchContent = $string;
        $params['batchContent'] = $batchContent;

        $baseUri = self::$siteurl . $params['merchantId'] . '-' . $params['batchNo'];
        //进行验签,此处是SHA加密，可选MD5根据商户后台秘钥决定
        $params['sign'] = self::sign($params,$apikey);
        //发起请求
        $params['signType'] = "SHA";
        $result = self::curl_post($baseUri,$params);
        //echo "return";
        //print_r($result);exit;

		file_put_contents('./Data/ANSDf.txt', "【".date('Y-m-d H:i:s')."】\r\n".$result."\r\n\r\n",FILE_APPEND);

        if ($result) {

            $result = json_decode($result, true);
            $result['respMsg'] = base64_decode(str_replace(" ", "+", $result['respMessage']));

            switch ($result['respCode']) {
                case 'S0001':
                    $return = ['status' => 1, 'msg' => $result['respMsg']];
                    break;
                default:
                    $return = ['status' => substr($result['respCode'], 1), 'msg'=>$result['respMsg']];
                    break;
            }

        } else {
            $return = ['status' => 3, 'msg' => '网络延迟，请稍后再试！'];
        }
        return $return;
    }

    public static function curl_post($url,$postarray){
        $posturl = $url;
        $curl = curl_init($posturl);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        $header[] = "charset=UTF-8";
        $header[] = "application/x-www-form-urlencoded";
        curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);
        curl_setopt($curl, CURLOPT_POSTFIELDS,http_build_query($postarray));
        $response = curl_exec($curl);
        if (curl_errno($curl)) {
            return false;
        }
        curl_close($curl);
        return $response;
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


    public function PaymentQuery($data, $config)
    {
        $apiKey = $config['signkey'];
        $date = date("Ymd", strtotime($data['searchtime']));

        $params = [
            "merchantId" => $config['mch_id'],        //商户号
            "batchVersion" => "00",             //版本号
            "charset" => "utf8"                 //字符编码
        ];
        //参数进行封装
        $params['batchDate'] =$date;
        $params['batchNo'] = $data['orderid'];
        $baseUri = self::$queryurl . $params['merchantId'] . '-' . $params['batchNo'];
        //进行验签,此处是SHA加密，可选MD5根据商户后台秘钥决定
        $params['sign'] = self::sign($params,$apiKey);
        $params['signType'] = "SHA";
        $result = self::curl_get($baseUri, $params);


        $return = [];

        if ($result) {
            $result = json_decode($result, true);
            $result['respMsg'] = base64_decode(str_replace(" ", "+", $result['respMessage']));

            $batchContent = $result['batchContent'];
            $contents = explode(",", $batchContent);
            //print_r($contents);
            $status = $contents[count($contents) - 2];
            //var_dump($status);exit;

            if ($result['respCode'] != "S0001") {
                $return = ['status' => 3, 'msg' => $result['respMsg']];
            } else if ($status == '成功') {
                $return = ['status' => 2, 'msg' => $result['respMsg']];
            } else if (strtoupper($status) == 'NULL') {
                $return = ['status' => 1, 'msg' => $result['respMsg']];
            }
        } else {
            $return = ['status' => 3, 'msg' => '网络延迟，请稍后再试！'];
        }

        return $return;
    }

    //public function PaymentQuery($data, $config)
    //{
    //    $arraystr = [
    //        'version'    => '1.0.0',
    //        'txnType'    => '00',
    //        'txnSubType' => '01',
    //        'merId'      => $config['mch_id'],
    //        'merOrderId' => $data['orderid'],
    //    ];
    //    $arraystr['signature']  = base64_encode($this->md5Sign($arraystr, $config['signkey']));
    //    $arraystr['signMethod'] = 'MD5';
    //    $result                 = curlPost($config['query_gateway'], http_build_query($arraystr));
    //    if ($result) {
    //        parse_str($result, $result);
    //        $result['respMsg'] = base64_decode(str_replace(" ", "+", $result['respMsg']));
    //        switch ($result['respCode']) {

    //            case '1001':
    //                $return = ['status' => 2, 'msg' => $result['respMsg']];
    //                break;
    //            case '1002':
    //                $return = ['status' => 3, 'msg' => $result['respMsg']];
    //                break;
    //            case '1111':
    //                $return = ['status' => 1, 'msg' => $result['respMsg']];
    //                break;
    //            default:
    //                $return = ['status' => 3, 'msg' => $result['respMsg']];
    //                break;
    //        }

    //    } else {
    //        $return = ['status' => 3, 'msg' => '网络延迟，请稍后再试！'];
    //    }

    //    return $return;
    //}

    public static function sign($params, $apiKey)
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

    public function encryptDecrypt($string, $key = '', $decrypt = '0')
    {
        if ($decrypt) {
            $decrypted = rtrim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, md5($key), base64_decode($string), MCRYPT_MODE_CBC, md5(md5($key))), "12");
            return $decrypted;
        } else {
            $encrypted = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5($key), $string, MCRYPT_MODE_CBC, md5(md5($key))));
            return $encrypted;
        }
    }
    public function notifyurl()
    {

    }

    public function queryBalance()
    {
        $id = I('post.id', '');
        if (IS_AJAX) {
            $config_info = $this->findPaymentType($id);
            $params      = [
                'version'    => '1.0.0',
                'txnType'    => '71',
                'txnSubType' => '00',
                'merId'      => $config_info['mch_id'],
            ];
            $params['signature']  = base64_encode($this->md5Sign($params, $config_info['signkey']));
            $params['signMethod'] = 'MD5';
            $result               = curlPost($config_info['exec_gateway'], http_build_query($params));
            parse_str($result, $result);

            if ($result) {
                $data = [
                    [
                        'key'   => '账户可用余额',
                        'value' => $result['balance'] / 100 . '元',
                    ],
                    [
                        'key'   => 'T0授信额度',
                        'value' => $result['creditLines'] / 100 . '元',
                    ],
                    [
                        'key'   => '冻结余额',
                        'value' => $result['frozenAmt'] / 100 . '元',
                    ],
                    [
                        'key'   => '欠费金额',
                        'value' => $result['owedAmt'] / 100 . '元',
                    ],
                    [
                        'key'   => '当日入金',
                        'value' => $result['curInAmt'] / 100 . '元',
                    ],
                    [
                        'key'   => '当日出金',
                        'value' => $result['curOutAmt'] / 100 . '元',
                    ],
                ];
                $this->assign('data',$data);
                $html = $this->fetch('Public/queryBalance');
                $this->ajaxReturn(['status' => 1, 'msg' => '成功', 'data' => $html]);
            }
            $this->ajaxReturn(['status'=>0,'msg'=>'网络延迟']);
        }

    }
}
