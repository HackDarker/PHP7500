<?php
//$pay_orderid = 'E'.date("YmdHis").rand(100000,999999);    //订单号

$pay_orderid =  date('ymd').substr(time(),-5).substr(microtime(),2,5);

?>
<!DOCTYPE html>
<html lang=zh>
<head>
    <meta charset=UTF-8>
    <title>聚合收银台</title>
    <link href="cashier.css" rel="stylesheet">
    <link href="/Public/Front/js/plugins/layui/css/layui.css" rel="stylesheet">
</head>
<body>
<div class="tastesdk-box">
    <div class="header clearfix">
        <div class="title">
            <p class="logo">
                <span>收银台</span>
            </p>
            <div class="right">
                <div class="clearfix">
                    <ul class="clearfix">

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="main">
        <div class="typedemo">
            <div class="demo-pc">
                <div class="pay-jd">
                    <form action="index1.php" method="post" autocomplete="off" id="demo_submit">
                        <input type="hidden" name="orderid" value="<?php echo $pay_orderid;?>">
                        
                        <div class="two-step">
                            <p><strong>请您及时付款，以便订单尽快处理！</strong>请您在提交订单后<span>24小时</span>内完成支付，否则订单会自动取消。</p>
                            <ul class="pay-infor">
                                <li>商品名称：测试应用-支付功能体验(非商品消费)</li>
                                <li>支付金额：<strong><input type="" name="amount" style="width: 150px;" value="1.00"> <span>元</span></strong></li>
                                <li>订单编号：<span><?php echo $pay_orderid;?></span></li>
                            </ul>
                            <h5>选择支付方式：</h5>
                            <ul class="pay-label">

                                <li>
                                    <input value="905" name="channel" id="QQH5" type="radio">
                                    <label for="QQH5"><img src="weixin.png" alt="QQH5"><span>QQH5</span></label>
                                </li>
                                <li>
                                    <input value="901" name="channel" id="wx1" type="radio">
                                    <label for="wx1"><img src="weixin.png" alt="微信支付"><span>微信H5</span></label>
                                </li>
                                <li>
                                    <input value="902" name="channel" id="wx" type="radio">
                                    <label for="wx"><img src="weixin.png" alt="微信支付"><span>微信扫码</span></label>
                                </li>
                                <li>
                                    <input value="903" checked="checked" name="channel" id="zfb" type="radio">
                                    <label for="zfb"><img src="zhifubao.png" alt="支付宝"><span>支付宝扫码</span></label>
                                </li>
                                <li>
                                    <input value="912" checked="checked" name="channel" id="ymf" type="radio">
                                    <label for="ymf"><img src="zhifubao.png" alt="一码付"><span>一码付</span></label>
                                </li>
                                <li>
                                    <input value="904"  name="channel" id="zfb1" type="radio">
                                    <label for="zfb1"><img src="zhifubao.png" alt="支付宝"><span>支付宝手机</span></label>
                                </li>
                                <li>
                                    <input value="907" name="channel" id="bd1" type="radio">
                                    <label for="bd1"><img src="yinlian.png" alt="银联支付"><span>银联支付</span></label>
                                </li>

                                <li>
                                    <input value="908" name="channel" id="bd2" type="radio">
                                    <label for="bd2"><img src="weixin.png" alt="qq线上扫码"><span>qq线上扫码</span></label>
                                </li>

                                <li>
                                    <input value="910" name="channel" id="bd3" type="radio">
                                    <label for="bd3"><img src="weixin.png" alt="京东支付"><span>京东支付</span></label>
                                </li>


                                <li>
                                    <input value="911" name="channel" id="bd4" type="radio">
                                    <label for="bd4"><img src="weixin.png" alt="快捷支付"><span>快捷支付</span></label>
                                </li>

                                <li>
                                    <input value="916" name="channel" id="bd5" type="radio">
                                    <label for="bd5"><img src="weixin.png" alt="快捷支付"><span>百利宝网银</span></label>
                                </li>

                                <li>
                                    <input value="917" name="channel" id="bd6" type="radio">
                                    <label for="bd6"><img src="weixin.png" alt="瀚银网银"><span>瀚银网银</span></label>
                                </li>

                                <li>
                                    <input value="918" name="channel" id="bd7" type="radio">
                                    <label for="bd7" data-bankcode="918" data-bankname="瀚银快捷"><img src="weixin.png" alt="瀚银快捷"><span>瀚银快捷</span></label>
                                </li>

                                <li>
                                    <input value="920" name="channel" id="bd8" type="radio">
                                    <label for="bd8"><img src="weixin.png" alt="开联通快捷"><span>开联通快捷</span></label>
                                </li>

                                <li>
                                    <input value="921" name="channel" id="bd9" type="radio">
                                    <label for="bd9"><img src="weixin.png" alt="开联通网银"><span>开联通网银</span></label>
                                </li>


                            </ul>
                            <div class="btns"> <button type="submit" class="pcdemo-btn sbpay-btn" >立即支付</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/html" id="template">
    <div class="layui-col-md12">
        <form class="layui-form" style="padding:15px;" lay-filter="dialog-form" action="index1.php" method="post" autocomplete="off">

            <h3 class="layui-badge layui-bg-orange">{{ d.bank.name }}</h3>
            <hr class="layui-bg-blue">

            <div class="layui-form-item">
                <label class="layui-form-label">卡号：</label>
                <div class="layui-input-inline">
                    <input class="layui-input " name="accNo">
                </div>
                <div class="layui-input-inline">
                    <span class="layui-badge-dot"></span>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号：</label>
                <div class="layui-input-inline">
                    <input class="layui-input " name="telNo">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名：</label>
                <div class="layui-input-inline">
                    <input class="layui-input" name="name">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">证件号：</label>
                <div class="layui-input-inline">
                    <input class="layui-input" name="idNumber">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="hidden" name="channel" value="{{ d.bank.code }}">
                    <input type="hidden" name="orderid" value="<?php echo $pay_orderid;?>">
                    <input type="hidden" name="amount" value="{{ d.amount }}">    
                    <button class="layui-btn" lay-submit lay-filter="user">确认</button>
                </div>
            </div>
        </form>
    </div>
