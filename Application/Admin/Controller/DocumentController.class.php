<?php

namespace Admin\Controller;


/**
 * 支付帮助文档
 * @author guopong
 * @date 20181122
 */
class DocumentController extends BaseController 
{

	public function _initialize()
	{
		C('TMPL_L_DELIM', '{');
    	C('TMPL_R_DELIM', '}');
	}

	public function index()
	{
		$products = M('product_doc')->alias('a')
			->join('right join pay_product b on a.product_id=b.id')
			->field("a.*,b.name,b.status,b.isdisplay,b.id prod_id")
			->order('b.id desc')
			->select();
		
		$this->assign("products", $products);
		$this->display();
	}

	public function edit() 
	{
		$pid = I('product_id', 0, 'intval');
		$info = M('product_doc')->where(['product_id'=> $pid])->select();

		$this->ajaxReturn($info, '', 1);
	}
}