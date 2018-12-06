<?php

/**
 * 上游异步通知日志服务
 * @author  guopong
 * @date 20181206
 * 
 */

namespace Common\Service;

use Think\Log;
//use Think\Model;

class UpstreamNotifyLogService extends Log
{

	//上游日志的低级目录
	const PARENT_DIR ='Data/upstream_notify/';

	//支付日志目录名
	const PAY_DIR = 'pay/';

	//代付日志目录名
	const DF_DIR = 'df/';

	const CHA_TRIM_CONTROLLER = 'Controller'; 

	private static $pay_dir;

	private static $df_dir;

	private static $log_level;

	public function __construct()
	{
		$parent_dir = THINK_PATH. '../'. self::PARENT_DIR;

		self::$pay_dir = $parent_dir. self::PAY_DIR;
		self::$df_dir = $parent_dir. self::DF_DIR;

		self::$log_level = self::INFO;
	}

	/**
	 * 日志核心类
	 * # thinkphp下日志模块的一个代理
	 * @param  string $mess 日志内容 
	 * @param  string $dest 日志地址
	 * @return null      
	 */
	private static function log($mess, $dest)
	{
		$dest.= self::generateFilename();
		self::write($mess, self::$log_level, '', $dest);
	}

	/**
	 * 支付交易log
	 * @param  string $orderid 订单号
	 * @param  string $content log数据
	 * @param  string $channel 通道名称(可以通过self::autoChaName生成)
	 * @return null
	 */
	public function paylog($orderid, $content = NULL, $channel = '')
	{
		$body= sprintf("id:%s ", $orderid);
		$channel and $body .= sprintf('channel:%s', $channel);
		$body.= PHP_EOL;	

		$body.= $content !== NULL? $content: file_get_contents('php://input');
		self::log($body, self::$pay_dir);
	}

	/**
	 * 代付交易log
	 * @param  string $orderid 订单号
	 * @param  string $content 内容信息
	 * @param  string $channel 通道信息
	 * @return null          
	 */
	public function dflog($orderid, $content = NULL, $channel = '')
	{
		$body= sprintf("id:%s ", $orderid);
		$channel and $body.= sprintf('channel:%s', $channel);
		$body.= PHP_EOL;

		$body.= $content !== NULL? $content: file_get_contents('php://input');
		self::log($body, self::$df_dir);
	}

	/**
	 * 自动生成通道标识名称
	 * @param  string $classname  完整类名
	 * @param  string $funname    方法名 
	 * @param  string $clsssrtrim 要remove的右外字符(如`Model`,`Controller`,`Service`) 
	 * @return string            
	 */
	public function autoChaName($classname, $funname = '', $classrtrim = '')
	{
		$slashpos = strrpos($classname, '\\');
		false !== $slashpos and $classname = substr($classname, $slashpos+1);

		$ident = rtrim($classname, $classrtrim);

		return $ident. '-'. $funname;			
	}

	public static function generateFilename()
	{
		return sprintf('%s.log', date('y_m_d'));
	}

}