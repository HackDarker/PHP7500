<?php

namespace Admin\Controller;

use Think\Page;


/**
 * 自动代付
 * @author guopong
 * @date 20181207
 */
class AutodfController extends BaseController
{

	/**
	 * 暂时使用的单渠道代付
	 * @return 
	 */
	public function single()
	{
		$count = M('user_auto_df')->where($where)->count();
        $rows  = I('get.pagesize', 15, 'intval');
        $page = new Page($count, $rows);

        $where = [];

        $list = M('user_auto_df')->alias('a')
        	->join('pay_member b ON a.uid = b.id')
        	->join('pay_pay_for_another c ON a.another_id = c.id')
        	->field('a.uid,a.another_id,b.username,c.title prodname')
            ->where($where)
            ->limit($page->firstRow . ',' . $page->listRows)
            ->order('a.create_at desc')
            ->select();

        $prodlist = M('pay_for_another')->where(['status'=>1])->field('id,title')->select();

        $this->assign('prodlist', $prodlist);
        $this->assign('rows', $rows);
        $this->assign("list", $list);
        $this->assign("page", $page->show());

        $this->display();

	}

	public function add()
	{
		$data['uid'] = I('post.uid', 0, 'intval');
		$data['another_id'] = I('post.another_id', 0, 'intval');
		$data['create_at'] = date('Y-m-d H:i:s');
		$data['create_by'] = session('admin_auth')['uid'];

		$data['uid'] > 10000 and $data['uid']-=10000;

		if (!$data['uid'] || !$data['another_id'])
			$this->error('-操作失败');

		$res = M('user_auto_df')->add($data);
		if ($res)
			$this->success("操作成功");
		else
			$this->error("操作失败".M('user_auto_df')->getDbError());
	}

	public function delete()
	{
		$uid = I('request.uid', 0, 'intval');
		$res = M('user_auto_df')->where(['uid'=>$uid])->delete();

		if ($res)
			$this->success("操作成功");
		else
			$this->error("操作失败".M('user_auto_df')->getDbError());
	}

}