</script>

<script src="/Public/Front/js/plugins/layui/layui.js"></script>

<script>

    +function(){
        'use strict'

        layui.use(['jquery', 'layer', 'laytpl', 'element', 'form'], function($, layer, laytpl){

            var $form = $('form#demo_submit');

            var $_GET = (function(){
            var url = window.document.location.href.toString();
            var u = url.split("?");
            if(typeof(u[1]) == "string"){
                u = u[1].split("&");
                var get = {};
                for(var i in u){
                    var j = u[i].split("=");
                    get[j[0]] = j[1];
                }
                return get;
            } else {
                return {};
            }
        })();

        $.each($_GET, function(k,v){
            var $input = $('<input type="hidden" name="'+ k+ '" value="'+ v+'"/>');
            $input.appendTo($form);
        })

        var tmpl = $('#template').html(),
            $dialog = $('<div class="layui-row dialog-inner">').appendTo(document.body).hide();

        $(document.body).on('click', '[data-bankcode]', function(){
            var $this = $(this),
                code = $this.data('bankcode'),
                name = $this.data('bankname');

            $dialog.html('<div class="">加载中…</div>');
                    layer.open({
                        type:1,
                        content: $dialog,
                        area: ['750px', '550px'],
                        cancel: function(index){
                            layer.close(index);

                        }
                    })

            laytpl(tmpl).render({bank:{code:code, name:name}, amount:$(':input[name=amount]').val()}, function(html){
                    $dialog.html(html);
                    layui.form.render('select', 'dialog-form');
                });



        })

    })
}();

</script>
</body>
</html>
