<?php
$pay_orderid = 'E'.date("YmdHis").rand(100000,999999);    //订单号

?>
<!DOCTYPE html>
<html lang=zh>
<head>
    <meta charset=UTF-8>
    <title>聚合收银台</title>
    <link href="cashier.css" rel="stylesheet">
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
                    <form action="index1.php" method="post" autocomplete="off">
                        <input type="hidden" name="orderid" value="<?php echo $pay_orderid;?>">
                        
                        <div class="two-step">
                            <p><strong>请您及时付款，以便订单尽快处理！</strong>请您在提交订单后<span>24小时</span>内完成支付，否则订单会自动取消。</p>
                            <ul class="pay-infor">
                                <li>商品名称：测试应用-支付功能体验(非商品消费)</li>
                                <li>支付金额：<strong><input type="" name="amount" value="1.00"> <span>元</span></strong></li>
                                <li>订单编号：<span><?php echo $pay_orderid;?></span></li>
                            </ul>
                            <h5>选择支付方式：</h5>
                            <ul class="pay-label">
              
                                <li>
                                    <input value="901" checked name="channel" id="wx1" type="radio">
                                    <label for="wx1"><img src="weixin.png" alt="微信支付"><span>微信H5</span></label>
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
</body>
</html>
