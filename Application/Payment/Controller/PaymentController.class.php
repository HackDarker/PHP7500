<?php
/**
 * Created by PhpStorm.
 * User: gaoxi
 * Date: 2017-08-22
 * Time: 14:34
 */
namespace Payment\Controller;

/**
 * 用户中心首页控制器
 * Class IndexController
 * @package User\Controller
 */
use Think\Controller;

class PaymentController extends Controller
{
	protected $verify_data_ = [
				'code'=>'请选择代付方式！',
				'id'=>'请选择代付订单！', 
				'opt' => '操作方式错误！',
			];



	public function __construct(){
	    parent::__construct();
	}

	protected function findPaymentType($code='default'){
		$where['status'] = 1;
		if($code == 'default'){
			$where['is_default'] = 1;
		}else{
			$where['id'] = $code;
		}
		$list = M('PayForAnother')->where($where)->find();
		$list || showError('支付方式错误');
		return $list;
	}

	protected function selectOrder($where){
		
		$lists = M('Wttklist')->where($where)->select();
		$lists || showError('无该代付订单或订单当前状态不允许该操作！');
		foreach($lists as $k => $v){
			$lists[$k]['additional'] = json_decode($v['additional'],true);
		}
		return $lists;
	}



	protected function checkMoney($uid,$money){
		$where = ['id' => $uid];
		$balance = M('Member')->where($where)->getField('balance');
		$balance < $money && showError('支付金额错误'); 
	}

	protected function handle($id, $status=1, $return){
	    //处理成功返回的数据
        $memo = M('Wttklist')->where(['id' => $id])->getField('memo');
        $data = array();
        if($status == 1){
           $data['status'] = 1;
           $data['memo']  = '申请成功！ - '.date('Y-m-d H:i:s').'<br>'.$memo;
        }else if ($status == 2) {
           $data['status'] = 2;
           $data['cldatetime'] = date('Y-m-d H:i:s', time());
           $data['memo']  = '代付成功！ - '.date('Y-m-d H:i:s').'<br>'.$memo;
        }else if($status == 3){
            $data['status'] = 4;
			$data['memo'] = isset($return['memo'])?$return['memo']:'代付失败！';
            $data['memo']  = $data['memo'].' - '.date('Y-m-d H:i:s').'<br>'.$memo;
        }
        if(in_array($status, [1,2,3])){
        	$data = array_merge($data, $return);
            $where = ['id'=>$id, 'status'=>['in', '0,1,4']];
        	return M('Wttklist')->where($where)->save($data);
        }

        return false;
   
	}


	/**
	 * 主要来记录异步回调的支付结束信息
	 * @param string $msg 日志内容
	 * @param string $level 日志级别 默认'ALERT'
	 */
	protected function log($msg, $level = 'ALERT')
	{
		\Think\Log::record($msg,$level);
	}

	/**
     * 方便调试异步通知
     * @param string $ident 支付类型标识字符串
     */
    protected static function debug($ident = '')
    {
        $cachename = $ident.'_notify_test';
        
        $content = file_get_contents("php://input");
        $info = [];
        if (F($cachename))
        {
            $info = F($cachename);
        }

        //var_dump($info);

        $info[] = $content;

        F($cachename, $info);

    }

}