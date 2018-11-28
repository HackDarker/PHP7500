<?php

namespace Admin\Controller;


/**
 * 支付帮助文档
 * @author guopong
 * @date 20181122
 */
class DocumentController extends BaseController 
{

	const DOC_CACHE_NAME = "pay_product_doc";

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
		if ($_POST) {
			$data = [
				'process' => I('post.process', 0),
				'content' => I('post.content', ''),
				'product_id' => I('post.product_id',0),
			];
			$data['process'] = I('post.process', 0);
			$ret = M('product_doc')->add($data, '', true);

			$ret and $this->updateCache();

			$this->ajaxReturn('');
		} else {
			$pid = I('proid', 0, 'intval');
			$info = M('product_doc')->where(['product_id'=> $pid])->find();
			empty($info) && $info = ['product_id'=>$pid, 'content'=>'', 'process'=>0];

			$this->ajaxReturn($info);
		}
	}

	public function updateCache()
	{
		$products = M('product_doc')->alias('a')
			->join('right join pay_product b on a.product_id=b.id')
			->field("b.name,b.status,b.isdisplay,b.id as product_id,IFNULL(a.content,'') content")
			->where('b.status = 1')
			->order('b.id desc')
			->select();

		F(self::DOC_CACHE_NAME, $products);
	}
}