/*
Navicat MySQL Data Transfer

Source Server         : 支付demo
Source Server Version : 50641
Source Host           : 127.0.0.1:3306
Source Database       : www_u527_com

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2018-10-24 23:29:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pay_admin`
-- ----------------------------
DROP TABLE IF EXISTS `pay_admin`;
CREATE TABLE `pay_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(50) NOT NULL COMMENT '后台用户名',
  `password` varchar(32) NOT NULL COMMENT '后台用户密码',
  `groupid` tinyint(1) unsigned DEFAULT '0' COMMENT '用户组',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `google_secret_key` varchar(128) NOT NULL DEFAULT '' COMMENT '谷歌令牌密钥',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号码',
  `session_random` varchar(50) NOT NULL DEFAULT '' COMMENT 'session随机字符串',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_admin
-- ----------------------------
INSERT INTO `pay_admin` VALUES ('1', 'aiyaowei888', '7aa5e695be95cdd64a88410a64dfe2c1', '1', '0', '3BBGR5RL2TGF7U23', '', 'oeDjTVd1wI1MEh8YmJyG8oQXw93P2ksh');

-- ----------------------------
-- Table structure for `pay_apimoney`
-- ----------------------------
DROP TABLE IF EXISTS `pay_apimoney`;
CREATE TABLE `pay_apimoney` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `payapiid` int(11) DEFAULT NULL,
  `money` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `freezemoney` decimal(15,3) NOT NULL DEFAULT '0.000' COMMENT '冻结金额',
  `status` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_apimoney
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_article`
-- ----------------------------
DROP TABLE IF EXISTS `pay_article`;
CREATE TABLE `pay_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `groupid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分组 0：所有 1：商户 2：代理',
  `title` varchar(300) NOT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1显示 0 不显示',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_article
-- ----------------------------
INSERT INTO `pay_article` VALUES ('16', '3', '0', '结算需要手机验证的通知', '为了保障客户资金安全，近日将对系统进行不停机升级，升级完毕后，在发起结算的时候需要接收手机验证码进行验证，这样可以有效防止因为密码丢失而导致的资金损失。到时请准备好常用手机号进行绑定。谢谢配合！', '1524499200', '手机验证', '1', '0');
INSERT INTO `pay_article` VALUES ('17', '3', '0', '系统升级通知', '<p>系统将于2018.4.25日9:00:00 - 10:00:00&nbsp;进行安全升级，期间会影响支付交易。请谅解。</p>', '1524724601', '系统升级通知', '1', '1524724885');
INSERT INTO `pay_article` VALUES ('18', '0', '0', '结算方式变更', '<p>系统升级后，用户可以在左侧菜单--&gt;帐户管理--&gt;银行卡管理，添加多张常用结算卡信息，在“代付申请”中直接选择其中任意卡来进行结算。</p><p><br></p><p>结算请和务必选择“代付申请”，尽量不要使用“结算申请”。谢谢</p>', '1524794944', '结算方式变更', '1', '0');
INSERT INTO `pay_article` VALUES ('19', '4', '0', '告商户重要通知！', '近期发现商户的客户投诉时有发生，请妥善处理好。上游银联渠道实行的是客户投诉“投1冻2”规则。无法提供有效交易证明的，投诉额将被返还给客户。整个渠道会因投诉率被降级、冻结整个渠道资金、变更结算周期、或直至取消渠道资格等惩罚。&nbsp;', '1526458619', '重要通知！', '1', '1526458743');
INSERT INTO `pay_article` VALUES ('20', '3', '0', '紧急通知！！！！', '<p>接到上游通知，有客户私下对接违法网站，导致整个通道和款已被冻结。正在解决中。现暂停出款，配合上级检查到结果后再开放。敬请谅解！</p><p><br></p><p>结算方式暂变更为T+1</p>', '1527051803', '', '1', '1527064909');
INSERT INTO `pay_article` VALUES ('21', '0', '0', '结算方式变更通知！！！', '<p>因商户交易订单原因，导致原D0渠道被毁，并导致通道中所有流动资金被冻结。目前更改结算方式默认为T+1结算(周一至周五结算，双休和节假日不结算)，交易金额会出现在“冻结金额”中，但不是真正冻结，是到第二天自动结算到可结算余额中。</p><p><br></p><p>正在紧急申请新渠道中，短时间内将重新变更为D0结算。请谅解！！！</p>', '1527137780', '', '1', '1527212708');
INSERT INTO `pay_article` VALUES ('22', '0', '0', '紧急通知！！！', '<p>接上游紧急通知，因政策高速暂时关闭网银，快捷通道。余额可以在7日下午3时后结算。</p><p><br></p><p>敬请谅解！</p>', '1528274416', '', '1', '0');
INSERT INTO `pay_article` VALUES ('24', '4', '0', '支付宝WAP通道维护中。', '<p><span>支付宝WAP通道维护中。</span></p>', '1530050016', '', '1', '0');
INSERT INTO `pay_article` VALUES ('25', '4', '0', '快捷支付因投诉暂时关闭~', '<p><span>快捷支付因投诉暂时关闭~</span></p>', '1530501602', '', '1', '0');
INSERT INTO `pay_article` VALUES ('15', '3', '0', '2018年4月14日凌晨00:00至02:00上游通道进行维护，网银和快捷受影响。', '<p><span>2018年4月14日凌晨00:00至02:00上游通道进行维护，网银和快捷受影响。</span></p>', '1523376000', '', '1', '0');
INSERT INTO `pay_article` VALUES ('13', '0', '0', '乐百付API支付注册协议', '<p align=\"left\"><span><span><span>&nbsp; &nbsp;&nbsp;<span><span><span>乐百付网络科技有限公司（以下简称“乐百付”），同意按照本协议的规定及其不时发布的操作规则提供基于互联网的相关服务（以下称“网络服务”），服务使用人（以下称“商户”）应当同意本协议的全部条款并按照页面上的提示完成全部的注册程序。商户在进行注册程序过程中点“同意”按钮即表示个人完全接受本协议项下的全部条款。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>服务内容</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>乐百付支付在互联网上搭建乐百付支付服务平台，商户通过乐百付支付服务平台在互联网上受理用人民币银行卡进行支付的商品交易。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span><span><span>包括：</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>1</span></span></span><span><span><span>．安全加密和身份认证</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span><span><span>为商户使用乐百付支付的平台支付功能提供高质量的网络传输加密通道。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>2</span></span></span><span><span><span>．提供网上安全支付服务</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span><span><span>商户的商务网站产生的交易所需的在线支付与结算功能，通过乐百付支付的网上支付网关与乐百付支付所连通的国内商业银行交换信息，并将银行的确认信息反馈商户。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>3</span></span></span><span><span><span>．提供安全技术支持</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span><span><span>为商户提供订单信息传输的接口规范，配置安全传输协议，后台管理权限设定；为消费者的支付等重要信息提供高质量的网络传输加密通道。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>4</span></span></span><span><span><span>．向商户提供其在网上支付结算的相关信息查询服务。</span></span></span></span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>乐百付支付的权利与义务</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>1</span></span></span><span><span><span>．实时地将商户发来的网上支付的交易请求传递给银行，并将银行对该支付请求的应答及时、安全、保密地传递给商户。乐百付支付对其支付服务平台的支付接入系统中信息传递过程的安全、保密、实时性负责，承担且仅承担因此项原因造成的直接经济损失。因《合同法》规定之不可抗力（灾害、战争等）原因造成损失时，乐百付支付免除本条款所述责任，但应为商户提供书面证明资料并协助商户寻求补救办法。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>2</span></span></span><span><span><span>．每个交易日（正常工作日）后，乐百付支付及时向商户提供所有的交易和结算数据，并按本协议规定及时将结算资金划入商户账户。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>3</span></span></span><span><span><span>．负责为商户提供三个月内的交易信息查询功能。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>4</span></span></span><span><span><span>．乐百付支付有权根据系统升级等需要暂时中止提供在线支付服务，一般应提前一天在乐百付网站上明示、告知商户，并预告恢复日期。乐百付支付有权自行决定对支付平台的功能和服务进行改动和升级，对改进服务事项，将在乐百付网站上提前公示。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>5</span></span></span><span><span><span>．商户有下列情形之一的，乐百付支付有权立即终止本协议，并有权追偿因这些情形所导致的损失：</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(a) </span></span></span><span><span><span>与客户串通诈骗资金；</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(b) </span></span></span><span><span><span>无理拒绝受理客户使用在线支付平台而发生的成功交易；</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(c) </span></span></span><span><span><span>商户交易中存在过多的交易纠纷或过大的交易风险、且经双方友好协商无法解决；</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(d) </span></span></span><span><span><span>商户网站上没有提供真实有效的客服联系方式（即商户的客户无法通过商户网站提供的联系方式与商户取得联系、无法及时得到商户反馈）；</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(e) </span></span></span><span><span><span>银行出具的要求中止商户交易的书面通知。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>6</span></span></span><span><span><span>．商户业务变更或终止未及时通知乐百付支付，乐百付支付在联系无回应的情况下，有权中止本协议，并对持卡人提出的退款请求（在此款未转账给商户的情况下）进行处理，将持卡人在商户网站已提交的订单款项转回持卡人账户。</span></span></span></span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>商户的权利与义务</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>1</span></span></span><span><span><span>．商户在申请使用乐百付支付的乐百付支付平台服务时，必须向乐百付支付准确提供必要的资料。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>2</span></span></span><span><span><span>．商户注册成功后，乐百付支付为其开通一个账户，该账户的登录名和密码由商户负责保管；商户应当对以其账户进行的所有活动和事件负法律责任。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>3</span></span></span><span><span><span>．商户必须同意接受乐百付支付通过电子邮件或其他方式向其发送的产品促销或其他相关商业信息。 </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>4</span></span></span><span><span><span>．商户在网上发布的信息和从事的商务活动，需严格遵守政府及工商管理部门的有关规定并独自承担与此相应的责任。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(a) </span></span></span><span><span><span>提供基本业务情况说明及相关法律证明；承担由于其所提供的资质材料不准确、不真实等情况而导致的经济和法律方面的责任。乐百付支付对此保留终止为商户提供支付服务的权力。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(b) </span></span></span><span><span><span>商户应在其网站页面上如实描述乐百付支付支付业务，商户不得采用技术手段或其它非法手段截获持卡人的卡信息、代持卡人提交订单，商户必须在商户网站引导持卡人到乐百付支付平台亲自提交订单，否则乐百付支付保留终止为商户提供支付服务的权力。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(c) </span></span></span><span><span><span>及时处理持卡人的消费投诉，并负责处理因货物、价格以及售后服务等方面原因引起的与持卡人的纠纷。乐百付支付可提供相关协助。由于商户原因造成商户所提供服务引起的一切客户投诉或引起的法律上的责任，由商户负责或追究有关方面的责任，与乐百付支付无关。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(d) </span></span></span><span><span><span>商户终止服务或业务发生变更，应提前十五个工作日书面通知乐百付支付，否则造成损失由商户负责。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><b><span><span><span>资费及结算</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>1</span></span></span><span><span><span>、资费标准</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span><span><span>银行卡在线支付交易手续费率：0.8%</span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;</span></span></span></p><p align=\"left\"><span><span><span>&nbsp;</span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>退款处理</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>据银行的有关规定，对于网上交易流程中出现的、由于商户的原因（例：缺货、无法运货等）造成不能发货、做退款处理的情况，按如下处理：</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(a) </span></span></span><span><span><span>商户按乐百付支付及银行要求，在银行规定时限内，提交退款处理所需要的文字材料。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(b) </span></span></span><span><span><span>当商户向乐百付支付提出退款请求时，商户在乐百付支付账户中应有足够退款的账存资金，或者商户须按要求退款的金额将款项转账至乐百付支付账户，乐百付支付收到该款项后向持卡人做出退款处理。否则造成的一切后果均由商户承担。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(c) </span></span></span><span><span><span>退款时乐百付支付不再另收取手续费，但若银行方面需要另行收取相关费用，则此费用由商户承担。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(d) </span></span></span><span><span><span>扣款过程中收取的手续费不再退还，此费用由商户承担。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(e) </span></span></span><span><span><span>商户负责解决消费者无故拒付而导致的退款问题。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(f) </span></span></span><span><span><span>退款时，乐百付支付原则上不接受消费者的直接指令，乐百付支付有权将消费者的指令传达给商户，并由商户自行进行处理。但在商户与消费者发生纠纷时，如果乐百付支付认为商户存在未发货、退货、欺诈等情况，或乐百付支付认为不立即退款给消费者将影响乐百付支付的声誉或者给乐百付支付带来经济损失时，乐百付支付有权直接向消费者退款，如果商户的账存资金不足时，商户应及时向乐百付支付补偿相应的金额。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(g) </span></span></span><span><span><span>商户发起的退款指令须在交易发生后的40天内提出。</span></span></span></span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>内容所有权</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>乐百付支付提供的乐百付在线支付服务内容可能包括：文字、软件、声音、图片、录像、图表等。所有这些内容受版权、商标和其它财产所有权法律的保护。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>商户只有在获得乐百付支付或其他相关权利人的授权之后才能使用这些内容，不得擅自复制、再造这些内容、或制造与内容有关的派生产品。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>隐私保护</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>保护商户隐私是乐百付支付一项基本政策，乐百付支付保证不对外公开或向第三方提供商户注册资料及商户在使用网络服务时存储在乐百付支付的非公开内容，但下列情况除外：&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(a) </span></span></span><span><span><span>事先获得商户的明确授权；&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(b) </span></span></span><span><span><span>根据有关的法律法规要求；&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(c) </span></span></span><span><span><span>按照相关政府主管部门的要求；&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(d) </span></span></span><span><span><span>为维护社会公众的利益；&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(e) </span></span></span><span><span><span>为维护乐百付支付有限公司的合法权益。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>乐百付支付可能会与第三方合作向商户提供相关的网络服务，在此情况下，如该第三方同意承担与乐百付支付同等的保护商户隐私的责任，则乐百付支付可将用户的注册资料等信息提供给该第三方。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>在不透露单个商户隐私资料的前提下，乐百付支付有权对整个商户数据库进行</span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span><span><span>分析并对商户数据库进行商业上的利用。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp; </span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>免责声明</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>商户明确同意其使用乐百付支付提供的乐百付在线支付服务所存在的风险将完全由其自己承担；因其使用乐百付支付提供的服务而产生的一切后果也由其自行承担，乐百付支付对商户及其网上交易行为的影响不承担任何责任。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span><span><span>乐百付支付不担保网络服务一定能满足商户的要求，也不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。 </span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>乐百付支付不保证为向商户提供便利而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由乐百付支付实际控制的任何网页上的内容，乐百付支付不承担任何责任。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>对于因不可抗力或乐百付支付不能控制的原因造成的网络服务中断或其它缺陷，乐百付支付不承担任何责任，但将尽力减少因此而给商户造成的损失和影响 </span></span></span></span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>服务变更、中断或终止</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>如因系统维护或升级的需要而需暂停网络服务，乐百付支付将尽可能事先进行通告。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>如发生下列任何一种情形，乐百付支付有权随时中断或终止向商户提供本协议项下乐百付在线支付服务而无需通知商户：&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(a) </span></span></span><span><span><span>商户提供的个人资料不真实；&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span lang=\"EN-US\"><span><span>(b) </span></span></span><span><span><span>商户违反本协议中规定的使用规则。 </span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp; </span></span></span></p><p align=\"left\"><span><span><span><b><span><span><span>违约赔偿</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>商户同意保障和维护乐百付支付及其他拥护的利益，如因商户违反有关法律、法规或本协议项下的任何条款而给乐百付支付或任何其他第三方造成损失，用户同意承担由此造成的损害赔偿责任。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>协议修改</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>乐百付支付将有权随时修改本协议的有关条款，一旦本协议的内容发生变动，乐百付支付将会通过适当方式向商户提示修改内容。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span><span><span><span>如果不同意乐百付支付对本协议相关条款所做的修改，商户有权停止使用乐百付在线支付服务，但必须事先向乐百付支付提出书面通知。乐百付支付会与商户结清交易款，并停止提供服务。如果商户继续使用乐百付在线支付服务，则视为商户接受乐百付支付对本协议相关条款所做的修改。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>法律管辖</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>本协议的订立、执行和解释及争议的解决均应适用中国法律。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向乐百付支付所在地的人民法院提起诉讼。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>通知和送达</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>本协议项下所有的通知均可通过重要页面公告、电子邮件或常规的信件传送等方式进行；该等通知于发送之日视为已送达收件人。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><br></p><p align=\"left\"><span><span><span><b><span><span><span>其他</span></span></span></b></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp; <span><span><span>本协议构成双方对本协议之约定事项及其他有关事宜的完整协议，除本协议规定的之外，未赋予本协议各方其他权利。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>如本协议的条款与商户和乐百付支付公司另行签署的书面支付服务协议条款发生冲突，则以书面协议条款为准。&nbsp; </span></span></span></span></span></span></p><p align=\"left\"><span><span><span>&nbsp;&nbsp;&nbsp; <span><span><span>本协议中的标题仅为方便而设，在解释本协议时应被忽略。</span></span></span></span></span></span></p>', '1520388785', '', '0', '0');
INSERT INTO `pay_article` VALUES ('14', '0', '0', '支付限额说明', '<p>各支付方式单笔限额</p><p>网银：10-20000(各银行对卡支付限额也不一样，普遍是普通支付单笔5000)</p><p>快捷：25-5000</p><p>微信线上扫码：10-200</p><p>微信H5：10-500</p><p>支付宝H5：10-2000</p><p>QQ钱包扫码：10-2000</p><p>QQ钱包H5：10-2000</p><p>京东钱包：10-2000</p>', '1521993600', '支付限额', '1', '1522501145');
INSERT INTO `pay_article` VALUES ('27', '3', '0', '微信扫码维护至7月26日9时', '微信扫码维护至7月26日9时', '1532533674', '微信扫码维护至7月26日9时', '1', '0');
INSERT INTO `pay_article` VALUES ('28', '0', '0', '8月9日系统升级，代付结算在当日下午16点30分后启用。', '8月9日系统升级，代付结算在当日下午16点30分后启用。支付交易不受影响', '1533522559', '', '1', '0');
INSERT INTO `pay_article` VALUES ('29', '3', '0', '紧急通知！', '<p><span>关于人行的专线检查，系统会增加如下风控规则，请商户做好准备工作：</span></p><p><br /></p><p><span>1、限制夜间交易，限制时间为：0:00~6:00 ,出入金均限制，生效时间：下周二(9月11日)</span></p><p><span>2、限制入金交易金额为100的整数倍，</span>生效<span>时间：下周二(9月11日)</span></p><div><br /></div>', '1536244297', '紧急通知！', '1', '0');

-- ----------------------------
-- Table structure for `pay_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `pay_attachment`;
CREATE TABLE `pay_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户编号',
  `filename` varchar(100) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_attachment
-- ----------------------------
INSERT INTO `pay_attachment` VALUES ('48', '2', '242dd42a2834349b88359f1eccea15ce36d3be7e.jpg', 'Uploads/verifyinfo/59a2b65d0816c.jpg');
INSERT INTO `pay_attachment` VALUES ('46', '2', '6-140F316125V44.jpg', 'Uploads/verifyinfo/59a2b65cd9877.jpg');
INSERT INTO `pay_attachment` VALUES ('47', '2', '6-140F316132J02.jpg', 'Uploads/verifyinfo/59a2b65cea2ec.jpg');
INSERT INTO `pay_attachment` VALUES ('49', '33', 'QQ截图20180116205947.jpg', 'Uploads/verifyinfo/5ab0ef66717ef.jpg');
INSERT INTO `pay_attachment` VALUES ('50', '33', 'QQ截图20180116205848.jpg', 'Uploads/verifyinfo/5ab0ef6754ac6.jpg');
INSERT INTO `pay_attachment` VALUES ('51', '33', 'QQ截图20180116205939.jpg', 'Uploads/verifyinfo/5ab0ef684666c.jpg');
INSERT INTO `pay_attachment` VALUES ('52', '33', '0BEA2DCFFBBFDFD4975BFE9EC4226E2B.png', 'Uploads/verifyinfo/5ab0ef6937e32.png');
INSERT INTO `pay_attachment` VALUES ('53', '33', '45ADCE6DB27491F073432236935C85D5.png', 'Uploads/verifyinfo/5ab0ef69408f9.png');
INSERT INTO `pay_attachment` VALUES ('54', '33', '6A0310AFD43208A01B2EC48784BCA922.png', 'Uploads/verifyinfo/5ab0ef6985e4d.png');
INSERT INTO `pay_attachment` VALUES ('55', '41', 'QQ图片20180323191651.jpg', 'Uploads/verifyinfo/5ab4e24fe3d87.jpg');
INSERT INTO `pay_attachment` VALUES ('56', '41', 'QQ图片20180323191657.jpg', 'Uploads/verifyinfo/5ab4e250dc053.jpg');
INSERT INTO `pay_attachment` VALUES ('57', '41', 'QQ图片20180323191703.jpg', 'Uploads/verifyinfo/5ab4e250ecce5.jpg');
INSERT INTO `pay_attachment` VALUES ('58', '41', 'QQ图片20180323191642.jpg', 'Uploads/verifyinfo/5ab4e250efe7b.jpg');

-- ----------------------------
-- Table structure for `pay_auth_error_log`
-- ----------------------------
DROP TABLE IF EXISTS `pay_auth_error_log`;
CREATE TABLE `pay_auth_error_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `auth_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：商户登录 1：后台登录 2：商户短信验证 3：后台短信验证 4：谷歌令牌验证 5：支付密码验证 ',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_auth_error_log
-- ----------------------------
INSERT INTO `pay_auth_error_log` VALUES ('8', '1', '1', '1540380429');
INSERT INTO `pay_auth_error_log` VALUES ('9', '1', '1', '1540380444');
INSERT INTO `pay_auth_error_log` VALUES ('10', '1', '1', '1540380458');

-- ----------------------------
-- Table structure for `pay_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `pay_auth_group`;
CREATE TABLE `pay_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_manager` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1需要验证权限 0 不需要验证权限',
  `rules` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_auth_group
-- ----------------------------
INSERT INTO `pay_auth_group` VALUES ('1', '超级管理员', '1', '0', '1,49,2,3,51,4,57,5,55,56,58,59,6,44,52,53,48,70,54,127,133,7,8,60,61,62,9,63,64,65,66,10,67,68,69,11,12,79,80,81,82,83,84,85,86,87,88,89,90,91,93,94,95,96,97,98,99,100,101,120,13,14,15,92,16,73,76,77,78,17,121,131,18,19,71,75,20,21,72,74,22,23,114,115,24,25,26,46,126,128,129,132,134,27,28,29,102,30,103,106,107,119,104,105,109,110,111,125,135,31,32,33,34,35,36,37,38,39,113,40,112,41,42,45,47,116,122,117,123,118,124');
INSERT INTO `pay_auth_group` VALUES ('2', '运营管理员', '1', '0', '1,77,3,18,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,49,92,93,94,98,99,19,50,51,52,4,14,54,55,56,57,15,59,60,61,62,63,5,23,65,66,24,67,6,13,68,69,70,71,73,76,7,12,78,79,80,81,82,22,83,84,85,86,87');
INSERT INTO `pay_auth_group` VALUES ('3', '财务管理员', '1', '1', '1,77,5,23,65,66,24,67,6,13,68,69,70,71,73,76,25,72,26,74,75');
INSERT INTO `pay_auth_group` VALUES ('4', '普通商户', '1', '1', '27,30,103,106,107,119,104');
INSERT INTO `pay_auth_group` VALUES ('5', '普通代理商', '1', '1', '');

-- ----------------------------
-- Table structure for `pay_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `pay_auth_group_access`;
CREATE TABLE `pay_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_auth_group_access
-- ----------------------------
INSERT INTO `pay_auth_group_access` VALUES ('1', '1');
INSERT INTO `pay_auth_group_access` VALUES ('2', '4');
INSERT INTO `pay_auth_group_access` VALUES ('7', '2');

-- ----------------------------
-- Table structure for `pay_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `pay_auth_rule`;
CREATE TABLE `pay_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) DEFAULT '' COMMENT '图标',
  `menu_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一标识Controller/action',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `pid` tinyint(5) NOT NULL DEFAULT '0' COMMENT '菜单ID ',
  `is_menu` tinyint(1) unsigned DEFAULT '0' COMMENT '1:是主菜单 0否',
  `is_race_menu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:是 0:不是',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pay_auth_rule
-- ----------------------------
INSERT INTO `pay_auth_rule` VALUES ('1', 'fa fa-home', 'Index/index', '管理首页', '0', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('2', 'fa fa-cogs', 'System/#', '系统设置', '0', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('3', 'fa fa-cog', 'System/base', '基本设置', '2', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('4', 'fa fa-envelope-o', 'System/email', '邮件设置', '2', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('5', 'fa fa-send', 'System/smssz', '短信设置', '2', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('6', 'fa fa-hourglass', 'System/planning', '计划任务', '2', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('7', 'fa fa-user-circle', 'Admin/#', '管理员管理', '0', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('8', 'fa fa-vcard ', 'Admin/index', '管理员信息', '7', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('9', 'fa fa-street-view', 'Auth/index', '角色配置', '7', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('10', 'fa fa-universal-access', 'Menu/index', '权限配置', '7', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('11', 'fa fa-users', 'User/#', '用户管理', '0', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('12', 'fa fa-user', 'User/index?status=1&authorized=1', '已认证用户', '11', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('13', 'fa fa-user-o', 'User/index?status=1&authorized=2', '待认证用户', '11', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('14', 'fa fa-user-plus', 'User/index?status=1&authorized=0', '未认证用户', '11', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('15', 'fa fa-user-times', 'User/index?status=0', '冻结用户', '11', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('16', 'fa fa-gift', 'User/invitecode', '邀请码', '11', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('17', 'fa fa-address-book', 'User/loginrecord', '登录记录', '11', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('18', 'fa fa-handshake-o', 'Agent/#', '代理管理', '0', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('19', 'fa fa-hand-lizard-o', 'User/agentList', '代理列表', '18', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('20', 'fa fa-signing', 'Order/changeRecord?bank=9', '佣金记录', '18', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('21', 'fa fa-sellsy', 'Order/dfApiOrderList', '代付Api订单', '18', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('22', 'fa fa-reorder', 'User/#', '订单管理', '0', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('23', 'fa fa-indent', 'Order/changeRecord', '流水记录', '22', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('24', 'fa fa-thumbs-up', 'Order/index?status=1or2', '成功订单', '22', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('25', 'fa fa-thumbs-down', 'Order/index?status=0', '未支付订单', '22', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('26', 'fa fa-hand-o-right', 'Order/index?status=1', '异常订单', '22', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('27', 'fa fa-user-secret', 'Withdrawal', '提款管理', '0', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('28', 'fa fa-wrench', 'Withdrawal/setting', '提款设置', '27', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('29', 'fa fa-asl-interpreting', 'Withdrawal/index', '手动结算', '27', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('30', 'fa fa-window-restore', 'Withdrawal/payment', '代付结算', '27', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('31', 'fa fa-bank', 'Channel/#', '通道管理', '0', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('32', 'fa fa-product-hunt', 'Channel/index', '入金渠道设置', '31', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('33', 'fa fa-sitemap', 'Channel/product', '支付产品设置', '31', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('34', 'fa fa-sliders', 'PayForAnother/index', '代付渠道设置', '31', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('35', 'fa fa-book', 'Content/#', '文章管理', '0', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('36', 'fa fa-tags', 'Content/category', '栏目列表', '35', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('37', 'fa fa-list-alt', 'Content/article', '文章列表', '35', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('38', 'fa fa-line-chart', 'Statistics/#', '财务分析', '0', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('39', 'fa fa-bar-chart-o', 'Statistics/index', '交易统计', '38', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('40', 'fa fa-area-chart', 'Statistics/userFinance', '商户交易统计', '38', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('41', 'fa fa-industry', 'Statistics/userFinance?groupid=agent', '代理商交易统计', '38', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('42', 'fa fa-pie-chart', 'Statistics/channelFinance', '接口交易统计', '38', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('43', 'fa fa-cubes', 'Template/index', '模板设置', '2', '1', '0', '1', '0', '');
INSERT INTO `pay_auth_rule` VALUES ('44', 'fa fa-mobile', 'System/mobile', '手机设置', '2', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('45', 'fa fa-signal', 'Statistics/chargeRank', '充值排行榜', '38', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('46', 'fa fa-first-order', 'Deposit/index', '投诉保证金设置', '22', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('47', 'fa fa-asterisk', 'Statistics/complaintsDeposit', '投诉保证金统计', '38', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('48', 'fa fa-database', 'System/clearData', '数据清理', '2', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('49', '', 'Index/main', 'Dashboard', '1', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('51', '', 'System/SaveBase', '保存设置', '3', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('52', '', 'System/BindMobileShow', '绑定手机号码', '44', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('53', '', 'System/editMobileShow', '手机修改', '44', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('54', 'fa fa-lock', 'System/editPassword', '修改密码', '2', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('55', '', 'System/editSmstemplate', '短信模板', '5', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('56', '', 'System/saveSmstemplate', '保存短信模板', '5', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('57', '', 'System/saveEmail', '邮件保存', '4', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('58', '', 'System/testMobile', '测试短信', '5', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('59', '', 'System/deleteAdmin', '删除短信模板', '5', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('60', '', 'Admin/addAdmin', '管理员添加', '8', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('61', '', 'Admin/editAdmin', '管理员修改', '8', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('62', '', 'Admin/deleteAdmin', '管理员删除', '8', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('63', '', 'Auth/addGroup', '添加角色', '9', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('64', '', 'Auth/editGroup', '修改角色', '9', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('65', '', 'Auth/giveRole', '选择角色', '9', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('66', '', 'Auth/ruleGroup', '分配权限', '9', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('67', '', 'Menu/addMenu', '添加菜单', '10', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('68', '', 'Menu/editMenu', '修改菜单', '10', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('69', '', 'Menu/delMenu', '删除菜单', '10', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('70', '', 'System/clearDataSend', '数据清理提交', '48', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('71', '', 'User/addAgentCate', '代理级别', '19', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('72', '', 'User/saveAgentCate', '保存代理级别', '18', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('73', '', 'User/addInvitecode', '添加激活码', '16', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('74', '', 'User/EditAgentCate', '修改代理分类', '18', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('75', '', 'User/deleteAgentCate', '删除代理分类', '19', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('76', '', 'User/setInvite', '邀请码设置', '16', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('77', '', 'User/addInvite', '创建邀请码', '16', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('78', '', 'User/delInvitecode', '删除邀请码', '16', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('79', '', 'User/editUser', '用户编辑', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('80', '', 'User/changeuser', '修改状态', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('81', '', 'User/authorize', '用户认证', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('82', '', 'User/usermoney', '用户资金管理', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('83', '', 'User/userWithdrawal', '用户提现设置', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('84', '', 'User/userRateEdit', '用户费率设置', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('85', '', 'User/editPassword', '用户密码修改', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('86', '', 'User/editStatus', '用户状态修改', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('87', '', 'User/delUser', '用户删除', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('88', '', 'User/thawingFunds', 'T1解冻任务管理', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('89', '', 'User/exportuser', '导出用户', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('90', '', 'User/editAuthoize', '修改用户认证', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('91', '', 'User/getRandstr', '切换商户密钥', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('92', '', 'User/suoding', '用户锁定', '15', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('93', '', 'User/editbankcard', '银行卡管理', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('94', '', 'User/saveUser', '添加用户', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('95', '', 'User/saveUserProduct', '保存用户产品', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('96', '', 'User/saveUserRate', '保存用户费率', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('97', '', 'User/edittongdao', '编辑通道', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('98', '', 'User/frozenMoney', '用户资金冻结', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('99', '', 'User/unfrozenHandles', 'T1资金解冻', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('100', '', 'User/frozenOrder', '冻结订单列表', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('101', '', 'User/frozenHandles', 'T1订单解冻展示', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('102', '', 'Withdrawal/editStatus', '操作状态', '29', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('103', '', 'Withdrawal/editwtStatus', '操作订单状态', '30', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('104', '', 'Withdrawal/exportorder', '导出数据', '27', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('105', '', 'Withdrawal/editwtAllStatus', '批量修改提款状态', '27', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('106', '', 'Withdrawal/exportweituo', '导出委托提现', '30', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('107', '', 'Payment/index', '提交上游', '30', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('108', '', 'Withdrawal/saveWithdrawal', '保存设置', '28', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('109', '', 'Withdrawal/AddHoliday', '添加假日', '27', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('110', '', 'Withdrawal/settimeEdit', '编辑提款时间', '27', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('111', '', 'Withdrawal/delHoliday', '删除节假日', '27', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('112', '', 'Statistics/exportorder', '订单数据导出', '40', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('113', '', 'Statistics/details', '查看详情', '39', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('114', '', 'Order/exportorder', '订单导出', '23', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('115', '', 'Order/exceldownload', '记录导出', '23', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('116', 'fa fa-area-chart', 'Statistics/platformReport', '平台报表', '38', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('117', 'fa fa-area-chart', 'Statistics/merchantReport', '商户报表', '38', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('118', 'fa fa-area-chart', 'Statistics/agentReport', '代理报表', '38', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('119', '', 'Withdrawal/submitDf', '代付提交', '30', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('120', '', 'User/editUserProduct', '分配用户通道', '12', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('121', 'fa fa-wrench', 'Transaction/index', '风控设置', '11', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('122', '', 'Statistics/exportPlatform', '导出平台报表', '116', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('123', '', 'Statistics/exportMerchant', '导出商户报表', '117', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('124', '', 'Statistics/exportAgent', '导出代理报表', '118', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('125', '', 'Withdrawal/rejectAllDf', '批量驳回代付', '27', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('126', '', 'Order/show', '查看订单', '22', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('127', 'fa fa-cog', 'Withdrawal/checkNotice', '提现申请声音提示', '2', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('128', 'fa fa-snowflake-o', 'Order/index', '全部订单', '22', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('129', '', 'Order/index?status=2', '查看已支付订单', '22', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('130', '', 'User/saveWithdrawal', '保存用户提款设置', '28', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('131', 'fa fa-wrench', 'Transaction/index', '风控设置', '11', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('132', '', 'Order/show', '查看订单', '22', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('133', 'fa fa-cog', 'Withdrawal/checkNotice', '提现申请声音提示', '2', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('134', 'fa fa-snowflake-o', 'Order/index', '全部订单', '22', '1', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('135', '', 'Withdrawal/rejectAllDf', '批量驳回代付', '27', '0', '0', '1', '1', '');
INSERT INTO `pay_auth_rule` VALUES ('137', 'fa fa-snowflake-o', 'Order/frozenOrder', '冻结订单', '22', '1', '0', '1', '1', '');

-- ----------------------------
-- Table structure for `pay_auto_df_log`
-- ----------------------------
DROP TABLE IF EXISTS `pay_auto_df_log`;
CREATE TABLE `pay_auto_df_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `df_id` int(11) NOT NULL DEFAULT '0' COMMENT '代付ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型：1提交 2查询',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '结果 0：提交失败 1：提交成功 2：代付成功 3：代付失败',
  `msg` varchar(255) DEFAULT '' COMMENT '描述',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_auto_df_log
-- ----------------------------
INSERT INTO `pay_auto_df_log` VALUES ('1', '3', '2', '1', '交易进行中', '1537273022');
INSERT INTO `pay_auto_df_log` VALUES ('2', '3', '2', '1', '交易进行中', '1537273082');
INSERT INTO `pay_auto_df_log` VALUES ('3', '3', '2', '2', '交易成功', '1537273141');

-- ----------------------------
-- Table structure for `pay_auto_unfrozen_order`
-- ----------------------------
DROP TABLE IF EXISTS `pay_auto_unfrozen_order`;
CREATE TABLE `pay_auto_unfrozen_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `freeze_money` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '冻结金额',
  `unfreeze_time` int(11) NOT NULL DEFAULT '0' COMMENT '计划解冻时间',
  `real_unfreeze_time` int(11) NOT NULL DEFAULT '0' COMMENT '实际解冻时间',
  `is_pause` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否暂停解冻 0正常解冻 1暂停解冻',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '解冻状态 0未解冻 1已解冻',
  `create_at` int(11) NOT NULL COMMENT '记录创建时间',
  `update_at` int(11) NOT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_unfreezeing` (`status`,`is_pause`,`unfreeze_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手动冻结订单';

-- ----------------------------
-- Records of pay_auto_unfrozen_order
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_bankcard`
-- ----------------------------
DROP TABLE IF EXISTS `pay_bankcard`;
CREATE TABLE `pay_bankcard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户编号',
  `bankname` varchar(100) NOT NULL COMMENT '银行名称',
  `subbranch` varchar(100) NOT NULL COMMENT '支行名称',
  `accountname` varchar(100) NOT NULL COMMENT '开户名',
  `cardnumber` varchar(100) NOT NULL COMMENT '银行卡号',
  `province` varchar(100) NOT NULL COMMENT '所属省',
  `city` varchar(100) NOT NULL COMMENT '所属市',
  `ip` varchar(100) DEFAULT NULL COMMENT '上次修改IP',
  `ipaddress` varchar(300) DEFAULT NULL COMMENT 'IP地址',
  `alias` varchar(255) DEFAULT '' COMMENT '备注',
  `isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认 1是 0 否',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `IND_UID` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=2081 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_bankcard
-- ----------------------------
INSERT INTO `pay_bankcard` VALUES ('45', '19', '招商银行', '招商银行重庆沙坪坝支行', '赵赟', '6214832308048938', '重庆', '重庆', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('46', '16', '中国农业银行', '七台河市新兴区支行', '王军章', '6228482230448036617', '黑龙江省', '七台河市', null, null, '王军章', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('47', '16', '中国建设银行', '新兴区支行', '罗婷婷', '6217001080003114175', '黑龙江省', '七台河市', null, null, '罗婷婷', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('48', '16', '中国建设银行', '新兴区支行', '王永全', '6217001080002909716', '黑龙江省', '七台河市', null, null, '王永全', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('49', '16', '中国建设银行', '西红门支行', '张广飞', '6217000010120803914', '北京市', '北京市', null, null, '张广飞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('50', '40', '中国邮政储蓄银行', '中国邮政储蓄银行永州市双牌县平阳支行', '涂勇波', '6217995650010679291', '湖南省', '永州市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('553', '97', '招商银行', '江苏省如皋支行 ', '张雪薇 ', '6214835130245168', '江苏省', '南通市', null, null, '张雪薇 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('150', '92', '中国银行', '中国银行濮阳历山路支行', '宋大娜', '6217858000093044185', '河南省', '濮阳', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('101', '24', '招商银行', '湘潭支行', '陈宇杰', '6214837320887551', '湖南省', '湘潭', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('64', '64', '中国农业银行', '苏州工业园星海街支行', '张晓凯', '6228480405891257074', '江苏省', '苏州', null, null, '无', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('55', '26', '招商银行', '江西南昌青山湖支行', '毛航', '6214837903927576', '江西', '南昌', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('56', '42', '支付宝', '13231607377', '李秋荣', '13231607377', '', '', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('58', '63', '', '工商银行嘉兴市桐乡新濮支行', '赵玉胜', '6222081204001887417', '浙江', '嘉兴市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('68', '74', '中国建设银行', '东莞塘厦迎宾支行', '石敏华', '6217003230038065284', '广东省', '东莞市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('60', '8', '中国银行', '海门腾达支行', '周运河', '6217856100076884441', '江苏', '南通', null, null, '中行周运河', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('61', '69', '中国民生银行', '广西南宁西乡塘民生支行', '罗启槟', '6216915501467571', '广西', '南宁', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('62', '29', '中国工商银行', '抚州文昌支行营业室', '王燕丽', '6215581511002864990', '江西省', '抚州市', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('63', '20', '中国工商银行', '义乌港城支行', '祝路', '6215581208001321573', '浙江', '义乌', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('65', '18', '中国农业银行', '农行上海三林支行', '陈俊琴', '6228480038484243670', '上海', '上海', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('67', '66', '中国银行', '三明清流支行', '杨洋', '6217906400017675456', '福建省', '三明市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('69', '70', '中国邮政储蓄银行', '湖北支行', '肖佳阳', '6217995200060606537', '湖北', '', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('70', '20', '广发银行', '广东省珠海市香洲区拱北夏湾支行', '傅银梅', '6214621321000355792', '广东省', '珠海市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('71', '20', '中国农业银行', '韶关安全东支行', '叶贵莲', '6230521430000797676', '广东省', '韶关市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('77', '75', '招商银行', '体育西路支行', '冯炜邦', '6214851202857566', '广东省', '广州市', null, null, '冯先生', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('76', '60', '广发银行', '江门市五邑大学支行', '饶晓宇', '6225680323000189605', '广东省', '江门市', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('74', '8', '中国邮政储蓄银行', '邮政储蓄灌云县支行', '周庆同', '6217993000290934937', '江苏', '连云港', null, null, '邮政周庆同', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('75', '8', '招商银行', '招商银行江阴支行', '周运河', '6214835111150338', '江苏', '无锡', null, null, '招商周运河', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('78', '75', '中国工商银行', '从化市荔香支行', '欧阳敬文', '6212263602054455654', '广东省', '广州市', null, null, '欧阳敬文', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('80', '73', '中国民生银行', '广西南宁民生银行', '罗启槟', '6216915501467571', '广西', '南宁', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('97', '87', '中国建设银行', '海南三亚分行', '陈国林', '6236683520006352673', '海南', '三亚', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('83', '8', '中国工商银行', '义乌港城支行', '祝路', '6215581208001321573', '浙江', '义乌', null, null, '财神祝路工商', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('98', '20', '中国工商银行', '梧州藤县支行', '李汉昌', '6222032104002371835', ' 广西省', '梧州市', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('85', '80', '上海浦东发展银行', '广州琶洲支行', '刘恩良', '6217921005346559', '广东省', '广州市', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('114', '24', '中国建设银行', '辽宁省分行', '马芳芳', '6236680730006384526', '辽宁省', '', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('124', '84', '中国光大银行', '上海市龙茗路支行', '白锋锋', '6226630603128249', '上海', '上海', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('100', '45', '中国农业银行', '葫芦岛渤海支行', '中国农业银行', '6230521270009404175', '辽宁省', '葫芦岛市', null, null, '辽宁省葫芦岛市', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('102', '24', '中国工商银行', '宁明县支行', '黄罗浩', '6212262112002198720', '广西省', '崇左市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('92', '20', '中国工商银行', '玉林容县兴容支行', '李广源', '6212262111003689844', '广西省', '玉林市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('108', '75', '中国建设银行', '城南支行', '刘金荣', '6227001278970012716', '江苏省', '南通市', null, null, '刘金荣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('109', '20', '招商银行', '金华分行义乌支行', '祝路', '6214835793615517', '浙江', '金华分行义乌', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('149', '108', '中国农业银行', '湘乡支行', '胡永逸', '6228481119448152972', '', '', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('133', '39', '中国工商银行', '延边和龙支行营业部', '许光天', '6222030808000843759', '吉林', '延边', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('126', '95', '中国工商银行', '河南省焦作市二环路支行', '王晨', '6212261709003753402', '河南省', '焦作市', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('128', '91', '中国民生银行', '西城支行', '翟永星', '6226197901074590', '山东', '临沂', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('130', '103', '中国建设银行', '石家庄开发区黄河大道支行', '李阳', '6236680130005227760', '河北省', '石家庄', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('144', '108', '招商银行', '', '胡志浩', '6214832133631817', '上海', '上海', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('147', '97', '中国工商银行', '长治县支行营业室', '李渊', '6222030505000362554', '山西', '长治', null, null, '李渊', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('148', '84', '华夏银行', '华夏银行上海市闵行支行', '闫万震', '6230200055494061', '上海', '上海', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2080', '8', '中国邮政储蓄银行', '灌云县支行', '房友梅', '6217993000261656865', '江苏', '连云港', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('152', '109', '中国建设银行', '江苏省昆山市汉浦路支行', '张献杰', '6236682000017423673', '江苏', '昆山', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('557', '97', '中国银行', '江苏省如皋市西皋支行 ', '冒亚红 ', '6217566100029421318', '江苏省', '南通市', null, null, '冒亚红 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('556', '97', '中国工商银行', '临汾市向阳路支行 ', '郭沙沙 ', '6222020510002168126', '山东省', '临汾市', null, null, '郭沙沙 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('555', '97', '中国建设银行', '江苏省如皋支行 ', '张艳红 ', '4340621270005782', '江苏省', '南通市', null, null, '张艳红 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('159', '97', '中国农业银行', '辽宁沈阳河沿支行', '韩俊峰', '6228480049012240773', '辽宁省', '沈阳', null, null, '韩俊峰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('554', '97', '中国工商银行', '临汾市车站支行 ', '李佳宾 ', '6222020510007140203', '山东省', '临汾市', null, null, '李佳宾 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('552', '97', '中国建设银行', '山西省临汾市鼓楼支行 ', '亢二女 ', '6227000351080252950', '山东省', '临汾市', null, null, '亢二女 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('550', '97', '中国建设银行', '临汾市营业部 ', '刘婷 ', '6217000350003563908', '山东省', '临汾市', null, null, '刘婷 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1820', '47', '中国工商银行', '工商银行', '韦冬秋', '6212262102017079734', '', '', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('544', '97', '中国农业银行', '安镇支行 ', '杜京京 ', '6228480434589245712', '江苏省', '无锡市', null, null, '杜京京 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('545', '97', '中国农业银行', '中国农业银行股份有限公司南通分行 ', '周玲 ', '6228480425801876870', '江苏省', '南通市', null, null, '周玲 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('546', '97', '中国建设银行', '中国建设银行股份有限公司福州金街支行 ', '陈茂财 ', '6227001824120223537', '福建省', '福州市', null, null, '陈茂财 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('169', '109', '招商银行', '湖北襄阳襄阳支行', '翁美悦', '6214837105358877', '湖北省', '襄阳市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('551', '97', '中国建设银行', '江苏如皋北门分理处 ', '周美云 ', '5522451276389999', '江苏省', '南通市', null, null, '周美云 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('549', '97', '中国农业银行', '山西省临汾市尧都区平阳支行 ', '张鸿 ', '6228481298622210374', '山东省', '临汾市', null, null, '张鸿 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('548', '97', '中国建设银行', '江苏省如皋市建行北门分理处 ', '周海霞 ', '6227001272930060238', '江苏省', '南通市', null, null, '周海霞 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('175', '114', '中国工商银行', '苏州新区新升支行', '熊兵', '6222021102011114843', '江苏省', '苏州', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('547', '97', '中国工商银行', '枣庄市分行滕州支行 ', '徐跃 ', '6212261605007256261', '山东省', '枣庄市', null, null, '徐跃 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('542', '97', '中国工商银行', '南通启东城西支行', ' 施美丞 ', '6222021111011953837', '江苏省', '南通市', null, null, ' 施美丞 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('543', '97', '中国工商银行', '石河子百大城支行 ', '吴彦云 ', '6222033016000092917', '新疆省', '石河子', null, null, '吴彦云 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('536', '97', '兴业银行', '临汾分行 ', '吕海军 ', '622908483019986118', '山西省', '临汾市', null, null, '吕海军 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('537', '97', '招商银行', '上海市分行闵行支行', '汪盼', '6214832160532268', '上海市', '上海市', null, null, '汪盼', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('538', '97', '中国工商银行', '江苏省南通市友谊桥工商银行', '吴冬梅', '6222021111016729109', '江苏省', '南通市', null, null, '吴冬梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('540', '97', '中国建设银行', '遵义市分行人民路支行 ', '孟美琼 ', '6217007110010980989', '贵州省', '遵义市', null, null, '孟美琼 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('541', '97', '中国工商银行', '南通启东人民东路支行 ', '张校 ', '6215581111002542744', '江苏省', '南通市', null, null, '张校 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('185', '111', '上海浦东发展银行', '如皋市支行', '钱君', '6217922351728929', '江苏', '南通', null, null, '钱君', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('582', '97', '中国建设银行', '中国建设银行股份有限公司太仓南区分理处 ', '沈雪琴 ', '6217002000038143329', '江苏省', '太仓市', null, null, '沈雪琴 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('583', '97', '交通银行', '南通市小石桥支行 ', '任霞 ', '6222623100002936283', '江苏省', '南通市', null, null, '任霞 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('584', '97', '中国建设银行', '苏州市太仓支行 ', '陈亮 ', '6236682000003186177', '江苏省', '苏州市', null, null, '陈亮 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('585', '97', '中国建设银行', '中国建设银行股份有限公司太仓璜泾支行 ', '王一帆 ', '6227002007630142764', '江苏省', '太仓市', null, null, '王一帆 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('586', '97', '中国农业银行', '无锡市东湖塘支行 ', '陈云娟 ', '6228480433554677412', '江苏省', '无锡市', null, null, '陈云娟 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('587', '97', '中国建设银行', '启东江海北路分理处 ', '施海娟 ', '6217001270004830701', '江苏省', '启东市', null, null, '施海娟 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('580', '97', '中国银行', '启东支行营业部 ', '陆冬林 ', '6217856100034703709', '江苏省', '南通市', null, null, '陆冬林 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('581', '97', '中国建设银行', '苏州市分行昆山城中支行 ', '樊小华 ', '4367422006630367361', '江苏省', '苏州市', null, null, '樊小华 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('579', '97', '中国农业银行', '南通青年西路支行 ', '钟廷英 ', '6228450428042053974', '江苏省', '南通市', null, null, '钟廷英 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('578', '97', '招商银行', '招商银行江苏省太仓市支行 ', '朱雪娟 ', '6214855120183401', '江苏省', '太仓市', null, null, '朱雪娟 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('577', '97', '中国建设银行', '中国建设银行股份有限公司临汾分行业务经营部 ', '张马兴 ', '6217000350006296530', '山西省', '临汾市', null, null, '张马兴 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('576', '97', '中国建设银行', '苏州市昆山市开发区支行 ', '陈晓明 ', '6222802006631059277', '江苏省', '苏州市', null, null, '陈晓明 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('203', '93', '中国光大银行', '昆山支行', '张昆', '6214921804192686', '江苏省', '昆山市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('204', '93', '中国光大银行', '昆山支行', '张昆', '6214921804192686', '江苏省', '苏州市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('575', '97', '中国工商银行', '南通启东市城西支行 ', '毛文君 ', '6215581111007227739', '江苏省', '南通市', null, null, '毛文君 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('574', '97', '交通银行', '临汾市尧都区鼓楼支行 ', '孙华蓉 ', '6222621460001156925', '山西省', '临汾市', null, null, '孙华蓉 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('573', '97', '中国银行', '南通启东华联支行 ', '施天哲 ', '6217856100007653998', '江苏省', '南通市', null, null, '施天哲 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('572', '97', '中国邮政储蓄银行', '启东市大同营业所 ', '陆萍 ', '6217993000255224621', '江苏省', '南通市', null, null, '陆萍 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('571', '97', '中国建设银行', '临汾市分行车站街支行 ', '马海龙 ', '6217000350008313440', '山西省', '临汾市', null, null, '马海龙 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('570', '97', '中国农业银行', '江苏省如皋市石庄支行 ', '钱美 ', '6228480429399944975', '江苏省', '南通市', null, null, '钱美 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('569', '97', '中国农业银行', '无锡市农业银行梅村支行 ', '钱张晶 ', '6228480432301981317', '江苏省', '无锡市', null, null, '钱张晶 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('558', '97', '招商银行', '江苏省如皋市支行 ', '石莉莉 ', '6226095131056611', '江苏省', '南通市', null, null, '石莉莉 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('559', '97', '中国工商银行', '江苏无锡 ', '蔡小明 ', '622208110300080755', '江苏省', '无锡市', null, null, '蔡小明 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('560', '97', '中国工商银行', '山西省临汾市西城支行 ', '张丽娜 ', '6212260510005495419', '山西省', '临汾市', null, null, '张丽娜 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('561', '97', '中国银行', '中国银行临汾分行解放路支行 ', '许鑫 ', '6217858100013909135', '山西省', '临汾市', null, null, '许鑫 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('562', '97', '中国工商银行', '临汾市平阳支行 ', '刘震 ', '6212260510006291437', '山西省', '临汾市', null, null, '刘震 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('563', '97', '中国银行', '中国银行启东支行 ', '陆抗美 ', '6259063203337939', '江苏省', '南通市', null, null, '陆抗美 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('564', '97', '招商银行', '江苏省如皋市支行 ', '吴晓群', '6214835132650365', '江苏省', '南通市', null, null, '吴晓群', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('565', '97', '中国农业银行', '江苏省太仓分行 ', '洪秋 ', '6228480400983813116', '江苏省', '太仓市', null, null, '洪秋 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('566', '97', '中国建设银行', '昆山市东城支行 ', '薛琴 ', '6236682000004856075', '江苏省', '昆山市', null, null, '薛琴 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('567', '97', '中国建设银行', '常州市新北区春江镇支行 ', '高亦琦 ', '6227001263070029828', '江苏省', '常州市', null, null, '高亦琦 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('568', '97', '中国农业银行', '江苏苏州太仓娄东支行 ', '王慧 ', '6228480403607173818', '江苏省', '苏州市', null, null, '王慧 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('620', '97', '中国建设银行', '中国建设银行湖南省郴州市资兴市支行鲤鱼江分理处 ', '谭英 ', '6227002980240079263', '湖南省', '郴州市', null, null, '谭英 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('619', '97', '中国工商银行', '南通启东城西支行 ', '黄和珍 ', '6222081111004419728', '江苏省', '南通市', null, null, '黄和珍 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('618', '97', '中国邮政储蓄银行', '江苏无锡 ', '王树根 ', '6217993000269391853', '江苏省', '无锡市', null, null, '王树根 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('617', '97', '中国农业银行', '盐城市 ', '钱兰凤 ', '6228481985739614379', '江苏省', '盐城市 ', null, null, '钱兰凤 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('616', '97', '中信银行', '江苏省南通市海安县支行', '程彩虹 ', '6226960500414594', '江苏省', '南通市', null, null, '程彩虹 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('614', '97', '中国工商银行', '无锡市安镇分行中国工商银行 ', '殷杰 ', '6212261103002373679', '江苏省', '无锡市', null, null, '殷杰 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('615', '97', '中国工商银行', '江苏省如皋市总支行 ', '庄凤美 ', '6215581111007154958', '江苏省', '南通市', null, null, '庄凤美 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('613', '97', '中国农业银行', '启东支行 ', '薛允慧', '6228480425020799374', '江苏省', '南通市', null, null, '薛允慧 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('612', '97', '中国工商银行', '无锡港下 ', '顾秋丹 ', '6222021103006727995', '江苏省', '无锡市', null, null, '顾秋丹 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('611', '97', '中国工商银行', '临汾尧都支行营业部 ', '王娜 ', '6222020510001900800', '山西省', '临汾市', null, null, '王娜 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('610', '97', '中国农业银行', '启东市曹家镇支行 ', '黄娟 ', '6228480428553421473', '江苏省', '南通市', null, null, '黄娟 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('609', '97', '中国农业银行', '启东曹家镇分理处 ', '曹骏 ', '6228480427982638475', '江苏省', '南通市', null, null, '曹骏 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('608', '97', '中国农业银行', '上海市青浦区徐泾镇京华路徐泾支行 ', '倪芹 ', '6228480038850305970', '上海市', '上海市', null, null, '倪芹 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('588', '97', '中国建设银行', '淮安分行营业部 ', '李前坤 ', '6217001290005749445', '江苏省', '淮安', null, null, '李前坤 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('589', '97', '中国银行', '启东市吕四支行 ', '陈曜坤 ', '6217856100055911272', '江苏省', '南通市', null, null, '陈曜坤 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('590', '97', '中国银行', '江苏省南通市跃龙路南通支行 ', '刘金华 ', '6217566100035463213', '江苏省', '南通市', null, null, '刘金华 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('591', '97', '中国建设银行', '上海市虹口支行 ', '张春雅 ', '6227001217020042810', '上海市', '上海市', null, null, '张春雅 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('592', '97', '中国建设银行', '常州市金坛西门支行 ', '夏忠平 ', '4367421265010098258', '江苏省', '常州市', null, null, '夏忠平 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('593', '97', '中国建设银行', '江苏省苏州市支行 ', '孙晨琳 ', '6217002000017593163', '江苏省', '苏州市', null, null, '孙晨琳 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('594', '97', '中国农业银行', '冮苏南通启东支行 ', '陈圣贤 ', '6228480425602939372', '江苏省', '南通市', null, null, '陈圣贤 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('595', '97', '中国农业银行', '运城市中国农业银行运城支行 ', '郝小亲 ', '6230523040020151370', '山西省', '运城市', null, null, '郝小亲 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('596', '97', '中国银行', '如皋市中国银行 ', '吉洪 ', '6217906100009068153', '江苏省', '南通市', null, null, '吉洪 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('597', '8', '中国银行', '海门腾达支行', '范存峰', '6217856100069450598', '江苏', '南通', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('598', '97', '中国农业银行', '长沙市天心区支行 ', '向欣芳 ', '6230521090023176470', '湖南省', '长沙市', null, null, '向欣芳 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('599', '97', '中国工商银行', '运城中国工商银行运城支行 ', '冉冬冬 ', '6212260511005342809', '山西省', '运城市', null, null, '冉冬冬 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('600', '97', '中国邮政储蓄银行', '江苏省南通市启东支行 ', '张桂芳 ', '6217993000215162531', '江苏省', '南通市', null, null, '张桂芳 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('601', '97', '中国邮政储蓄银行', '中国邮政储蓄银行北哈药路营业所 ', '汤强 ', '6217992610194514956', '黑龙江省', '哈尔滨', null, null, '汤强 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('602', '97', '中国农业银行', '苏州市支行 ', '徐水云 ', '6228480402737960011', '江苏省', '苏州市', null, null, '徐水云 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('603', '97', '中国工商银行', '南通启东支行 ', '张吕军 ', '6222081111003198190', '江苏省', '南通市', null, null, '张吕军 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('604', '97', '中国农业银行', '南通市人民东路支行 ', '向丽圆 ', '6228480422593807817', '江苏省', '南通市', null, null, '向丽圆 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('605', '97', '中国建设银行', '上海市九亭支行 ', '胡伟萍 ', '6217001210015298209', '上海市', '上海市', null, null, '胡伟萍 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('606', '97', '中国建设银行', '临猗县建设银行支行 ', '南国录 ', '6227000360562233198', '山西省', '临猗县', null, null, '南国录 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('607', '97', '上海浦东发展银行', '上海浦东发展银行股份有限公司哈尔滨哈药路支行 ', '李莹 ', '6217922704141960', '黑龙江省', '哈尔滨', null, null, '李莹 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('263', '120', '中国建设银行', '长沙市雨花亭支行', '刘世杰', '6217002920102971216', '湖南省', '长沙市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('265', '115', '中国农业银行', '上海东昌支行', '吴喜洪', '6228480039018296879', '上海', '上海', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('266', '111', '中国银行', '如皋市支行', '胡静', '6217906100009429587', '江苏', '南通', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('636', '97', '招商银行', '江苏省如皋市支行 ', '刘鹏 ', '6214835130073024', '江苏省', '南通市', null, null, '刘鹏 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('635', '97', '中国建设银行', '江苏省如皋市支行 ', '周永莲 ', '6236681270001508695', '江苏省', '南通市', null, null, '周永莲 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('634', '97', '中国建设银行', '江苏省如皋市通扬分理处 ', '谢明俊 ', '6217001270010241570', '江苏省', '南通市', null, null, '谢明俊 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('633', '97', '招商银行', '江苏省如皋市支行 ', '陈甦 ', '6214855132285673', '江苏省', '南通市', null, null, '陈甦 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('632', '97', '中国建设银行', '江苏省如皋市新皋桥支行 ', '石光霞 ', '4340621277758789', '江苏省', '南通市', null, null, '石光霞 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('621', '97', '中国建设银行', '江苏省南通市姚港路支行 ', '陈红梅 ', '6217001270014998852', '江苏省', '南通市', null, null, '陈红梅 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('622', '97', '中国建设银行', '中国建设银行江苏省南通市如皋城中支行 ', '袁馨 ', '6217001270009966377', '江苏省', '南通市', null, null, '袁馨 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('623', '97', '招商银行', '中国招商银行江苏省南通市如皋支行 ', '万红华 ', '6214835131688945', '江苏省', '南通市', null, null, '万红华 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('624', '97', '中国工商银行', '中国工商银行山东省淄博市张店支行 ', '刘秀云 ', '6212261603009268038', '山东省', '淄博市', null, null, '刘秀云 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('625', '97', '中国建设银行', '中国建设银行四川省德阳市分行营业部 ', '谢静姝 ', '6214883600003535', '四川省', '德阳市', null, null, '谢静姝 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('626', '97', '中国农业银行', '江苏省南通市如东欧贸支行 ', '徐国芳 ', '6228480425602751876', '江苏省', '南通市', null, null, '徐国芳 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('627', '97', '中国工商银行', '中国工商银行四川省雅安市雨城区羌江南路支行 ', '谢芳 ', '6212262319000465270', '四川省', '雅安市', null, null, '谢芳 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('628', '97', '中国建设银行', '江苏省如皋支行分理处 ', '陈宝梅 ', '6227001272610330745', '江苏省', '南通市', null, null, '陈宝梅 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('629', '97', '中国银行', '中行临汾分行洪洞支行 ', '邢瑞瑞 ', '6013828103004152269', '山西省', '临汾市', null, null, '邢瑞瑞 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('630', '97', '中国银行', '江苏无锡 ', '张锦花 ', '6217856100002726385', '江苏省', '无锡市', null, null, '张锦花 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('631', '97', '中国建设银行', '石河子市分行夕阳红支行 ', '张红梅 ', '6217004630000168603', '新疆省', '石河子市', null, null, '张红梅 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('805', '97', '交通银行', '无锡东亭支行', '华志芬', '5201690150277600', '江苏省', '无锡市', null, null, '华志芬', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('806', '97', '中国农业银行', '江苏省南通市分行营业部', '汤颖嵩', '6228480429740369179', '江苏省', '南通市', null, null, '汤颖嵩', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('804', '97', '中国农业银行', '浙江省缙云县', '丁广来', '6228481089402006078', '浙江省', '缙云县', null, null, '丁广来', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('803', '97', '中国农业银行', '江苏如皋市石庄农业支行', '陈海兰', '6228480429322621278', '江苏省', '南通市', null, null, '陈海兰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('802', '97', '中国工商银行', '安镇支行', '顾燕', '6222021103013566618', '江苏省', '无锡市', null, null, '顾燕', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('801', '97', '中国建设银行', '建设银行临汾营业部', '张戈', '6217000350005353563', '山西省', '临汾', null, null, '张戈', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('800', '97', '中国农业银行', '江苏省如皋市', '孙晓梅', '6228480429323153677', '江苏省', '南通市', null, null, '孙晓梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('799', '97', '中国农业银行', '江苏省如皋市', '孙晓梅', '6228480429323153677', '江苏省', '南通市', null, null, '孙晓梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('798', '97', '中国银行', '中行临汾分行洪洞支行', '邢瑞瑞', '6013828103004152269', '山西省', '临汾市', null, null, '邢瑞瑞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('797', '97', '中国建设银行', '江苏省如皋市建行北门分理处', '周海霞', '6227001272930060238', '江苏省', '南通市', null, null, '周海霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('795', '97', '中国农业银行', '无锡市东湖塘支行', '吕洁', '6228480435782347478', '江苏省', '无锡市', null, null, '吕洁', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('796', '97', '中国建设银行', '江苏无锡分行胜利门支行', '章炜', '6217001240021507780', '江苏省', '无锡市', null, null, '章炜', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('794', '97', '中国农业银行', '苏州市枫桥支行', '黎桂华', '6230520400014214274', '江苏省', '苏州市', null, null, '黎桂华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('637', '97', '中国建设银行', '江苏省南通市如皋市海阳分理处 ', '钱碧飞 ', '4340621277057588', '江苏省', '南通市', null, null, '钱碧飞 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('638', '97', '中国建设银行', '江苏省如皋市福寿西路支行 ', '谢晓莲 ', '6236681270001722809', '江苏省', '南通市', null, null, '谢晓莲 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('639', '97', '中国农业银行', '新疆五家渠长征街支行 ', '周明贤 ', '6228480898566497878', '新疆省', '五家渠', null, null, '周明贤 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('640', '97', '中国银行', '江苏南通南苑支行 ', '陈慰 ', '6217856100003942858', '江苏省', '南通市', null, null, '陈慰 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('641', '97', '中国农业银行', '江苏省南通市通州区开发区支行 ', '成海军 ', '6228480429725940879', '江苏省', '南通市', null, null, '成海军 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('642', '97', '中国邮政储蓄银行', '湖南省新化县西河镇沙江分行 ', '肖裕怀 ', '6217995620002108971', '湖南省', '新化县', null, null, '肖裕怀 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('643', '97', '中国工商银行', '江苏省南通市启东市 ', '俞智旋 ', '6215581111007257397', '江苏省', '南通市', null, null, '俞智旋 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('644', '97', '中国银行', '石河子市建设银行 ', '常世佳 ', '6216608300004258972', '新疆省', '石河子市', null, null, '常世佳 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('645', '97', '中国银行', '石河子市建设银行 ', '常世佳 ', '6216608300004258972', '新疆省', '石河子市', null, null, '常世佳 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('646', '97', '中国建设银行', '石河子市分行经济技术开发区支行 ', '刘子铭 ', '6217004630001074560', '新疆省', '石河子市', null, null, '刘子铭 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('647', '97', '中国民生银行', '江苏省如皋市支行 ', '张利 ', '6216914902559540', '江苏省', '南通市', null, null, '张利 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('648', '97', '中国银行', '石河子市中国银行分行西一路支行 ', '张英 ', '6217858300021897385', '新疆省', '石河子市', null, null, '张英 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('649', '97', '中国银行', '洛阳市宜阳县支行 ', '聂洛宜 ', '6217858000075159001', '河南省', '洛阳市', null, null, '聂洛宜 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('650', '97', '招商银行', '苏州市昆山支行 ', '王丽丽 ', '6214835212813545', '江苏省', '苏州市', null, null, '王丽丽 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('651', '97', '中国农业银行', '江苏无锡 ', '李季舟 ', '6228480439228257572', '江苏省', '无锡市', null, null, '李季舟 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('652', '97', '交通银行', '江苏省海安市海安支行 ', '李仁林 ', '6222623100002938263', '江苏省', '南通市', null, null, '李仁林 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('653', '97', '中国农业银行', '农行石河子红旗（兵团）支行 ', '杨辉 ', '6228483378042202371', '新疆省', '石河子市', null, null, '杨辉 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('654', '97', '中国工商银行', '江苏省南通市海门市东州支行 ', '龚静 ', '6212261111000218408', '江苏省', '南通市', null, null, '龚静 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('655', '97', '中国工商银行', '中国工商银行石河子分行营业部 ', '温建邦 ', '6222083016000008797', '新疆省', '石河子', null, null, '温建邦 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('656', '97', '中国农业银行', '江苏省昆山市陆家支行 ', '陈安芹 ', '6228480403678607611', '江苏省', '昆山市', null, null, '陈安芹 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('657', '97', '交通银行', '广州市分行番禺支行 ', '梁光明 ', '6222620710012843858', '广东省', '广州市', null, null, '梁光明 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('658', '97', '中国工商银行', '石河子市百大城支行 ', '武子文 ', '6212263016001047391', '新疆省', '石河子', null, null, '武子文 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('659', '97', '中国建设银行', '江苏省如皋市支行营业部 ', '张凤英 ', '6236681270000473263', '江苏省', '南通市', null, null, '张凤英 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('660', '97', '交通银行', '无锡安镇支行 ', '顾正伟 ', '6222620150006774365', '江苏省', '无锡市', null, null, '顾正伟 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('661', '97', '中国建设银行', '江苏省东台市支行', '罗优芳 ', '6217001320007651180', '江苏省', '东台市', null, null, '罗优芳 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('662', '97', '中国农业银行', '上海市九亭支行 ', '胡飞扬 ', '6228480038616821971', '上海市', '上海市', null, null, '胡飞扬 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('663', '97', '中国建设银行', '临汾市分行平阳南街支行 ', '郭虎虎 ', '6217000350002877382', '山西省', '临汾市', null, null, '郭虎虎 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('664', '97', '中国邮政储蓄银行', '江苏南通', '范存国', '6217993000309498569', '江苏省', '南通市', null, null, '范存国', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('665', '97', '中国农业银行', '无锡市分行安镇支行', '浦慧华', '6228480431662179917', '江苏省', '无锡市', null, null, '浦慧华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('666', '97', '中国农业银行', '启东市惠萍分理处', '施卫', '6228480425020132170', '江苏省', '南通市', null, null, '施卫', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('667', '97', '中国农业银行', '江苏省如皋市石庄支行', '王国祥', '6228480429077967272', '江苏省', '南通市', null, null, '王国祥', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('668', '97', '中国建设银行', '江苏省如皋支行营业部', '卢红', '6236681270001945046', '江苏省', '南通市', null, null, '卢红', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('669', '97', '中国工商银行', '江苏省如皋支行分理处', '孙伟', '6215581111006471023', '江苏省', '南通市', null, null, '孙伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('670', '97', '中国建设银行', '江苏省如皋支行营业部', '徐玉静', '6236681270001840056', '江苏省', '南通市', null, null, '徐玉静', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('671', '97', '中国工商银行', '遵义市遵义湘江支行', '周德华', '6212262403010062085', '贵州省', '遵义市', null, null, '周德华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('672', '97', '中国工商银行', '南通启东城西支行', '施美丞', '6222021111011953837', '江苏省', '南通市', null, null, '施美丞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('673', '97', '中国建设银行', '江苏省昆山市东城支行', '陆介平', '6217002000000464463', '江苏省', '昆山市', null, null, '陆介平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('674', '97', '中国农业银行', '农行上海松江九亭涞寅路支行', '黄娴', '6228480031683639319', '上海市', '上海市', null, null, '黄娴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('675', '97', '中国银行', '新疆石河子市西一路支行', '胡致峰', '6217868300001251148', '新疆省', '石河子市', null, null, '胡致峰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('676', '97', '中国农业银行', '中国农业银行股份有限公司南通分行', '周玲', '6228480425801876870', '江苏省', '南通市', null, null, '周玲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('677', '97', '中国农业银行', '查桥支行', '倪晓华', '6228480434734063713', '江苏省', '无锡市', null, null, '倪晓华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('701', '97', '平安银行', '南京市城西支行', '沈轲', '6230582000002778515', '江苏省', '南京市', null, null, '沈轲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('679', '97', '中国农业银行', '无锡市农业银行梅村支行', '钱张晶', '6228480432301981317', '江苏省', '无锡市', null, null, '钱张晶', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('680', '97', '中国建设银行', '无锡分行', '钱利忠', '6217001240010572886', '江苏省', '无锡市', null, null, '钱利忠', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('694', '97', '中国工商银行', '南通启东电力大厦支行', '朱红健', '6215581111005436068', '江苏省', '南通市', null, null, '朱红健', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('682', '97', '华夏银行', '乌鲁木齐分行新兴街支行', '夏自强', '6230210220041986', '新疆省', '乌鲁木齐', null, null, '夏自强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('683', '97', '招商银行', '招商银行江苏省太仓市支行', '朱雪娟', '6214855120183401', '江苏省', '太仓市', null, null, '朱雪娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('684', '97', '中国建设银行', '南通市平潮分理处', '任美芳', '6217001270003359223', '江苏省', '南通市', null, null, '任美芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('685', '97', '中国建设银行', '建行临汾龙信支行', '叶鹏飞', '6227000351030039275', '山西省', '临汾市', null, null, '叶鹏飞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('686', '97', '中国银行', '江苏省南通市城港支行', '杨吉道', '6013826105019128061', '江苏省', '南通市', null, null, '杨吉道', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('687', '97', '中国建设银行', '江苏省太仓分行营业部', '杨丽英', '6236682000019889319', '江苏省', '太仓市', null, null, '杨丽英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('688', '97', '中国邮政储蓄银行', '太仓市中市营业所', '杨骐菲', '6217993000060764860', '江苏省', '太仓市', null, null, '杨骐菲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('689', '97', '兴业银行', '临汾分行', '吕海军', '622908483019986118', '山西省', '临汾市', null, null, '吕海军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('690', '97', '中国建设银行', '苏州市昆山市开发区支行', '陈晓明', '6222802006631059277', '江苏省', '苏州市', null, null, '陈晓明', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('691', '97', '中国建设银行', '苏州市分行昆山城中支行', '樊小华', '4367422006630367361', '江苏省', '苏州市', null, null, '樊小华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('692', '97', '中国银行', '江苏省南通市崇川区城港支行', '刘莲花', '6217856100048554361', '江苏省', '南通市', null, null, '刘莲花', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('693', '97', '中国工商银行', '南通启东和合支行', '陆单单', '6217231111000814889', '江苏省', '南通市', null, null, '陆单单', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('696', '97', '中国建设银行', '苏州市太仓支行', '陈亮', '6236682000003186177', '江苏省', '苏州市', null, null, '陈亮', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('697', '97', '中国建设银行', '佛山市平洲支行', '张志明', '6227003112450151199', '广东', '佛山', null, null, '张志明', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('698', '97', '中国邮政储蓄银行', '南通市木行桥支行', '夏国良', '6217993000335594423', '江苏省', '南通市', null, null, '夏国良', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('702', '97', '中国农业银行', '昆山市同丰路支行', '严红', '6228450408053248879', '江苏省', '昆山市', null, null, '严红', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('700', '97', '中国建设银行', '常州市溧阳市支行', '潘小伟', '6227001263539523486', '江苏省', '常州市', null, null, '潘小伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('703', '97', '中国建设银行', '如皋市建行如皋通扬分理处', '冒乃云', '6217001270011398668', '江苏省', '南通市', null, null, '冒乃云', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('704', '97', '中国农业银行', '运城市中国农业银行运城支行', '郝小亲', '6230523040020151370', '山西省', '运城市', null, null, '郝小亲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('705', '97', '中国建设银行', '上海市九亭支行', '胡伟萍', '6217001210015298209', '上海市', '上海市', null, null, '胡伟萍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('706', '97', '中国工商银行', '江苏无锡', '蔡小明', '6222081103000880755', '江苏省', '无锡市', null, null, '蔡小明', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('707', '97', '中国银行', '中国银行启东华联支行', '陆冬梅', '6216616105001261667', '江苏省', '南通市', null, null, '陆冬梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('708', '97', '中国邮政储蓄银行', '启东市汇龙镇支行', '黄兰英', '6217993000027566341', '江苏省', '南通市', null, null, '黄兰英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('709', '97', '中国邮政储蓄银行', '南通市木行枪', '陈学军', '6217993000335568211', '江苏省', '南通市', null, null, '陈学军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('710', '97', '中国农业银行', '运城中国农业银行运城支行', '冉冬冬', '6228413044525777470', '山西省', '运城市', null, null, '冉冬冬', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('711', '97', '交通银行', '运城市分行', '冉军', '6222621480000759073', '山西省', '运城市', null, null, '冉军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('712', '125', '招商银行', '郑州市金水路支行', '陈化轶', '6214833804404872', '河南省', '郑州市', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('713', '97', '中国民生银行', '江苏南通', '吴铭', '6226224980033519', '江苏省', '南通市', null, null, '吴铭', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('714', '97', '中国工商银行', '中国工商银行北京天通苑支行', '景峰峰', '6212260200024784841', '北京市', '北京市', null, null, '景峰峰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('715', '97', '中国农业银行', '江苏省如皋市海阳南路支行', '许霞', '6228480425826364571', '江苏省', '南通市', null, null, '许霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('716', '97', '中国农业银行', '佛山市三水白坭支行', '麦洁儿', '6228480096535552275', '广东省', '佛山市', null, null, '麦洁儿', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('717', '97', '中国农业银行', '无锡安镇', '姚振伟', '6228480431747198510', '江苏省', '无锡市', null, null, '姚振伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('718', '97', '中国银行', '锡山区西漳支行', '吴静娟 ', '6013826102044249509', '江苏省', '无锡市', null, null, '吴静娟 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('719', '97', '中国建设银行', '山西省临汾市尧都区车站街支行', '梁晓洁', '6217000350006553302', '山西省', '临汾市', null, null, '梁晓洁', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('720', '97', '中国工商银行', '山西省翼城县支行', '吕炎岭', '6212260510004335400', '山西省', '翼城县', null, null, '吕炎岭', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('721', '97', '中国邮政储蓄银行', '中国邮政储蓄银行银行南通市如皋港支行', '沈娟', '6217993000145287150', '江苏省', '南通市', null, null, '沈娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('722', '97', '中国建设银行', '中国建设银行湖南省郴州市资兴市支行鲤鱼江分理处', '谭瑛', '6227002980240079263', '湖南省', '郴州市', null, null, '谭瑛', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('723', '97', '中国工商银行', '中国工商银行山东省淄博市张店支行', '刘秀云', '6212261603009268038', '山东省', '淄博市', null, null, '刘秀云', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('724', '97', '中国建设银行', '江苏省如皋支行', '张艳红', '4340621270005782', '江苏省', '南通市', null, null, '张艳红', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('725', '97', '中国建设银行', '深圳市罗湖区莲塘支行', '何红 ', '6217007200039465185', '广东省', '深圳市', null, null, '何红 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('726', '97', '中国工商银行', '江苏省如皋支行', '徐胜岳', '6214835131439547', '江苏省', '南通市', null, null, '徐胜岳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('727', '97', '中国工商银行', '江苏省苏州市太仓市支行', '顾振清', '6212261102002286766', '江苏省', '苏州市', null, null, '顾振清', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('728', '97', '中国建设银行', '江苏省如皋市新皋桥支行', '石光霞', '4340621277758789', '江苏省', '南通市', null, null, '石光霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('729', '97', '中国建设银行', '江苏省如皋市通扬分理处', '谢明俊', '6217001270010241570', '江苏省', '南通市', null, null, '谢明俊', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('730', '97', '中国建设银行', '江苏省南通市如皋市海阳分理处', '钱碧飞', '4340621277057588', '江苏省', '南通市', null, null, '钱碧飞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('731', '97', '中国工商银行', '昆山正阳支行', '龙佳妮 ', '6222021102053088848', '江苏省', '昆山市', null, null, '龙佳妮 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('732', '97', '中国银行', '临汾市解放路支行', '肖淑媛', '6216618103000220634', '山西省', '临汾市', null, null, '肖淑媛', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('733', '97', '中国建设银行', '中国建设银行德阳分行天山南路储蓄所', '陈光蓉', '6230943600000049597', '四川省', '德阳市', null, null, '陈光蓉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('734', '97', '中国农业银行', '无锡市分行安镇支行', '周大伟', '6228480435516319371', '江苏省', '无锡市', null, null, '周大伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('735', '97', '中国农业银行', '南通市人民东路支行', '沈雷 ', '6228480421963558612', '江苏省', '南通市', null, null, '沈雷 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('736', '97', '招商银行', '哈尔滨市大直支行', '齐莉娟', '6214834572542992', '黑龙江省', '哈尔滨', null, null, '齐莉娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('737', '97', '中国邮政储蓄银行', '湖南省新化县西河镇沙江分行', '肖裕怀', '6217995620002108971', '湖南省', '新化县', null, null, '肖裕怀', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('738', '97', '中国农业银行', '镇江市农行金山分行', '李海波', '6228481049557652779', '江苏省', '镇江市', null, null, '李海波', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('739', '97', '中国工商银行', '江苏省南通市启东市', '俞智旋', '6215581111007257397', '江苏省', '南通市', null, null, '俞智旋', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('740', '97', '中国农业银行', '江苏省如皋市如皋支行', '梁志林', '6228480424789857416', '江苏省', '南通市', null, null, '梁志林', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('745', '97', '中国工商银行', '枣庄市分行滕州支行', '徐跃', '6212261605007256261', '山东省', '枣庄市', null, null, '徐跃', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('742', '97', '中国建设银行', '江苏省东台市支行', '罗优芳', '6217001320007651180', '江苏省', '东台市', null, null, '罗优芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('743', '97', '中国民生银行', '江苏南通', '王钰', '6226224900943771', '江苏省', '南通市', null, null, '王钰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('744', '97', '中国农业银行', '五家渠市长征街支行', '吴建军', '6228480898002638879', '新疆省', '五家渠市', null, null, '吴建军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('746', '97', '中国农业银行', '江苏省如皋市石庄支行', '钱美', '6228480429399944975', '江苏省', '南通市', null, null, '钱美', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('747', '97', '中国建设银行', '河南省洛阳市宜阳县', '炊伟芳', '6217002450007584724', '河南省', '洛阳市', null, null, '炊伟芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('748', '97', '中国建设银行', '南通市通州区平潮分理处', '任伟', '6217001270003359215', '江苏省', '南通市', null, null, '任伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('749', '97', '中国工商银行', '山西省临汾市西城支行', '张丽娜', '6212260510005495419', '山西省', '临汾市', null, null, '张丽娜', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('750', '97', '中国工商银行', '江苏省海安县李堡支行分理处', '陈夕芳', '6217231111005493242', '江苏省', '南通市', null, null, '陈夕芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('751', '97', '中国建设银行', '启东港西路支行', '谢青云', '6217001270016888937', '江苏省', '南通市', null, null, '谢青云', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('752', '97', '中国工商银行', '江苏省太仓市支行营业室', '陆菊芳', '6212261102005889970', '江苏省', '太仓市', null, null, '陆菊芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('753', '97', '中国农业银行', '江苏南通启东支行', '张家兵', '6228480425794204270', '江苏省', '南通市', null, null, '张家兵', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('754', '97', '中国农业银行', '中国农业银行股份有限公司石狮祥芝支行', '孙继猛', '6230520680046062870', '福建省', '石狮市', null, null, '孙继猛', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('891', '97', '中国银行', '江苏无锡', '吕建强', '6217856100004193626', '江苏省', '无锡市', null, null, '吕建强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('756', '97', '中国农业银行', '冮苏南通启东支行', '陈圣贤', '6228480425602939372', '江苏省', '南通市', null, null, '陈圣贤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('757', '97', '中国工商银行', '工行临汾分行洪洞支行', '师晓磊', '6222020510002555579', '山西省', '临汾市', null, null, '师晓磊', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('758', '97', '中国建设银行', '南通市崇川区观音山支行', '葛丽华', '6236681270002225869', '江苏省', '南通市', null, null, '葛丽华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('759', '97', '中国农业银行', '江苏省南通市港闸区天生港支行', '任莲英', '6228480425784014374', '江苏省', '南通市', null, null, '任莲英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('762', '97', '中国农业银行', '农业银行江苏省南通市新开支行', '陈伟', '6228480423056387610', '江苏省', '南通市', null, null, '陈伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('761', '97', '招商银行', '宁波东部新城支行', '陆德兴', '6214855741624619', '浙江省', '宁波', null, null, '陆德兴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('763', '97', '中国建设银行', '江苏省苏州市支行', '孙晨琳', '6217002000017593163', '江苏省', '苏州市', null, null, '孙晨琳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('764', '97', '中国农业银行', '苏州市金鸡湖支行', '季美琴', '6228480405965492672', '江苏省', '苏州市', null, null, '季美琴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('765', '97', '中国建设银行', '上海市虹口支行', '张春雅', '6227001217020042810', '上海市', '上海市', null, null, '张春雅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('766', '97', '中国工商银行', '江苏省南通分行', '花建平', '6217231111001240035', '江苏省', '南通市', null, null, '花建平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('767', '97', '中国银行', '江苏省如皋市西皋分理处', '王兰英', '6217566100032505461', '江苏省', '南通市', null, null, '王兰英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('768', '97', '中国农业银行', '长沙市天心区支行', '向欣芳', '6230521090023176470', '湖南省', '长沙市', null, null, '向欣芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('769', '97', '中国建设银行', '济宁市分行任城区支行', '童振兴', '6217002210011187744', '山东省', '济宁市', null, null, '童振兴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('770', '97', '中国建设银行', '无锡市分行建筑路支行', '俞俊杰', '6217001240013405514', '江苏省', '无锡市', null, null, '俞俊杰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('771', '97', '中国农业银行', '中国农业银行南通四安支行', '杨春霞', '6228480429062825873', '江苏省', '南通市', null, null, '杨春霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('772', '97', '中国银行', '石河子分行营业室', '杨蕊嘉', '6217868300002251139', '新疆省', '石河子市', null, null, '杨蕊嘉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('773', '97', '中国银行', '安镇支行', '冯胜洪', '6217876100002199514', '江苏省', '无锡市', null, null, '冯胜洪', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('774', '97', '中国工商银行', '南通启东市城西支行', '毛文君', '6215581111007227739', '江苏省', '南通市', null, null, '毛文君', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('775', '97', '中国建设银行', '南通市平潮分理处', '任美芳', '6217001270003359223', '江苏省', '南通市', null, null, '任美芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('776', '97', '中国邮政储蓄银行', '江苏省南通市启东支行', '张桂芳', '6217993000215162531', '江苏省', '南通市', null, null, '张桂芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('777', '97', '中国银行', '安镇支行', '何琼霞', '6217876100002198789', '江苏省', '无锡市', null, null, '何琼霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('778', '97', '中国邮政储蓄银行', '启东市大同营业所', '陆萍', '6217993000255224621', '江苏省', '南通市', null, null, '陆萍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('779', '97', '中国工商银行', '江苏省启东市支行', '黄红铃', '6217231111001013721', '江苏省', '南通市', null, null, '黄红铃', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('780', '97', '中国农业银行', '无锡市支行东湖塘分行', '费敏艳', '6228250438034918771', '江苏省', '无锡市', null, null, '费敏艳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('781', '97', '中国农业银行', '江苏南通启东支行', '宋蓉美', '6228480422521612214', '江苏省', '南通市', null, null, '宋蓉美', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('782', '97', '中国工商银行', '南通启东支行', '张吕军', '6222081111003198190', '江苏省', '南通市', null, null, '张吕军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('783', '97', '中国农业银行', '查桥支行', '居建卫', '6228480434543157714', '江苏省', ' 无锡市', null, null, '居建卫', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('784', '97', '中国建设银行', '福州市仓山分行', '高强', '6217001820001703150', '福建省', '福州市', null, null, '高强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('785', '97', '中国农业银行', '安镇农业银行', '杨珠英', '6228480433180294319', '江苏省', '无锡市', null, null, '杨珠英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('786', '97', '中国农业银行', '安镇支行', '杨明霞', '6217993000295293016', '江苏省', '无锡市', null, null, '杨明霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('787', '97', '中国农业银行', '上海市青浦区徐泾镇京华路徐泾支行', '倪芹', '6228480038850305970', '上海市', '上海市', null, null, '倪芹', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('788', '97', '中国邮政储蓄银行', '启东市汇龙镇支行', '黄兰英', '6217993000027566341', '江苏省', '南通市', null, null, '黄兰英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('789', '97', '中国邮政储蓄银行', '中国邮政储蓄银行北哈药路营业所', '汤强', '6217992610194514956', ' 黑龙江', '哈尔滨', null, null, '汤强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('790', '97', '中国农业银行', '启东市支行', '沈卫', '6228480429736738676', '江苏省', '南通市', null, null, '沈卫', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('791', '97', '中国农业银行', '江苏省南通市八厂支行', '陈劲', '6228450428033185579', '江苏省', '南通市', null, null, '陈劲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('792', '97', '中国农业银行', '常熟市方塔支行', '潘文蓉', '6228480405683665575', '江苏省', '常熟市', null, null, '潘文蓉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('793', '97', '中国银行', '江苏南通南苑支行', '陈慰', '6217856100003942858', '江苏省', '南通市', null, null, '陈慰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('476', '117', '中国工商银行', '兴安乌兰浩特乌兰大街支行', '孔晶', '6215590608003626029', '内蒙古', '兴安盟', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('816', '97', '中国工商银行', '江苏省南通市友谊桥工商银行', '吴冬梅', '6222021111016729109', '江苏省', '南通市', null, null, '吴冬梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('817', '97', '中国工商银行', '江苏省如皋市环南分行', '刘小飞', '6215581111006014898', '江苏省', '南通市', null, null, '刘小飞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('818', '97', '中国建设银行', '中国建设银行股份有限公司太仓南区分理处', '沈雪琴', '6217002000038143329', '江苏省', '太仓市', null, null, '沈雪琴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('819', '97', '中国建设银行', '苏州市太仓支行', '陈亮', '6236682000003186177', '江苏省', '苏州市', null, null, '陈亮', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('820', '97', '中国银行', '启东支行营业部', '陆冬林', '6217856100034703709', '江苏省', '南通市', null, null, '陆冬林', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('821', '97', '中国农业银行', '农行石河子红旗兵团支行', '杨辉', '6228483378042202371', '新疆省', '石河子', null, null, '杨辉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('822', '97', '交通银行', '临汾城东支行', '梁家瑞', '6222621460001179083', '山西省', '临汾市', null, null, '梁家瑞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('807', '97', '中国光大银行', '南通分行', '谢永建', '6226632000206131', '江苏省', '南通市', null, null, '谢永建', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('808', '97', '中国农业银行', '江苏无锡', '严韶丰', '6228480439953953270', '江苏省', '无锡市', null, null, '严韶丰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('809', '97', '中国建设银行', '无锡市建设银行梅村支行', '张琴兰', '6217001240019635064', '江苏省', '无锡市', null, null, '张琴兰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('810', '97', '中国建设银行', '中国建设银行德阳分行天山南路储蓄所', '陈光蓉', '6230943600000049597', '四川省', '德阳市', null, null, '陈光蓉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('811', '97', '中国建设银行', '江西省丰城市支行', '曾万通', '6217002100008644692', '江苏省', '丰城市', null, null, '曾万通', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('812', '97', '兴业银行', '崇川区支行', '钟彩华', '6229084067973897386417', '江苏省', '南通市', null, null, '钟彩华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('813', '97', '中国工商银行', '南通市', '曹玉梅', '6222021111017018569', '江苏省', '南通市', null, null, '曹玉梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('814', '97', '中国银行', '启东市汇龙支行', '龚晓蕾', '6217876100005892628', '江苏省', '南通市', null, null, '龚晓蕾', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('815', '97', '中国工商银行', '工商银行浙江省宁波市宁海六合支行', '林益辉', '6222083901004344837', '浙江省', '宁波市', null, null, '林益辉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('495', '121', '中国建设银行', '浙江金华分行义乌支行', '肖国庆', '6236681460010857643', '浙江省', '义乌', null, null, '义乌支行', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('852', '97', '中国农业银行', '江苏无锡', '张卫萍', '6228480439567352372', '江苏省', '无锡市', null, null, '张卫萍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('853', '97', '中国农业银行', '枣庄市滕州市农业支行', '陈真', '6228271311254183472', '山东省', '枣庄市', null, null, '陈真', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('854', '97', '招商银行', '宁波东部新城支行', '陆德兴', '6214855741624619', '浙江省', '宁波市', null, null, '陆德兴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('855', '97', '兴业银行', '兴业银行临汾支行', '原福禄', '622908483799797016', '山西省', '临汾市', null, null, '原福禄', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('823', '97', '中国建设银行', '江苏省东台市支行', '罗优芳', '6217001320007651180', '江苏省', '东台市', null, null, '罗优芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('824', '97', '中国建设银行', '常州市溧阳市支行', '潘小伟', '6227001263539523486', '江苏省', '常熟市', null, null, '潘小伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('825', '97', '中国工商银行', '遵义市遵义湘江支行', '周德华', '6212262403010062085', '贵州省', '遵义市', null, null, '周德华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('826', '97', '中国工商银行', '江苏省海安县李堡支行分理处', '陈夕芳', '6217231111005493242', '江苏省', '南通市', null, null, '陈夕芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('827', '97', '中国建设银行', '临汾市车站街支行', '梁奎民', '4367420351102425608', '山西省', '临汾市', null, null, '梁奎民', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('828', '97', '中国农业银行', '安镇支行', '任丽均', '6228410433028179560', '江苏省', '无锡市', null, null, '任丽均', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('829', '97', '中国农业银行', '江苏省南通分行', '丁美华', '6228480428087583673', '江苏省', '南通市', null, null, '丁美华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('830', '97', '中国邮政储蓄银行', '徐州市分行丰县支行', '陈康', '6217993000224201593', '江苏省', '徐州市', null, null, '陈康', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('831', '97', '中国农业银行', '江苏省如皋市文峰分理处', '赵桂芳', '6228480425785914572', '江苏省', '南通市', null, null, '赵桂芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('832', '97', '中国建设银行', '江苏省如皋市海阳路分理处', '曹石泉', '6236681270000481365', '江苏省', '南通市', null, null, '曹石泉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('833', '97', '中国农业银行', '江苏南通启东支行', '张家兵', '6228480425794204270', '江苏省', '南通市', null, null, '张家兵', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('834', '97', '中国农业银行', '冮苏南通启东支行', '陈圣贤', '6228480425602939372', '江苏省', '南通市', null, null, '陈圣贤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('835', '97', '中国银行', '临汾市南外环分行', '郭文杰', '6216608100000670455', '山西省', '临汾市', null, null, '郭文杰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('836', '97', '中国建设银行', '启东港西路支行', '谢青云', '6217001270016888937', '江苏省', '南通市', null, null, '谢青云', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('837', '97', '中国建设银行', '江苏省太仓南区分理处', '苏英娣', '6236682000011378121', '江苏省', '太仓市', null, null, '苏英娣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('838', '97', '中国银行', '中国银行上海市闸北支行营业部', '王彩亚', '6217560800005694392', '上海市', '上海市', null, null, '王彩亚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('839', '97', '中国农业银行', '开户行为中国农业银行股份有限公司太原经济技术开发区支行', '张鸿艳', '6228480908101843674', '山西省', '太原市', null, null, '张鸿艳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('840', '97', '招商银行', '苏州市新区支行', '姜沫含', '6214835220422586', '江苏省', '苏州市', null, null, '姜沫含', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('841', '97', '中国农业银行', '镇江市农行金山分行', '李海波', '6228481049557652779', '江苏省', '镇江市', null, null, '李海波', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('842', '97', '中国农业银行', '常州市天宁区雕庄支行', '张珊瑚', '6228480415107770877', '江苏省', '常州市', null, null, ' 张珊瑚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('843', '97', '招商银行', '招商银行江苏省太仓市支行', '朱建强', '6214835126271921', '江苏省', '太仓市', null, null, '朱建强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('844', '97', '中国工商银行', '江苏省南通市启东市', '俞智旋', '6215581111007257397', '江苏省', '南通市', null, null, '俞智旋', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('845', '97', '中国银行', '江苏省太仓分行营业部', '顾玲珍', '6013826101030565951', '江苏省', '太仓市', null, null, '顾玲珍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('846', '97', '中国农业银行', '中国农业银行股份有限公司玛纳斯县支行', '王鸿军', '6228483018574660873', '新疆省', '玛纳斯县', null, null, '王鸿军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('847', '97', '中国农业银行', '无锡市查桥支行', '蔡军', '6228480434017901019', '江苏省', '无锡市', null, null, '蔡军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('848', '97', '中国建设银行', '中国建设银行湖南省永州市宁远县支行', '唐保国', '6214662990049633', '湖南省', '永州市', null, null, '唐保国', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('849', '97', '中国工商银行', '南通启东人民东路支行', '张校', '6215581111002542744', '江苏省', '南通市', null, null, '张校', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('850', '97', '中国工商银行', '临汾市尧都支行', '曹艳霞', '6212260510003948492', '山西省', '临汾市', null, null, '曹艳霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('851', '97', '招商银行', '招商银行宁波市文化广场支行', '项晓晓', '6214835743729681', '浙江省', '宁波市', null, null, '项晓晓', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('535', '97', '中国农业银行', '启东市支行 ', '施玲玲', '6228230425704794660', '江苏省', '南通市', null, null, '施玲玲 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('539', '97', '招商银行', '中国招商银行上海瑞虹支行', '程石', '6226091210201558', '上海市', '上海市', null, null, '程石', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('856', '97', '中国工商银行', '沙雅县支行', '吴丽丽', '6222023014004074017', '新疆省', '沙雅县', null, null, '吴丽丽', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('857', '97', '中国农业银行', '如皋市石庄农业支行', '徐永建', '6228480425786040773', '江苏省', '南通市', null, null, '徐永建', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('858', '97', '中国银行', '南通启东华联支行', '施天哲', '6217856100007653998', '江苏省', '南通市', null, null, '施天哲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('859', '97', '中国农业银行', '河北省廊坊市香河县支行', '游信', '6228480518107449473', '河北省', '廊坊市', null, null, '游信', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('860', '97', '中国工商银行', '南通启东和合支行', '陆单单', '6217231111000814889', '江苏省', '南通市', null, null, '陆单单', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('861', '97', '中国工商银行', '徐州分行丰县支行', '师凤云', '6222081106001015180', '江苏省', '徐州市', null, null, '师凤云', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('862', '97', '中国建设银行', '中国建设银行股份有限公司太仓璜泾支行', '王一帆', '6227002007630142764', '江苏省', '太仓市', null, null, '王一帆', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('863', '97', '中国邮政储蓄银行', '启东市大同营业所', '陆萍', '6217993000255224621', '江苏省', '南通市', null, null, '陆萍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('864', '97', '中国建设银行', '上海市九亭支行', '杨卫平', '6227001219030386153', '上海市', '上海市', null, null, '杨卫平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('865', '97', '中国建设银行', '江苏省苏州市太仓市城厢镇南区分理处', '张长勇', '6217002000000109829', '江苏省', '苏州市', null, null, '张长勇', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('866', '97', '中国工商银行', '阿克苏东大街支行', '程跃博', '6212263014000007201', '新疆省', '阿克苏东', null, null, '程跃博', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('867', '97', '中国农业银行', '无锡市新吴区支行', '吴军', '6228480438844041675', '江苏省', '无锡市', null, null, '吴军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('868', '97', '中国建设银行', '城中支行', '施楠楠', '6236681270001108470', '江苏省', '南通市', null, null, '施楠楠', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('869', '97', '中国工商银行', '江苏省南通市如皋支行', '赵晓琴', '621723111100550925', '江苏省', '南通市', null, null, '赵晓琴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('870', '97', '中国工商银行', '江苏省南通市如皋支行', '张爱萍', '6215581111002841229', '江苏省', '南通市', null, null, '张爱萍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('871', '97', '中国农业银行', '江苏省无锡市', '蒋建军', '6228480435859984971', '江苏省', '无锡市', null, null, '蒋建军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('872', '97', '中国银行', '中国银行启东华联支行', '陆冬梅', '6216616105001261667', '江苏省', '南通市', null, null, '陆冬梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('873', '97', '中国工商银行', '山西省临汾市临汾滨河路支行', '董银梁', '6222020510000555878', '山西省', '临汾市', null, null, '董银梁', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('874', '97', '中国农业银行', '南通市农行分行', '何兵', '6228480425796756673', '江苏省', '南通市', null, null, '何兵', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('875', '97', '中国建设银行', '宜春樟树支行', '李瑜', '6217002100003547825', '江西省', '宜春市', null, null, '李瑜', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('876', '97', '交通银行', '无锡安镇支行', '顾正伟', '6222620150006774365', '江苏省', '无锡市', null, null, '顾正伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('877', '97', '中国农业银行', '中国农业银行江苏如皋港区支行', '郁建梅', '6228480423290279714', '江苏省', '南通市', null, null, '郁建梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('878', '97', '中国农业银行', '苏州市枫桥支行', '姜响', '6230520400093759678', '江苏省', '苏州市', null, null, '姜响', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('879', '97', '中国农业银行', '江苏无锡', '余艳碧', '6228480433176333717', '江苏省', '无锡市', null, null, '余艳碧', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('880', '97', '中国农业银行', '东湖塘支行', '周月娣', '6228480435293393573', '江苏省', '无锡市', null, null, '周月娣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('881', '97', '中国农业银行', '江苏省如皋市丁堰镇支行', '钱伯达', '6228480425779535870', '江苏省', '南通市', null, null, '钱伯达', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('882', '97', '中国农业银行', '江苏无锡', '张忠华', '6228480435305619676', '江苏省', '无锡市', null, null, '张忠华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('883', '97', '中国工商银行', '无锡市安镇分行中国工商银行', '殷杰', '6212261103002373679', '江苏省', '无锡市', null, null, '殷杰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('884', '97', '中国建设银行', '厦门建设银行同安分行', '林伟', '6217001930003935260', '福建省', '厦门市', null, null, '林伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('885', '97', '中国工商银行', '江苏南通', '李晨', '6217231111000278283', '江苏省', '南通市', null, null, '李晨', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('886', '97', '中国农业银行', '安镇支行', '杜京京', '6228480434589245712', '江苏省', '无锡市', null, null, '杜京京', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('887', '97', '中国建设银行', '长乐市江田支行', '黄青国', '6236681820002528843', '福建省', '长乐市', null, null, '黄青国', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('888', '97', '中国建设银行', '中国建设银行股份有限公司福州金街支行', '梁菊英', '6227001824120209114', '福建省', '福州市', null, null, '梁菊英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('889', '97', '中国建设银行', '中国建设银行股份有限公司福州金街支行', '陈茂财', '6227001824120223537', '福建省', '福州市', null, null, '陈茂财', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('890', '121', '中国工商银行', '吴江嘉鸿广场支行', '陈广军', '6212251102001410732', '江苏省', '苏州市', null, null, '吴江嘉鸿广场支行', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('892', '97', '中国银行', '无锡市东湖塘支行', '乔秀芳', '6217876100014128899', '江苏省', '无锡市', null, null, '乔秀芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('893', '97', '中国建设银行', '江苏省靖江市富海广场支行', '姚丽姣', '6236681310001250292', '江苏省', '靖江市', null, null, '姚丽姣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('894', '97', '交通银行', '江苏南通', '钱美芳', '6222603100000595473', '江苏省', '南通市', null, null, '钱美芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('895', '97', '中国邮政储蓄银行', '金寨邮政储蓄', '储彩霞', '6221883761010406382', '安徽省', '金寨', null, null, '储彩霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('896', '97', '中国农业银行', '江苏省靖江市渔婆路支行', '闻翠君', '6228483425784443471', '江苏省', '靖江市', null, null, '闻翠君', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('897', '97', '中国银行', '中国银行临汾分行解放路支行', '许鑫', '6217858100013909135', '山西省', '临汾市', null, null, '许鑫', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('898', '97', '中国农业银行', '江苏省如皋市石庄支行', '王国祥', '6228480429077967272', '江苏省', '南通市', null, null, '王国祥', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('899', '97', '中国建设银行', '石河子市分行营业室', '武建明', '4340624630019451', '新疆省', '石河子市', null, null, '武建明', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('900', '97', '中国农业银行', '上海松江九亭涞寅路支行', '黄敏', '6228480031244438714', '上海市', '上海市', null, null, '黄敏', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('901', '97', '中国农业银行', '农行上海松江九亭涞寅路支行', '黄娴', '6228480031683639319', '上海市', '上海市', null, null, '黄娴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('902', '97', '中国农业银行', '中国农业银行股份有限公司临汾东城支行', '张成学', '6228481298368795976', '山西省', '临汾市', null, null, '张成学', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('903', '97', '中国农业银行', '新疆省石河子兵团分行营业室', '陈锋', '6228453378080454733', '新疆省', '石河子市', null, null, '陈锋', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('904', '97', '中国农业银行', '中国上海农业银行股份又限公司上海新村储蓄所', '胡中苹', '6228480030925709310', '上海市', '上海市', null, null, '胡中苹', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('905', '97', '中国工商银行', '上海市奉贤区南桥镇新建西路支行', '黄翠莲', '6212261001005042533', '上海市', '上海市', null, null, '黄翠莲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('906', '97', '中国建设银行', '无锡市锡山区东湖塘支行', '陈海蓝', '6227001242130000136', '江苏省', '无锡市', null, null, '陈海蓝', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('907', '97', '中国农业银行', '江苏支行', '马谜佳', '6228480435099369678', '江苏省', '江苏省', null, null, '马谜佳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('908', '97', '中国工商银行', '江苏南通启东支行', '张颜萍', '6222021111016353819', '江苏省', '南通市', null, null, '张颜萍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('909', '97', '中国工商银行', '江苏南通', '吴亚基', '6222081111000428962', '江苏省', '南通市', null, null, '吴亚基', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('910', '97', '中国农业银行', '江苏省南通市姚港路支行', '汪程', '6228480425566477476', '江苏省', '南通市', null, null, '汪程', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('911', '97', '中国工商银行', '南通金沙支行', '李亚楠', '6222021111006444305', '江苏省', '南通市', null, null, '李亚楠', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('912', '97', '中国银行', '江苏省如皋市长江支行', '薛杨鹏', '6216606100006008512', '江苏省', '南通市', null, null, '薛杨鹏', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('913', '97', '中国农业银行', '无锡市锡山区东湖塘支行', '朱震亚', ' 6228480431369028516', '江苏省', '无锡市', null, null, '朱震亚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('914', '97', '中国工商银行', '南通市人民路支行', '黄宇新', '6222081111001334037', '江苏省', '南通市', null, null, '黄宇新', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('915', '97', '中国建设银行', '中国建设银行股份有限公司北京慧忠路支行', '景峰峰', '6217000010079499656', '北京市', '北京市', null, null, '景峰峰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('916', '97', '中国农业银行', '江苏省泰州市姜堰区府西支行分理处', '陈翠兰', '6228483428887443778', '江苏省', '泰州市', null, null, '陈翠兰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('917', '97', '中国农业银行', '无锡山北支行 ', '金建军 ', '6228480435060750070', '江苏省', '无锡市', null, null, '金建军 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('918', '97', '中国建设银行', '中国建设银行江苏省南通市如皋城中支行', '高卫兵 ', '6214661270174988', '江苏省', '南通市', null, null, '高卫兵 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('919', '97', '中国工商银行', '南通启东市支行', '樊高华', '6222021111001046147', '江苏省', '南通市', null, null, '樊高华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('920', '97', '中国农业银行', '江苏省南通市分行营业部', '丛小娟', '6228480425315150374', '江苏省', '南通市', null, null, '丛小娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('921', '97', '中国工商银行', '工行临汾分行广宣街支行', '李磊', '6222080510000351770', '山西省', '临汾市', null, null, '李磊', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('922', '97', '中国建设银行', '江苏省如皋市支行营业部', '陈永和', '6217001270011199140', '江苏省', '南通市', null, null, '陈永和', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('923', '97', '中国农业银行', '无锡市支行', '王卫华', '6228480435303078172', '江苏省', '无锡市', null, null, '王卫华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('924', '97', '中国农业银行', '华庄支行', '宋月华', '6228480438802032773', '江苏省', '无锡市', null, null, '宋月华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('925', '97', '中国农业银行', '江苏省苏州市浒关支行', '李燕芳', '6228480409674418572', '江苏省', '南通市', null, null, '李燕芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('926', '97', '中国建设银行', '建设银行无锡堰桥支行', '黄奕玲', '6217001240009135018', '江苏省', '无锡市', null, null, '黄奕玲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('927', '97', '中国农业银行', '江苏省苏州市太仓支行', '杨建琴', '6228480402306376912', '江苏省', '苏州市', null, null, '杨建琴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('928', '97', '中国邮政储蓄银行', '中国邮政储蓄银行银行南通市如皋港支行', '沈娟', '6217993000145287150', '江苏省', '南通市', null, null, '沈娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('929', '97', '中国邮政储蓄银行', '江苏省如皋市长江支行', '陆永连', '6217993000165065379', '江苏省', '南通市', null, null, '陆永连', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('930', '97', '中国建设银行', '江苏省苏州市太仓市城厢镇南区分理处', '张长勇', '6217002000000109829', '江苏省', '太仓市', null, null, '张长勇', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('931', '97', '中国建设银行', '中国建设银行如皋东门分理处', '仇佩荣', '6236681270001938918', '江苏省', '南通市', null, null, '仇佩荣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('932', '97', '中国农业银行', '江苏省南通市海安县曲塘支行', '王正英', '6228480428923411675', '江苏省', '南通市', null, null, '王正英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('933', '97', '中国建设银行', '山西省临汾市鼓楼支行', '申明虎', '6217000350005007334', '山西省', '临汾市', null, null, '申明虎', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('934', '97', '中国建设银行', '临汾解放路支行', '叶二飞', '6217000350005818813', '山西省', '临汾', null, null, '叶二飞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('935', '97', '中国工商银行', '江苏省苏州市太仓市支行', '王燕', '6222021102069200171', '江苏省', '苏州市', null, null, '王燕', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('936', '97', '中国工商银行', '临汾市开发区支行', '高东喜', '6212260510001942935', '山西省', '临汾市', null, null, '高东喜', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('937', '97', '中国工商银行', '中国工商银行江苏省南通市如皋支行', '张云红', '6222001111100880895', '江苏省', '南通市', null, null, '张云红', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('938', '97', '中国银行', '江苏无锡', '吕建强', '6217856100004193626', '江苏省', '无锡市', null, null, '吕建强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('939', '97', '中国农业银行', '无锡农业银行江阴文林支行', '黄力加', '6228410433032537860', '江苏省', '无锡市', null, null, '黄力加', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('940', '97', '中国农业银行', '江苏省南通市崇川区濠北支行', '戴秀芳', '6228480420946243219', '江苏省', '南通市', null, null, '戴秀芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('941', '97', '中国农业银行', '江苏省南通市祟川区濠北支行', '王子炀', '6228480423058665617', '江苏省', '南通市', null, null, '王子炀', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('942', '97', '中国工商银行', '临汾市向阳路支行', '郭沙沙', '6222020510002168126', '山西省', '临汾市', null, null, '郭沙沙', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('943', '97', '中国建设银行', '如皋市南门支行', '沈光明', '6217001270003987619', '江苏省', '南通市', null, null, '沈光明', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('944', '97', '中国农业银行', '长沙市天心区农业钢城支行', '胡大汛', '6228481099037500874', '湖南省', '长沙市', null, null, '胡大汛', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('945', '97', '交通银行', '临汾市鼓楼分行', '高淑珍', '6222621460000949221', '山西省', '临汾市', null, null, '高淑珍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('946', '97', '中国农业银行', '上海市分行华漕支行', '陈进海', '6228480038263068272', '上海市', '上海市', null, null, '陈进海', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('947', '97', '中国农业银行', '江苏如皋市石庄农业支行', '陈海兰', '6228480429322621278', '江苏省', '南通市', null, null, '陈海兰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('948', '97', '中国农业银行', '江苏无锡', '黄强', '6228250438034119479', '江苏省', '无锡市', null, null, '黄强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('949', '97', '兴业银行', '南通市南通分行', '朱银', '622908407219836518', '江苏省', '南通市', null, null, '朱银', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('950', '97', '中国银行', '中国银行昆山周市支行', '罗来丽', '6259073234021261', '江苏省', '昆山市', null, null, '罗来丽', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('951', '97', '中国银行', '江苏省如皋市长江支行', '薛杨鹏', '6216606100006008512', '江苏省', '南通市', null, null, '薛杨鹏', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('952', '97', '中国建设银行', '江苏南通', '王勇芹', '6217001270010066738', '江苏省', '南通市', null, null, '王勇芹', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('953', '97', '中国工商银行', '徐州市矿大支行', '胡跃华', '6212261106005451939', '江苏省', '徐州市', null, null, '胡跃华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('954', '97', '中国银行', '无锡市分行稻香支行', '乔伯南', '6217566100029492111', '江苏省', '无锡市', null, null, '乔伯南', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('955', '97', '中国农业银行', '上海市分行华漕支行', '陈娟', '6228480038462967977', '上海市', '上海市', null, null, '陈娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('956', '97', '中国农业银行', '盐城市', '钱兰凤', '6228481985739614379', '江苏省', '盐城市', null, null, '钱兰凤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('957', '97', '中国工商银行', '临沂市东行支行', '武红霞', '6212261610018153374', '山西省', '临沂市', null, null, '武红霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('958', '97', '中国建设银行', '建行临汾分行洪洞县支行', '郭鹏', '6217000350003021337', '山西省', '临汾市', null, null, '郭鹏', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('959', '97', '中国农业银行', '江苏省南通市八厂支行', '白晓燕', '6228450428033101279', '江苏省', '南通市', null, null, '白晓燕', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('960', '97', '平安银行', '上海分行新天地支行', '马骕', '6222980100811423', '上海市', '上海市', null, null, '马骕', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('961', '97', '上海浦东发展银行', '中山市古镇支行', '蔡健波', '6217921070352466', '广东省', '中山市', null, null, '蔡健波', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('962', '97', '中国民生银行', '江苏南通', '邹悦', '6226224900136715', '江苏省', '南通市', null, null, '邹悦', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('963', '97', '招商银行', '招商银行遵义分行', '孙涛', '6212868930996666', '贵州省', '遵义', null, null, '孙涛', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('964', '97', '中国农业银行', '中国农业银行股份有限公司城区支行', '常莲莲', '6228480402932951815', '城区支行', '城区支行', null, null, '常莲莲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('965', '97', '中国农业银行', '江苏省靖江市人民中路支行', '陆金凤', '6228413424505585376', '江苏省', '靖江市', null, null, '陆金凤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('966', '97', '中国建设银行', '江苏省太仓分行营业部', '杨丽英', '6236682000019889319', '江苏省', '太仓市', null, null, '杨丽英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('967', '97', '中国银行', '湖南省永州市宁远县支行', '周喜训', '6215697500011633596', '湖南省', '永州市', null, null, '周喜训', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('968', '97', '中国工商银行', '菏泽市郓城县', '张冰', '6212261607000934056', '山东省', '菏泽市', null, null, '张冰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('969', '97', '交通银行', '七宝支行', '李正', '6222600110050831002', '上海市', '上海市', null, null, '李正', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('970', '97', '中国工商银行', '昆山市前进分行', '卢建卿', '6222021102006169703', '江苏省', '昆山市', null, null, '卢建卿', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('971', '97', '中国农业银行', '江苏省南通市秦灶分理处', '陈建华', '6228480428319656370', '江苏省', '南通市', null, null, '陈建华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('972', '97', '中国农业银行', '无锡安镇支行', '罗艳', '6228480435828795474', '江苏省', '无锡市', null, null, '罗艳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('973', '97', '中国邮政储蓄银行', '洪洞县邮政储蓄银行洪洞支行', '芦三女', '6217991770007155610', '洪洞', '洪洞', null, null, '芦三女', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('974', '97', '中国建设银行', '临汾市分行洪洞支行', '师晓冬', '6217000350001095937', '山西省', '临汾市', null, null, '师晓冬', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('975', '97', '中国农业银行', '无锡市查桥支行', '蔡军', '6228480434017901019', '江苏省', '无锡市', null, null, '蔡军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('976', '97', '中国工商银行', '四川成都工商银行滨江华西医院分理处', '许琳', '6222024402064919552', '四川省', '成都', null, null, '许琳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('977', '97', '中国建设银行', '江苏省南通如皋市支行营业部', '周谷静', '6236681270002024601', '江苏省', '南通市', null, null, '周谷静', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('978', '97', '中国银行', '南通市南通分行', '徐秋月', '6217876100003373720', '江苏省', '南通市', null, null, '徐秋月', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('979', '97', '中国建设银行', '江苏省太仓东区支行', '宋建娅', '4340612000265671', '江苏省', '太仓市', null, null, '宋建娅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('980', '97', '兴业银行', '兴业银行靖江支行', '钱咏梅', '622909403793173310', '江苏省', '靖江', null, null, '钱咏梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('981', '97', '中国工商银行', '樾河支行', '潘喜英', '6222021102015982617', '樾河', '樾河', null, null, '潘喜英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('982', '97', '兴业银行', '兴业银行靖江支行', '钱咏梅', '622909403793173310', '靖江', '靖江', null, null, '钱咏梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('983', '97', '中国农业银行', '南通青年西路支行', '钟廷英', '6228450428042053974', '江苏省', '南通市', null, null, '钟廷英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('984', '97', '中国农业银行', '宜春樟树分行', '戈招义', '6228482328144879577', '宜春樟树', '宜春樟树', null, null, '戈招义', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('985', '97', '中国农业银行', '中国农业银行临朐杨善分理处', '王光振', '6228480299039524770', '临朐杨善', '临朐杨善', null, null, '王光振', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('986', '97', '中国农业银行', '中国农业银行股份有限公司太原经济技术开发区支行', '张鸿艳', '6228480908101843674', '太原', '太原', null, null, '张鸿艳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('987', '97', '中国工商银行', '江苏省南通市崇川区人民东路工商银行分行', '保清国', '6217231111006086946', '江苏省', '南通市', null, null, '保清国', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('988', '97', '中国农业银行', '江苏如皋中山东路支行', '张朱平', '6228480423839072810', '江苏省', '南通市', null, null, '张朱平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('989', '97', '中国工商银行', '江苏南通市崇川区人民东路德民花苑分理处', '刘金凤', '6222081111001759555', '江苏省', '南通市', null, null, '刘金凤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('990', '97', '中国农业银行', '江苏南通启东支行', '陈新新', '6228480429393430278', '江苏省', '南通市', null, null, '陈新新', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('991', '97', '中国银行', '如皋市中国银行', '吉洪', '6217906100009068153', '江苏省', '南通市', null, null, '吉洪', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('992', '97', '中国工商银行', '江苏省南通市崇川区学田支行', '陆文亚', '6222021111014479053', '江苏省', '南通市', null, null, '陆文亚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('993', '97', '中国建设银行', '江苏省南通市崇川区人民东路支行', '韩群', '6217001270014707568', '江苏省', '南通市', null, null, '韩群', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('994', '124', '中国农业银行', '江阴周庄支行', '曹晓锋', '6228480439055692370', '江苏省', '无锡市江阴市', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('995', '97', '中国建设银行', '无锡市南长区', '张建珍', '6217001240009855482', '江苏省', '无锡市', null, null, '张建珍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('998', '97', '中国农业银行', '江苏省如皋市江安支行', '  卢德华', '6228480425797442075', '江苏省', '南通市', null, null, '卢德华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('999', '97', '中国建设银行', '淮安分行营业部', '李前坤', '6217001290005749445', '江苏省', '淮安', null, null, '李前坤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1000', '97', '中国工商银行', '江苏省南通港闸分行', '薛继平', '6222081111001031682', '江苏省', '南通市', null, null, '薛继平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1001', '97', '中国农业银行', '农业银行靖远县北辰支行', '齐金书', '6228481228217995972', '靖远县', '靖远县', null, null, '齐金书', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1002', '97', '中国建设银行', '南通金沙支行', '杨建国', '6217001270012930303', '江苏省', '南通市', null, null, '杨建国', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1003', '97', '中国邮政储蓄银行', '江苏无锡', '王树根', '6217993000269391853', '江苏省', '无锡市', null, null, '王树根', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1004', '97', '交通银行', '江苏南通市', '龚晓婷', '6222623100001143170', '江苏省', '南通市', null, null, '龚晓婷', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1005', '97', '中国工商银行', '南通金沙支行', '李亚楠', '6222021111006444305', '江苏省', '南通市', null, null, '李亚楠', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1006', '97', '中国建设银行', '安镇支行', '周婷婷', '6217001240006967165', '江苏省', '无锡市', null, null, '周婷婷', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1007', '97', '中国农业银行', '无锡市分行东北塘支行', '徐晓明', '6228480432460030211', '江苏省', '无锡市', null, null, '徐晓明', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1008', '97', '平安银行', '上海分行新天地支行', '马骕', '6222980100811423', '上海市', '上海市', null, null, '马骕', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1009', '97', '中国农业银行', '江苏省靖江市御水湾支行', '黄慧', '6228483425569635077', '江苏省', '靖江市', null, null, '黄慧', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1010', '97', '中国建设银行', '广州市分行黄埔支行', '吴玉碟', '6217003320019430548', '广东省', '广州市', null, null, '吴玉碟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1011', '97', '中国建设银行', '中国建设银行浙江省宁波市天一支行', '李俊杰', '6227001590580059055', '浙江省', '宁波市', null, null, '李俊杰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1012', '97', '中国工商银行', '江苏省太仓市总行', '邹亚静', '6222021102067008683', '江苏省', '太仓市', null, null, '邹亚静', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1013', '97', '交通银行', '临汾市鼓楼分行', '高淑珍', '6222621460000949221', '山西省', '临汾市', null, null, '高淑珍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1014', '97', '中国建设银行', '无锡市建设银行梅村支行', '张琴兰', '6217001240019635064', '江苏省', '无锡市', null, null, '张琴兰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1015', '97', '招商银行', '南通市分行南大街支行', '陈泳好', '6214855131938777', '江苏省', '南通市', null, null, '陈泳好', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1016', '97', '中国建设银行', '江苏省靖江市富海广场支行', '殷卫娟', '6217001310004521908', '江苏省', '靖江市', null, null, '殷卫娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1017', '97', '招商银行', '江苏省如皋支行分理处', '周美英', '6214835131688465', '江苏省', '南通市', null, null, '周美英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1018', '97', '中国建设银行', '江苏省如皋市北门分理处', '王蓉', ' 6236681270002636487', '江苏省', '南通市', null, null, '王蓉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1019', '97', '中国建设银行', '中国建设银行洪洞分行', '张康梅', '6236682000023750028', '洪洞', '洪洞', null, null, '张康梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1020', '120', '中国农业银行', '湘潭支行', '陈自斌', '6228481119451604679', '湖南省', '湘潭市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1021', '97', '招商银行', '江苏省如皋市支行', '赵国莲', '6214835131689257', '江苏省', '南通市', null, null, '赵国莲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1022', '97', '中国建设银行', '江苏省如皋市新皋桥支行', '徐玉群', '6217001270000212110', '江苏省', '南通市', null, null, '徐玉群', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1023', '97', '招商银行', '江苏省如皋支行', '芦忠芳', '6214835131859017', '江苏省', '南通市', null, null, '芦忠芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1024', '97', '中国农业银行', '宜春市樟树分行', '杨玲', '6228482326078437164', '宜春市', '宜春市', null, null, '杨玲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1025', '97', '中国建设银行', '江苏省如皋市支行营业部', '陈永和', '6217001270011199140', '江苏省', '南通市', null, null, '陈永和', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1026', '97', '中国农业银行', '江苏省南通市崇川区南大街支行', '杨德军', '6228480424413335813', '江苏省', '南通市', null, null, '杨德军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1027', '97', '中国银行', '湖南省永州市宁远县支行', '周训喜 ', '6215697500011633596', '湖南省', '永州市', null, null, '周训喜 ', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1028', '97', '中国建设银行', '江苏省如皋市海阳路分理处', '曹石泉', '6236681270000481365', '江苏省', '南通市', null, null, '曹石泉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1029', '97', '中国农业银行', '江苏省如皋市长江支行', '刘德梅', '6228480425785638874', '江苏省', '南通市', null, null, '刘德梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1030', '97', '中国邮政储蓄银行', '临汾分行洪洞支行', '乔艳荣', '6217991771000041153', '山西省', '临汾市', null, null, '乔艳荣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1031', '97', '交通银行', '无锡东亭支行', '华志芬', '5201690150277600', '江苏省', '无锡市', null, null, '华志芬', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1032', '97', '中国农业银行', '临汾市洪洞支行', '张丽', '6228481290460818210', '山西省', '临汾市', null, null, '张丽', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1033', '97', '中国农业银行', '招远蚕庄分理处', '刘滨琪', '6228480268086652677', '山东省', '烟台市', null, null, '刘滨琪', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1034', '97', '中国工商银行', '菏泽市郓城县', '张冰', '6212261609000934056', '菏泽市', '菏泽市', null, null, '张冰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1035', '97', '中国银行', '洛阳市宜阳县支行', '聂洛宜', '6217858000075159001', '洛阳市', '洛阳市 ', null, null, '聂洛宜', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1036', '97', '中国农业银行', '江苏无锡', '周铁农', '6228480430416083516', '江苏省', '无锡市', null, null, '周铁农', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1037', '97', '中国建设银行', '江苏省如皋市海阳路分理处', '丁伟伟', '6217001270005588811', '江苏省', '南通市', null, null, '丁伟伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1038', '97', '中国建设银行', '宜春樟树支行', '李瑜', '6217002100003547825', '宜春樟树', '宜春樟树', null, null, '李瑜', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1039', '97', '中国工商银行', '张泾支行', '刘章敏', '6212261103004690914', '江苏省', '无锡市', null, null, '刘章敏', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1040', '97', '中国农业银行', '无锡安镇支行', '罗艳', '6228480435828795474', '江苏省', '无锡市', null, null, '罗艳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1041', '97', '中国建设银行', '江苏省南通市港闸支行', '张继财', '6227001278840001931', '江苏省', '南通市', null, null, '张继财', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1042', '97', '中国农业银行', '盐城市建湖县支行', '赵文秀', '6228481985574900677', '江苏省', '盐城市', null, null, '赵文秀', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1043', '97', '中国建设银行', '福州市仓山支行', '叶冠之', '6217001820003421686', '福建省', '福州市', null, null, '叶冠之', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1044', '97', '中国工商银行', '江苏省南通市海安市海安支行', '谷少康', '6222081111003976348', '江苏省', '南通市', null, null, '谷少康', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1045', '97', '中国建设银行', '湖南省郴州资兴市鲤鱼江支行', '王小燕', '6236682980002207241', '湖南省', '郴州', null, null, '王小燕', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1046', '97', '中国建设银行', '无锡市', '钱利忠', '6217001240010572886', '江苏省', '无锡市', null, null, '钱利忠', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1047', '97', '中国农业银行', '江苏如东支行栟茶分理处', '丁宏英', '6228270426187006276', '江苏省', '南通市', null, null, '丁宏英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1048', '97', '中国工商银行', '沙雅县支行', '吴丽丽', '6222023014004074017', '沙雅县', '沙雅县', null, null, '吴丽丽', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1049', '97', '中国农业银行', '长沙市天心区农业钢城支行', '胡大汛', '6228481099037500874', '湖南省', '长沙市', null, null, '胡大汛', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1050', '97', '中国工商银行', '江苏南通市崇川区春晖支行', '俞海荣', '6217231111003007168', '江苏省', '南通市', null, null, '俞海荣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1051', '97', '中国工商银行', '工商银行临汾市分行', '贺凤', '6212260510001111069', '山西省', '临汾市', null, null, '贺凤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1052', '97', '中国建设银行', '无锡市城北支行', '姚慧珍', '6217001240018682752', '江苏省', '无锡市', null, null, '姚慧珍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1053', '97', '中国建设银行', '江苏省南通如皋市支行营业部', '周谷静', '6236681270002024601', '江苏省', '南通市', null, null, '周谷静', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1054', '97', '兴业银行', '兴业银行靖江支行', '钱咏梅', '622909403793173310', '靖江', '靖江', null, null, '钱咏梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1055', '97', '中国农业银行', '江苏省南通市跃龙路支行', '张群', '6228480428808672177', '江苏省', '南通市', null, null, '张群', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1056', '97', '中国农业银行', '临汾市建设路支行', '冯晓丽', '6228481298196455074', '山西省', '临汾市', null, null, '冯晓丽', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1057', '97', '中国工商银行', '江苏省南通市崇川区人民东路工商银行分行', '保清国', '6217231111006086946', '江苏省', '南通市', null, null, '保清国', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1058', '97', '招商银行', '招商银行江苏省太仓市支行', '朱建强', '6214835126271921', '江苏省', '太仓市', null, null, '朱建强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1059', '97', '中国工商银行', '江苏南通市崇川区人民东路德民花苑分理处', '刘金凤', '6222081111001759555', '江苏省', '南通市', null, null, '刘金凤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1060', '97', '中国银行', '江苏省南通分行', '邱骥', '6217856100017696441', '江苏省', '南通市', null, null, '邱骥', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1061', '97', '中国建设银行', '怀化市沅陵县支行', '张丙兰', '6217003020106681272', '怀化市', '怀化市', null, null, '张丙兰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1062', '97', '中国邮政储蓄银行', '邮政储蓄银行临汾分行洪洞支行', '杨东兵', '6217981770000204441', '山西省', '临汾', null, null, '杨东兵', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1063', '97', '中国银行', '临汾市解放路支行', '肖淑媛', '6216618103000220634', '临汾市', '临汾市', null, null, '肖淑媛', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1064', '97', '中国民生银行', '上海福山支行', '邢琴', '6226220213793333', '上海市', '上海市', null, null, '邢琴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1065', '97', '中国建设银行', '江苏南通启东合和镇分理处', '杨建英', '6217001270013935053', '江苏省', '南通市', null, null, '杨建英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1066', '97', '中国农业银行', '无锡安镇', '姚振伟', '6228480431747198510', '江苏省', '无锡市', null, null, '姚振伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1067', '97', '中国银行', '临汾市莲花池支行', '李花萍', '6217858100027711907', '山西省', '临汾市', null, null, '李花萍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1068', '97', '中国农业银行', '无锡市东湖塘支行', '黄国强', '6228250438034258277', '江苏省', '无锡市', null, null, '黄国强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1069', '97', '中国农业银行', '荆门市东宝区子陵镇分行', '徐文丹', '6228481609759189779', '荆门市', '荆门市', null, null, '徐文丹', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1087', '97', '中国农业银行', '江苏无锡', '余艳碧', '6228480433176333717', '江苏省', '无锡市', null, null, '余艳碧', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1071', '97', '中国建设银行', '常州市清潭支行', '许守坚', '4340611260187864', '江苏省', '常州市', null, null, '许守坚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1072', '97', '中国工商银行', '无锡市工商银行后宅支行', '刘何富', '6222021103017244501', '江苏省', '无锡市', null, null, '刘何富', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1073', '97', '中国邮政储蓄银行', '中国邮政储蓄银行银行南通市如皋港支行', '沈娟', '6217993000145287150', '江苏省', '南通市', null, null, '沈娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1086', '97', '中国农业银行', '江苏省南通市如东欧贸支行', '徐国芳', '6228480425602751876', '江苏省', '南通市', null, null, '徐国芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1085', '97', '中国建设银行', '中国建设银行股份有限公司福州金街支行', '梁菊英', '6227001824120209114', '福州', '福州', null, null, '梁菊英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1084', '97', '招商银行', '江苏省如皋支行分理处', '周美英', '6214835131688465', '江苏省', '南通市', null, null, '周美英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1077', '97', '中国工商银行', '南通启东城西支行', '施美丞', '6222021111011953837', '江苏省', '南通市', null, null, '施美丞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1078', '97', '中国农业银行', '新疆省石河子兵团分行营业室', '陈锋', '6228453378080454733', '新疆省', '石河子', null, null, '陈锋', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1079', '97', '招商银行', '江苏省如皋市支行', '蒋伟', '6214855136039415', '江苏省', '南通市', null, null, '蒋伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1080', '97', '交通银行', '临汾城东支行', '梁家瑞', '6222621460001179083', '山西省', '临汾', null, null, '梁家瑞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1081', '97', '中国建设银行', '中国建设银行浙江省宁波市宁海天景园支行', '陈友辉', '6236681590006331375', '浙江省', '宁波市', null, null, '陈友辉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1082', '97', '中国工商银行', '江苏省苏州市太仓市支行', '顾振清', '6212261102002286766', '江苏省', '苏州市', null, null, '顾振清', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1083', '97', '中国建设银行', '江苏省如皋市北门分理处', '王蓉', '6236681270002636487', '江苏省', '南通市', null, null, '王蓉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1088', '97', '中信银行', '中信银行', '张峰', '6217731902671052', '中信银行', '中信银行', null, null, '张峰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1089', '97', '中国建设银行', '中国建设银行湖南省郴州市资兴市支行鲤鱼江分理处', '谭瑛', '6227002980240079263', '湖南省', '郴州市', null, null, '谭瑛', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1090', '97', '中国工商银行', '锡山区安镇支行', '秦锡兴', '6222021103024275027', '江苏省', '无锡市', null, null, '秦锡兴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1091', '97', '中国工商银行', '菏泽市郓城县', '张冰', '6212261609000934056', '菏泽市', '菏泽市', null, null, '张冰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1092', '97', '中国银行', '南通市南通分行', '徐秋月', '6217876100003373720', '江苏省', '南通市', null, null, '徐秋月', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1093', '97', '中国农业银行', '江苏省如皋市文峰分理处', '赵桂芳', '6228480425785914572', '江苏省', '南通市', null, null, '赵桂芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1094', '97', '中国工商银行', '江苏省常熟支行', '范国明', '6222081102003351053', '江苏省', '常熟市', null, null, '范国明', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1095', '97', '中国农业银行', '江苏省常熟市莫城支行', '何进到', '6228480402484903719', '江苏省', '常熟市', null, null, '何进到', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1096', '97', '中国建设银行', '常州市溧阳市支行', '潘小伟', '6227001263539523486', '江苏省', '常州市', null, null, '潘小伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1097', '97', '交通银行', '七宝支行', '李正', '6222600110050831002', '七宝', '七宝', null, null, '李正', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1098', '97', '中国农业银行', '江苏省靖江市人民中路支行', '陆金凤', '6228413424505585376', '江苏省', '靖江市', null, null, '陆金凤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1099', '97', '中国工商银行', '工行临汾分行洪洞支行', '李金刚', '6212260510005675226', '山西省', '临汾市', null, null, '李金刚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1100', '97', '交通银行', '临汾鼓楼广场支行', '贾丽辉', '6222621020004112117', '山西省', '临汾', null, null, '贾丽辉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1101', '97', '中国工商银行', '南通市高店支行', '许东清', '6222081111002423953', '江苏省', '南通市', null, null, '许东清', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1102', '97', '中国建设银行', '湖南省郴州资兴市鲤鱼江支行', '王小燕', '6236682980002207241', '湖南省', '郴州', null, null, '王小燕', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1103', '97', '中国建设银行', '无锡市建设银行梅村支行', '华明洪', '6217001240021309302', '江苏省', '无锡市', null, null, '华明洪', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1104', '97', '中国工商银行', '南通金沙支行', '李亚楠', '6222021111006444305', '江苏省', '南通市', null, null, '李亚楠', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1105', '97', '中国建设银行', '南通金沙支行', '杨建国', '6217001270012930303', '江苏省', '南通市', null, null, '杨建国', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1106', '97', '中国银行', '常州世府邻里支行', '顾琴芳', '6217876100008874839', '江苏省', '常州市', null, null, '顾琴芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1107', '97', '招商银行', '上海分行闵行支行', '杨肖', '6214832151376113', '上海市', '上海市', null, null, '杨肖', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1108', '97', '中国工商银行', '临汾市临汾东大街支行', '邓洋', '6212260510003729991', '山西省', '临汾市', null, null, '邓洋', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1109', '97', '中国农业银行', '海门市余东镇', '王菊艳', '6228480429392514874', '江苏省', '南通市', null, null, '王菊艳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1110', '97', '中国工商银行', '南通市', '曹玉梅', '6222021111017018569', '江苏省', '南通市', null, null, '曹玉梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1111', '97', '中国建设银行', '如皋市建行如皋通扬分理处', '冒乃云', '6217001270011398668', '江苏省', '南通市', null, null, '冒乃云', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1112', '97', '中国工商银行', '中国工商银行新疆维吾尔自治区昌吉回族自治州昌吉延安中路支行', '杜淑娟', '6212263004002689551', '新疆', '新疆维', null, null, '杜淑娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1113', '97', '中国银行', '山西临汾', '杨鑫', '6217858100012208927', '山西省', '临汾', null, null, '杨鑫', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1114', '97', '中国工商银行', '江苏省启东市支行', '黄红铃', '6217231111001013721', '江苏省', '启东市', null, null, '黄红铃', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1115', '97', '中国农业银行', '江苏南通启东支行', '陈新新', '6228480429393430278', '江苏省', '南通市', null, null, '陈新新', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1116', '97', '中国建设银行', '中国建设银行临汾分行洪洞支行', '李刚', '6217000350006762705', '山西省', '临汾', null, null, '李刚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1117', '97', '中国邮政储蓄银行', '安镇支行', '杨明霞', '6217993000295293016', '江苏省', '无锡市', null, null, '杨明霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1118', '97', '中国工商银行', '江苏无锡', '赵爱娟', '62220211010885888', '江苏', '无锡市', null, null, '赵爱娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1119', '97', '兴业银行', '南通市兴业银行南通分行', '李光', '622909406302936119', '江苏省', '南通市', null, null, '李光', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1120', '97', '中国建设银行', '临汾市华门分行', '张健', '6217000350006761202', '山西省', '临汾市', null, null, '张健', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1121', '97', '中国银行', '江苏南通南苑支行', '陈慰', '6217856100003942858', '江苏省', '南通市', null, null, '陈慰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1122', '97', '中国建设银行', '无锡市南长区', '张建珍', '6217001240009855482', '江苏省', '无锡市', null, null, '张建珍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1123', '97', '中国农业银行', '昆山市同丰路支行', '严红', '6228450408053248879', '江苏省', '昆山市', null, null, '严红', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1124', '97', '中国工商银行', '中国工商银行四川省雅安市雨城区羌江南路支行', '谢芳', '6212262319000465270', '四川省', '雅安市', null, null, '谢芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1125', '97', '中国农业银行', '江苏省南通市钟秀支行', '范家丞', '6228480425838792678', '江苏省', '南通市', null, null, '范家丞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1126', '97', '中国农业银行', '南通崇川区跃龙路支行', '单陈', '6228480425564733078', '江苏省', '南通市', null, null, '单陈', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1127', '97', '中国农业银行', '江苏省南通市崇川区跃龙路支行', '陈福军', '6228480425285555271', '江苏省', '南通市', null, null, '陈福军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1128', '97', '中国建设银行', '长沙市青山支行', '向本闯', '6230942920000983954', '长沙市', '长沙市', null, null, '向本闯', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1129', '97', '中国农业银行', '临汾市襄汾襄陵支行', '王晓琴', '6228481290546307113', '临汾市', '临汾市', null, null, '王晓琴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1130', '97', '中国农业银行', '江苏省南通市工农路支行', '黄萍', '6228480425308849073', '江苏省', '南通市', null, null, '黄萍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1131', '97', '中国工商银行', '南京市新街口支行', '汪振好', '6212264301016218099', '江苏省', '南京市', null, null, '汪振好', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1132', '97', '中国工商银行', '启东市吕四支行', '葛煌', '6212261111001581861', '江苏省', '启东市', null, null, '葛煌', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1133', '97', '中国银行', '中国银行临汾分行洪洞支行', '朱红荣', '4563518103003229374', '山西省', '临汾', null, null, '朱红荣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1134', '97', '中国工商银行', '江苏无锡', '赵爱娟', '6222021103010885888', '江苏省', '无锡市', null, null, '赵爱娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1135', '97', '兴业银行', '崇川区支行', '钟彩华', '622908406797386417', '江苏省', '南通市', null, null, '钟彩华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1136', '97', '中国工商银行', '江苏无锡', '李爱兰', '6222021103004164852', '江苏省', '无锡市', null, null, '李爱兰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1137', '97', '中国建设银行', '江苏南通启东合和镇分理处', '杨建英', '6217001270013935053', '江苏省', '南通市', null, null, '杨建英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1138', '97', '中国工商银行', '江苏南通启东支行', '张颜萍', '6222021111016353819', '江苏省', '南通市', null, null, '张颜萍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1139', '97', '中国建设银行', '无锡市梁溪区', '徐群珠', '6222801240111034630', '江苏省', '无锡市', null, null, '徐群珠', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1143', '97', '中国建设银行', '中国建设银行股份有限公司石河子分行营业室', '陈锋', '4340624630004784', '新疆省', '石河子', null, null, '陈锋', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1141', '97', '中国建设银行', '中国建设银行股份有限公司北京慧忠路支行', '景峰峰', '6217000010079499656', '北京市', '北京市', null, null, '景峰峰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1142', '97', '中国银行', '南通市城山支行', '陈诚', '6217876100010620691', '江苏省', '南通市', null, null, '陈诚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1144', '97', '中国建设银行', '中国建设银行股份有限公司福州金街支行', '梁菊英', '6227001824120209114', '福州', '福州', null, null, '梁菊英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1145', '97', '中国农业银行', '上海市分行华漕支行', '陈娟', '6228480038462967977', '上海市', '上海市', null, null, '陈娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1146', '97', '中国工商银行', '江苏无锡', '汪可红', '6222021103017013658', '江苏省', '无锡市', null, null, '汪可红', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1147', '97', '中国工商银行', '启东市分行支行', '龚圣芳', '6222021111009943212', '江苏省', '南通市', null, null, '龚圣芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1148', '97', '中国农业银行', '常熟市方塔支行', '潘文蓉', '6228480405683665575', '江苏省', '南通市', null, null, '潘文蓉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1149', '97', '中国工商银行', '山西省临汾市襄汾县', '范盼飞', '6212260510007998857', '山西省', '临汾', null, null, '范盼飞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1150', '97', '中国建设银行', '江苏无锡分行胜利门支行', '章炜', '6217001240021507780', '江苏省', '无锡市', null, null, '章炜', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1151', '97', '中国邮政储蓄银行', '陕西旬阳', '陈平', '6221888010012747913', '陕西', '旬阳', null, null, '陈平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1152', '97', '中国邮政储蓄银行', '陕西旬阳', '陈平', '6221888010012747913', '陕西', '旬阳', null, null, '陈平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1153', '97', '中国建设银行', '上海市番禺路支行', '施黄健', '6236681210000291190', '上海市', '上海市', null, null, '施黄健', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1154', '97', '招商银行', '江苏省如皋市支行', '张耀如', '62148351131200543', '江苏省', '南通市', null, null, '张耀如', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1155', '97', '中国建设银行', '江苏无锡', '浦晓新', '6217001240001789317', '江苏省', '无锡市', null, null, '浦晓新', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1156', '97', '中国建设银行', '江苏南通启东汇龙南苑路支行', '王卫菊', '6217001270017492325', '江苏省', '南通市', null, null, '王卫菊', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1157', '97', '中国农业银行', '徐州经济技术开发区支行', '詹小霄', '6228480458182596478', '江苏省', '徐州', null, null, '詹小霄', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1158', '97', '中国建设银行', '中国建设银行江苏省南通市如皋城中支行', '袁馨', '6217001270009966377', '江苏省', '南通市', null, null, '袁馨', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1159', '97', '中国农业银行', '新疆五家渠市中心支行', '王红新', '6228450898056626271', '新疆省', '五家渠', null, null, '王红新', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1160', '97', '中国建设银行', '中国建设银行江苏省南通市青年中路分理处', '孙亮亮', '6217001270014547998', '江苏省', '南通市', null, null, '孙亮亮', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1161', '97', '中国工商银行', '中国工商银行江苏省南通市如皋支行', '葛云霞', '6215581111007510605', '江苏省', '南通市', null, null, '葛云霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1162', '97', '中国银行', '江苏启东公园里支行', '黄亚琴', '6217856100027832952', '江苏省', '南通市', null, null, '黄亚琴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1163', '97', '中国工商银行', '扬州市宝应支行', '徐玉军', '6215581108002585434', '扬州市', '扬州市', null, null, '徐玉军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1164', '97', '中国工商银行', '中国工商银行江苏省南通市如皋城中支行', '曹月健', '6215581111007394026', '江苏省', '南通市', null, null, '曹月健', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1165', '97', '中国农业银行', '中国农业银行江苏省南通市如皋中山东路支行', '朱和连', '6228480425774428170', '江苏省', '南通市', null, null, '朱和连', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1166', '97', '上海浦东发展银行', '安徽省', '赵永恒', '6217921375374611', '安徽省', '安徽省', null, null, '赵永恒', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1167', '97', '中国建设银行', '江苏南通', '顾媛媛', '6217001270012164978', '江苏省', '南通市', null, null, '顾媛媛', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1168', '97', '中国农业银行', '江苏省南通市', '徐志锋', '6228480428087348077', '江苏省', '南通市', null, null, '徐志锋', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1169', '97', '中国工商银行', '工商银行临汾市分行西城支行', '安晋慷', '6222080510000658307', '山西省', '临汾市', null, null, '安晋慷', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1170', '97', '中国农业银行', '中国农业银行临朐杨善分理处', '王光振', '6228480299039524770', '临朐杨善', '临朐杨善', null, null, '王光振', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1171', '97', '交通银行', '无锡安镇支行', '顾正伟', '6222620150006774365', '江苏省', '无锡市', null, null, '顾正伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1172', '97', '中国建设银行', '中国建设银行江苏省南通市如皋城中支行', '高卫兵', '6214661270174988', '江苏省', '南通市', null, null, '高卫兵', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1173', '97', '招商银行', '江苏省如皋市支行', '蒋伟', '6214855136039415', '江苏省', '南通市', null, null, '蒋伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1174', '97', '中国建设银行', '厦门建设银行同安分行', '林伟', '6217001930003935260', '同安', '同安', null, null, '林伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1175', '97', '中国银行', '常州世府邻里支行', '顾琴芳', '6217876100008874839', '江苏省', '常州市', null, null, '顾琴芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1176', '97', '中国邮政储蓄银行', '江西宜春樟树洋湖邮政储蓄银行', '傅耀平', '6217994310007132835', '江西省', '宜春樟树', null, null, '傅耀平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1177', '97', '中国农业银行', '石河子分行农科院支行', '魏新兵', '6228453378080334371', '新疆省', '石河子', null, null, '魏新兵', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1178', '97', '中国工商银行', '工商银行临汾市分行西城支行', '吴瑶瑶', '6222080510000658224', '山西省', '临汾', null, null, '吴瑶瑶', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1179', '97', '中国建设银行', '建设银行无锡堰桥支行', '张玉亚', '6217001240016091469', '江苏省', '无锡市', null, null, '张玉亚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1180', '97', '中国农业银行', '南通市农行分行', '何兵', '6228480425796756673', '江苏省', '南通市', null, null, '何兵', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1181', '97', '上海浦东发展银行', '中山市古镇支行', '蔡健波', '6217921070352466', '中山市', '中山市', null, null, '蔡健波', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1182', '97', '中国民生银行', '上海市分行七宝支行', '张学芳', '6216910208713633', '上海市', '上海市', null, null, '张学芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1183', '97', '中国建设银行', '中国建设银行股份有限公司临汾分行业务经营部', '张马兴', '6217000350006296530', '山西省', '临汾', null, null, '张马兴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1184', '97', '中国银行', '临汾市支行', '杨凯州', '6217908100001169494', '山西省', '临汾市', null, null, '杨凯州', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1185', '97', '中国建设银行', '石河子市建设银行分行夕阳红支行', '王思琦', '6214674630000451815', '新疆省', '石河子市', null, null, '王思琦', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1186', '97', '中国工商银行', '江苏南通启东汇龙支行', '董娟', '6215581111005075296', '江苏省', '南通市', null, null, '董娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1187', '97', '中国工商银行', '江苏南通启东汇龙支行', '董娟', '6215581111005075296', '江苏省', '南通市', null, null, '董娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1188', '97', '中国银行', '中国银行启东支行', '陆抗美', '6259063203337939', '江苏省', '南通市', null, null, '陆抗美', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1189', '97', '中国银行', '湖南省永州市宁远县支行', '周光荣', '6215697000011633604', '湖南省', '永州市', null, null, '周光荣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1190', '97', '中国农业银行', '江苏无锡市', '蔡旭明', '6230520430017833770', '江苏省', '无锡市', null, null, '蔡旭明', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1191', '97', '中国农业银行', '江苏省无锡市', '黄国琼', '6228480434641785416', '江苏省', '无锡市', null, null, '黄国琼', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1192', '97', '中国农业银行', '山东济南章丘绣江分理处', '马素东', '6228480250258788513', '山东', '济南', null, null, '马素东', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1193', '97', '中国银行', '中国银行昆山周市支行', '罗来丽', '6259073234021261', '江苏省', '昆山市', null, null, '罗来丽', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1194', '97', '中国建设银行', '湖南省郴州资兴市鲤鱼江支行', '王小燕', '6236682980002207241', '湖南省', '郴州', null, null, '王小燕', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1195', '97', '中国农业银行', '安镇支行', '任丽均', '6228410433028179560', '江苏省', '无锡市', null, null, '任丽均', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1196', '97', '中国农业银行', '江阴市文林支行', '潘洲', '6228480434501765318', '江阴市', '江阴市', null, null, '潘洲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1197', '97', '中国农业银行', '江苏省南通分行', '丁美华', '6228480428087583673', '江苏省', '南通市', null, null, '丁美华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1198', '97', '中国邮政储蓄银行', '临汾平阳广场支行', '张天亮', '6217991600000062697', '山西省', '临汾', null, null, '张天亮', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1199', '97', '中国银行', '启东支行营业部', '陆佳琳', '6216615105001514230', '江苏省', '南通市', null, null, '陆佳琳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1200', '97', '中国建设银行', '苏州市大观名园分理处', '陈斌', '6227002001260084362', '江苏省', '苏州市', null, null, '陈斌', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1201', '97', '中国工商银行', '苏州市', '马兰', '6222081102001103589', '江苏省', '苏州市', null, null, '马兰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1202', '97', '中国农业银行', '无锡山北支行', '金建军', '6228480435060750070', '江苏省', '无锡市', null, null, '金建军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1203', '97', '中国建设银行', '中国建设银行浙江省宁波市天一支行', '李俊杰', '6227001590580059055', '浙江省', '宁波市', null, null, '李俊杰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1204', '97', '中国农业银行', '中国农业银行股份有限公司临汾东城支行', '张成学', '6228481298368795976', '山西省', '临汾', null, null, '张成学', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1205', '97', '中国建设银行', '江苏南通启东支行', '施胜杰', '6227001276930170699', '江苏省', '南通市', null, null, '施胜杰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1206', '97', '中国工商银行', '上海市虹口区四川北路山阴路支行', '刘钰', '6212261001037101323', '上海市', '上海市', null, null, '刘钰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1207', '97', '交通银行', '南通市小石桥支行', '任霞', '6222623100002936283', '江苏省', '南通市', null, null, '任霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1212', '97', '中国工商银行', '临猗工商银行临猗支行', '王明芳', '6212260511013227596', '山西省', '临猗', null, null, '王明芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1213', '97', '中国农业银行', '如皋市石庄农业支行', '徐永建', '6228480425786040773', '江苏省', '南通市', null, null, '徐永建', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1214', '97', '中国农业银行', '无锡市支行', '王卫华', '6228480435303078172', '江苏省', '无锡市', null, null, '王卫华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1215', '97', '中国工商银行', '三亚支行', '李锦', '6212262201022909594', '三亚', '三亚', null, null, '李锦', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1216', '97', '中国邮政储蓄银行', '南通市木行枪', '陈学军', '6217993000335568211', '江苏省', '南通市', null, null, '陈学军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1217', '97', '中国银行', '临汾市解放路支行', '肖淑媛', '6216618103000220634', '山西省', '临汾市', null, null, '肖淑媛', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1218', '97', '招商银行', '江苏省南通市港闸区高迪支行', '朱顾阳', '6214835133078269', '江苏省', '南通市', null, null, '朱顾阳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1219', '97', '中国工商银行', '南通市高店支行', '许东清', '6222081111002423953', '江苏省', '南通市', null, null, '许东清', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1220', '97', '中国建设银行', '济宁市分行任城区支行', '童振兴', '6217002210011187744', '济宁市', '济宁市', null, null, '童振兴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1221', '97', '中国农业银行', '江苏省如皋市下原分理处', '谭福平', '6228480422198819316', '江苏省', '南通市', null, null, '谭福平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1222', '97', '中国建设银行', '中国建设银行股份有限公司太仓璜泾支行', '王一帆', '6227002007630142764', '太仓', '太仓', null, null, '王一帆', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1223', '97', '中国工商银行', '山东省菏泽市支行郓城分行', '孟姗', '6222021609001978169', '山东省', '菏泽市', null, null, '孟姗', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1224', '97', '中国建设银行', '福州市仓山分行', '高强', '6217001820001703150', '福州市', '福州市', null, null, '高强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1225', '97', '中国农业银行', '临汾市襄汾襄陵支行', '王晓琴', '6228481290546307113', '临汾市', '临汾市', null, null, '王晓琴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1226', '97', '中国农业银行', '江苏省南通市海安县曲塘支行', '王正英', '6228480428923411675', '江苏省', '南通市', null, null, '王正英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1227', '97', '中国农业银行', '河北省廊坊市香河县支行', '游信', '6228480518107449473', '河北省', '廊坊市', null, null, '游信', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1228', '97', '中国农业银行', '无锡市锡山区安镇分行', '黎倩', '6228480435305590174', '江苏省', '无锡市', null, null, '黎倩', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1229', '97', '中国农业银行', '启东市支行', '宋郁辉', '6228480421436902017', '江苏省', '南通市', null, null, '宋郁辉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1230', '97', '平安银行', '广州万达支行', '张冬平', '6230583000003333202', '广州市', '广州市', null, null, '张冬平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1231', '97', '中国建设银行', '无锡市南长区', '张建珍', '6217001240009855482', '江苏省', '张建珍', null, null, '无锡市', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1232', '97', '中国工商银行', '江苏无锡', '李爱兰', '6222021103004164852', '江苏省', '无锡市', null, null, '李爱兰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1233', '97', '中国银行', '南通市城山支行', '陈诚', '6217876100010620691', '江苏省', '南通市', null, null, '陈诚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1234', '97', '中国工商银行', '江苏南通', '吴亚基', '6222081111000428962', '江苏省', '南通市', null, null, '吴亚基', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1235', '97', '中国农业银行', '中国农业银行股份有限公司上海西渡支行', '顾中利', '6228480039014994576', '上海市', '上海市', null, null, '顾中利', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1236', '97', '中国农业银行', '苏州市枫桥支行', '黎桂华', '6230520400014214274', '江苏省', '苏州市', null, null, '黎桂华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1237', '97', '中国工商银行', '江苏省如皋市白蒲支行', '张晶晶', '6222021111013274992', '江苏省', '南通市', null, null, '张晶晶', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1238', '97', '中国工商银行', '山西省临汾市临汾向阳路支行', '布芳芳', '6212260510005294283', '山西省', '临汾市', null, null, '布芳芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1239', '97', '中国工商银行', '江苏无锡', '汪可红', '6222021103017013658', '江苏省', '无锡市', null, null, '汪可红', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1240', '97', '中国邮政储蓄银行', '中国邮政储蓄银行银行南通市如皋港支行', '沈娟', '6217993000145287150', '江苏省', '南通市', null, null, '沈娟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1241', '97', '中国工商银行', '江苏省南通市如皋支行', '张爱萍', '6215581111002841229', '江苏省', '南通市', null, null, '张爱萍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1242', '97', '中国建设银行', '贵州省都匀市桥城支行', '张仁勇', '6217007130006890133', '贵州省', '都匀市', null, null, '张仁勇', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1243', '97', '中国工商银行', '梁溪区支行', '王明远', '6212261103005154134', '梁溪区', '梁溪区', null, null, '王明远', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1244', '97', '中国农业银行', '江苏无锡', '伍忠平', '6228480435827913870', '江苏省', '无锡市', null, null, '伍忠平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1245', '97', '招商银行', '苏州吴中支行', '陆青晨', '6214835127849543', '江苏省', '苏州市', null, null, '陆青晨', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1246', '97', '中国农业银行', '中国农业银行吴江支行', '唐凤仙', '6228480402969898111', '江苏省', '苏州市', null, null, '唐凤仙', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1247', '97', '中国建设银行', '江苏省如皋市通扬分理处', '谢梦露', '6217001270005144813', '江苏省', '南通市', null, null, '谢梦露', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1248', '97', '中国农业银行', '江苏州如皋市长江支行', '薛飞', '6228480429009731671', '江苏省', '南通市', null, null, '薛飞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1249', '97', '中国建设银行', '中国建设银行如皋东门分理处', '仇佩荣', '6236681270001938918', '江苏省', '南通市', null, null, '仇佩荣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1250', '97', '中国农业银行', '江苏省南通市学田光华支行', '黄志杰', '6228480422330847316', '江苏省', '南通市', null, null, '黄志杰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1252', '97', '中国建设银行', '临汾平阳支行', '邢晋文', '6236680350000664672', '山西省', '临汾', null, null, '邢晋文', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1253', '97', '中国建设银行', '临汾市解放路支行', '苏贤惠', '4367420351092332228', '山西省', '临汾市', null, null, '苏贤惠', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1254', '97', '中国建设银行', '江苏南通', '顾建军', '6227001278110070822', '江苏省', '南通市', null, null, '顾建军', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1255', '97', '中国建设银行', '建设银行洪洞县支行', '陈英', '6214660350006110', '洪洞县', '洪洞县', null, null, '陈英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1256', '97', '中国工商银行', '菏泽市郓城县', '张冰', '6212261609000934056', '菏泽市', '菏泽市', null, null, '张冰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1257', '97', '中国银行', '启东市分行城西支行', '袁超', '6217856100045320634', '江苏省', '南通市', null, null, '袁超', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1258', '97', '平安银行', '南京市城西支行', '沈轲', '6230582000002778515', '江苏省', '南京市', null, null, '沈轲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1259', '97', '中国建设银行', '江苏省如皋市支行营业部', '陈永和', '6217001270011199140', '江苏省', '南通市', null, null, '陈永和', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1260', '97', '中国银行', '湖南省永州市宁远县支行', '周光荣', '6215697500011633604', '湖南省', '湖南省', null, null, '周光荣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1261', '97', '上海浦东发展银行', '上海浦东发展银行股份有限公司哈尔滨哈药路支行', '李莹', '6217922704141960', '上海市', '上海市', null, null, '李莹', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1262', '97', '中国银行', '江苏省南通分行', '马雨华', '6013826105017163334', '江苏省', '南通市', null, null, '马雨华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1263', '97', '交通银行', '交通银行昆山开发区支行', '罗来丽', '6222620140009039874', '江苏省', '昆山市', null, null, '罗来丽', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1264', '97', '中国工商银行', '山西省临汾市尧都区尧都支行', '潘慧刚', '6212260510004530422', '山西省', '临汾市', null, null, '潘慧刚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1265', '97', '中国建设银行', '无锡市建设银行梅村支行', '华明洪', '6217001240021309302', '江苏省', '无锡市', null, null, '华明洪', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1266', '97', '中国工商银行', '南通市', '曹玉梅', '6222021111017018569', '江苏省', '南通市', null, null, '曹玉梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1267', '97', '中国银行', '临汾分行洪洞支行', '徐聪聪', '6013828103001839025', '临汾', '临汾', null, null, '徐聪聪', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1268', '97', '中国银行', '南通市通州区平潮支行', '黄丽', '6217856100003622583', '江苏省', '南通市', null, null, '黄丽', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1269', '97', '中国工商银行', '苏州市', '马兰', '6222081102001103589', '江苏省', '苏州市', null, null, '马兰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1270', '97', '中国建设银行', '苏州市大观名园分理处', '陈斌', '6227002001260084362', '江苏省', '苏州市', null, null, '陈斌', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1271', '97', '中国农业银行', '无锡市分行山北支行', '辛子余', '6228450430015969418', '江苏省', '无锡市', null, null, '辛子余', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1272', '97', '中国农业银行', '常州市溧阳支行', '李玉珍', '6228480414062275113', '江苏省', '常州市', null, null, '李玉珍', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1273', '97', '中国银行', '临汾市解放路支行', '孙鑫', '6217908100001163034', '山西省', '临汾市', null, null, '孙鑫', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1274', '97', '中国农业银行', '佛山市南海区平洲厦动分行', '林玉玲', '6228231466005937060', '佛山市', '佛山市', null, null, '林玉玲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1275', '97', '中国建设银行', '南通金沙支行', '杨建国', '6217001270012930303', '江苏省', '南通市', null, null, '杨建国', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1276', '97', '中国工商银行', '中国工商银行都匀桥城支行', '钟雅迪', '6212262405000699156', '都匀桥城', '都匀桥城', null, null, '钟雅迪', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1277', '97', '中国农业银行', '江苏如皋中山东路支行', '朱长玉', '320622195204238271', '江苏省', '南通市', null, null, '朱长玉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1278', '97', '中国农业银行', '无锡市分行安镇支行', '浦慧华', '6228480431662179917', '江苏省', '无锡市', null, null, '浦慧华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1279', '97', '中国建设银行', '中国建设银行江苏省南通市青年中路分理处', '孙亮亮', '6217001270014547998', '江苏省', '南通市', null, null, '孙亮亮', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1280', '97', '中国建设银行', '长沙市青山支行', '向本闯', '6230942920000983954', '湖南省', '长沙市', null, null, '向本闯', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1281', '97', '中国邮政储蓄银行', '怀化市沅陵县马底驿支行', '向成刚', '6217995670004759966', '怀化市', '怀化市', null, null, '向成刚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1282', '97', '中国工商银行', '上海市虹口区四川北路山阴路支行', '刘钰', '6212261001037101323', '上海市', '上海市', null, null, '刘钰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1283', '97', '中国农业银行', '新疆五家渠市中心支行', '王红新', '6228450898056626271', '新疆', '新疆', null, null, '王红新', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1284', '97', '中国农业银行', '江苏南通启东支行', '陆建英', '6228480425603192773', '江苏省', '南通市', null, null, '陆建英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1285', '97', '中国工商银行', '中国工商银行江苏省南通市如皋城中支行', '曹月健', '6215581111007394026', '江苏省', '南通市', null, null, '曹月健', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1286', '97', '中国银行', '中国银行临汾分行洪洞支行', '朱红荣', '4563518103003229374', '临汾', '临汾', null, null, '朱红荣', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1287', '97', '中国工商银行', '中国工商银行江苏省南通市如皋支行', '葛云霞', '6215581111007510605', '江苏省', '南通市', null, null, '葛云霞', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1288', '97', '中国建设银行', '上海市番禺路支行', '施黄健', '6236681210000291190', '上海市', '上海市', null, null, '施黄健', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1289', '97', '中国建设银行', '江苏南通启东汇龙南苑路支行', '王卫菊', '6217001270017492325', '江苏省', '南通市', null, null, '王卫菊', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1290', '97', '中国农业银行', '中国农业银行石河子市钟家庄支行', '徐琳', '6228483378054233777', '新疆省', '石河子市', null, null, '徐琳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1291', '97', '中国建设银行', '福州市仓山分行', '高强', '6217001820001703150', '福州市', '福州市', null, null, '高强', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1292', '97', '招商银行', '江苏省南通市港闸区高迪支行', '朱顾阳', '6214835133078269', '江苏省', '南通市', null, null, '朱顾阳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1293', '97', '中国农业银行', '江苏省太仓板桥支行', '盛露英', '6228230405087989160', '江苏省', '太仓市', null, null, '盛露英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1294', '97', '中国民生银行', '江苏南通启东支行', '董勇', '6216914900058875', '江苏省', '南通市', null, null, '董勇', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1295', '97', '中国邮政储蓄银行', '荆门市', '潘茂亮', '6217995200254583369', '荆门市', '荆门市', null, null, '潘茂亮', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1296', '97', '中国工商银行', '临汾分行洪洞支行', '崔世伟', '6212260510006159923', '临汾', '临汾', null, null, '崔世伟', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1297', '97', '中国农业银行', '上海市分行华漕支行', '陈进海', '6228480038263068272', '上海市', '上海市', null, null, '陈进海', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1298', '97', '中国农业银行', '福州市平潭县', '郭静静', '6230520060041190374', '福州市平潭县', '福州市平潭县', null, null, '郭静静', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1299', '97', '中国农业银行', '长兴雉城支行', '韦建德', '6228480358377580875', '长兴雉城', '长兴雉城', null, null, '韦建德', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1300', '97', '中国农业银行', '江苏省南通市港闸区天生港分行', '李东莉', '6228480424297573513', '江苏省', '南通市', null, null, '李东莉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1301', '97', '招商银行', '江苏省如皋市支行', '吴晓宏', '6214835131691667', '江苏省', '南通市', null, null, '吴晓宏', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1302', '97', '中国工商银行', '南通市人民路支行', '黄宇新', '6222081111001334037', '江苏省', '南通市', null, null, '黄宇新', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1303', '97', '中国农业银行', '江苏省南通市港闸区天生港支行', '葛淑玉', '6228480425784025172', '江苏省', '南通市', null, null, '葛淑玉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1304', '97', '中国工商银行', '工商银行浙江省宁波市宁海六合支行', '林益辉', '6222083901004344837', '浙江省', '宁波市', null, null, '林益辉', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1305', '97', '中国建设银行', '江苏省南通分行', '孙小华', '6227001277510899715', '江苏省', '南通', null, null, '孙小华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1306', '97', '中国工商银行', '中国工商银行江苏省南通市如皋支行', '张云红', '6222001111100880895', '江苏省', '南通市', null, null, '张云红', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1307', '97', '中国建设银行', '江苏省如皋市通扬分理处', '谢梦露', '6217001270005144813', '江苏省', '南通市', null, null, '谢梦露', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1308', '97', '中国建设银行', '临汾分行龙信支行', '王宁', '6217000350001169286', '临汾', '临汾', null, null, '王宁', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1309', '97', '中国农业银行', '山东济南章丘绣江分理处', '马素东', '6228480250258788513', '山东省', '济南', null, null, '马素东', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1310', '97', '中国工商银行', '石河子市百大城支行', '武子文', '6212263016001047391', '石河子市', '石河子市', null, null, '武子文', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1311', '97', '中国邮政储蓄银行', '无锡市分行安镇支行', '朱明贤', '6217973000002784780', '江苏省', '南通市', null, null, '朱明贤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1312', '97', '中国建设银行', '江苏无锡查桥', '胡义婷', '6217001240004359647', '江苏省', '无锡市', null, null, '胡义婷', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1313', '97', '中国建设银行', '石河子市分行营业室', '武建明', '4340624630019451', '新疆省', '石河子市', null, null, '武建明', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1314', '97', '中国银行', '南通市南通分行', '徐秋月', '6217876100003373720', '江苏省', '南通市', null, null, '徐秋月', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1315', '97', '中国农业银行', '中国农业银行浙江省宁波市西河支行', '吴建发', '6228480316016687162', '浙江省', '宁波市', null, null, '吴建发', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1316', '97', '中国工商银行', '江苏省太仓市支行营业室', '陆菊芳', '6212261102005889970', '江苏省', '太仓市', null, null, '陆菊芳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1317', '97', '中国建设银行', '重庆市红锦支行', '穆冬梅', '6217003760108985649', '重庆市', '重庆市', null, null, '穆冬梅', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1318', '97', '中国农业银行', '临汾市建设路支行', '冯晓丽', '6228481298196455074', '临汾市', '临汾市', null, null, '冯晓丽', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1320', '97', '中国农业银行', '江苏南通启东支行', '陈新新', '6228480429393430278', '江苏省', '南通市', null, null, '陈新新', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1321', '97', '中国建设银行', '洪洞县支行', '崔永华', '6217000350004484013', '洪洞县', '洪洞县', null, null, '崔永华', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1322', '97', '中国工商银行', '尧都区平阳支行', '冯云红', '6222080510000468954', '尧都区', '尧都区', null, null, '冯云红', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1323', '97', '中国工商银行', '南通启东城西支行', '陆佳琳', '6215581111005445176', '江苏省', '南通市', null, null, '陆佳琳', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1324', '97', '中国工商银行', '江苏省苏州市太仓市支行', '顾振清', '6212261102002286766', '江苏省', '苏州市', null, null, '顾振清', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1325', '97', '中国建设银行', '建设银行洪洞县支行', '陈英', '6214660350006110', '洪洞县', '洪洞县', null, null, '陈英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1326', '97', '中国工商银行', '无锡市分行后宅支行', '陈海利', '6217231103001015293', '江苏省', '无锡市', null, null, '陈海利', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1327', '97', '中国银行', '启东支行营业部', '陆冬林', '6217856100034703709', '江苏省', '南通市', null, null, '陆冬林', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1328', '97', '中国工商银行', '宁波市分行营业部', '杨林和', '6215593901002986115', '浙江省', '宁波市', null, null, '杨林和', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1329', '97', '中国工商银行', '上海市虹口区四川北路山阴路支行', '刘钰', '6212261001037101323', '上海市', '上海市', null, null, '刘钰', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1358', '131', '中国农业银行', '温县支行', '杨森', '6228482379190418570', '河南', '温县', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2029', '97', '中国工商银行', '河北邢台桥东支行', '于召安', '6222030406001839833', '河北', '邢台', null, null, '于召安', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2030', '94', '招商银行', '龙湖三千支行', '李佩珂', '6214850280510931', '四川', '成都', null, null, '测试', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2031', '140', '中国建设银行', '武汉航空路支行', '周艳平', '6217002870077355947', '湖北省', '武汉市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2033', '94', '中国农业银行', '四川省宜宾市长宁县支行', '李佩珂', '6228452468056050274', '四川省', '宜宾市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2034', '97', '中国银行', '江苏省如皋市西皋支行', '张冬生', '6217906100009399335', '江苏省', '南通市', null, null, '张冬生', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2035', '97', '上海浦东发展银行', '江苏南通', '吴亚基', '6217952300001326', '江苏省', '南通市', null, null, '吴亚基', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2036', '97', '中国农业银行', '启东支行', '高金花', '6228480429076962373', '江苏省', '南通市', null, null, '高金花', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2037', '97', '上海浦东发展银行', '江苏省南通市', '张建', '6225212301354541', '江苏省', '南通市', null, null, '张建', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2038', '97', '中信银行', '中信银行海门支行', '崔兰琴', '6217680500429621', '江苏省', '南通市', null, null, '崔兰琴', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2039', '97', '中国工商银行', '江苏省南通市', '王美云', '6222081111005196986', '江苏省', '南通市', null, null, '王美云', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2040', '116', '中国工商银行', '兴安乌兰浩特乌兰大街支行', '明锁', '6215590608003626409', '内蒙古', '兴安盟', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1373', '131', '招商银行', '郑州市金水路支行', '陈化轶', '6214833804404872', '河南省', '郑州市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('1527', '123', '中国农业银行', '平顶山分行', '薛小孩', '6228482069521287071', '河南', '平顶山', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2047', '141', '中国建设银行', '苏州市兴元分理处', '唐振', '6227002001060057121', '江苏省', '苏州市', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2050', '97', '中国农业银行', '江苏省如皋市中山路支行', '陆新莲', '6228450428032196676', '江苏省', '南通市', null, null, '陆新莲', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2049', '97', '中国建设银行', '无锡支行', '周文妹', '6217001240019601207', '江苏', '无锡', null, null, '周文妹', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2051', '97', '中国农业银行', '江苏省无锡市', '陈明英', '6228480434587945610', '江苏省', '无锡市', null, null, '陈明英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2052', '97', '中国工商银行', '重庆南岸大石路分理处', '贾慧敏', '6222023100038369208', '重庆市', '重庆市', null, null, '贾慧敏', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2053', '44', '中国工商银行', '中国工商银行', '姜华', '6222020704007588046', '辽宁', '沈阳', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('2054', '97', '中国工商银行', '中国工商银行艮山支行', '林功勋', '6222081202008371377', '浙江省', '杭州市', null, null, '林功勋', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2055', '97', '交通银行', '苏州市昆山市开发区支行', '饶荐诒', '6222620140011068770', '江苏省', '苏州市', null, null, '饶荐诒', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2056', '97', '中国农业银行', '江苏省昆山市周市支行', '陈瑞雪', '6228480400772277713', '江苏省', '昆山市', null, null, '陈瑞雪', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2057', '97', '中国建设银行', '江苏省南通市', '朱旭颖', '6217001270018457335', '江苏省', '南通市', null, null, '朱旭颖', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2058', '97', '中国农业银行', '安镇支行', '谢永新', '6228480435085561778', '江苏省', '无锡市', null, null, '谢永新', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2059', '97', '中国农业银行', '睢宁', '张秀明', '6228410454539665079', '江苏', '徐州', null, null, '张秀明*', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2060', '97', '中国工商银行', '安镇', '陈志英', '6222021103021287579', '江苏', '无锡', null, null, '陈志英', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2061', '97', '中国工商银行', '启东', '张亚芳', '6215581111004285490', '江苏', '南通', null, null, '张亚芳*', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2062', '97', '招商银行', '江苏省南通市分行', '许䶮', '6214835132615996', '江苏省', '南通市', null, null, '许䶮', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2063', '97', '交通银行', '江苏省南通市', '龚晓婷', '6222603100001383408', '江苏省', '南通市', null, null, '龚晓婷', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2064', '97', '中国农业银行', '睢宁', '张燕', '6230520450062211771', '江苏', '徐州', null, null, '张燕*', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2065', '127', '中国农业银行', '', '李开阳', '6230520070007407472', '', '', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('2066', '128', '中国工商银行', '焦作工商银行', '关颖', '6222023400012570338', '河南省', '焦作市', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('2041', '97', '交通银行', '江苏省无锡市', '吕芯妮', '6222620150001411280', '江苏省', '无锡市', null, null, '吕芯妮', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2042', '97', '中国农业银行', '安镇支行', '何钇宏', '6230520430019365870', '江苏省', '无锡市', null, null, '何钇宏', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2043', '97', '上海银行', '上海市嘉定区丰庄西路支行', '程家廷', '6222620110038044559', '上海市', '上海市', null, null, '程家廷', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2044', '97', '中国农业银行', '青年路支行', '朱海彬', '6228480425802977776', '江苏省', '南通市', null, null, '朱海彬', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2045', '97', '中国工商银行', '华侨支行', '秦忠', '6222081111005049219', '江苏省', '南通市', null, null, '秦忠', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2046', '97', '中国邮政储蓄银行', '启东支行', '顾沁卓', '6217993000087352202', '江苏省', '南通市', null, null, '顾沁卓', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2067', '97', '中国银行', '南通市海安支行', '陈永凤', '6217856100054773830', '江苏省', '南通市', null, null, '陈永凤', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2068', '97', '中国农业银行', '悦来支行', '袁海民', '6228480423665092213', '江苏省', '南通市', null, null, '袁海民', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2069', '97', '中国工商银行', '工商银行深圳分行华南城支行', '沈独', '6212264000005212200', '广东省', '深圳市', null, null, '沈独', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2070', '97', '中国工商银行', '江苏省南通市', '施超', '6217231111005902259', '江苏省', '南通市', null, null, '施超', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2071', '97', '中国农业银行', '太仓市分行城北支行', '杨帮平', '6228480405805676476', '江苏省', '南通市', null, null, '杨帮平', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2072', '97', '中国工商银行', '临汾', '段淼鹏', '6222030510000739603', '山西', '临汾', null, null, '段淼鹏*', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2073', '97', '中国邮政储蓄银行', '运城市学府营业所', '姜亚妮', '6217991810002732409', '运城市', '运城市', null, null, '姜亚妮', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2074', '97', '中国工商银行', '刘桥支行', '任泽华', '6217231111006500607', '江苏', '南通', null, null, '任泽华*', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2078', '130', '中国工商银行', '佛山南海时代支行', '邓力', '6222032013002220795', '广东', '佛山', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('2076', '142', '中国农业银行', '桐梓坡', '李建峰', '6230521090026581973', '湖南', '长沙', null, null, '建', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('2077', '142', '中国建设银行', '楠竹山支行', '王尚', '6236682930003083943', '湖南', '湘潭', null, null, '尚', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2079', '84', '上海银行', '上海银行', '刘洋洋', '620522001013670825', '上海', '上海', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('1917', '134', '交通银行', '武汉分行', '王威', '6222600610015448289', '湖北省', '武汉市', null, null, '', '1', '0');
INSERT INTO `pay_bankcard` VALUES ('2027', '108', '中国建设银行', '中国建设银行广州登峰支行', '徐庆开', '6217003320013073567', '广州', '广州', null, null, '', '0', '0');
INSERT INTO `pay_bankcard` VALUES ('2028', '108', '中国农业银行', '农业银行', '覃树检', '6228480831797547211', '', '', null, null, '', '0', '0');

-- ----------------------------
-- Table structure for `pay_blockedlog`
-- ----------------------------
DROP TABLE IF EXISTS `pay_blockedlog`;
CREATE TABLE `pay_blockedlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) NOT NULL COMMENT '订单号',
  `userid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户编号',
  `amount` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '冻结金额',
  `thawtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '解冻时间',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '商户支付通道',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1 解冻 0 冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资金冻结待解冻记录';

-- ----------------------------
-- Records of pay_blockedlog
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_browserecord`
-- ----------------------------
DROP TABLE IF EXISTS `pay_browserecord`;
CREATE TABLE `pay_browserecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `articleid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_browserecord
-- ----------------------------
INSERT INTO `pay_browserecord` VALUES ('32', '27', '145', '2018-09-28 14:55:47');

-- ----------------------------
-- Table structure for `pay_category`
-- ----------------------------
DROP TABLE IF EXISTS `pay_category`;
CREATE TABLE `pay_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1开启 0关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文章栏目';

-- ----------------------------
-- Records of pay_category
-- ----------------------------
INSERT INTO `pay_category` VALUES ('1', '最新资讯', '0', '1');
INSERT INTO `pay_category` VALUES ('2', '公司新闻', '0', '1');
INSERT INTO `pay_category` VALUES ('3', '公告通知', '0', '1');
INSERT INTO `pay_category` VALUES ('4', '站内公告', '3', '1');
INSERT INTO `pay_category` VALUES ('5', '公司新闻', '3', '1');

-- ----------------------------
-- Table structure for `pay_channel`
-- ----------------------------
DROP TABLE IF EXISTS `pay_channel`;
CREATE TABLE `pay_channel` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '供应商通道ID',
  `code` varchar(200) DEFAULT NULL COMMENT '供应商通道英文编码',
  `title` varchar(200) DEFAULT NULL COMMENT '供应商通道名称',
  `mch_id` varchar(100) DEFAULT NULL COMMENT '商户号',
  `signkey` varchar(500) DEFAULT NULL COMMENT '签文密钥',
  `appid` varchar(100) DEFAULT NULL COMMENT '应用APPID',
  `appsecret` varchar(100) DEFAULT NULL COMMENT '安全密钥',
  `gateway` varchar(300) DEFAULT NULL COMMENT '网关地址',
  `pagereturn` varchar(255) DEFAULT NULL COMMENT '页面跳转网址',
  `serverreturn` varchar(255) DEFAULT NULL COMMENT '服务器通知网址',
  `defaultrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '下家费率',
  `fengding` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '封顶手续费',
  `rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '银行费率',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上次更改时间',
  `unlockdomain` varchar(100) NOT NULL COMMENT '防封域名',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1开启 0关闭',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '渠道类型: 1 微信扫码 2 微信H5 3 支付宝扫码 4 支付宝H5 5网银跳转 6网银直连 7百度钱包 8 QQ钱包 9 京东钱包',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `paying_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当天交易金额',
  `all_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当天上游可交易量',
  `last_paying_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后交易时间',
  `min_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔最小交易额',
  `max_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔最大交易额',
  `control_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '风控状态:0否1是',
  `offline_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '通道上线状态:0已下线，1上线',
  `t0defaultrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT 'T0运营费率',
  `t0fengding` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT 'T0封顶手续费',
  `t0rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT 'T0成本费率',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COMMENT='供应商列表';

-- ----------------------------
-- Records of pay_channel
-- ----------------------------
INSERT INTO `pay_channel` VALUES ('199', 'WxSm', '微信扫码支付(官方)', '', '', '', '', '', '', '', '0.0200', '0.0900', '0.0090', '1531542539', '', '0', '1', '0', '0', '0.00', '0.00', '0', '1.00', '3000.00', '1', '1', '0.0200', '0.0000', '0.0090');
INSERT INTO `pay_channel` VALUES ('200', 'WxGzh', '微信H5', '', '', 'wxf33668d58442ff6e', '', '', '', '', '0.0220', '0.0500', '0.0150', '1502378687', '', '0', '2', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('201', 'Aliscan', '支付宝扫码', '', '', '', '', '', '', '', '0.0320', '0.0500', '0.0250', '1503857975', '', '0', '3', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('202', 'Aliwap', '支付宝H5', '', '', '', '', '', '', '', '0.0420', '0.0500', '0.0350', '1503857966', '', '0', '4', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('203', 'QQSCAN', 'QQ扫码', '', '', '', '', '', '', '', '0.0220', '0.0500', '0.0150', '1503280494', '', '0', '8', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('220', 'YdAliH5', 'YD(支付宝H5)', '', '', '', '', 'http://pay.73zf.com/Pay_Index.html', '', '', '0.0450', '0.0600', '0.0380', '1521547455', '', '0', '4', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('208', 'YcfWxWap', '微信wap(畅付)', '', '', '', '', 'http://pay.changfpay.com/pay.aspx', '', '', '0.0320', '0.0500', '0.0250', '1522936313', '', '0', '2', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('209', 'YcfSm', '微信扫码(畅付)', '', '', '', '', 'http://pay.changfpay.com/pay.aspx', '', '', '0.0220', '0.0500', '0.0150', '1520654879', '', '0', '1', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('210', 'YcfQQWap', 'QQ-wap(畅付)', '', '', '', '', 'http://pay.changfpay.com/pay.aspx', '', '', '0.0320', '0.0500', '0.0250', '1522936289', '', '0', '10', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('211', 'YcfQQSm', 'QQ扫码(畅付)', '', '', '', '', 'http://pay.changfpay.com/pay.aspx', '', '', '0.0220', '0.0500', '0.0150', '1520654847', '', '0', '8', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('212', 'YcfAliSm', '支付宝扫码(畅付)', '', '', '', '', 'http://pay.changfpay.com/pay.aspx', '', '', '0.0220', '0.0500', '0.0150', '1520654839', '', '0', '3', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('213', 'YcfAliWap', '支付宝wap(畅付)', '', '', '', '', 'http://pay.changfpay.com/pay.aspx', '', '', '0.0400', '0.0500', '0.0350', '1522936275', '', '0', '4', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0400', '0.0000', '0.0350');
INSERT INTO `pay_channel` VALUES ('214', 'AnsBank', '网银(爱农)', '', '', '', '', 'http://gpay.chinagpay.com/bas/FrontTrans', '', '', '0.0060', '0.0100', '0.0030', '1520654902', '', '1', '5', '0', '0', '0.00', '0.00', '0', '1.00', '20000.00', '1', '1', '0.0060', '0.0000', '0.0030');
INSERT INTO `pay_channel` VALUES ('215', 'AnsYl', '银联快捷(爱农)', '', '', '', '', 'http://gpay.chinagpay.com/bas/FrontTrans', '', '', '0.0100', '0.0500', '0.0060', '1520654909', '', '0', '12', '0', '0', '0.00', '0.00', '0', '25.00', '5000.00', '1', '1', '0.0100', '0.0000', '0.0060');
INSERT INTO `pay_channel` VALUES ('216', 'DwjBank', '网银(800001)', '', '', '', '', 'http://103.47.137.51:8092/posm/gwpayreq.tran?olpdat=', '', '', '0.0070', '0.0100', '0.0030', '1520511968', '', '0', '5', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('217', 'DwjYl', '网银快捷(800001)', '', '', '', '', 'http://103.47.137.51:8092/posm/fastpayreq.tran?olpdat=', '', '', '0.0150', '0.0500', '0.0060', '1520483088', '', '0', '12', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('219', 'DwjQQH5', 'QQ-wap(800001)', '', '', '', '', 'http://103.47.137.51:8092/posm/qrpayreq.tran?olpdat=', '', '', '0.0150', '0.0500', '0.0080', '1522936299', '', '0', '10', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('221', 'YdYmf', 'YD(线上一码付)', '', '', '', '', 'http://pay.73zf.com/Pay_Index.html', '', '', '0.0250', '0.0500', '0.0180', '1521547444', '', '0', '13', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('222', 'DwjJdH5', '京东(800001)', '', '', '', '', 'http://103.47.137.51:8092/posm/qrpayreq.tran?olpdat=', '', '', '0.0150', '0.0500', '0.0080', '1521770280', '', '0', '9', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('223', 'DwjYlSm', '银联扫码(80001)', '', '', '', '', 'http://103.47.137.51:8092/posm/qrpayreq.tran?olpdat=', '', '', '0.0120', '0.0500', '0.0085', '1523705311', '', '0', '14', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('224', 'JuHePay', '支付宝Wap(友付)', '', '', '', '', 'http://www.yzyoufu666.cn/Pay_Index.html', '', '', '0.0350', '0.0500', '0.0300', '1524213136', '', '0', '4', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('225', 'JuHePay', '友付(支付宝扫码)', '', '', '', '', 'http://www.yzyoufu666.cn/Pay_Index.html', '', '', '0.0250', '0.0000', '0.0200', '1524901722', '', '0', '3', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('226', 'JuHePay', '友付(微信Wap)', '', '', '', '', 'http://www.yzyoufu666.cn/Pay_Index.html', '', '', '0.0000', '0.0000', '0.0000', '1524901413', '', '0', '2', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('227', 'JuHePay', '友付(微信扫码)', '', '', '', '', '', '', '', '0.0000', '0.0000', '0.0000', '1524901482', '', '0', '1', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('228', 'JuHePay', '友付(qq扫码)', '', '', '', '', 'http://www.yzyoufu666.cn/Pay_Index.html', '', '', '0.0000', '0.0000', '0.0000', '1524901465', '', '0', '8', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('229', 'JuHePay', '友付(qqH5)', '', '', '', '', 'http://www.yzyoufu666.cn/Pay_Index.html', '', '', '0.0000', '0.0000', '0.0000', '1524901442', '', '0', '10', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('230', 'ShanDeWxscan', '衫德-微信扫码', '', '', '', '', 'https://cashier.sandpay.com.cn/qr/api/order/create', '', '', '0.0150', '0.0000', '0.0030', '1526351782', '', '0', '1', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('231', 'ShanDeBank', '衫德-网银支付', '', '', '', '', 'https://cashier.sandpay.com.cn/gateway/api/order/pay', '', '', '0.0060', '0.0000', '0.0025', '1526365664', '', '1', '5', '0', '0', '0.00', '0.00', '0', '1.00', '20000.00', '1', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('232', 'ShanDeBankScan', '衫德-网银扫码', '', '', '', '', 'https://cashier.sandpay.com.cn/qr/api/order/create', '', '', '0.0150', '0.0000', '0.0090', '1526370202', '', '1', '14', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('233', 'ShanKjH5', '衫德-快捷', '', '', '', '', 'https://cashier.sandpay.com.cn/gateway/api/order/pay', '', '', '0.0120', '0.0000', '0.0065', '1534752834', '', '0', '12', '0', '0', '0.00', '0.00', '0', '10.00', '20000.00', '1', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('234', 'YaoQianShuWxH5', 'YQS(微信H5)', '', '', '', '', '', '', '', '0.0300', '0.0000', '0.0150', '1527154201', '', '0', '2', '0', '0', '0.00', '0.00', '0', '1.00', '5000.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('235', 'ShanKj', '杉德-绑卡快捷', '', '', '', '', '', '', '', '0.0120', '0.0000', '0.0055', '1528445332', '', '0', '12', '0', '0', '0.00', '0.00', '0', '1.00', '4800.00', '1', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('236', 'WftAliSm', 'WFT支付宝扫码(兴业)', '', '', '', '', 'https://pay.swiftpass.cn/pay/gateway', '', '', '0.0150', '0.0000', '0.0060', '1529485669', '', '0', '3', '8', '23', '0.00', '0.00', '1529632198', '1.00', '2000.00', '1', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('237', 'WftWxSmRsa', 'WFT微信扫码(中信)', '', '', '', '', 'https://pay.swiftpass.cn/pay/gateway', '', '', '0.0200', '0.0000', '0.0060', '1529657716', '', '0', '1', '8', '21', '0.00', '0.00', '0', '1.00', '3000.00', '1', '1', '0.0200', '0.0000', '0.0060');
INSERT INTO `pay_channel` VALUES ('238', 'WftAliSmRsa', 'WFT支付宝扫码(中信)', '', '', '', '', 'https://pay.swiftpass.cn/pay/gateway', '', '', '0.0200', '0.0000', '0.0060', '1529657452', '', '1', '3', '8', '21', '0.00', '0.00', '0', '1.00', '3000.00', '1', '1', '0.0200', '0.0000', '0.0060');
INSERT INTO `pay_channel` VALUES ('239', 'WftQQSmRsa', 'WFTQQ扫码(中信)', '', '', '', '', 'https://pay.swiftpass.cn/pay/gateway', '', '', '0.0200', '0.0000', '0.0060', '1529657707', '', '0', '8', '8', '21', '0.00', '0.00', '0', '1.00', '3000.00', '1', '1', '0.0200', '0.0000', '0.0060');
INSERT INTO `pay_channel` VALUES ('240', 'WftQQSm', 'WFTQQ扫码（平安）', '', '', '', '', 'https://brappay.pingan.com.cn/pay/gateway', '', '', '0.0000', '0.0000', '0.0000', '1529985011', '', '0', '8', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('241', 'WftAliSm', 'WFT支付宝扫码（平安）', '', '', '', '', 'https://brappay.pingan.com.cn/pay/gateway', '', '', '0.0000', '0.0000', '0.0000', '1529985002', '', '0', '3', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('242', 'WftWxSm', 'WFT微信扫码（平安）', '', '', '', '', 'https://brappay.pingan.com.cn/pay/gateway', '', '', '0.0000', '0.0000', '0.0000', '1529984997', '', '0', '1', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('243', 'WftJdSm', 'WFT京东扫码（平安）', '', '', '', '', 'https://brappay.pingan.com.cn/pay/gateway', '', '', '0.0000', '0.0000', '0.0000', '1529984989', '', '0', '9', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('244', 'VzfWx', '微支付微信扫码', '', '', '', '', 'http://www.beizijinfu.com/beizi/unifiedOrder.htm', 'http://pay.kadiya66.com/Pay_VzfWx_callbackurl.html', 'http://pay.kadiya66.com/Pay_VzfWx_notifyurl.html', '0.0150', '0.0500', '0.0060', '1531916001', '', '0', '1', '0', '0', '0.00', '0.00', '0', '1.00', '3000.00', '1', '1', '0.0150', '0.0500', '0.0060');
INSERT INTO `pay_channel` VALUES ('245', 'VzfAli', '微支付支付宝扫码', '', '', '', '', 'http://www.beizijinfu.com/beizi/unifiedOrder.htm', 'http://pay.kadiya66.com/Pay_VzfAli_callbackurl.html', 'http://pay.kadiya66.com/Pay_VzfAli_notifyurl.html', '0.0150', '0.0500', '0.0060', '1531915972', '', '0', '3', '0', '0', '0.00', '0.00', '0', '1.00', '3000.00', '1', '1', '0.0150', '0.0500', '0.0060');
INSERT INTO `pay_channel` VALUES ('246', 'ShanUpsdk', '衫德-银联SDK', '', '', '', '', 'https://cashier.sandpay.com.cn/gateway/api/order/pay', '', '', '0.0120', '0.0000', '0.0065', '1534765883', '', '0', '12', '0', '0', '0.00', '0.00', '0', '0.00', '0.00', '0', '1', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_channel` VALUES ('247', 'RzfAliH5', 'RZF(支付宝H5)', '', '', '', '', '', '', '', '0.0300', '0.0500', '0.0220', '1534766213', '', '0', '4', '8', '21', '0.00', '0.00', '0', '1.00', '3000.00', '1', '1', '0.0300', '0.0500', '0.0220');
INSERT INTO `pay_channel` VALUES ('248', 'RzfAliSm', 'RZF(支付宝扫码)', '', '', '', '', '', '', '', '0.0300', '0.0500', '0.0220', '1534775244', '', '0', '3', '8', '21', '0.00', '0.00', '0', '1.00', '3000.00', '1', '1', '0.0300', '0.0500', '0.0220');
INSERT INTO `pay_channel` VALUES ('249', 'LmAliH5', 'LM(支付宝H5)', '', '', '', '', '', '', '', '0.0280', '0.0500', '0.0200', '1535460701', '', '1', '4', '0', '0', '0.00', '0.00', '0', '10.00', '10000.00', '1', '1', '0.0280', '0.0500', '0.0200');
INSERT INTO `pay_channel` VALUES ('250', 'LmWxH5', 'LM(微信H5)', '', '', '', '', '', '', '', '0.0280', '0.0500', '0.0200', '1535460689', '', '0', '2', '8', '15', '0.00', '0.00', '0', '10.00', '10000.00', '1', '1', '0.0280', '0.0500', '0.0200');

-- ----------------------------
-- Table structure for `pay_channel_account`
-- ----------------------------
DROP TABLE IF EXISTS `pay_channel_account`;
CREATE TABLE `pay_channel_account` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '供应商通道账号ID',
  `channel_id` smallint(6) unsigned NOT NULL COMMENT '通道id',
  `mch_id` varchar(100) DEFAULT NULL COMMENT '商户号',
  `signkey` varchar(500) DEFAULT NULL COMMENT '签文密钥',
  `appid` varchar(100) DEFAULT NULL COMMENT '应用APPID',
  `appsecret` varchar(2500) DEFAULT NULL COMMENT '安全密钥',
  `defaultrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '下家费率',
  `fengding` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '封顶手续费',
  `rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '银行费率',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上次更改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1开启 0关闭',
  `title` varchar(100) DEFAULT NULL COMMENT '账户标题',
  `weight` tinyint(2) DEFAULT NULL COMMENT '轮询权重',
  `custom_rate` tinyint(1) DEFAULT NULL COMMENT '是否自定义费率',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始交易时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `last_paying_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一笔交易时间',
  `paying_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当天交易金额',
  `all_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单日可交易金额',
  `max_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔交易最大金额',
  `min_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔交易最小金额',
  `offline_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上线状态-1上线,0下线',
  `control_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '风控状态-0不风控,1风控中',
  `is_defined` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否自定义:1-是,0-否',
  `unit_frist_paying_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单位时间第一笔交易时间',
  `unit_paying_number` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '单时间交易笔数',
  `unit_paying_amount` decimal(11,0) unsigned NOT NULL DEFAULT '0' COMMENT '单位时间交易金额',
  `unit_interval` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '单位时间数值',
  `time_unit` char(1) NOT NULL DEFAULT 's' COMMENT '限制时间单位',
  `unit_number` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '单位时间次数',
  `unit_all_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位时间金额',
  `t0defaultrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT 'T0运营费率',
  `t0fengding` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT 'T0封顶手续费',
  `t0rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT 'T0成本费率',
  `unlockdomain` varchar(255) NOT NULL COMMENT '防封域名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=299 DEFAULT CHARSET=utf8 COMMENT='供应商账号列表';

-- ----------------------------
-- Records of pay_channel_account
-- ----------------------------
INSERT INTO `pay_channel_account` VALUES ('218', '199', '1410327902', 'guangdongkeyiwangluo123456789020', 'wxb6aa39f8d7098211', '1508770371', '0.0400', '0.0900', '0.0000', '1531905261', '0', '1508770371', '1', '0', '8', '21', '1532679086', '0.00', '75000.00', '3000.00', '1.00', '1', '1', '1', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('219', '200', '', '', 'wxf33668d58442ff6e', '', '0.0000', '0.0000', '0.0000', '1513408073', '1', '微信H5', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('220', '201', '', '', '', '', '0.0000', '0.0000', '0.0000', '1513408073', '1', '支付宝扫码', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('221', '202', '', '', '', '', '0.0000', '0.0000', '0.0000', '1513408073', '1', '支付宝H5', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('222', '203', '', '', '', '', '0.0050', '0.0000', '0.0000', '1513408073', '1', 'QQ扫码', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('240', '221', '10658', 'vktvijysk7jmwbwjwi7v06ezky864idy', '', '', '0.0000', '0.0000', '0.0000', '1521537984', '1', '10658', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('224', '211', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '0.0000', '0.0000', '0.0000', '1522145458', '1', '乐百付8060', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('225', '210', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '0.0000', '0.0000', '0.0000', '1522202285', '1', '乐百付8060', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('226', '209', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '0.0000', '0.0000', '0.0000', '1522202398', '1', '乐百付8060', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('227', '208', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '0.0000', '0.0000', '0.0000', '1522202326', '1', '乐百付8060', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('228', '212', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '0.0000', '0.0000', '0.0000', '1522202214', '1', '乐百付8060', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('229', '213', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '0.0000', '0.0000', '0.0000', '1522202165', '1', '乐百付8060', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('230', '214', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '', '0.0000', '0.0000', '0.0000', '1532689218', '1', '承德向友', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', 'http://mall.103934.com');
INSERT INTO `pay_channel_account` VALUES ('231', '215', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '', '', '0.0000', '0.0000', '0.0000', '1532689720', '0', '承德向友', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', 'http://mall.103934.com');
INSERT INTO `pay_channel_account` VALUES ('232', '216', 'OLP800001000001', 'SwJw1FoE8C1EGA1JSNFxVFpVv', '800001', '', '0.0000', '0.0000', '0.0000', '1520476445', '1', 'OLP800001000001', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('233', '217', 'OLP800001000001', 'SwJw1FoE8C1EGA1JSNFxVFpVv', '800001', '', '0.0000', '0.0000', '0.0000', '1520479649', '1', 'OLP800001000001', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('237', '219', 'OLP800001000001', 'SwJw1FoE8C1EGA1JSNFxVFpVv', '800001', '', '0.0000', '0.0000', '0.0000', '1520827654', '1', 'OLP800001000001', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('239', '220', '10658', 'vktvijysk7jmwbwjwi7v06ezky864idy', '', '', '0.0000', '0.0000', '0.0000', '1521536152', '1', '10658', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('241', '222', 'OLP800001000001', 'SwJw1FoE8C1EGA1JSNFxVFpVv', '800001', '', '0.0000', '0.0000', '0.0000', '1521770016', '1', 'OLP800001000001', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('243', '213', '8089', 'babf5791c536ddb64d4de9382154834f', '', '', '0.0000', '0.0000', '0.0000', '1522202157', '0', '承德向友8089', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('244', '212', '8089', 'babf5791c536ddb64d4de9382154834f', '', '', '0.0000', '0.0000', '0.0000', '1522202198', '0', '承德向友8089', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('245', '211', '8089', 'babf5791c536ddb64d4de9382154834f', '', '', '0.0000', '0.0000', '0.0000', '1522202268', '0', '承德向友8089', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('246', '210', '8089', 'babf5791c536ddb64d4de9382154834f', '', '', '0.0000', '0.0000', '0.0000', '1522202305', '0', '承德向友8089', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('247', '208', '8089', 'babf5791c536ddb64d4de9382154834f', '', '', '0.0000', '0.0000', '0.0000', '1522202343', '0', '承德向友8089', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('248', '209', '8089', 'babf5791c536ddb64d4de9382154834f', '', '', '0.0000', '0.0000', '0.0000', '1522202469', '0', '承德向友8089', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('249', '223', 'OLP800001000001', 'SwJw1FoE8C1EGA1JSNFxVFpVv', '800001', '', '0.0000', '0.0000', '0.0000', '1523702892', '1', 'OLP800001000001', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('250', '224', '10009', 'kl8ww0k76uytpuilva4sznwghk0fxmq5', '904', '', '0.0000', '0.0000', '0.0000', '1524188853', '1', '10009', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('251', '225', '10009', 'kl8ww0k76uytpuilva4sznwghk0fxmq5', '903', '', '0.0000', '0.0000', '0.0000', '1524901332', '1', '10009', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('252', '226', '10009', 'kl8ww0k76uytpuilva4sznwghk0fxmq5', '901', '', '0.0000', '0.0000', '0.0000', '1524901514', '1', '10009', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('253', '227', '10009', 'kl8ww0k76uytpuilva4sznwghk0fxmq5', '902', '', '0.0000', '0.0000', '0.0000', '1524901531', '1', '10009', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('254', '228', '10009', 'kl8ww0k76uytpuilva4sznwghk0fxmq5', '908', '', '0.0000', '0.0000', '0.0000', '1524901557', '1', '10009', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('255', '229', '10009', 'kl8ww0k76uytpuilva4sznwghk0fxmq5', '905', '', '0.0000', '0.0000', '0.0000', '1524901577', '1', '10009', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('256', '230', '11760908', './cert/sandpay/sand.cer', './cert/sandpay/mid.pfx', 'lbf888', '0.0000', '0.0000', '0.0000', '1526350778', '0', '11760908', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('257', '231', '11760908', './cert/sandpay/sand.cer', './cert/sandpay/mid.pfx', 'lbf888|http://pay.lebaifupay.com', '0.0000', '0.0000', '0.0000', '1526349383', '0', '11760908', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('258', '232', '11760908', './cert/sandpay/sand.cer', './cert/sandpay/mid.pfx', 'lbf888', '0.0000', '0.0000', '0.0000', '1526351840', '0', '11760908', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('259', '233', '11760908', './cert/sandpay/sand.cer', './cert/sandpay/mid.pfx', 'lbf888', '0.0000', '0.0000', '0.0000', '1526366500', '0', '11760908', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('260', '234', '10000172', 'd36fg2b75cef75a5b6e6d5125gd7cba1', '', '', '0.0000', '0.0000', '0.0000', '1527153258', '1', '10000172', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('261', '233', '16974417', './cert/sandpay/sand.cer', './cert/sandpay/16974417.pfx', 'ug74u1', '0.0000', '0.0000', '0.0000', '1528356315', '0', '16974417', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('262', '232', '16974417', './cert/sandpay/sand.cer', './cert/sandpay/16974417.pfx', 'ug74u1', '0.0000', '0.0000', '0.0000', '1528356361', '0', '16974417', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('263', '231', '16974417', './cert/sandpay/sand.cer', './cert/sandpay/16974417.pfx', 'ug74u1', '0.0000', '0.0000', '0.0000', '1528356396', '0', '16974417', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('264', '230', '16974417', './cert/sandpay/sand.cer', './cert/sandpay/16974417.pfx', 'ug74u1', '0.0000', '0.0000', '0.0000', '1528356420', '1', '16974417', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('265', '235', '16974417', './cert/sandpay/sand.cer', './cert/sandpay/16974417.pfx', 'ug74u1', '0.0000', '0.0000', '0.0000', '1528444866', '1', '16974417', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('266', '236', '101500950230', '5731bc94e63d6ddd249625f26848a96d', '', '', '0.0000', '0.0000', '0.0000', '1529461128', '0', '兴业101500950230', '1', '0', '0', '0', '1529593217', '27500.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('267', '237', '102545570975', '', '', '', '0.0000', '0.0000', '0.0000', '1529480860', '0', '102545570975', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('268', '238', '102545570975', '', '', '', '0.0000', '0.0000', '0.0000', '1529480912', '0', '102545570975', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('269', '239', '102545570975', '', '', '', '0.0000', '0.0000', '0.0000', '1529480957', '0', '102545570975', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('270', '236', '101570996552', 'df3b12ad051c300926c51f81717a5927', '', '', '0.0000', '0.0000', '0.0000', '1529631907', '1', '兴业101570996552', '1', '0', '0', '0', '1529632198', '1.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('271', '240', '530520005627', 'fef09bcd7c44ac8bec473ff310e7690d', '', '', '0.0000', '0.0000', '0.0000', '1529658261', '1', '530520005627', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('272', '240', '530570005743', 'bec323cf4d8e4b256c2d9516a283d3b0', '', '', '0.0000', '0.0000', '0.0000', '1529659256', '1', '530570005743', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('273', '241', '530520005627', 'fef09bcd7c44ac8bec473ff310e7690d', '', '', '0.0000', '0.0000', '0.0000', '1529984537', '1', '530520005627', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('274', '241', '530570005743', 'bec323cf4d8e4b256c2d9516a283d3b0', '', '', '0.0000', '0.0000', '0.0000', '1529659433', '0', '530570005743', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('275', '242', '530520005627', 'fef09bcd7c44ac8bec473ff310e7690d', '', '', '0.0000', '0.0000', '0.0000', '1529659516', '0', '530520005627', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('276', '242', '530570005743', 'bec323cf4d8e4b256c2d9516a283d3b0', '', '', '0.0000', '0.0000', '0.0000', '1529659533', '1', '530570005743', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('277', '243', '530520005627', 'fef09bcd7c44ac8bec473ff310e7690d', '', '', '0.0000', '0.0000', '0.0000', '1529660567', '1', '530520005627', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('278', '243', '530570005743', 'bec323cf4d8e4b256c2d9516a283d3b0', '', '', '0.0000', '0.0000', '0.0000', '1529660582', '1', '530570005743', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('279', '237', '401500301984', '', '', '', '0.0000', '0.0000', '0.0000', '1531541249', '1', '401500301984', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('280', '238', '401500301984', '', '', '', '0.0000', '0.0000', '0.0000', '1531541262', '1', '401500301984', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('281', '239', '401500301984', '', '', '', '0.0000', '0.0000', '0.0000', '1531541274', '1', '401500301984', '1', '0', '8', '21', '0', '0.00', '0.00', '3000.00', '1.00', '1', '1', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('282', '244', '1017664299591790592', 'IGfMA0GCSqGSIb3DQEBAQUAA4GNADC', '1017664299591790594', '3484e8624330d5a1d53769145a8e27b7', '0.0000', '0.0000', '0.0000', '1531554717', '1', '微支付微信扫码', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('283', '245', '1017664299591790592', 'IGfMA0GCSqGSIb3DQEBAQUAA4GNADC', '1017664299591790594', '3484e8624330d5a1d53769145a8e27b7', '0.0000', '0.0000', '0.0000', '1531554912', '1', '微支付支付宝扫码', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('284', '199', '1410327902', 'guangdongkeyiwangluo123456789020', 'wxb6aa39f8d7098211', '1508774531', '0.0000', '0.0000', '0.0000', '1531905696', '0', '1508774531', '1', '0', '8', '21', '1532679272', '0.00', '75000.00', '3000.00', '1.00', '1', '1', '1', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('285', '199', '1410327902', 'guangdongkeyiwangluo123456789020', 'wxb6aa39f8d7098211', '1508776821', '0.0000', '0.0000', '0.0000', '1531905773', '0', '1508776821', '1', '0', '0', '0', '1532621887', '0.00', '75000.00', '3000.00', '1.00', '1', '1', '1', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('286', '199', '1410327902', 'guangdongkeyiwangluo123456789020', 'wxb6aa39f8d7098211', '1509488911', '0.0000', '0.0000', '0.0000', '1531905777', '0', '1509488911', '1', '0', '0', '0', '1532618529', '0.00', '75000.00', '3000.00', '1.00', '1', '1', '1', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('287', '215', '929010095025022', 'xMXKwZZfAPEnsG3ftMvteBK5w5YwSD6b', '', '', '0.0000', '0.0000', '0.0000', '1532689697', '1', '博宇商贸', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', 'http://mall.renyuanj.cn');
INSERT INTO `pay_channel_account` VALUES ('288', '214', '929010095025022', 'xMXKwZZfAPEnsG3ftMvteBK5w5YwSD6b', '', '', '0.0000', '0.0000', '0.0000', '1532689660', '0', '博宇商贸', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', 'http://mall.renyuanj.cn');
INSERT INTO `pay_channel_account` VALUES ('289', '239', '401520305590', '', '', '', '0.0000', '0.0000', '0.0000', '1533614145', '0', '401520305590', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('290', '238', '401520305590', '', '', '', '0.0000', '0.0000', '0.0000', '1533614164', '0', '401520305590', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('291', '233', '11260495', './cert/sandpay/11260495/sand.cer', './cert/sandpay/11260495/11260495.pfx', 'ug74u1', '0.0000', '0.0000', '0.0000', '1534592011', '1', '11260495', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('292', '232', '11260495', './cert/sandpay/11260495/sand.cer', './cert/sandpay/11260495/11260495.pfx', 'ug74u1', '0.0000', '0.0000', '0.0000', '1534592032', '1', '11260495', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('293', '231', '11260495', './cert/sandpay/11260495/sand.cer', './cert/sandpay/11260495/11260495.pfx', 'ug74u1', '0.0000', '0.0000', '0.0000', '1534592039', '1', '11260495', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('294', '246', '11260495', './cert/sandpay/11260495/sand.cer', './cert/sandpay/11260495/11260495.pfx', 'ug74u1', '0.0000', '0.0000', '0.0000', '1534765557', '1', '11260495', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('295', '247', '14008', 'gbo1fjuu066goonm0rhkf78fjmqiy3o3', '', '', '0.0000', '0.0000', '0.0000', '1534766239', '1', '14008', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('296', '248', '14008', 'gbo1fjuu066goonm0rhkf78fjmqiy3o3', '', '', '0.0000', '0.0000', '0.0000', '1534775266', '1', '14008', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('297', '249', '1000000060', '44aIZ6h8e8Z4iT19', '', '', '0.0000', '0.0000', '0.0000', '1535385077', '1', '1000000060', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');
INSERT INTO `pay_channel_account` VALUES ('298', '250', '1000000060', '44aIZ6h8e8Z4iT19', '', '', '0.0000', '0.0000', '0.0000', '1535385116', '1', '1000000060', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 's', '0', '0.00', '0.0000', '0.0000', '0.0000', '');

-- ----------------------------
-- Table structure for `pay_complaints_deposit`
-- ----------------------------
DROP TABLE IF EXISTS `pay_complaints_deposit`;
CREATE TABLE `pay_complaints_deposit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `pay_orderid` varchar(100) NOT NULL DEFAULT '0' COMMENT '系统订单号',
  `out_trade_id` varchar(50) NOT NULL DEFAULT '' COMMENT '下游订单号',
  `freeze_money` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '冻结保证金额',
  `unfreeze_time` int(11) NOT NULL DEFAULT '0' COMMENT '计划解冻时间',
  `real_unfreeze_time` int(11) NOT NULL DEFAULT '0' COMMENT '实际解冻时间',
  `is_pause` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否暂停解冻 0正常解冻 1暂停解冻',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '解冻状态 0未解冻 1已解冻',
  `create_at` int(11) NOT NULL COMMENT '记录创建时间',
  `update_at` int(11) NOT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_unfreezeing` (`status`,`is_pause`,`unfreeze_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉保证金余额';

-- ----------------------------
-- Records of pay_complaints_deposit
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_complaints_deposit_rule`
-- ----------------------------
DROP TABLE IF EXISTS `pay_complaints_deposit_rule`;
CREATE TABLE `pay_complaints_deposit_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_system` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否系统规则 1是 0否',
  `ratio` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '投诉保证金比例（百分比）',
  `freeze_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '冻结时间（秒）',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '规则是否开启 1开启 0关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉保证金规则表';

-- ----------------------------
-- Records of pay_complaints_deposit_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_df_api_order`
-- ----------------------------
DROP TABLE IF EXISTS `pay_df_api_order`;
CREATE TABLE `pay_df_api_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户编号',
  `trade_no` varchar(30) NOT NULL DEFAULT '' COMMENT '平台订单号',
  `out_trade_no` varchar(30) NOT NULL DEFAULT '' COMMENT '商户订单号',
  `money` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '金额',
  `bankname` varchar(100) NOT NULL DEFAULT '' COMMENT '银行名称',
  `subbranch` varchar(100) NOT NULL DEFAULT '' COMMENT '支行名称',
  `accountname` varchar(100) NOT NULL DEFAULT '' COMMENT '开户名',
  `cardnumber` varchar(100) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `province` varchar(100) NOT NULL DEFAULT '' COMMENT '所属省',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '所属市',
  `ip` varchar(100) DEFAULT '' COMMENT 'IP地址',
  `check_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：待审核 1：已提交后台审核 2：审核驳回',
  `extends` text COMMENT '扩展字段',
  `df_id` int(11) NOT NULL DEFAULT '0' COMMENT '代付ID',
  `notifyurl` varchar(255) DEFAULT '' COMMENT '异步通知地址',
  `reject_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '驳回原因',
  `check_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `df_charge_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '代付API扣除手续费方式，0：从到账金额里扣，1：从商户余额里扣',
  PRIMARY KEY (`id`),
  KEY `IND_UID` (`userid`),
  KEY `df_id` (`df_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_df_api_order
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_email`
-- ----------------------------
DROP TABLE IF EXISTS `pay_email`;
CREATE TABLE `pay_email` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `smtp_host` varchar(300) DEFAULT NULL,
  `smtp_port` varchar(300) DEFAULT NULL,
  `smtp_user` varchar(300) DEFAULT NULL,
  `smtp_pass` varchar(300) DEFAULT NULL,
  `smtp_email` varchar(300) DEFAULT NULL,
  `smtp_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_email
-- ----------------------------
INSERT INTO `pay_email` VALUES ('1', 'smtpdm.aliyun.com', '465', 'info@mail.tianniu.cc', 'Mailpush123', '12399078@qq.com', '乐百付API支付系统');

-- ----------------------------
-- Table structure for `pay_invitecode`
-- ----------------------------
DROP TABLE IF EXISTS `pay_invitecode`;
CREATE TABLE `pay_invitecode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invitecode` varchar(32) NOT NULL,
  `fmusernameid` int(11) unsigned NOT NULL DEFAULT '0',
  `syusernameid` int(11) NOT NULL DEFAULT '0',
  `regtype` tinyint(1) unsigned NOT NULL DEFAULT '4' COMMENT '用户组 4 普通用户 5 代理商',
  `fbdatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `yxdatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `sydatetime` int(11) unsigned DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '邀请码状态 0 禁用 1 未使用 2 已使用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `invitecode` (`invitecode`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_invitecode
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_inviteconfig`
-- ----------------------------
DROP TABLE IF EXISTS `pay_inviteconfig`;
CREATE TABLE `pay_inviteconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invitezt` tinyint(1) unsigned DEFAULT '1',
  `invitetype2number` int(11) NOT NULL DEFAULT '20',
  `invitetype2ff` smallint(6) NOT NULL DEFAULT '1',
  `invitetype5number` int(11) NOT NULL DEFAULT '20',
  `invitetype5ff` smallint(6) NOT NULL DEFAULT '1',
  `invitetype6number` int(11) NOT NULL DEFAULT '20',
  `invitetype6ff` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_inviteconfig
-- ----------------------------
INSERT INTO `pay_inviteconfig` VALUES ('1', '1', '0', '0', '100', '0', '0', '0');

-- ----------------------------
-- Table structure for `pay_loginrecord`
-- ----------------------------
DROP TABLE IF EXISTS `pay_loginrecord`;
CREATE TABLE `pay_loginrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `logindatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginip` varchar(100) NOT NULL,
  `loginaddress` varchar(300) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型：0：前台用户 1：后台用户',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_loginrecord
-- ----------------------------
INSERT INTO `pay_loginrecord` VALUES ('1', '1', '2018-09-13 13:22:01', '27.109.113.205', '柬埔寨', '1');
INSERT INTO `pay_loginrecord` VALUES ('2', '1', '2018-09-13 13:27:39', '27.109.113.205', '柬埔寨', '1');
INSERT INTO `pay_loginrecord` VALUES ('3', '1', '2018-09-14 14:36:53', '61.242.114.6', '广东省江门市', '1');
INSERT INTO `pay_loginrecord` VALUES ('4', '1', '2018-09-14 17:31:03', '119.15.81.226', '柬埔寨', '1');
INSERT INTO `pay_loginrecord` VALUES ('5', '145', '2018-09-14 18:10:16', '115.84.97.14', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('6', '1', '2018-09-14 18:17:50', '119.15.81.226', '柬埔寨', '1');
INSERT INTO `pay_loginrecord` VALUES ('7', '144', '2018-09-14 18:19:30', '115.84.97.14', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('8', '145', '2018-09-14 18:30:11', '115.150.28.176', '江西-赣州', '0');
INSERT INTO `pay_loginrecord` VALUES ('9', '145', '2018-09-14 18:41:03', '117.61.23.16', '江苏-', '0');
INSERT INTO `pay_loginrecord` VALUES ('10', '145', '2018-09-14 18:45:46', '117.61.23.16', '江苏-', '0');
INSERT INTO `pay_loginrecord` VALUES ('11', '145', '2018-09-14 18:51:14', '117.61.23.16', '江苏-', '0');
INSERT INTO `pay_loginrecord` VALUES ('12', '145', '2018-09-14 21:24:16', '115.84.97.14', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('13', '145', '2018-09-14 21:25:17', '115.84.97.14', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('14', '144', '2018-09-14 21:32:25', '115.84.97.14', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('15', '144', '2018-09-14 21:33:13', '115.84.97.14', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('16', '144', '2018-09-15 15:40:12', '115.84.83.178', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('17', '144', '2018-09-16 14:46:40', '115.84.83.178', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('18', '145', '2018-09-16 15:43:21', '115.84.83.178', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('19', '145', '2018-09-16 15:45:47', '115.84.83.178', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('20', '1', '2018-09-18 20:12:00', '119.15.89.174', '柬埔寨', '1');
INSERT INTO `pay_loginrecord` VALUES ('21', '145', '2018-09-28 14:39:46', '115.84.83.178', '老挝-', '0');
INSERT INTO `pay_loginrecord` VALUES ('22', '145', '2018-09-28 14:52:13', '182.123.63.210', '河南-新乡', '0');
INSERT INTO `pay_loginrecord` VALUES ('23', '1', '2018-09-29 15:12:45', '119.15.89.174', '柬埔寨', '1');
INSERT INTO `pay_loginrecord` VALUES ('24', '1', '2018-09-29 15:39:59', '116.230.40.44', '上海市', '1');
INSERT INTO `pay_loginrecord` VALUES ('25', '1', '2018-09-29 16:38:17', '119.15.89.174', '柬埔寨', '1');
INSERT INTO `pay_loginrecord` VALUES ('26', '1', '2018-10-11 15:20:17', '119.15.89.174', '柬埔寨', '1');
INSERT INTO `pay_loginrecord` VALUES ('27', '1', '2018-10-11 15:22:53', '119.96.209.69', '湖北省武汉市', '1');
INSERT INTO `pay_loginrecord` VALUES ('28', '146', '2018-10-11 15:32:02', '119.96.209.69', '湖北-武汉', '0');
INSERT INTO `pay_loginrecord` VALUES ('29', '1', '2018-10-15 22:54:59', '119.15.89.174', '柬埔寨', '1');
INSERT INTO `pay_loginrecord` VALUES ('30', '1', '2018-10-18 12:44:11', '119.15.89.174', '柬埔寨', '1');
INSERT INTO `pay_loginrecord` VALUES ('31', '148', '2018-10-18 14:48:48', '119.123.0.111', '广东-深圳', '0');
INSERT INTO `pay_loginrecord` VALUES ('32', '1', '2018-10-20 13:06:19', '180.191.154.38', '菲律宾', '1');
INSERT INTO `pay_loginrecord` VALUES ('33', '1', '2018-10-20 13:13:41', '180.191.154.38', '菲律宾', '1');
INSERT INTO `pay_loginrecord` VALUES ('34', '1', '2018-10-20 17:48:21', '119.15.89.174', '柬埔寨', '1');

-- ----------------------------
-- Table structure for `pay_member`
-- ----------------------------
DROP TABLE IF EXISTS `pay_member`;
CREATE TABLE `pay_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `groupid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户组',
  `salt` varchar(10) NOT NULL COMMENT '密码随机字符',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '代理ID',
  `agent_cate` int(11) NOT NULL DEFAULT '0' COMMENT '代理级别',
  `balance` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '可用余额',
  `blockedbalance` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '冻结可用余额',
  `email` varchar(100) NOT NULL,
  `activate` varchar(200) NOT NULL,
  `regdatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `activatedatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `realname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别',
  `birthday` int(11) NOT NULL DEFAULT '0',
  `sfznumber` varchar(20) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `qq` varchar(15) DEFAULT NULL COMMENT 'QQ',
  `address` varchar(200) DEFAULT NULL COMMENT '联系地址',
  `paypassword` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `authorized` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 已认证 0 未认证 2 待审核',
  `apidomain` varchar(500) DEFAULT NULL COMMENT '授权访问域名',
  `apikey` varchar(32) NOT NULL COMMENT 'APIKEY',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1激活 0未激活',
  `receiver` varchar(255) DEFAULT NULL COMMENT '台卡显示的收款人信息',
  `unit_paying_number` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单位时间已交易次数',
  `unit_paying_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位时间已交易金额',
  `unit_frist_paying_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单位时间已交易的第一笔时间',
  `last_paying_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天最后一笔已交易时间',
  `paying_money` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '当天已交易金额',
  `login_ip` varchar(255) NOT NULL DEFAULT ' ' COMMENT '登录IP',
  `last_error_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录错误时间',
  `login_error_num` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '错误登录次数',
  `google_auth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启谷歌身份验证登录',
  `df_api` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启代付API',
  `session_random` varchar(50) NOT NULL DEFAULT '' COMMENT 'session随机字符串',
  `df_domain` text NOT NULL COMMENT '代付域名报备',
  `df_auto_check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '代付API自动审核',
  `google_secret_key` varchar(255) NOT NULL DEFAULT '' COMMENT '谷歌密钥',
  `df_ip` text NOT NULL COMMENT '代付域名报备IP',
  `open_charge` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启充值功能',
  `df_charge_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '代付API扣除手续费方式，0：从到账金额里扣，1：从商户余额里扣',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_member
-- ----------------------------
INSERT INTO `pay_member` VALUES ('1', 'adminroot', '81b5234976a55e5181f24d9eab8fb697', '1', '', '0', '0', '0.0000', '0.0000', '', '', '0', '0', '', '1', '0', '', '', '', '', '', '0', '', '', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('8', 'beta', '7b6b04d046f495af038d1ad7b6f62d4a', '4', '5782', '1', '0', '491.5520', '0.0000', '12399078@qq.com', '4b5f49f0f1bb4e194310899e7bd074f0', '1520477745', '2018', '乐百富', '1', '235929600', '320723197706245217', '18761335892', '12399078', 'asdfasdf', '515a48a361daa2d68a89d2070c54270c', '1', null, 'oqjj7hwfznhmyx4bpobfojmj5yzwwu0v', '1', null, '215', '2062419.75', '0', '1539615595', '2062419.7366', ' ', '1527321020', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('9', 'w2109423213', '4d431aadff78a780e65c2301a8a20136', '4', '4341', '1', '0', '0.0000', '0.0000', 'asdfads@qerads.com', '2425579f256fb9ca2089ca1f5c720c7d', '1520507942', '2018', '陈斌', '1', '414864000', '140429198302248514', '18672379917', '234141214', 'afadsf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '1dh25u0l0ginwpy2lyv1mcgamn3qv24j', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('11', 'LY-80031', 'c852f72e2bd14c99e536367d490b1c59', '7', '1875', '1', '0', '0.0000', '0.0000', 'asdf@asfasf.com', 'b53a65b764555cfb65c753a0bb5ef59d', '1520508108', '2018', '励扬集团', '1', '453484800', '312153198405163521', '13248651236', '2131231', 'aeefaaf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'id159cziavrtqmg280ug2r5cb3bu7xyg', '1', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('13', 'lbf03111920', '732dd53a29654cfec0283a416bc56752', '4', '4503', '1', '0', '0.0000', '0.0000', 'asfsaf@qerafsdf.com', '17b747d3faeb6c4c2e5da37bc9324344', '1520508287', '2018', '冉维顺', '1', '250272000', '511228197912073510', '13717520864', '1232452', 'asfasfas', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'uolzvb6soyvqe6ajpw629nli8hqmbw23', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('16', 'wangyongquan110', '341377cbf63f5b7db4f8c1fe31079954', '4', '9779', '1', '0', '0.0000', '0.0000', 'asfasfas@asfasf.com', '798c5a2b87569bb3f64a561ca4debd8a', '1520508482', '2018', '王永全', '1', '497894400', '230902198510122114', '15145646057', '12345324', 'sadfsafdsa', '98641e30ace18a76f07bd7e5fbf7cd6c', '1', null, '0viihymnzi1nc32p4mje3g58k8ku6h91', '1', null, '6332', '5964415.00', '0', '1536639725', '5964414.9710', ' ', '1534569221', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1536638266');
INSERT INTO `pay_member` VALUES ('18', 'admin332', 'f635c31e0d4872731802756ae7ff3bd8', '4', '8888', '11', '0', '0.0000', '0.0000', 'sfsafa@sdfasfa.com', 'efc84f403a9022322cee763cb85829ee', '1520509960', '0', '励扬集团', '0', '460483200', '612401198408055284', '13621695572', '123465123', 'asdfasdf', 'bf66265a9552fd184b109a86214a38d5', '1', null, 'w0odrk8bson0dsjpqccog4dphrbou3up', '1', null, '7140', '9080673.95', '0', '1536639728', '9080674.0080', ' ', '1531394639', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1536636113');
INSERT INTO `pay_member` VALUES ('19', 'wy5420781', '21c9a709fe3bd041cbd725293fc5e6b0', '4', '3170', '11', '0', '0.0000', '0.0000', 'safasfasfj@asfhasj.com', '3eb950b584bb2f5b0c7b4fc45aa4b0fe', '1520510059', '0', '神灯', '1', '249062400', '452501197711233937', '15961640490', '65432112', 'adfasfas', '4d3ad193aa88b380c7d629ed44d4cec1', '0', null, 'sos7rbocl1btr8skilesicft6qfq2hi2', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('20', 'lbf13046180387', 'b99e9d304b29c4e849da72897d76c42e', '4', '7034', '11', '0', '0.0000', '0.0000', '3250809982@qq.com', 'ff19698030f898d20b163f068fbecdf3', '1520510124', '0', '财神', '1', '181152000', '452525197509290453', '13260282359', '23412414', 'afasfasfa', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'z61zfs5j9muo5a5fyhoowu4mbgz2nm0e', '0', null, '2285', '772705.08', '0', '1527777351', '772705.0800', ' ', '1526699129', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('24', 'lbf1000', 'ec17176f29e231123bf74bc705f83f21', '4', '1013', '1', '0', '0.0000', '0.0000', 'asdfasd@fadfdafsa.com', '3dff520d0d52331ac704e09aedba2640', '1520822435', '2018', '永利国际', '1', '703094400', '320643199204137561', '13216845975', '1232435', 'qdsafasf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'xbxo5o01zuo9v25ltzqgpnc67115ulbo', '0', null, '14', '13440.00', '0', '1526909527', '13440.0000', ' ', '1523532634', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('26', 'qw6632039', '0a714a05959cfa06ffe0605f5fc2ee87', '4', '1022', '1', '0', '0.0000', '0.0000', 'asfsaf@asfasdf.com', '1fad3f1d9e399d15417bbb18778006a9', '1520916409', '2018', '辉色', '1', '470851200', '362329198412037117', '13699506701', '1241524434', 'fsfdfjghgd', '394c6f1e76a28dbfb9a8f316b4f3397c', '1', null, '5uo6ut7xy4w4togkergq4dsv4800efca', '1', null, '658', '446102.82', '0', '1532774375', '446102.8200', ' ', '1530894792', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1532880762');
INSERT INTO `pay_member` VALUES ('29', 'lbf9988', 'b31619d471e8ffb883844c5b5f602275', '4', '5386', '1', '0', '0.0000', '0.0000', '510892678@qq.com', '6490214365a88fdb77c5e1ab185b093b', '1521272155', '2018', '王燕丽', '0', '625593600', '410521198910297520', '18788137846', '510892678', 'adfdadsfa', '40cb2f2db0649da3f223ae6d0d5aa6da', '1', null, '4s8cbgsocy6z33ns17zo0qcfu5qqonc4', '1', null, '499', '251291.25', '0', '1536604765', '251291.2420', ' ', '1526006501', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1536593843');
INSERT INTO `pay_member` VALUES ('31', 'mj123456', 'd34a9d6ec8167e7856680e5822da51f3', '4', '8832', '1', '0', '0.0000', '0.0000', 'asdfasdf@sdfgasfa.com', 'e8c1a591eef90691bce9e65150b2bd16', '1521465212', '2018', '蒙娟', '0', '342633600', '320481198011106224', '13199846521', '12535243', 'asdgadfgas', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'utei16j0ab8uyaqyed04tiuvwymqs9xs', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('37', 'lbf88888', 'adb3518a0f63c0ca5c69926ef1cfee2e', '7', '5768', '1', '0', '0.0000', '0.0000', 'asfdasd@asfasdf.com', '18b8951c627a3cc77c2643bcaf557891', '1521705558', '2018', '王小二', '1', '611420400', '354116198905186214', '13695486249', '153421', 'asfadsf', 'c2c6e9d20f59dee59b7a47e3993a657b', '0', null, '7jm5w3tmq33ntpnxhy8904tglab6nocr', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '1526099797', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('39', 'rlffyd', 'dfcafd5d38c38e7eb519ba6a96858c0d', '4', '1841', '1', '0', '0.0000', '0.0000', 'afhasf@qdafdsad.com', '839df55acd92fa1db7d832274c88e592', '1521711744', '2018', 'N00ls', '1', '653324400', '430426199009152112', '18843309618', '2134231324', 'adsfasfa', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'mjf94aodhybfrbmybaq76em57g0e77gm', '0', null, '4', '486.70', '0', '1524013684', '486.7000', ' ', '1523853129', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('40', 'tt1888', '154b0d2d5ffd9e14b38c1890e16805e4', '4', '8442', '31', '0', '0.0000', '0.0000', '897715185@qq.com', 'b1eaddbea082d96e1480f3a051c362d9', '1521767313', '0', 'city', '1', '0', '320956198506217562', '13029459376', '12412131', 'dfasf', '5aa83310d9dcf6ee6ac94ac69e5fe417', '0', null, '80i43nffgd3ai7acou9esjrrg1tpc093', '0', null, '288', '320825.43', '0', '1528271045', '320825.4300', ' ', '1526530277', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('42', 'lbf800', 'c5466095bd615e94bd907c661345389d', '4', '6835', '1', '0', '0.0000', '0.0000', 'asfasd@asdfasdf.com', '4a7006213f1a4ffe0faa37b37be59fda', '1522047311', '2018', '800棋牌', '1', '569865600', '3209824198801236543', '13186431564', '1223435424', 'adsfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'qa9bhvn3hb5ftjs1uge7rg2iduk866sj', '0', null, '24', '98.21', '0', '1524393261', '98.2100', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('43', 'lbf0008', '06a2d70e80f26231a62fae3eddefa4ae', '4', '6113', '1', '0', '0.0000', '0.0000', 'asdfasz@asdfasd.com', '262736e95e4c13ac8e8b756dc62ee7ee', '1522131517', '2018', '艳丽', '0', '641919600', '624123199005063651', '13685649216', '23431', 'asdfasdf', '4297f44b13955235245b2497399d7a93', '0', null, 'k8ni3ztibx1s6hfzig5sy09ch9ckq5vk', '0', null, '39', '12171.63', '0', '1524667436', '12171.6300', ' ', '1523366531', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('44', 'weizhe28', 'ca5fbb826f6d5b510c04fcdc037b4538', '7', '5286', '1', '0', '0.0000', '0.0000', 'asfasf@asfasf.com', '9fc3b2b5fabf375c6cc81bc42a74cf97', '1522144970', '2018', '大猫', '0', '301939200', '612321197702283611', '13700000000', '15009195', 'sgasfasdfa', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'fjgiyjk35bm2ww7udsrul4scm6wtesd6', '1', null, '0', '0.00', '0', '0', '0.0000', ' ', '1534246344', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1536539164');
INSERT INTO `pay_member` VALUES ('45', 'xiaohai88', 'ce414b4b7ca4bf9ed26df76ddfddb267', '4', '6215', '44', '0', '0.0000', '0.0000', 'asfasdf@afaf.com', '3ce0e37e3c3210a53ade8076fdf80e2b', '1522145231', '0', '顺顺GC', '1', '697132800', '21142219920204621x', '15184076998', '4765342', 'adfasfasdf', '6532dc2eaf81691db2f64145d1e081cf', '0', null, 'mktr3fhxgb7w23sqqbsr6e551565hbks', '1', null, '4', '11099.98', '0', '1526714285', '11099.9800', ' ', '1526124362', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('46', 'lbf1680', 'ed0dd7b55602040f7fca47505e9769c5', '4', '5193', '1', '0', '0.0000', '0.0000', '1776956857@qq.com', '15364e59b0cce0bdd4f58204a523641b', '1522217455', '2018', '李艳许', '1', '497808000', '410421198510112536', '18736090485', '1776956857', 'dsfadsfa', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '2cyu945e341p8jrzxpvyisoaqr8y46mi', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('47', 'jiuying', '7aaed23ed165721b019a9cd70f32ed8f', '4', '9612', '1', '0', '0.0000', '0.0000', 'asfasf@asdfasdf.com', 'f3592492757c7d5a14e6d5a60067cfd5', '1522238060', '2018', '林惠玲', '1', '976809600', '445222200012153322', '17098632574', '2048350003', '广东省揭阳市', 'ce70bfeb4ddacccf08bd43158581e030', '1', null, 'tk75amrq6f69hjw05eqygsjofubqaypi', '1', null, '187', '93946.10', '0', '1534817023', '93946.1000', ' ', '1534922138', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1536132694');
INSERT INTO `pay_member` VALUES ('48', 'lbf00001', '8bf496d9cb9b76e5b1a484dec4be6c69', '7', '9116', '1', '0', '0.0000', '0.0000', 'sdfasfd@asdfasfd.com', 'f010d0d18dec60762426e428d2b9ceeb', '1522588306', '2018', '大胖', '1', '596304000', '321621198811243126', '13146854789', '243524512', 'adfadfa', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'awy7su7pktnlfrms1ltl94ldacyh98wt', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('49', 'lbf1688', '43570d8e1fdebb2ddd6958610406b6dc', '4', '4757', '1', '0', '0.0000', '0.0000', '1558627617@qq.com', 'e59e9851987956aba62b56cbde9ebb8b', '1523005743', '2018', '秦向伟', '1', '257961600', '411324197803060936', '18736049865', '1558627617', 'dfadf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '347e42lyt6amh3b6zpw1l84b1i3j0k04', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('51', 'ly0008', '1aad5bb2ae6b551bd423512ba7674b60', '7', '8982', '1', '0', '0.0000', '0.0000', 'dasfas@adfasdf.com', '9c51022064378efd72d148d6ea54eae7', '1523160365', '2018', '励扬代理', '0', '488131200', '320624198506213215', '13654216875', '123442', 'fsfasdfa', 'bf66265a9552fd184b109a86214a38d5', '1', null, '07a8cbmrm4kaj70mq1ismucpe119dffw', '1', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1536138576');
INSERT INTO `pay_member` VALUES ('52', 'ycy889', '7f75bb1fb368424223d343c9e223984f', '4', '9698', '51', '0', '0.0000', '0.0000', '555@llllcom', '56d2ab8bb39ff8990515bc424b57685b', '1523165336', '0', '太阳', '1', '0', '47958225662562522x', '16666666666', '755554222', 'www', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'gniqd2by5gs81zeorkwhwknc66p9k55m', '1', null, '6', '147.00', '0', '1523609113', '147.0000', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('53', 'lbf10688', '55a88930e0eb14ac3a31ecef142ac112', '4', '1929', '1', '0', '0.0000', '0.0000', 'adsfsas@asfadf.com', 'aaaab46326262a4543bf83f14f9f6b06', '1523188991', '2018', '陈广军', '1', '676134000', '413026199106067515', '13695462453', '12255423', 'dasfasd', '4607e782c4d86fd5364d7e4508bb10d9', '0', null, 'zjqeommfa1gass92yynepofq44h7vnae', '0', null, '1', '24.63', '0', '1523692987', '24.6300', ' ', '1523782951', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('54', 'lbf241832675', '5828afe351eade1431666aeb2cc0d86c', '4', '5208', '37', '0', '0.0000', '0.0000', '563996243gg@gmail.com', '6340c244a31223f9f5afc1783fcdd876', '1523347631', '0', '舒丹婷', '0', '534700800', '36223319861212162x', '13219648549', '405789006', 'fsafasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'rkidy2mkef7e0xoltyu642telysfszcm', '0', null, '3', '2.95', '0', '1524397981', '2.9500', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('58', 'rangel008', '65bf11e94833a1f4e79f76a596b1b19a', '4', '9742', '1', '0', '0.0000', '0.0000', '970772703@qq.com', 'a19157f198b34c43a13d20982f62ee02', '1523696412', '2018', '林子', '1', '476121600', '110221198502022897', '13159200319', '970772703', 'dasfasd', 'fd72fb874733aa5a96cba54462eaa902', '0', null, '9pw3ppzd9vc8obefj76yn5tld6gsvpf5', '0', null, '23', '705.86', '0', '1525921671', '705.8600', '', '1525939734', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('59', 'lbf106698', '53842b35cd6dda60335af0f2ca1fa409', '4', '2862', '1', '0', '0.0000', '0.0000', 'asdfasd@afad.com', 'f722f5569d72ca3828eded8cdd3e76a3', '1524126855', '2018', '方块', '1', '494956800', '320924198509083305', '13158947562', '434124121', 'dassfa', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '8l4ng5zyu5s7gmo684o1abuafm0nipzi', '0', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('60', 'lbf66888', 'b66f8e4463d8f0885aa0cee3b7eae5b6', '7', '1737', '1', '0', '0.0000', '0.0000', 'adsfas@asfdadsf.com', 'f0f37035bb48eab0654f06414121519e', '1524217991', '2018', '饶先生', '1', '262108800', '320642197804233541', '13654982135', '137813516', 'asfdasf', '0659c7992e268962384eb17fafe88364', '0', null, 'jb09tfb59d2aasfwk3gj4wqx0zk6393p', '0', null, '0', '0.00', '0', '0', '0.0000', '', '1526795539', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('61', 'shenzhenpdzs', '54ac306a65b082dc4bf2b58a928525f2', '4', '4927', '60', '0', '0.0000', '0.0000', '690971700@qq.com', 'f5241fb4fb730766732a1b7fc9569341', '1524295269', '0', '黄强', '1', '0', '511525198704265376', '18926753075', '690971700', '深圳市龙华新区太阳能硅谷大厦313', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'peorgrzmljvy5xs5j72c0sp3ahev1ltm', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '1524626495', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('62', 'bubiji549255', '9180cc1c939d2767b4755305ac7ae4ef', '4', '8782', '1', '0', '0.0000', '0.0000', 'bubiji549255@163.com', '5f49cfaf6289be4e3d302edbd9203273', '1524446263', '2018', '朱光远', '1', '852307200', '340322199701046815', '17157586961', '70137535', 'asfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'e66dv2t90y4sxym7ajp3io1smtbl2we8', '0', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('63', '哲林科技', 'ffe90b8b798d4c694ca0e2c930d06fac', '4', '2255', '60', '0', '0.0000', '0.0000', '59862093@qq.com', '01d8eb641279c09ebd8bf62d4a15c902', '1524447973', '0', '汪顺龙', '1', '0', '342623199006214033', '18067907930', '59862093', '安徽省合肥市哲林科技有限公司', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'sfbf7a095atgrqx7ueorqrauubobo572', '0', null, '9', '198.25', '0', '1524467603', '198.2500', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('64', 'joker123', 'cda643192c400d1d1246c94fad6d9834', '6', '8444', '60', '0', '0.0000', '0.0000', '892956253@qq.com', '8a060ae3c4f5a200fed90c9a55d1b039', '1524550581', '0', '张晓凯', '1', '631123200', '320501199108125518', '13776021991', '934261159', '苏州工业园区星湖街328号创意产业园2栋B301', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '3zmt090qfnouxgyw671yq14lskw184zl', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '1525222437', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('66', 'lebaifu', '46773124b9f4bb175deefd1f23490646', '4', '4831', '64', '0', '0.0000', '0.0000', '22274234@qq.com', 'ccc2c5cdf81640a028a67421f24b2c82', '1524553942', '0', '', '1', '0', '320526197605163215', '13145687954', '', '', '04c186e0bbcf77d585e4a774fcfe4cd8', '0', null, 't1mt1gp8d61afhjuny7t82kl5xuw0xp0', '0', null, '63', '55716.54', '0', '1524905367', '55716.5400', ' ', '1526618152', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('69', '福晟实业', '06bfd0f92462491e6005a479d29c1b9c', '4', '8350', '60', '0', '0.0000', '0.0000', 'landunfwh@outlook.com', '49aae7e59eb9ae82f4e412248f774ce0', '1524653440', '0', '高伟', '1', '0', '360102198310024830', '13168375304', '', '深圳市福田区香蜜湖街道紫竹六路金民大厦1408-1', '0cb796c8f73595c16828f0243971122c', '0', null, '344bd0z8zysj5bxfl4rkb16xj9jm7jj8', '0', null, '4635', '3615848.45', '0', '1526991433', '3615848.4500', ' ', '1527038778', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('70', 'dx201825', 'cab2c7fc5344f08202d17f009e6d8c57', '4', '3581', '64', '0', '0.0000', '0.0000', '1246726329@qq.com', 'b261f8f8d5f5f7ea76040a3e0afb8a15', '1524729050', '0', '李亚敏', '1', '0', '460034199403164115', '15545106473', '1246726329', '', '297898c9c6f9caf90000d9253af47e86', '0', null, '8e4fetbf8v8h4lionfjk5nodzp9684km', '0', null, '15', '271.38', '0', '1526725327', '271.3800', ' ', '1525348357', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('71', 'tyclbf', 'e27a6e2c25762e18bbba0c4119081100', '4', '3439', '64', '0', '0.0000', '0.0000', '1774329852@qq.com', '14a1342f9a9ff6d8aefeb73a7e1165df', '1524749278', '0', null, '1', '0', null, null, null, null, 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'd8mt8m2lrorvpcq9v3evnh71rhcdhe2y', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('72', 'xinpujing', '4d9dde9e08235ffe4ce5d71d0b22cf83', '4', '2914', '64', '0', '0.0000', '0.0000', '2604986300@qq.com', '24f8316cee98ef680d7328122f1748c1', '1524812375', '0', null, '1', '0', null, null, null, null, '8542516f8870173d7d1daba1daaaf0a1', '0', null, 'sc84oskorjh6avept1vq3iidztyu8hrl', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '1524832979', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('73', '汉文春商贸', 'af4cf513e4ba2bdc6e7b78c186272f44', '4', '8898', '60', '0', '0.0000', '0.0000', 'bocaixm@outlook.com', 'ef8bf7e58d2d36990b8e1c9bde8c121a', '1524820542', '0', '邵刚刚', '1', '0', '610425197504183037', '13168375304', '', '南宁市兴宁区上海路盛世联邦广场5号楼5-0408号', '0cb796c8f73595c16828f0243971122c', '0', null, '9lmmyjtv7bvjj87n27znmvo56y61wi3k', '0', null, '1852', '1311810.40', '0', '1526991429', '1311810.4000', ' ', '1526435880', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('74', 'xinpujing001', '7237dfac3145894ba84e618b460f49f8', '4', '7490', '64', '0', '0.0000', '0.0000', '2595590283@qq.com', '94563d904b1669d9c315a8f4e7a22c40', '1524882827', '0', '陈华锋', '1', '0', '350526200108081517', '18509135614', '', '', '5687042f58a40fe09234d9d57886ea88', '0', null, '7xv3egl1g2grwojvmkos0gfa3e5fe6fk', '0', null, '2', '689.50', '0', '1524945897', '689.5000', ' ', '1526136962', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('75', '欧阳敬文', 'ad3c0643f15f702fd9fe6b5cafcb478b', '4', '9168', '60', '0', '0.0000', '0.0000', '1346394626@qq.com', '9523bb3771e111d16da74e7539204604', '1525227230', '0', '欧阳敬文', '1', '0', '440182199008270033', '15815860773', '', '广州市天河区体育西路101号维多利广场', '04efe4cfbe936e6c964f1cf161d2b305', '0', null, '21dogaxu7r36g21tf02cy3p4zyo35r7k', '0', null, '137', '135135.20', '0', '1526978086', '135135.2000', ' ', '1525416630', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('76', 'admin', 'c43c8184830540bd1818f49c63c77f7a', '4', '1117', '60', '0', '0.0000', '0.0000', 'my51688my@gmail.com', 'c98b4916a612c82c3f138cb5a414ec19', '1525262178', '0', '杜海龙', '0', '0', '440982199809125370', '13266852667', '', '广州市', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'rmz2k2lb14tqnk8q0p82tneug9ytxdit', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('78', '欣夏商贸', '171bcb92ee2a59ab1e8acc1d366e14ce', '4', '3424', '60', '0', '0.0000', '0.0000', 'lilaijiao@outlook.com', '2cedf17e4985bc2d6c757c65fa81fe65', '1525426155', '0', '李秋香', '1', '0', '420982199509155380', '13617882204', '', '南宁市青秀区茶花园6/1号南湖翠苑11层1101c号房', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'ghx0uue49hdccvk12s31t3ek770sndf5', '0', null, '1', '0.99', '0', '1526455263', '0.9900', ' ', '1526461828', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('79', 'yangdabao888', '22739e4caf6806e0ea8e808512f9b2c3', '7', '6313', '1', '7', '0.0000', '0.0000', '3284162315@qq.com', '40aed4992bb94443c78a86aab42128ac', '1525768122', '2018', '杨大宝', '0', '582130800', '411528198806132625', '18339290313', '3284162315', '河南郑州', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'qknhbs162pagl3u85fg6q5x75misb32t', '0', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('80', 'LEL', 'c025a2a59c84c72c9a58bd95043d5e49', '4', '8870', '79', '0', '0.0000', '0.0000', '674620168@qq.com', '39ac2d1d270ffbd98f2409f9eec592a6', '1525769082', '0', '杨一', '0', '0', '522428199404080012', '18339290313', '674620138', '465116', '2dafedc9806cfec9be2076b650b70c2a', '0', null, 'i3nk98j8asg7852m5y41zoxp3rmhphoa', '0', null, '81', '7956.55', '0', '1527490509', '7956.5500', ' ', '1527733084', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('81', 'lbf10081', 'ef1f9eef4682aa4bb0b62c79a50b356a', '4', '3597', '79', '0', '0.0000', '0.0000', 'fafa@adsfasd.com', '3bfa80a64dc0344130d760090695dc2f', '1525865546', '0', '杨二', '0', '765734400', '522428199404080012', '13594621578', '14212315', 'adsfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'n2nmue9t4xaeici5jqo7pivnjzptfh1z', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('82', '领航科技', '7adad70bcf4387ac087c1421ea053ea4', '4', '8670', '60', '0', '0.0000', '0.0000', '939042564@qq.com', '31769df0013ea3d92143f9389efbff11', '1525932923', '0', '领航付友', '1', '0', '421982199509125890', '15210193927', '939042564', '北京市东城区', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'ixj6epr5xlt1bm9whd5y514tz0v6bs02', '0', null, '15', '18.37', '0', '1526030614', '18.3700', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('83', '艺贵科技', 'bd303fd6bcae19a0f14597f1351d2f81', '4', '1754', '60', '0', '0.0000', '0.0000', '2461732537@qq.com', '8f6ae826d1baa7769e347fdf1a6b7a58', '1526001584', '0', '郭荣弟', '1', '0', '440309132580820', '13661548909', '2461732537', '上海市浦东新区金扬路金东名苑1栋103', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'pvw2f0gyvh3n30pxowj6nskc1qarz036', '0', null, '1', '0.99', '0', '1526292808', '0.9900', ' ', '1526631684', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('84', 'qxh123', 'b7e0fe01571cc17649f0616ede012822', '4', '7552', '51', '0', '0.0000', '0.0000', 'qxhsk777@163.com', '6c26b59f825e6230b0e310cdf7466631', '1526284728', '0', '白锋锋', '1', '427651200', '632122198307227496', '15687599681', '123456789', '中国', '723d505516e0c197e42a6be3c0af910e', '1', null, '536iwfenjeyr5f0946gqfusz0a1qqo2e', '1', null, '911', '585892.54', '0', '1536573617', '585892.5400', ' ', '1528781773', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1536572103');
INSERT INTO `pay_member` VALUES ('85', 'lbf10085', 'd57cc9916e2f13833f42c943f3df19f3', '4', '2202', '1', '4', '0.0000', '0.0000', '3106729681@qq.com', '42e7b40bb16b3a3763d225f369c072e9', '1526302793', '2018', '金之沙', '0', '0', '320526198506213561', '13685497652', '3106729681', 'asdfas', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'hnzg00vi4fd1q0ros8khbxeb478ydb5v', '0', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('86', 'a35396098', 'a81e1219a8157a47ad4cd63b6d8e8650', '4', '7272', '1', '4', '0.0000', '0.0000', 'fafdsa@adfasfd.com', 'd4ad3d4198ee67870071a234923beced', '1526356923', '2018', '深爱介', '0', '0', '320913199012036542', '13685497561', '2424562', 'adfadf', 'e10adc3949ba59abbe56e057f20f883e', '0', null, 'zmdsfz3qpc78vg1t93wbqlxxdzx5r00c', '0', null, '21', '9552.33', '0', '1528190979', '9552.3300', '', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('87', 'xpj123', '5b44416245b32cd5842d719a083f3666', '4', '7885', '51', '0', '0.0000', '0.0000', '63722116@qq.com', 'ea5d21a838a66a45595c665f8dad18bc', '1526375134', '0', '袁源', '1', '314380800', '620501197912192318', '13902430543', '63722116', '中国', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'cb4yvwwhi3wk4o9nvhb40prc39l1xm49', '1', null, '53', '3299.54', '0', '1536589811', '3299.5400', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('88', 'lbf10088', '6c280be02de90d8d2eebaee286fe28c2', '4', '7131', '79', '0', '0.0000', '0.0000', 'asfasdf@asfasdf.com', '14687b7102805108ff747cbce8a95a21', '1526450957', '0', 'lbf10088', '0', '0', '320645198904136541', '13148956752', '142423324', 'dsafasf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'yti3jtw6wy4k406sz5y3hnvdnn1z3r80', '0', null, '1', '0.99', '0', '1526905760', '0.9900', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('89', 'lbf10089', 'fc1a9c65786a36c72286523e50adb7ca', '4', '7979', '1', '4', '0.0000', '0.0000', '594131398@qq.com', '95dcd6b0e037b8f88e6b0eb870ed4282', '1526559580', '2018', 'T杨', '1', '0', '320946198706053641', '13694865782', '594131398', 'asgagfaf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '3d2cyrxyzn020bmgfo3q5d0yzbzqohrr', '0', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('90', '爱逛电子', '8944a7fc78d141e6baa2abf74fb81de8', '4', '1489', '60', '0', '0.0000', '0.0000', '383595562@qq.com', '60e1a5c33581804e18d7814a9d1b0b4b', '1526615352', '0', 'peter', '1', '0', '237882414124109', '13176374444', '383595562', '山东省枣庄市市中区青檀中路15号', 'd0e867ece571e89a8d7fb3d0c12ea2a5', '0', null, 'mci7k1jy9hwbijch7s9vlq3jatodewni', '0', null, '173', '1459910.02', '0', '1527049275', '1459910.0200', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('91', 'qicai', '8502c9226c57605f12c84966bd528012', '4', '1582', '1', '4', '0.0000', '0.0000', 'fadfa@qdasfas.com', '4167fc285b1088f38121e61f7f2c1d64', '1526816462', '2018', '七彩', '0', '0', '320426198908193212', '15698762543', '31243542', 'adsfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'vhxc86upwqdm1kidyezr9h4flt8ntqsh', '0', null, '12', '557.24', '0', '1528810381', '557.2400', '', '1528602795', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('92', 'lbf10092', '77ad704a677cb048f6968972c714db7b', '4', '7213', '1', '4', '0.0000', '0.0000', 'dsafsafd@fadfasdf.com', '19cb803d1874438dd57398b6cb9464f6', '1526990402', '2018', '郭总', '1', '-28800', '320526197706143215', '13894672156', '1253242', 'adsfad', '1bdc4c78d90dafa79bb851d59d83d775', '1', null, '2h613hv92nb3d6digkcftfcqp8xodtkx', '1', null, '494', '417129.35', '0', '1533810900', '417129.3500', '', '1533904120', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1534222024');
INSERT INTO `pay_member` VALUES ('93', 'lbf10093', 'd68571334d068aa321690bf86860f229', '4', '1407', '1', '4', '0.0000', '0.0000', 'fsasfkj@asdfhasf.com', 'a9b78c806e3a6d6629150e1b6e52f37e', '1527049703', '2018', '深爱介2', '0', '0', '320421198504196521', '13458954621', '2345213', 'dsafasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'jd2l8nwiy509h7a21mnx4s3xt2s8s1y2', '0', null, '8', '1173.30', '0', '1531731143', '1173.3000', '', '1531806996', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('94', 'ba123', 'e17bbf2bae30ed8da01c51e92134754e', '4', '1781', '51', '0', '0.0000', '0.0000', '3454917435@qq.com', '5e2a371c6629db419abc8c024b916890', '1527324670', '0', '谭海龙', '1', '171648000', '211081197506112932', '13665869957', '3454917435', '中国', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, '1qrwoe865iewah25pb7qc86n4d76vez0', '1', null, '2616', '1011498.35', '0', '1536640021', '1011498.3130', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1536632225');
INSERT INTO `pay_member` VALUES ('95', 'lbf10095', '6c63fd621b56e3d96b1c208d94a75e00', '7', '2973', '1', '7', '0.0000', '0.0000', 'adcghk@163.com', 'c56d0224f1feecf6d9a96b5ebb7d0164', '1527554574', '2018', '小王代', '0', '0', '320727198706148751', '13432541368', '621689', 'zcghhhfy', '875c6e8140862e136837f184146aa0b4', '0', null, 'ynkadfpnyggbpih1il8w08a5ifyp4q7z', '0', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1533518225');
INSERT INTO `pay_member` VALUES ('96', 'hougong2', 'd7e5c21bc0a93570be961264c211a23b', '4', '1572', '95', '0', '0.0000', '0.0000', '137075337@qq.com', 'cbed3ea079aa5d661ffe9ca055578b87', '1527570113', '0', '唐桂英', '0', '0', '410804198211040052', '13612345678', '', '北京市', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '9bnk5oyysror6h1z3k0hmpurx6fe1sfb', '0', null, '1', '0.98', '0', '1527592886', '0.9800', ' ', '1530515830', '4', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('97', 'lbf10097', '2aeac51fd61dd8e328178c4ce8759bf5', '4', '4164', '1', '4', '0.0000', '0.0000', '929368356@qq.com', '37105df7e669a88de3d2b530e9264a71', '1527580106', '2018', '韩俊峰', '1', '-28800', '210402198603071511', '17129117511', '', 'asfadsfas', '08ef84145b81dcd98554b70c662c41ed', '1', null, 'birg04xw8weiggrufb9w43o6kpperzxf', '1', null, '2612', '21108487.32', '0', '1536640017', '21108486.9080', '', '1531885301', '0', '0', '1', '0', '', '1', '', '', '0', '0', '1536631200');
INSERT INTO `pay_member` VALUES ('98', 'lbf10098', 'e4f5470315c2af135945745ec070d264', '4', '7234', '1', '4', '0.0000', '0.0000', 'fasfdsaf@fadsfasdf.com', '32cba3c62574952b259d1c098da86d07', '1527747483', '2018', '六脉', '0', '0', '320816198808136231', '13684975621', '2133565241', 'sdafasdfas', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'e7r74v12htfh62hylb1bgahf3849i5sh', '0', null, '3', '2.90', '0', '1527928794', '2.9000', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('99', 'lbf10099', '8ccb9e3dbcd4df1e142045149a0aca20', '4', '8247', '1', '4', '0.0000', '0.0000', 'afasdf@asdfasdf.com', 'b130ed9ffc07d8d3fb4dd2dec8fea599', '1527748047', '2018', '陈聪', '1', '577551600', '321323198804213611', '18072843094', '1246542314', '江苏省泗阳县临河镇曹渡村一组49号', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '2xe2hgmh0429t2gjqq3o76i5ra1f2cid', '0', null, '0', '0.00', '0', '0', '0.0000', '', '1529587814', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('100', 'lbf10100', 'd58e86276942a04b85528a809ebfa6a6', '7', '6008', '1', '7', '0.0000', '0.0000', 'afasdf@adsfasd.com', 'e01709938c6bbfc51c2b5368ad348ce5', '1527831742', '2018', '尹小姐', '0', '0', '321987198908186531', '13195486752', '12352423', 'adsfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '7gic48du31na5bn4xnw0d0t5fsdifjou', '0', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('102', 'lbf10102', 'e43196ba2af3611e16af6cd9a32bdbe7', '6', '7080', '100', '0', '0.0000', '0.0000', 'adsfasd@dasfda.com', 'cbd71dc85c9c612e788815eded6e5339', '1527841362', '0', '尹代', '0', '0', '321945198603214621', '13156489521', '12352', 'adsfadsf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '7n7t253kvj39tjedv1mpohpkcurgsshj', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '1528367932', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('103', 'lbf10103', 'bc931a3d6ab012a00f4c697178ec3d53', '4', '9188', '102', '0', '0.0000', '0.0000', 'asdfasf@dasfasfd.com', '3894670950a75eae602c77cff42d2119', '1527841494', '0', '尹代介', '0', '0', '320523198504193621', '13695488621', '12551345', 'adsa', '55587a910882016321201e6ebbc9f595', '0', null, 'sswhcefuxokgztjape2k7eepkhv10ac4', '0', null, '11', '33570.81', '0', '1528254650', '33570.8100', ' ', '1528176314', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('104', 'lbf10104', 'e0efe40a914c3d23d5c55fec514cf233', '6', '2055', '100', '0', '0.0000', '0.0000', 'asdfasdf@adfasd.com', '1514cc1f8f170185a305b173ff0bc3dc', '1527841973', '0', '尹代2', '0', '0', '320463198905203561', '13586498621', '21334523', 'adsdfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'k1uub2y1ionqver2zh3rvkjhdiok38ma', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('105', 'a893871', '16410be23e89e4c0c4f30dc3f926ffef', '4', '8315', '1', '4', '0.0000', '0.0000', 'dasfads@adfasd.com', 'fc7d5dbbe675a7ec66aac0eb7f75568e', '1527909863', '2018', ' 深爱介2', '0', '0', '320813197909301265', '13985642156', '1233456', 'addsfasafd', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'gcovod24ejfw2ypu2ekjc6xura5d0npx', '0', null, '6', '14.74', '0', '1529568080', '14.7400', '', '1529488468', '0', '0', '1', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('106', 'lbf10106', '3198a5156dde5b0add464ea8e8ea7b71', '4', '4121', '104', '0', '0.0000', '0.0000', 'dfasfadsf@adsfasf.com', 'a6cc72a3b4e3a93ce00f87340b9c7396', '1528181965', '0', '尹代介1', '0', '0', '32094319890812', '13416898576', '125345213', 'sdafasdfasd', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '4fs4hret83yxyjavpiol6hpd08888bnt', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('107', 'wong262', 'ea1558322b25d716df555be3dc96b6ba', '4', '9186', '95', '0', '0.0000', '0.0000', '231321@qq.com', 'aa8e98a43b11e15bc3b86c93718791b6', '1528514054', '0', '王晨', '1', '0', '410811147896541235', '13636363636', '2313112', '上海市', '875c6e8140862e136837f184146aa0b4', '0', null, 'wimr5la7j9ljkirpcdbvebvxigjl2ab3', '0', null, '5', '4.90', '0', '1528686147', '4.9000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('108', 'lbf10108', '9b920f80537231d27f80c84e812d0e66', '4', '8886', '1', '4', '0.0000', '0.0000', '7846528625@qq.com', '4f1eb7cdd9c9399c584d3aa2aed95312', '1528529908', '2018', '岩总', '0', '0', '321526198906073621', '13986574862', '7846528625', 'zdfasd', '648e3aabd2e8abbe4295d35d9c30cd18', '1', null, 'oslhf2tpn3plnksh5tn0t8h0tj6oddpn', '1', null, '5319', '891828.36', '0', '1536596139', '891828.3600', '', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1536523925');
INSERT INTO `pay_member` VALUES ('109', 'lbf249598234', '0921ef4cdeb8b9ccfc41d0b745d32b47', '4', '3626', '1', '4', '0.0000', '0.0000', '249598234@qq.com', 'ed9f5c987d16a6ff378f2dd2591ee61a', '1529571391', '2018', '深爱代号', '0', '0', '320956199212156213', '13495786524', '249598234', 'dsfadfaf', '92e767fe4ac649202f69e85be512d55d', '1', null, 'f81kyc85p8we2sap6x1mwpyl84tzbkyy', '1', null, '21', '31289.84', '0', '1534862133', '31289.8350', '', '1530368356', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1535105784');
INSERT INTO `pay_member` VALUES ('110', 'lbf10110', '00c709c20faeb975df8bf96a8e163f83', '4', '1951', '1', '4', '0.0000', '0.0000', '223465242@qq.com', 'ff4b81c5de4b704970e1ae224ae2949d', '1529840450', '2018', '范范友', '0', '0', '320612198705163321', '13598764258', '223465242', 'dsdfasdfad', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'tlp2l58ahuhww10sn1qt75935bwno2gd', '0', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('111', 'lbf10111', 'cc4b5962070d9f3ff0756c1f2e9c9342', '4', '5925', '1', '4', '0.0000', '0.0000', '87415984@qq.com', '0aea67e0a4f41be1fbd08e888632ca73', '1530454612', '2018', '殷总', '0', '0', '320923197210156241', '13216854976', '87415984', 'asdfadsf', '4f19549c1d478d1b3ec5321ad63f9c7e', '1', null, '2eng297huswnsnhqsf47o8b3vjp2tw5s', '1', null, '58', '11472.56', '0', '1532190141', '11472.5600', '', '1533012766', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1533012786');
INSERT INTO `pay_member` VALUES ('112', '5682aaa', '754bf6bf5c040f2b11e3380870305fc4', '4', '6192', '95', '0', '0.0000', '0.0000', '2449450354@qq.com', '605b74a8c12ac8d3abae072d9655e1d0', '1530516133', '0', '张三', '1', '0', '410888198808080808', '13636254125', '2449450354', '上海市', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, '0mz6q6ihjezdhfj62tix62mem4eyaycu', '0', null, '2', '1.98', '0', '1530784758', '1.9800', ' ', '1531190258', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('113', 'xpgj001', 'd7eb5a3ac051b44f006eb507fbe9ad3c', '4', '9766', '95', '0', '0.0000', '0.0000', '231321232qq.com', '5f24de7653d1e64092177eca9fb19c3f', '1530536892', '0', '祥鹏', '1', '540748800', '410811198702200059', '13673911302', '1321564564', '山西省晋城市', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'beyui8f8ascrricesvlv2aq8reanvxwp', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('114', 'by123', '78a9c4507ff87eb880b27cd25d863c59', '4', '7020', '51', '0', '0.0000', '0.0000', '3056508820@qq.com', '44d60b879df76a2cea9090450fc45e94', '1530850067', '0', '魏曼珠', '0', '359568000', '530121198105253328', '15895147303', '3056508820', '中国', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'xgkpwhljmt6fz18us5r9slbxf5jcd49e', '1', null, '9', '1058.61', '0', '1534137298', '1058.6138', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1534339220');
INSERT INTO `pay_member` VALUES ('115', 'hd123', 'e7094f3d260eef89910d7320a52690f9', '4', '5050', '51', '0', '0.0000', '0.0000', 'm15221565648@163.com', '8c82937f0912ff0cc2e11f4544493bd2', '1530850813', '0', '范玉龙', '1', '16214400', '342221197007080117', '15221565648', '783979098', '中国', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, '0w87e4d2vcrsidbixjrmdl80l5kimf2h', '1', null, '2655', '1013896.21', '0', '1536639947', '1013896.2280', ' ', '0', '0', '0', '1', '0', '', '0', '', '', '0', '0', '1536639868');
INSERT INTO `pay_member` VALUES ('116', 'niucaiwang', 'b519fae3c2b60bdb0850a7625b29d448', '4', '2650', '1', '4', '0.0000', '0.0000', 'niucaiwang@gmail.com', 'f991bc2bb649dbb54d9854c23be1ab8a', '1531748670', '2018', '熊右', '1', '809280000', '421125199508252755', '13521750824', '205813535', 'sadfa', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'dmvfinz3h7kqgs1ptlqxlx25o16z3n71', '1', null, '242', '71644.29', '0', '1536632823', '71644.2890', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1536562023');
INSERT INTO `pay_member` VALUES ('117', 'xpj71235', 'e31493aaeee6c5470f28401435c38612', '4', '4530', '1', '4', '0.0000', '0.0000', 'xpj71235@gmail.com', '4e6bd484508e9110856918d982a015d3', '1531748714', '2018', '呼吉雅', '0', '25718400', '152222197010262828', '15288269281', '205813539', 'sfaasfd', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'w7w87f3thuxhmy91ycfr2zpq2rnbl0up', '1', null, '211', '10450.84', '0', '1533808394', '10450.8376', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1535348506');
INSERT INTO `pay_member` VALUES ('118', '2826094848', '9003bdd5c57b6dbdfdcca49e78f53413', '7', '7739', '1', '7', '0.0000', '0.0000', '2826094848@qq.com', '7bd4503fd358b1e0ae9eaaf0d42daf82', '1531830681', '2018', '赵世财', '1', '831139200', '622301199605042010', '18628221139', '2826094848', '网网介', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'q63lb3xkbv91kcf8jkw1993tc6bu5jy3', '0', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('119', 'js996x@gmail', 'c7162302511bb00ae097813e2d9456db', '4', '8715', '118', '0', '0.0000', '0.0000', 'js996x@gmail.com', 'd88565f42697e32dfba2d88b49022151', '1531831971', '0', '温鲁迅', '1', '727977600', '360735199301261214', '13247626715', '2826094848', '广西', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'vmg7uqiuopi1bq0yjm6js21g63i9lisv', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('120', 'gccp21', 'eeb3758ab07504bf1d6cc7898f19c6f5', '4', '8280', '1', '4', '0.0000', '0.0000', '1865487923@qq.com', 'cd995d23089a9484009afd5ab400e18c', '1531995780', '2018', '深受介88', '0', '-28800', '320813198506123251', '13189462578', '1865487923', 'sfFsdfs', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'ujzlmr743wbv9sf3h8drox4orkcjecys', '1', null, '54', '19717.42', '0', '1536544276', '19717.4222', '', '1534397382', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1536497444');
INSERT INTO `pay_member` VALUES ('121', 'lbf00121', '1b06a1c36adbd921eaca3a46fa9063a6', '4', '3172', '1', '4', '0.0000', '0.0000', '784651354@qq.com', '6985c5da595f33d54de6d14487fe167f', '1531997246', '2018', '殷总介8', '0', '-28800', '32091219880216', '13564895264', '784651354', 'adsfasdf', '5ea8b6126d94f2e17684272eb8073973', '1', null, '873xauxstxjliccnjb9ppzvn3zakj1rw', '1', null, '8', '6004.88', '0', '1533266272', '6004.8800', '', '1532590553', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1534235529');
INSERT INTO `pay_member` VALUES ('122', 'lbf10122', 'b7ae51f59f3a4a082721a410bd0ab4c1', '7', '6670', '1', '7', '0.0000', '0.0000', '874652841@qq.com', 'c7ea6b33979bfb6a3d198575a3f0020d', '1532496624', '2018', 'T扬畅', '0', '-28800', '320812198802153651', '13984652357', '874652841', 'asdfasfd', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'f5lrba8kpctixbi8y85u2dl0z30vcu85', '1', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1535290573');
INSERT INTO `pay_member` VALUES ('123', 'erbaoaa', 'b3aff5790265a37a5cb7e9d022431e5a', '4', '8721', '1', '4', '0.0000', '0.0000', '435687987876@qq.com', '90dff982bc83d6ac848dd2f35543ca6b', '1532547886', '2018', '深爱介8', '0', '-28800', '320462198805203264', '13888888888', '88888888', 'asdfafa', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'uhz22fobjasfnkvmg3rphcrmbukzgar0', '1', null, '0', '0.00', '0', '0', '0.0000', '', '1533439293', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1535021123');
INSERT INTO `pay_member` VALUES ('124', 'lbf10124', '93c47bae1811bb155a67976da6bcd41b', '4', '6575', '1', '4', '0.0000', '0.0000', '784561948@qq.com', 'dfc235e24405969188d5673deeb42ce7', '1532749029', '2018', '陈总', '0', '-28800', '320716198905263561', '13756849231', '784561948', 'asdfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'wg12cwkqurhvach50lohgrzne2dwog8k', '1', null, '535', '439069.08', '0', '1536638294', '439069.0670', '', '1534488250', '0', '0', '1', '0', '', '1', '', '', '0', '0', '1536634945');
INSERT INTO `pay_member` VALUES ('125', 'maomao234', '53dcfe5924557d30f49eb97666e16e66', '4', '5441', '1', '4', '0.0000', '0.0000', '7961685461@qq.com', '3401caa984167f7885ec996c8dcd165b', '1533128992', '2018', '大猫介', '0', '-28800', '320612198704196531', '13700000000', '202747', 'sdfafa', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'dpkh63vfnrkq63v07raadswb5b82l1xd', '1', null, '44', '50487.31', '0', '1533957125', '50487.3050', '', '1533517572', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1534608653');
INSERT INTO `pay_member` VALUES ('126', 'lbf10126', 'd132853c349b1ef34039f428900f0c4f', '4', '4163', '122', '0', '0.0000', '0.0000', '4745342324@qq.com', '6e88e4fc8e9dd3852fa02f14d7d65361', '1533284539', '0', '畅介', '0', '-28800', '320921198806126548', '13445956854', '4745342324', 'zsfasfda', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '6nb5a8j5tjuigffavxq1p6pq3movisff', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('127', 'lbf10127', 'eb58b08cefa7d34db21c75bc68bfc18d', '4', '7620', '1', '4', '0.0000', '0.0000', '79651646@qq.com', 'd6a9cd7fdcca3c7b6bc66b6b0285d859', '1533468638', '2018', '铁总', '0', '-28800', '320521198907183221', '13982256486', '79651646', 'adsfasdf', 'bfd925fa86084bd0300fde7fd05ddd97', '1', null, 'lt51etq70jv5kye52hznirpcv44oscrd', '1', null, '222', '76975.36', '0', '1536407227', '76975.3580', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1536586340');
INSERT INTO `pay_member` VALUES ('128', 'lbf10128', 'e5a005a5ee2a9350740a13d1827a94a1', '4', '4934', '44', '0', '0.0000', '0.0000', '746167461@qq.com', '6970f2d05ebb0caeab0b63a14373d930', '1533521215', '0', '大猫介', '0', '-28800', '320625198806203265', '13216895568', '746167461', 'adfadsf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'qyxfxflt9imd6vo8vtnqr3mli12fqnon', '1', null, '19', '25217.70', '0', '1534918987', '25217.7020', ' ', '1533897651', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1536148724');
INSERT INTO `pay_member` VALUES ('129', '76468753468', '84a67489b673bd9622ade0eb3b5f4947', '4', '8643', '44', '0', '0.0000', '0.0000', '87965419865@qq.com', '11185b3cce5abc212d9a1a2797d55955', '1533636872', '0', '大猫介2', '0', '-28800', '325612198904126521', '13596485525', '87965419865', 'asfasdfa', 'c8837b23ff8aaa8a2dde915473ce0991', '0', null, 'jk0g2ner1pr1a9lt3grypecvsozz05ao', '0', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('130', 'meihui28', '921b588be50282c2dd2a083124805156', '4', '3189', '44', '0', '0.0000', '0.0000', '7461687316@qq.com', '22550986083afe6a5c495247268de770', '1533680303', '0', '大猫介2', '0', '-28800', '320512198012153621', '13700000000', '202747', 'adfadf', 'c285504739bae571fb2e8d4c68e9c058', '1', null, 'zijvbh00e6oqynr232tb78irtnafimxt', '1', null, '34', '16809.48', '0', '1536637780', '16809.4800', ' ', '0', '0', '0', '1', '0', 'm.hk0598.com', '0', '', '103.84.111.201\r\n103.84.111.202\r\n103.84.111.203\r\n103.84.111.204\r\n103.84.111.205', '0', '0', '1536585688');
INSERT INTO `pay_member` VALUES ('131', 'meihui712', 'aa6557c59cde23af438fc6a6454f6c8f', '4', '4599', '44', '0', '0.0000', '0.0000', '1599764523@qq.com', 'cfab045f6624a976000fee8a9dfa17f3', '1533680358', '0', '大猫介3', '0', '-28800', '320125199105065428', '13700000000', '202742', 'adfadfa', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'sw8m3aong8vsv1cphjiffyzo9ncwsrzq', '1', null, '8', '14926.29', '0', '1534124649', '14926.2880', ' ', '1534208411', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1534382150');
INSERT INTO `pay_member` VALUES ('132', 'lbf10132', '33401b98714b4cc3691084e5d7602573', '4', '1870', '1', '4', '0.0000', '0.0000', '784616813@qq.com', '05061677319f9234151c3ee3ca2bfeda', '1534561808', '2018', '范范介', '0', '-28800', '320816198907253265', '13526211145', '784616813', 'adsfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'nzhhqgoofbf6yhrh9pxd811p4r188l0q', '1', null, '1', '9.94', '0', '1534593530', '9.9400', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('133', 'lbf10133', '92daee0f1ef2a30ec276656df1bf81a2', '7', '2533', '1', '7', '0.0000', '0.0000', '841635165@qq.com', 'e9a984598de639cadff9d37639580f48', '1534818094', '2018', '傻大兵', '0', '-28800', '320725197906213658', '13219546621', '841635165', 'adsfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, '79318gwjbaxlk8dqus3131vqt01pw2z5', '1', null, '0', '0.00', '0', '0', '0.0000', '', '1535086917', '3', '0', '0', '0', '', '0', '', '', '0', '0', '1534833384');
INSERT INTO `pay_member` VALUES ('134', 'lbf10134', '9f7ad7e74916f5246238c2a2704d9bbd', '4', '7317', '133', '0', '0.0000', '0.0000', '478164986@qq.com', 'e2f25df4fed6f67d9e203f4aef0e374a', '1534822341', '0', '小伟介1', '0', '-28800', '430121199101253684', '13859647552', '478164986', 'adsfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, '4gz8m7gqpmphepi9hhpn580poj9y1r34', '1', null, '3', '2.97', '0', '1535859736', '2.9680', ' ', '0', '0', '0', '1', '0', '448.7766.org', '0', '', '154.48.226.218', '0', '0', '1535178115');
INSERT INTO `pay_member` VALUES ('135', 'lbf10135', 'acdb799e414469994c070813f049c899', '4', '9664', '133', '0', '0.0000', '0.0000', '78415230@qq.com', '7b5179cf674fe63cf3e7c3246e47a54a', '1534918689', '0', '小伟介2', '0', '-28800', '356412198706223654', '13516498522', '78415230', 'adfadf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, '4oe7b58hz1sk7qdbhdeoighjc2g8cla9', '1', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1536042607');
INSERT INTO `pay_member` VALUES ('136', 'lbf10136', '1369eea6f9a61cfcd02508b4c0c9098d', '4', '3593', '133', '0', '0.0000', '0.0000', '46168413@qq.com', '144650f8a25e3de8ff344eb383185734', '1534918858', '0', '小伟介3', '0', '-28800', '156823199003154562', '13965642235', '46168413', 'asdfadfa', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'qjwibufu2w35ptqqbdx2v1x4k198nmh0', '1', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1535205588');
INSERT INTO `pay_member` VALUES ('137', 'lbf10137', '426072fd04b3c7b56f24b0ee817ba1f6', '4', '7753', '133', '0', '0.0000', '0.0000', '13584681@qq.com', '9d2a2b6d62caa699a17a8fa53a495271', '1534918913', '0', '小黄', '0', '-28800', '462145199210143651', '13846232263', '13584681', 'adfadf', '2bbb64f4948501a8769fa209bbf1e406', '1', null, '311im63j2cddb7wz6vlcxazgwdapj3lw', '1', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1536477717');
INSERT INTO `pay_member` VALUES ('138', 'lbf10138', 'ce561d65a2988f8b5e6c60d640504f46', '4', '4238', '133', '0', '0.0000', '0.0000', '7486431@qq.com', '672a04a872881fd3d0ccbe73200425b0', '1534919046', '0', '小伟介5', '0', '-28800', '116452199302363561', '13428651964', '7486431', 'adfasdfa', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, '1q2sqcqpjjk8m429fp3njkvo1hshjzfj', '1', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('139', 'lbf10139', '87a31fc9621b28ebe937639a2915ee9f', '4', '3517', '133', '0', '0.0000', '0.0000', '89463210@qq.com', 'e120ec709ebc6922d3b3d79489d1b81e', '1534919202', '0', '小伟介6', '0', '-28800', '456123199108163541', '13621541685', '89463210', 'adfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, '0ssiii0yzukgsc7s73vpgui1z59gfan7', '1', null, '0', '0.00', '0', '0', '0.0000', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1535005538');
INSERT INTO `pay_member` VALUES ('140', 'mb123', 'ab3b4641811f7428cf4d42ce15e5a86c', '4', '4902', '51', '0', '0.0000', '0.0000', '8496516@qq.com', '88d67fa81a00bad184571b02097a48d6', '1535461632', '0', '明博', '0', '-28800', '320415197910265491', '13759645985', '8496516', 'adsfadsf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'fj12wdhj11zy4ndkhmabbrwutviw5n7j', '1', null, '54', '21434.10', '0', '1536596739', '21434.1040', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1536604720');
INSERT INTO `pay_member` VALUES ('141', 'dj10141', '2d0cbadd278989b97e802e35732a3331', '4', '4309', '1', '4', '0.0000', '0.0000', '874516416@qq.com', '53917befb2a2a3ad004edd9a2c48d9d5', '1535506725', '2018', '大军弟', '0', '-28800', '365415198012143651', '13599654527', '874516416', 'daasdfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, '905dhv6srqu8qae50vno0c9y6e1mdyga', '1', null, '604', '3116626.18', '0', '1536640032', '3116626.1976', '', '0', '0', '0', '1', '0', '', '1', '', '45.76.1.116\r\n223.100.167.65', '0', '0', '1536636303');
INSERT INTO `pay_member` VALUES ('142', 'ying789', '0c97c6399bf27bf8af73e36e5c85c1ab', '4', '7308', '44', '0', '0.0000', '0.0000', '20274720@qq.com', '1bc9784b089df3b3ec56298898a4da05', '1535619748', '0', '王彪', '1', '646585200', '430321199006292235', '13700000000', '20274720', '中国', 'f6606b92d6e970621b19cddbde4de987', '1', null, 'qdzbjw85akp2nbjk4ee3l4myevxl4zkh', '1', null, '17', '120.21', '0', '1536544715', '120.1810', ' ', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1536544855');
INSERT INTO `pay_member` VALUES ('143', 'hceo168', 'a76dc0e448746807788fc40809d8c288', '7', '4075', '1', '7', '0.0000', '0.0000', '84165168@qq.com', '3e29a5a60b64242d3453b5ac8cb0cf4d', '1535708268', '2018', 'Hceo', '0', '-28800', '354612198509301564', '13654852245', '84165168', 'adfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'xm0mkar1ou9gc860temkn8tradx8x9yu', '1', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '0', '0', '', '0', '', '', '0', '0', '1535775988');
INSERT INTO `pay_member` VALUES ('144', 'agent008', '44abc1a6eac53fe247c49306a9659bb6', '7', '5291', '1', '7', '0.0500', '0.0000', '74865184@qq.com', '596af5f0e01488a5a31af9a09838fbe9', '1536581001', '2018', '殷总', '0', '-28800', '320612198809203621', '13594865895', '74865184', 'adsfasdfasf', 'b49089841b9e2a279dae7788091bd743', '1', null, 'lcrg11fpl82ta7ii928hdmh75kkc95pj', '1', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '1', 'tAXBwLXLdKeIY7zXi51ck2lAYjoUYFB2', '', '1', '', '', '0', '0', '1537080400');
INSERT INTO `pay_member` VALUES ('145', 'yin006', 'd436d7f28969ca3a1f2f757d01aa45ee', '4', '8541', '144', '0', '9.9000', '0.0000', '984656165@qq.com', '5e0006a81804f1bce1c3dec5374b2107', '1536917642', '0', '锐创科技', '0', '-28800', '320516198510063651', '13865954862', '984656165', 'afasdfa', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, 'kidte0iv67am1u5v4a1pj8asm74sgaas', '1', null, '1', '9.90', '0', '1536931036', '9.9000', ' ', '0', '0', '0', '0', 'gimpkbC8xL0Rk6yPRnUTD42TDJmOiCMI', '', '0', '', '', '0', '0', '1538117533');
INSERT INTO `pay_member` VALUES ('146', 'wuhan', 'f129887cfe98c3fc8caa27145accab21', '7', '1454', '1', '7', '0.0000', '0.0000', '9731586@qq.com', '44483d652cfffebd604bf9f61a21572d', '1539243100', '2018', 'wuhan', '0', '-28800', '420983197001011310', '13477010089', '', 'hubei', 'e10adc3949ba59abbe56e057f20f883e', '0', null, 'hski22go07n86f2cv4vo23m5x56yoazf', '1', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '1', 'LjraLA9kIEt5Ug1kETj4d2ueM9tkXxh3', '', '1', '', '', '0', '0', '1539243122');
INSERT INTO `pay_member` VALUES ('147', 'lbf10146', 'c288ff960037aed648e46d18ad179fbc', '4', '4095', '1', '4', '0.0000', '0.0000', '987965165@qq.com', '1891fa6e0801a4ac391859a73fcb8238', '1539837955', '2018', '欧阳', '0', '-28800', '361521198906093621', '13185649546', '987965165', 'adsfasdfasdf', 'c8837b23ff8aaa8a2dde915473ce0991', '1', null, '0sn085gfaobj98hpf8hakkpvgotobque', '0', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '0', '', '', '0', '', '', '0', '0', '0');
INSERT INTO `pay_member` VALUES ('148', 'lbf10148', 'bff95a583cce9bbb9c2160b1def3053b', '4', '2107', '1', '4', '0.0000', '0.0000', '98416873@qq.com', '7d7f13606c68c4ae5f5617292749d751', '1539838132', '2018', '欧阳', '0', '-28800', '320985199106083652', '13185264589', '98416873', 'adsfasdf', 'a66b5bfd614d5a62817f2c01cd98a18d', '1', null, 'z65dmgcmw8tlrxcfpl0gdctqubrkx4t0', '1', null, '0', '0.00', '0', '0', '0.0000', '', '0', '0', '0', '0', '6zsfeE7s25dH9HQcqlZXigJO6unorsZD', '', '0', '', '', '0', '0', '1539845328');

-- ----------------------------
-- Table structure for `pay_member_agent_cate`
-- ----------------------------
DROP TABLE IF EXISTS `pay_member_agent_cate`;
CREATE TABLE `pay_member_agent_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) DEFAULT NULL COMMENT '等级名',
  `desc` varchar(255) DEFAULT NULL COMMENT '等级描述',
  `ctime` int(11) DEFAULT '0' COMMENT '添加时间',
  `sort` int(11) DEFAULT '99' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_member_agent_cate
-- ----------------------------
INSERT INTO `pay_member_agent_cate` VALUES ('4', '普通商户', '', '1522638122', '99');
INSERT INTO `pay_member_agent_cate` VALUES ('5', '普通代理商户', '', '1522638122', '99');
INSERT INTO `pay_member_agent_cate` VALUES ('6', '中级代理商户', '', '1522638122', '99');
INSERT INTO `pay_member_agent_cate` VALUES ('7', '高级代理商户', '', '1522638122', '99');

-- ----------------------------
-- Table structure for `pay_moneychange`
-- ----------------------------
DROP TABLE IF EXISTS `pay_moneychange`;
CREATE TABLE `pay_moneychange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户编号',
  `ymoney` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '原金额',
  `money` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '变动金额',
  `gmoney` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '变动后金额',
  `datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `transid` varchar(50) DEFAULT NULL COMMENT '交易流水号',
  `tongdao` smallint(6) unsigned DEFAULT '0' COMMENT '支付通道ID',
  `lx` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `tcuserid` int(11) DEFAULT NULL,
  `tcdengji` int(11) DEFAULT NULL,
  `orderid` varchar(50) DEFAULT NULL COMMENT '订单号',
  `contentstr` varchar(255) DEFAULT NULL COMMENT '备注',
  `t` int(4) NOT NULL DEFAULT '0' COMMENT '结算方式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_moneychange
-- ----------------------------
INSERT INTO `pay_moneychange` VALUES ('1', '8', '0.0000', '100.0000', '100.0000', '2018-09-13 13:24:01', '', '0', '3', null, null, '', '测试【冲正周期:2018-09-13】', '0');
INSERT INTO `pay_moneychange` VALUES ('2', '8', '100.0000', '10.0000', '90.0000', '2018-09-13 13:24:34', 'H0913162741347077', '0', '10', null, null, 'H0913162741347077', '2018-09-13 13:24:34委托提现操作', '0');
INSERT INTO `pay_moneychange` VALUES ('3', '8', '90.0000', '2.0000', '88.0000', '2018-09-13 13:24:34', 'H0913162741347077', '0', '14', null, null, 'H0913162741347077', '2018-09-13 13:24:34代付结算扣除手续费', '0');
INSERT INTO `pay_moneychange` VALUES ('4', '8', '88.0000', '10.0000', '78.0000', '2018-09-13 13:25:30', 'H0913163305737448', '0', '10', null, null, 'H0913163305737448', '2018-09-13 13:25:30委托提现操作', '0');
INSERT INTO `pay_moneychange` VALUES ('5', '8', '78.0000', '2.0000', '76.0000', '2018-09-13 13:25:30', 'H0913163305737448', '0', '14', null, null, 'H0913163305737448', '2018-09-13 13:25:30代付结算扣除手续费', '0');
INSERT INTO `pay_moneychange` VALUES ('6', '8', '76.0000', '10.0000', '86.0000', '2018-09-13 13:25:40', '1', '0', '12', null, null, '1', '代付驳回', '0');
INSERT INTO `pay_moneychange` VALUES ('7', '8', '86.0000', '2.0000', '88.0000', '2018-09-13 13:25:40', '1', '0', '15', null, null, '1', '代付结算驳回退回手续费', '0');
INSERT INTO `pay_moneychange` VALUES ('8', '8', '88.0000', '9.9400', '97.9400', '2018-09-14 17:40:39', '20180914173927102531', '907', '1', null, null, 'E20180914173923340523', 'E20180914173923340523订单充值,结算方式：t+0', '0');
INSERT INTO `pay_moneychange` VALUES ('9', '145', '0.0000', '9.9000', '9.9000', '2018-09-14 21:17:16', '20180914211635514849', '907', '1', null, null, 'E20180914211630223336', 'E20180914211630223336订单充值,结算方式：t+0', '0');
INSERT INTO `pay_moneychange` VALUES ('10', '144', '0.0000', '0.0500', '0.0500', '2018-09-14 21:17:16', '20180914211635514849', '907', '9', '145', '1', 'tx20180914211716', null, '0');
INSERT INTO `pay_moneychange` VALUES ('11', '8', '97.9400', '5000.0000', '5097.9400', '2018-09-18 20:13:05', '', '0', '3', null, null, '', 'dafs【冲正周期:2018-09-18】', '0');
INSERT INTO `pay_moneychange` VALUES ('12', '8', '5097.9400', '5000.0000', '97.9400', '2018-09-18 20:16:28', 'H0918729883086375', '0', '10', null, null, 'H0918729883086375', '2018-09-18 20:16:28委托提现操作', '0');
INSERT INTO `pay_moneychange` VALUES ('13', '8', '97.9400', '2.0000', '95.9400', '2018-09-18 20:16:28', 'H0918729883086375', '0', '14', null, null, 'H0918729883086375', '2018-09-18 20:16:28代付结算扣除手续费', '0');
INSERT INTO `pay_moneychange` VALUES ('14', '8', '95.9400', '395.6120', '491.5520', '2018-10-15 22:59:55', '20181015225927102551', '907', '1', null, null, 'E20181015225922547791', 'E20181015225922547791订单充值,结算方式：t+0', '0');

-- ----------------------------
-- Table structure for `pay_order`
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_memberid` varchar(100) NOT NULL COMMENT '商户编号',
  `pay_orderid` varchar(100) NOT NULL COMMENT '系统订单号',
  `pay_amount` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000',
  `pay_poundage` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000',
  `pay_actualamount` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000',
  `pay_applydate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单创建日期',
  `pay_successdate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单支付成功时间',
  `pay_bankcode` varchar(100) DEFAULT NULL COMMENT '银行编码',
  `pay_notifyurl` varchar(500) NOT NULL COMMENT '商家异步通知地址',
  `pay_callbackurl` varchar(500) NOT NULL COMMENT '商家页面通知地址',
  `pay_bankname` varchar(300) DEFAULT NULL,
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态: 0 未支付 1 已支付未返回 2 已支付已返回',
  `pay_productname` varchar(300) DEFAULT NULL COMMENT '商品名称',
  `pay_tongdao` varchar(50) DEFAULT NULL,
  `pay_zh_tongdao` varchar(50) DEFAULT NULL,
  `pay_tjurl` varchar(1000) DEFAULT NULL,
  `out_trade_id` varchar(50) NOT NULL COMMENT '商户订单号',
  `num` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '已补发次数',
  `memberid` varchar(100) DEFAULT NULL COMMENT '支付渠道商家号',
  `key` varchar(500) DEFAULT NULL COMMENT '支付渠道密钥',
  `account` varchar(100) DEFAULT NULL COMMENT '渠道账号',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '伪删除订单 1 删除 0 未删',
  `ddlx` int(11) DEFAULT '0',
  `pay_ytongdao` varchar(50) DEFAULT NULL,
  `pay_yzh_tongdao` varchar(50) DEFAULT NULL,
  `xx` smallint(6) unsigned NOT NULL DEFAULT '0',
  `attach` text CHARACTER SET utf8mb4 COMMENT '商家附加字段,原样返回',
  `pay_channel_account` varchar(255) DEFAULT NULL COMMENT '通道账户',
  `cost` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '成本',
  `cost_rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '成本费率',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '子账号id',
  `channel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '渠道id',
  `t` tinyint(2) NOT NULL DEFAULT '1' COMMENT '结算周期（计算费率）',
  `last_reissue_time` int(11) NOT NULL DEFAULT '11' COMMENT '最后补发时间',
  `lock_status` tinyint(1) DEFAULT '0' COMMENT '是否冻结订单，1冻结，2解冻',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IND_ORD` (`pay_orderid`),
  KEY `account_id` (`account_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_order
-- ----------------------------
INSERT INTO `pay_order` VALUES ('1', '10008', '20180914164025575156', '1.0000', '0.0060', '0.9940', '1536914425', '0', '907', 'http://100pay.cc/demo/server.php', 'http://100pay.cc/demo/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://100pay.cc/demo/index1.php', 'E20180914163646195083', '0', '929010095025022', 'xMXKwZZfAPEnsG3ftMvteBK5w5YwSD6b', '', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '博宇商贸', '0.0030', '0.0030', '288', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('2', '10008', '20180914164412994956', '1.0000', '0.0060', '0.9940', '1536914652', '0', '907', 'http://100pay.cc/demo/server.php', 'http://100pay.cc/demo/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://100pay.cc/demo/index1.php', 'E20180914164200196305', '0', '929010095025022', 'xMXKwZZfAPEnsG3ftMvteBK5w5YwSD6b', '', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '博宇商贸', '0.0030', '0.0030', '288', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('3', '10008', '20180914164509535157', '1.0000', '0.0250', '0.9750', '1536914709', '0', '903', 'http://100pay.cc/demo/server.php', 'http://100pay.cc/demo/page.php', '支付宝线上扫码', '0', 'VIP基础服务', 'WftAliSmRsa', 'WFT支付宝扫码(中信)', 'http://100pay.cc/demo/index1.php', 'E20180914164440988288', '0', '401500301984', '', '', '0', '0', 'WftAliSmRsa', '威富通支付（支付宝扫码）', '0', '1234|456', '401500301984', '0.0060', '0.0060', '280', '238', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('4', '10008', '20180914164552485398', '1.0000', '0.0220', '0.9780', '1536914752', '0', '908', 'http://100pay.cc/demo/server.php', 'http://100pay.cc/demo/page.php', 'QQ线上扫码', '0', 'VIP基础服务', 'WftQQSmRsa', 'WFTQQ扫码(中信)', 'http://100pay.cc/demo/index1.php', 'E20180914164543762141', '0', '401500301984', '', '', '0', '0', 'WftQQSmRsa', '威富通支付（QQ钱包扫码）', '0', '1234|456', '401500301984', '0.0060', '0.0060', '281', '239', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('5', '10008', '20180914164722974952', '10.0000', '0.0600', '9.9400', '1536914842', '0', '907', 'http://100pay.cc/demo/server.php', 'http://100pay.cc/demo/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://100pay.cc/demo/index1.php', 'E20180914164713288988', '0', '929010095025022', 'xMXKwZZfAPEnsG3ftMvteBK5w5YwSD6b', '', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '博宇商贸', '0.0300', '0.0030', '288', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('6', '10008', '20180914173835984949', '10.0000', '0.0600', '9.9400', '1536917915', '0', '907', 'http://100pay.cc/demo/server.php', 'http://100pay.cc/demo/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://100pay.cc/demo/index1.php', 'E20180914173647820598', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0300', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('7', '10008', '20180914173927102531', '10.0000', '0.0600', '9.9400', '1536917967', '1536918039', '907', 'http://www.100pay.cc/demo/server.php', 'http://www.100pay.cc/demo/page.php', '网银支付', '2', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/demo/index1.php', 'E20180914173923340523', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0300', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('8', '10008', '20180914182956521004', '1.0000', '0.0060', '0.9940', '1536920996', '0', '907', 'http://100pay.cc/demo/server.php', 'http://100pay.cc/demo/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://100pay.cc/demo/index1.php', 'E20180914182756935940', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0030', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('9', '10145', '20180914211537575556', '10.0000', '0.1000', '9.9000', '1536930937', '0', '907', 'http://www.100pay.cc/pay/server.php', 'http://www.100pay.cc/pay/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/yin006/index1.php', 'E20180914211524380555', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0300', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('10', '10145', '20180914211635514849', '10.0000', '0.1000', '9.9000', '1536930995', '1536931036', '907', 'http://www.100pay.cc/pay/server.php', 'http://www.100pay.cc/pay/page.php', '网银支付', '1', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/yin006/index1.php', 'E20180914211630223336', '5', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0300', '0.0030', '230', '214', '0', '1536931121', '0');
INSERT INTO `pay_order` VALUES ('11', '10145', '20180914212310101515', '1499.0000', '14.9900', '1484.0100', '1536931390', '0', '907', 'http://100pay.cc/pay/server.php', 'http://100pay.cc/pay/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://100pay.cc/yin006/index1.php', 'E20180914212239775463', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '4.4970', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('12', '10145', '20180914213028525598', '1.0000', '0.0100', '0.9900', '1536931828', '0', '907', 'http://www.100pay.cc/pay/server.php', 'http://www.100pay.cc/pay/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/yin006/index1.php', 'E20180914213005675204', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0030', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('13', '10145', '20180916153022101985', '1.0000', '0.0100', '0.9900', '1537083022', '0', '907', 'http://www.100pay.cc/pay/server.php', 'http://www.100pay.cc/pay/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/yin006/index1.php', 'E20180916153016677026', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0030', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('14', '10145', '20180916153225575598', '1.0000', '0.0100', '0.9900', '1537083145', '0', '907', 'http://www.100pay.cc/pay/server.php', 'http://www.100pay.cc/pay/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/yin006/index1.php', 'E20180916153222237896', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0030', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('15', '10145', '20180916154206101989', '1.0000', '0.0100', '0.9900', '1537083726', '0', '907', 'http://www.100pay.cc/pay/server.php', 'http://www.100pay.cc/pay/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/yin006/index1.php', 'E20180916154144664269', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0030', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('16', '10145', '20180916154446101549', '1.0000', '0.0100', '0.9900', '1537083886', '0', '907', 'http://www.100pay.cc/pay/server.php', 'http://www.100pay.cc/pay/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/yin006/index1.php', 'E20180916154017951830', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0030', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('17', '10145', '20180917223848565597', '1.0000', '0.0100', '0.9900', '1537195128', '0', '907', 'http://www.100pay.cc/pay/server.php', 'http://www.100pay.cc/pay/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/yin006/index1.php', 'E20180917223843713540', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '0.0030', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('18', '10008', '20181015225838101100', '399.0000', '2.3940', '396.6060', '1539615518', '0', '907', 'http://www.100pay.cc/demo/server.php', 'http://www.100pay.cc/demo/page.php', '网银支付', '0', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/demo/index1.php', 'E20181015225818523599', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '1.1970', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('19', '10008', '20181015225927102551', '398.0000', '2.3880', '395.6120', '1539615567', '1539615595', '907', 'http://www.100pay.cc/demo/server.php', 'http://www.100pay.cc/demo/page.php', '网银支付', '2', 'VIP基础服务', 'AnsBank', '网银(爱农)', 'http://www.100pay.cc/demo/index1.php', 'E20181015225922547791', '0', '929080095023568', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '800001', '0', '0', 'AnsBank', '爱农商网银支付', '0', '1234|456', '承德向友', '1.1940', '0.0030', '230', '214', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('20', '10008', '20181020174953495610', '1.0000', '0.0250', '0.9750', '1540028993', '0', '903', 'http://www.u527.com/demo/server.php', 'http://www.u527.com/demo/page.php', '支付宝线上扫码', '0', 'VIP基础服务', 'WftAliSmRsa', 'WFT支付宝扫码(中信)', 'http://www.u527.com/demo/index1.php', 'E20181020174947113921', '0', '401500301984', '', '', '0', '0', 'WftAliSmRsa', '威富通支付（支付宝扫码）', '0', '1234|456', '401500301984', '0.0060', '0.0060', '280', '238', '0', '11', '0');
INSERT INTO `pay_order` VALUES ('21', '10008', '20181020175128489848', '10.0000', '0.3500', '9.6500', '1540029088', '0', '904', 'http://www.u527.com/demo/server.php', 'http://www.u527.com/demo/page.php', '支付宝手机wap', '0', 'VIP基础服务', 'LmAliH5', 'LM(支付宝H5)', 'http://www.u527.com/demo/index1.php', 'E20181020175124580657', '0', '1000000060', '44aIZ6h8e8Z4iT19', '', '0', '0', 'LmAliH5', '澜湄支付(支付宝H5)', '0', '1234|456', '1000000060', '0.2000', '0.0200', '297', '249', '0', '11', '0');

-- ----------------------------
-- Table structure for `pay_pay_channel_extend_fields`
-- ----------------------------
DROP TABLE IF EXISTS `pay_pay_channel_extend_fields`;
CREATE TABLE `pay_pay_channel_extend_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL DEFAULT '0' COMMENT '代付渠道ID',
  `code` varchar(64) NOT NULL DEFAULT '' COMMENT '代付渠道代码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展字段名',
  `alias` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展字段别名',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `etime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_pay_channel_extend_fields
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_pay_for_another`
-- ----------------------------
DROP TABLE IF EXISTS `pay_pay_for_another`;
CREATE TABLE `pay_pay_for_another` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code` varchar(64) NOT NULL COMMENT '代付代码',
  `title` varchar(64) NOT NULL COMMENT '代付名称',
  `mch_id` varchar(255) NOT NULL DEFAULT ' ' COMMENT '商户号',
  `appid` varchar(100) NOT NULL DEFAULT ' ' COMMENT '应用APPID',
  `appsecret` varchar(100) NOT NULL DEFAULT ' ' COMMENT '应用密钥',
  `signkey` varchar(500) NOT NULL DEFAULT ' ' COMMENT '加密的秘钥',
  `public_key` varchar(2000) NOT NULL DEFAULT '' COMMENT '加密的公钥',
  `private_key` varchar(2000) NOT NULL DEFAULT ' ' COMMENT '加密的私钥',
  `exec_gateway` varchar(255) NOT NULL DEFAULT ' ' COMMENT '请求代付的地址',
  `query_gateway` varchar(255) NOT NULL DEFAULT ' ' COMMENT '查询代付的地址',
  `serverreturn` varchar(255) NOT NULL DEFAULT ' ' COMMENT '服务器通知网址',
  `unlockdomain` varchar(255) NOT NULL DEFAULT ' ' COMMENT '防封域名',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更改时间',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1开启 0关闭',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认：1是，0否',
  `cost_rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '成本费率',
  `rate_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '费率类型：按单笔收费0，按比例收费：1',
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='代付通道表';

-- ----------------------------
-- Records of pay_pay_for_another
-- ----------------------------
INSERT INTO `pay_pay_for_another` VALUES ('11', 'Ans', '爱农T0(承德向友)', '929080095023568', '', '', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '', '', 'http://remit.chinagpay.com/bas/BgTrans', 'http://remit.chinagpay.com/bas/BgTrans', '', '', '1521195102', '0', '0', '0.0000', '0');
INSERT INTO `pay_pay_for_another` VALUES ('13', 'AnsT1', '爱农普通(承德向友)', '929080095023568', '', '', 'yVKWScFvy6a8UFKjC8BtR4p3UkDw4YHD', '', '', 'http://remit.chinagpay.com/bas/BgTrans', 'http://remit.chinagpay.com/bas/BgTrans', '', '', '1521296459', '0', '0', '0.0000', '0');
INSERT INTO `pay_pay_for_another` VALUES ('14', 'Ans2', '爱农T0(博宇商贸)', '929010095025022', '', '', 'xMXKwZZfAPEnsG3ftMvteBK5w5YwSD6b', '', '', 'http://remit.chinagpay.com/bas/BgTrans', 'http://remit.chinagpay.com/bas/BgTrans', '', '', '1532688611', '0', '0', '0.0000', '0');
INSERT INTO `pay_pay_for_another` VALUES ('15', 'AnsT12', '爱农普通(博宇商贸)', '929010095025022', '', '', 'xMXKwZZfAPEnsG3ftMvteBK5w5YwSD6b', '', '', 'http://remit.chinagpay.com/bas/BgTrans', 'http://remit.chinagpay.com/bas/BgTrans', '', '', '1532688687', '0', '0', '0.0000', '0');

-- ----------------------------
-- Table structure for `pay_paylog`
-- ----------------------------
DROP TABLE IF EXISTS `pay_paylog`;
CREATE TABLE `pay_paylog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `out_trade_no` varchar(50) NOT NULL,
  `result_code` varchar(50) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `fromuser` varchar(50) NOT NULL,
  `time_end` int(11) unsigned NOT NULL DEFAULT '0',
  `total_fee` smallint(6) unsigned NOT NULL DEFAULT '0',
  `payname` varchar(50) NOT NULL,
  `bank_type` varchar(20) DEFAULT NULL,
  `trade_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IND_TRD` (`transaction_id`),
  UNIQUE KEY `IND_ORD` (`out_trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_paylog
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_product`
-- ----------------------------
DROP TABLE IF EXISTS `pay_product`;
CREATE TABLE `pay_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '通道名称',
  `code` varchar(50) NOT NULL COMMENT '通道代码',
  `polling` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接口模式 0 单独 1 轮询',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付类型 1 微信扫码 2 微信H5 3 支付宝扫码 4 支付宝H5 5 网银跳转 6网银直连  7 百度钱包  8 QQ钱包 9 京东钱包',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `isdisplay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户端显示 1 显示 0 不显示',
  `channel` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '通道ID',
  `weight` text COMMENT '平台默认通道权重',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=916 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_product
-- ----------------------------
INSERT INTO `pay_product` VALUES ('901', '微信手机wap', 'WXJSAPI', '0', '2', '1', '1', '208', '');
INSERT INTO `pay_product` VALUES ('902', '微信线上扫码', 'WXSCAN', '0', '1', '1', '1', '209', '');
INSERT INTO `pay_product` VALUES ('903', '支付宝线上扫码', 'ALISCAN', '0', '3', '1', '1', '212', '');
INSERT INTO `pay_product` VALUES ('904', '支付宝手机wap', 'ALIWAP', '0', '4', '1', '1', '213', '');
INSERT INTO `pay_product` VALUES ('905', 'QQ手机wap', 'QQWAP', '0', '10', '1', '1', '210', '');
INSERT INTO `pay_product` VALUES ('907', '网银支付', 'DBANK', '0', '5', '1', '1', '216', '');
INSERT INTO `pay_product` VALUES ('908', 'QQ线上扫码', 'QSCAN', '0', '8', '1', '1', '211', '');
INSERT INTO `pay_product` VALUES ('909', '百度钱包', 'BAIDU', '0', '7', '0', '0', '0', '');
INSERT INTO `pay_product` VALUES ('910', '京东支付', 'JDPAY', '0', '9', '0', '0', '0', '');
INSERT INTO `pay_product` VALUES ('911', '银联快捷支付', 'YLKJZF', '0', '12', '1', '1', '217', '');
INSERT INTO `pay_product` VALUES ('912', '线上一码付', 'YMF', '0', '13', '0', '0', '0', '');
INSERT INTO `pay_product` VALUES ('913', '银联扫码', 'YLSM', '0', '14', '1', '1', '0', '');

-- ----------------------------
-- Table structure for `pay_product_user`
-- ----------------------------
DROP TABLE IF EXISTS `pay_product_user`;
CREATE TABLE `pay_product_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT ' ',
  `userid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户编号',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '商户通道ID',
  `polling` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接口模式：0 单独 1 轮询',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '通道状态 0 关闭 1 启用',
  `channel` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '指定单独通道ID',
  `weight` varchar(255) DEFAULT NULL COMMENT '通道权重',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1427 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_product_user
-- ----------------------------
INSERT INTO `pay_product_user` VALUES ('14', '2', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('15', '2', '901', '0', '1', '208', '');
INSERT INTO `pay_product_user` VALUES ('16', '2', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('17', '2', '903', '0', '1', '212', '');
INSERT INTO `pay_product_user` VALUES ('18', '2', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('19', '2', '905', '0', '1', '210', '');
INSERT INTO `pay_product_user` VALUES ('20', '6', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('21', '6', '902', '0', '1', '207', '');
INSERT INTO `pay_product_user` VALUES ('22', '6', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('23', '6', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('24', '6', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('25', '6', '907', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('26', '2', '908', '0', '0', '211', '');
INSERT INTO `pay_product_user` VALUES ('27', '2', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('28', '2', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('29', '8', '901', '0', '1', '250', '');
INSERT INTO `pay_product_user` VALUES ('30', '8', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('31', '8', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('32', '8', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('33', '8', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('34', '8', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('35', '8', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('36', '8', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('37', '8', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('38', '21', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('39', '21', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('40', '21', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('41', '21', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('42', '21', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('43', '21', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('44', '21', '908', '0', '0', '203', '');
INSERT INTO `pay_product_user` VALUES ('45', '21', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('46', '21', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('47', '20', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('48', '20', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('49', '20', '903', '0', '1', '236', '');
INSERT INTO `pay_product_user` VALUES ('50', '20', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('51', '20', '905', '0', '0', '219', '');
INSERT INTO `pay_product_user` VALUES ('52', '20', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('53', '20', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('54', '20', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('55', '20', '911', '0', '1', '235', '');
INSERT INTO `pay_product_user` VALUES ('56', '19', '901', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('57', '19', '902', '0', '0', '209', '');
INSERT INTO `pay_product_user` VALUES ('58', '19', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('59', '19', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('60', '19', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('61', '19', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('62', '19', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('63', '19', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('64', '19', '911', '0', '1', '235', '');
INSERT INTO `pay_product_user` VALUES ('65', '18', '901', '0', '1', '250', '');
INSERT INTO `pay_product_user` VALUES ('66', '18', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('67', '18', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('68', '18', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('69', '18', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('70', '18', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('71', '18', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('72', '18', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('73', '18', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('74', '16', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('75', '16', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('76', '16', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('77', '16', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('78', '16', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('79', '16', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('80', '16', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('81', '16', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('82', '16', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('83', '15', '901', '0', '1', '208', '');
INSERT INTO `pay_product_user` VALUES ('84', '15', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('85', '15', '903', '0', '1', '212', '');
INSERT INTO `pay_product_user` VALUES ('86', '15', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('87', '15', '905', '0', '1', '210', '');
INSERT INTO `pay_product_user` VALUES ('88', '15', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('89', '15', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('90', '15', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('91', '15', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('92', '13', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('93', '13', '902', '0', '0', '209', '');
INSERT INTO `pay_product_user` VALUES ('94', '13', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('95', '13', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('96', '13', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('97', '13', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('98', '13', '908', '0', '0', '211', '');
INSERT INTO `pay_product_user` VALUES ('99', '13', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('100', '13', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('101', '12', '901', '0', '1', '208', '');
INSERT INTO `pay_product_user` VALUES ('102', '12', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('103', '12', '903', '0', '1', '212', '');
INSERT INTO `pay_product_user` VALUES ('104', '12', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('105', '12', '905', '0', '1', '210', '');
INSERT INTO `pay_product_user` VALUES ('106', '12', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('107', '12', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('108', '12', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('109', '12', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('110', '11', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('111', '11', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('112', '11', '903', '0', '1', '248', '');
INSERT INTO `pay_product_user` VALUES ('113', '11', '904', '0', '1', '247', '');
INSERT INTO `pay_product_user` VALUES ('114', '11', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('115', '11', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('116', '11', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('117', '11', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('118', '11', '911', '0', '1', '246', '');
INSERT INTO `pay_product_user` VALUES ('119', '9', '901', '0', '1', '208', '');
INSERT INTO `pay_product_user` VALUES ('120', '9', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('121', '9', '903', '0', '1', '236', '');
INSERT INTO `pay_product_user` VALUES ('122', '9', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('123', '9', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('124', '9', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('125', '9', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('126', '9', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('127', '9', '911', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('128', '22', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('129', '22', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('130', '22', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('131', '22', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('132', '22', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('133', '22', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('134', '22', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('135', '22', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('136', '22', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('137', '24', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('138', '24', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('139', '24', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('140', '24', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('141', '24', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('142', '24', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('143', '24', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('144', '24', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('145', '24', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('146', '25', '901', '0', '1', '208', '');
INSERT INTO `pay_product_user` VALUES ('147', '25', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('148', '25', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('149', '25', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('150', '25', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('151', '25', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('152', '25', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('153', '25', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('154', '25', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('155', '26', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('156', '26', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('157', '26', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('158', '26', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('159', '26', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('160', '26', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('161', '26', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('162', '26', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('163', '26', '911', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('164', '23', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('165', '23', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('166', '23', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('167', '23', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('168', '23', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('169', '23', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('170', '23', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('171', '23', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('172', '23', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('173', '27', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('174', '27', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('175', '27', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('176', '27', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('177', '27', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('178', '27', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('179', '27', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('180', '27', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('181', '27', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('182', '28', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('183', '28', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('184', '28', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('185', '28', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('186', '28', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('187', '28', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('188', '28', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('189', '28', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('190', '28', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('191', '29', '901', '0', '1', '250', '');
INSERT INTO `pay_product_user` VALUES ('192', '29', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('193', '29', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('194', '29', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('195', '29', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('196', '29', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('197', '29', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('198', '29', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('199', '29', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('200', '30', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('201', '30', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('202', '30', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('203', '30', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('204', '30', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('205', '30', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('206', '30', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('207', '30', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('208', '30', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('209', '31', '901', '0', '0', '208', '');
INSERT INTO `pay_product_user` VALUES ('210', '31', '902', '0', '0', '209', '');
INSERT INTO `pay_product_user` VALUES ('211', '31', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('212', '31', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('213', '31', '905', '0', '0', '219', '');
INSERT INTO `pay_product_user` VALUES ('214', '31', '907', '0', '0', '214', '');
INSERT INTO `pay_product_user` VALUES ('215', '31', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('216', '31', '910', '0', '0', '222', '');
INSERT INTO `pay_product_user` VALUES ('217', '31', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('218', '32', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('219', '32', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('220', '32', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('221', '32', '904', '0', '1', '220', '');
INSERT INTO `pay_product_user` VALUES ('222', '32', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('223', '32', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('224', '32', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('225', '32', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('226', '32', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('227', '8', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('228', '33', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('229', '33', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('230', '33', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('231', '33', '904', '0', '1', '220', '');
INSERT INTO `pay_product_user` VALUES ('232', '33', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('233', '33', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('234', '33', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('235', '33', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('236', '33', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('237', '33', '912', '0', '1', '221', '');
INSERT INTO `pay_product_user` VALUES ('238', '31', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('239', '19', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('240', '29', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('241', '18', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('242', '24', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('243', '13', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('244', '32', '912', '0', '1', '221', '');
INSERT INTO `pay_product_user` VALUES ('245', '34', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('246', '34', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('247', '34', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('248', '34', '904', '0', '1', '220', '');
INSERT INTO `pay_product_user` VALUES ('249', '34', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('250', '34', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('251', '34', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('252', '34', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('253', '34', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('254', '34', '912', '0', '1', '221', '');
INSERT INTO `pay_product_user` VALUES ('255', '35', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('256', '35', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('257', '35', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('258', '35', '904', '0', '1', '220', '');
INSERT INTO `pay_product_user` VALUES ('259', '35', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('260', '35', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('261', '35', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('262', '35', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('263', '35', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('264', '35', '912', '0', '1', '221', '');
INSERT INTO `pay_product_user` VALUES ('265', '36', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('266', '36', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('267', '36', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('268', '36', '904', '0', '1', '220', '');
INSERT INTO `pay_product_user` VALUES ('269', '36', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('270', '36', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('271', '36', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('272', '36', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('273', '36', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('274', '36', '912', '0', '1', '221', '');
INSERT INTO `pay_product_user` VALUES ('275', '37', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('276', '37', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('277', '37', '903', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('278', '37', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('279', '37', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('280', '37', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('281', '37', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('282', '37', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('283', '37', '911', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('284', '37', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('285', '38', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('286', '38', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('287', '38', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('288', '38', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('289', '38', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('290', '38', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('291', '38', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('292', '38', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('293', '38', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('294', '38', '912', '0', '1', '221', '');
INSERT INTO `pay_product_user` VALUES ('295', '39', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('296', '39', '902', '0', '0', '209', '');
INSERT INTO `pay_product_user` VALUES ('297', '39', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('298', '39', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('299', '39', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('300', '39', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('301', '39', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('302', '39', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('303', '39', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('304', '39', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('305', '40', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('306', '40', '902', '0', '0', '209', '');
INSERT INTO `pay_product_user` VALUES ('307', '40', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('308', '40', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('309', '40', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('310', '40', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('311', '40', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('312', '40', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('313', '40', '911', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('314', '40', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('315', '41', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('316', '41', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('317', '41', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('318', '41', '904', '0', '1', '220', '');
INSERT INTO `pay_product_user` VALUES ('319', '41', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('320', '41', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('321', '41', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('322', '41', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('323', '41', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('324', '41', '912', '0', '1', '221', '');
INSERT INTO `pay_product_user` VALUES ('325', '16', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('326', '42', '901', '0', '0', '208', '');
INSERT INTO `pay_product_user` VALUES ('327', '42', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('328', '42', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('329', '42', '904', '0', '1', '224', '');
INSERT INTO `pay_product_user` VALUES ('330', '42', '905', '0', '1', '210', '');
INSERT INTO `pay_product_user` VALUES ('331', '42', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('332', '42', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('333', '42', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('334', '42', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('335', '42', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('336', '43', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('337', '43', '902', '0', '0', '209', '');
INSERT INTO `pay_product_user` VALUES ('338', '43', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('339', '43', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('340', '43', '905', '0', '1', '210', '');
INSERT INTO `pay_product_user` VALUES ('341', '43', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('342', '43', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('343', '43', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('344', '43', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('345', '43', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('346', '20', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('347', '44', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('348', '44', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('349', '44', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('350', '44', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('351', '44', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('352', '44', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('353', '44', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('354', '44', '910', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('355', '44', '911', '0', '0', '215', '');
INSERT INTO `pay_product_user` VALUES ('356', '44', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('357', '45', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('358', '45', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('359', '45', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('360', '45', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('361', '45', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('362', '45', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('363', '45', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('364', '45', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('365', '45', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('366', '45', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('367', '46', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('368', '46', '902', '0', '0', '209', '');
INSERT INTO `pay_product_user` VALUES ('369', '46', '903', '0', '0', '201', '');
INSERT INTO `pay_product_user` VALUES ('370', '46', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('371', '46', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('372', '46', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('373', '46', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('374', '46', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('375', '46', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('376', '46', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('377', '47', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('378', '47', '902', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('379', '47', '903', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('380', '47', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('381', '47', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('382', '47', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('383', '47', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('384', '47', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('385', '47', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('386', '47', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('387', '25', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('388', '48', '901', '0', '1', '208', '');
INSERT INTO `pay_product_user` VALUES ('389', '48', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('390', '48', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('391', '48', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('392', '48', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('393', '48', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('394', '48', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('395', '48', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('396', '48', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('397', '48', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('398', '49', '901', '0', '1', '208', '');
INSERT INTO `pay_product_user` VALUES ('399', '49', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('400', '49', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('401', '49', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('402', '49', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('403', '49', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('404', '49', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('405', '49', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('406', '49', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('407', '49', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('408', '50', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('409', '50', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('410', '50', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('411', '50', '904', '0', '1', '224', '');
INSERT INTO `pay_product_user` VALUES ('412', '50', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('413', '50', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('414', '50', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('415', '50', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('416', '50', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('417', '50', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('418', '51', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('419', '51', '902', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('420', '51', '903', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('421', '51', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('422', '51', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('423', '51', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('424', '51', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('425', '51', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('426', '51', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('427', '51', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('428', '52', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('429', '52', '902', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('430', '52', '903', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('431', '52', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('432', '52', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('433', '52', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('434', '52', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('435', '52', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('436', '52', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('437', '52', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('438', '53', '901', '0', '0', '208', '');
INSERT INTO `pay_product_user` VALUES ('439', '53', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('440', '53', '903', '0', '0', '201', '');
INSERT INTO `pay_product_user` VALUES ('441', '53', '904', '0', '1', '224', '');
INSERT INTO `pay_product_user` VALUES ('442', '53', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('443', '53', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('444', '53', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('445', '53', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('446', '53', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('447', '53', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('448', '54', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('449', '54', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('450', '54', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('451', '54', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('452', '54', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('453', '54', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('454', '54', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('455', '54', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('456', '54', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('457', '54', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('458', '26', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('459', '55', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('460', '55', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('461', '55', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('462', '55', '904', '0', '1', '224', '');
INSERT INTO `pay_product_user` VALUES ('463', '55', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('464', '55', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('465', '55', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('466', '55', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('467', '55', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('468', '55', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('469', '56', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('470', '56', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('471', '56', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('472', '56', '904', '0', '1', '224', '');
INSERT INTO `pay_product_user` VALUES ('473', '56', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('474', '56', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('475', '56', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('476', '56', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('477', '56', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('478', '56', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('479', '57', '901', '0', '0', '200', '');
INSERT INTO `pay_product_user` VALUES ('480', '57', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('481', '57', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('482', '57', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('483', '57', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('484', '57', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('485', '57', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('486', '57', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('487', '57', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('488', '57', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('489', '58', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('490', '58', '902', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('491', '58', '903', '0', '1', '236', '');
INSERT INTO `pay_product_user` VALUES ('492', '58', '904', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('493', '58', '905', '0', '0', '219', '');
INSERT INTO `pay_product_user` VALUES ('494', '58', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('495', '58', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('496', '58', '910', '0', '0', '222', '');
INSERT INTO `pay_product_user` VALUES ('497', '58', '911', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('498', '58', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('499', '8', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('500', '18', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('501', '20', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('502', '58', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('503', '19', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('504', '54', '913', '0', '1', '223', '');
INSERT INTO `pay_product_user` VALUES ('505', '52', '913', '0', '0', '232', '');
INSERT INTO `pay_product_user` VALUES ('506', '39', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('507', '56', '913', '0', '1', '223', '');
INSERT INTO `pay_product_user` VALUES ('508', '53', '913', '0', '1', '223', '');
INSERT INTO `pay_product_user` VALUES ('509', '40', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('510', '59', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('511', '59', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('512', '59', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('513', '59', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('514', '59', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('515', '59', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('516', '59', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('517', '59', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('518', '59', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('519', '59', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('520', '59', '913', '0', '1', '223', '');
INSERT INTO `pay_product_user` VALUES ('521', '42', '913', '0', '1', '223', '');
INSERT INTO `pay_product_user` VALUES ('522', '29', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('523', '43', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('524', '45', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('525', '47', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('526', '55', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('527', '60', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('528', '60', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('529', '60', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('530', '60', '904', '0', '1', '224', '');
INSERT INTO `pay_product_user` VALUES ('531', '60', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('532', '60', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('533', '60', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('534', '60', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('535', '60', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('536', '60', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('537', '60', '913', '0', '1', '223', '');
INSERT INTO `pay_product_user` VALUES ('538', '50', '913', '0', '1', '223', '');
INSERT INTO `pay_product_user` VALUES ('539', '31', '913', '0', '0', '223', '');
INSERT INTO `pay_product_user` VALUES ('540', '11', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('541', '11', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('542', '61', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('543', '61', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('544', '61', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('545', '61', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('546', '61', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('547', '61', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('548', '61', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('549', '61', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('550', '61', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('551', '61', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('552', '61', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('553', '62', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('554', '62', '902', '0', '1', '209', '');
INSERT INTO `pay_product_user` VALUES ('555', '62', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('556', '62', '904', '0', '1', '224', '');
INSERT INTO `pay_product_user` VALUES ('557', '62', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('558', '62', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('559', '62', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('560', '62', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('561', '62', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('562', '62', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('563', '62', '913', '0', '1', '223', '');
INSERT INTO `pay_product_user` VALUES ('564', '63', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('565', '63', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('566', '63', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('567', '63', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('568', '63', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('569', '63', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('570', '63', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('571', '63', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('572', '63', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('573', '63', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('574', '63', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('575', '64', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('576', '64', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('577', '64', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('578', '64', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('579', '64', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('580', '64', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('581', '64', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('582', '64', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('583', '64', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('584', '64', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('585', '64', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('586', '65', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('587', '65', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('588', '65', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('589', '65', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('590', '65', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('591', '65', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('592', '65', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('593', '65', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('594', '65', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('595', '65', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('596', '65', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('597', '66', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('598', '66', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('599', '66', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('600', '66', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('601', '66', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('602', '66', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('603', '66', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('604', '66', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('605', '66', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('606', '66', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('607', '66', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('608', '69', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('609', '69', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('610', '69', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('611', '69', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('612', '69', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('613', '69', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('614', '69', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('615', '69', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('616', '69', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('617', '69', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('618', '69', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('619', '70', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('620', '70', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('621', '70', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('622', '70', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('623', '70', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('624', '70', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('625', '70', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('626', '70', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('627', '70', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('628', '70', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('629', '70', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('630', '71', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('631', '71', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('632', '71', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('633', '71', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('634', '71', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('635', '71', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('636', '71', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('637', '71', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('638', '71', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('639', '71', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('640', '71', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('641', '72', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('642', '72', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('643', '72', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('644', '72', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('645', '72', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('646', '72', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('647', '72', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('648', '72', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('649', '72', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('650', '72', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('651', '72', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('652', '73', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('653', '73', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('654', '73', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('655', '73', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('656', '73', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('657', '73', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('658', '73', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('659', '73', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('660', '73', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('661', '73', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('662', '73', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('663', '74', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('664', '74', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('665', '74', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('666', '74', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('667', '74', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('668', '74', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('669', '74', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('670', '74', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('671', '74', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('672', '74', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('673', '74', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('674', '75', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('675', '75', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('676', '75', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('677', '75', '904', '0', '0', '213', '');
INSERT INTO `pay_product_user` VALUES ('678', '75', '905', '0', '0', '219', '');
INSERT INTO `pay_product_user` VALUES ('679', '75', '907', '0', '0', '214', '');
INSERT INTO `pay_product_user` VALUES ('680', '75', '908', '0', '0', '211', '');
INSERT INTO `pay_product_user` VALUES ('681', '75', '910', '0', '0', '222', '');
INSERT INTO `pay_product_user` VALUES ('682', '75', '911', '0', '0', '215', '');
INSERT INTO `pay_product_user` VALUES ('683', '75', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('684', '75', '913', '0', '0', '232', '');
INSERT INTO `pay_product_user` VALUES ('685', '76', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('686', '76', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('687', '76', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('688', '76', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('689', '76', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('690', '76', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('691', '76', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('692', '76', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('693', '76', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('694', '76', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('695', '76', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('696', '78', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('697', '78', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('698', '78', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('699', '78', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('700', '78', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('701', '78', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('702', '78', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('703', '78', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('704', '78', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('705', '78', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('706', '78', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('707', '26', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('708', '79', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('709', '79', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('710', '79', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('711', '79', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('712', '79', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('713', '79', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('714', '79', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('715', '79', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('716', '79', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('717', '79', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('718', '79', '913', '0', '1', '223', '');
INSERT INTO `pay_product_user` VALUES ('719', '80', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('720', '80', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('721', '80', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('722', '80', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('723', '80', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('724', '80', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('725', '80', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('726', '80', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('727', '80', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('728', '80', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('729', '80', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('730', '81', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('731', '81', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('732', '81', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('733', '81', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('734', '81', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('735', '81', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('736', '81', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('737', '81', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('738', '81', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('739', '81', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('740', '81', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('741', '82', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('742', '82', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('743', '82', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('744', '82', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('745', '82', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('746', '82', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('747', '82', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('748', '82', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('749', '82', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('750', '82', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('751', '82', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('752', '83', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('753', '83', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('754', '83', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('755', '83', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('756', '83', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('757', '83', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('758', '83', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('759', '83', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('760', '83', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('761', '83', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('762', '83', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('763', '24', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('764', '84', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('765', '84', '902', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('766', '84', '903', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('767', '84', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('768', '84', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('769', '84', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('770', '84', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('771', '84', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('772', '84', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('773', '84', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('774', '84', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('775', '85', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('776', '85', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('777', '85', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('778', '85', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('779', '85', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('780', '85', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('781', '85', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('782', '85', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('783', '85', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('784', '85', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('785', '85', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('786', '86', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('787', '86', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('788', '86', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('789', '86', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('790', '86', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('791', '86', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('792', '86', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('793', '86', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('794', '86', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('795', '86', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('796', '86', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('797', '87', '901', '0', '1', '250', '');
INSERT INTO `pay_product_user` VALUES ('798', '87', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('799', '87', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('800', '87', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('801', '87', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('802', '87', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('803', '87', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('804', '87', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('805', '87', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('806', '87', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('807', '87', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('808', '88', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('809', '88', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('810', '88', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('811', '88', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('812', '88', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('813', '88', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('814', '88', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('815', '88', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('816', '88', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('817', '88', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('818', '88', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('819', '89', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('820', '89', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('821', '89', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('822', '89', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('823', '89', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('824', '89', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('825', '89', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('826', '89', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('827', '89', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('828', '89', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('829', '89', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('830', '90', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('831', '90', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('832', '90', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('833', '90', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('834', '90', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('835', '90', '907', '0', '0', '214', '');
INSERT INTO `pay_product_user` VALUES ('836', '90', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('837', '90', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('838', '90', '911', '0', '0', '215', '');
INSERT INTO `pay_product_user` VALUES ('839', '90', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('840', '90', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('841', '44', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('842', '91', '901', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('843', '91', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('844', '91', '903', '0', '1', '236', '');
INSERT INTO `pay_product_user` VALUES ('845', '91', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('846', '91', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('847', '91', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('848', '91', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('849', '91', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('850', '91', '911', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('851', '91', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('852', '91', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('853', '92', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('854', '92', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('855', '92', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('856', '92', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('857', '92', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('858', '92', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('859', '92', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('860', '92', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('861', '92', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('862', '92', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('863', '92', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('864', '93', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('865', '93', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('866', '93', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('867', '93', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('868', '93', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('869', '93', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('870', '93', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('871', '93', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('872', '93', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('873', '93', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('874', '93', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('875', '13', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('876', '46', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('877', '51', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('878', '94', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('879', '94', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('880', '94', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('881', '94', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('882', '94', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('883', '94', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('884', '94', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('885', '94', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('886', '94', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('887', '94', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('888', '94', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('889', '37', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('890', '95', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('891', '95', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('892', '95', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('893', '95', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('894', '95', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('895', '95', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('896', '95', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('897', '95', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('898', '95', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('899', '95', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('900', '95', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('901', '96', '901', '0', '1', '234', '');
INSERT INTO `pay_product_user` VALUES ('902', '96', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('903', '96', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('904', '96', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('905', '96', '905', '0', '1', '219', '');
INSERT INTO `pay_product_user` VALUES ('906', '96', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('907', '96', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('908', '96', '910', '0', '1', '222', '');
INSERT INTO `pay_product_user` VALUES ('909', '96', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('910', '96', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('911', '96', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('912', '97', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('913', '97', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('914', '97', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('915', '97', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('916', '97', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('917', '97', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('918', '97', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('919', '97', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('920', '97', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('921', '97', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('922', '97', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('923', '98', '901', '0', '0', '208', '');
INSERT INTO `pay_product_user` VALUES ('924', '98', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('925', '98', '903', '0', '1', '236', '');
INSERT INTO `pay_product_user` VALUES ('926', '98', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('927', '98', '905', '0', '0', '219', '');
INSERT INTO `pay_product_user` VALUES ('928', '98', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('929', '98', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('930', '98', '910', '0', '0', '222', '');
INSERT INTO `pay_product_user` VALUES ('931', '98', '911', '0', '1', '235', '');
INSERT INTO `pay_product_user` VALUES ('932', '98', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('933', '98', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('934', '99', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('935', '99', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('936', '99', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('937', '99', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('938', '99', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('939', '99', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('940', '99', '908', '0', '1', '211', '');
INSERT INTO `pay_product_user` VALUES ('941', '99', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('942', '99', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('943', '99', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('944', '99', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('945', '100', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('946', '100', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('947', '100', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('948', '100', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('949', '100', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('950', '100', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('951', '100', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('952', '100', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('953', '100', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('954', '100', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('955', '100', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('956', '101', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('957', '101', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('958', '101', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('959', '101', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('960', '101', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('961', '101', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('962', '101', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('963', '101', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('964', '101', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('965', '101', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('966', '101', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('967', '102', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('968', '102', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('969', '102', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('970', '102', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('971', '102', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('972', '102', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('973', '102', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('974', '102', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('975', '102', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('976', '102', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('977', '102', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('978', '103', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('979', '103', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('980', '103', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('981', '103', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('982', '103', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('983', '103', '907', '0', '0', '214', '');
INSERT INTO `pay_product_user` VALUES ('984', '103', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('985', '103', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('986', '103', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('987', '103', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('988', '103', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('989', '104', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('990', '104', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('991', '104', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('992', '104', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('993', '104', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('994', '104', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('995', '104', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('996', '104', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('997', '104', '911', '0', '1', '233', '');
INSERT INTO `pay_product_user` VALUES ('998', '104', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('999', '104', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1000', '105', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1001', '105', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1002', '105', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1003', '105', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1004', '105', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1005', '105', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1006', '105', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1007', '105', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1008', '105', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1009', '105', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1010', '105', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1011', '106', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1012', '106', '902', '0', '1', '199', '');
INSERT INTO `pay_product_user` VALUES ('1013', '106', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1014', '106', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1015', '106', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1016', '106', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1017', '106', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1018', '106', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1019', '106', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1020', '106', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1021', '106', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1022', '1', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1023', '1', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1024', '1', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1025', '1', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1026', '1', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1027', '1', '907', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1028', '1', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1029', '1', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1030', '1', '911', '0', '1', '235', '');
INSERT INTO `pay_product_user` VALUES ('1031', '1', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1032', '1', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1033', '16', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1034', '107', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1035', '107', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1036', '107', '903', '0', '1', '236', '');
INSERT INTO `pay_product_user` VALUES ('1037', '107', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1038', '107', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1039', '107', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('1040', '107', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1041', '107', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1042', '107', '911', '0', '1', '235', '');
INSERT INTO `pay_product_user` VALUES ('1043', '107', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1044', '107', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1045', '108', '901', '0', '1', '250', '');
INSERT INTO `pay_product_user` VALUES ('1046', '108', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1047', '108', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1048', '108', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1049', '108', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1050', '108', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1051', '108', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1052', '108', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1053', '108', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1054', '108', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1055', '108', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1056', '109', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1057', '109', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1058', '109', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1059', '109', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1060', '109', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1061', '109', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1062', '109', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1063', '109', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1064', '109', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1065', '109', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1066', '109', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1067', '110', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1068', '110', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1069', '110', '903', '0', '1', '236', '');
INSERT INTO `pay_product_user` VALUES ('1070', '110', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1071', '110', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1072', '110', '907', '0', '1', '231', '');
INSERT INTO `pay_product_user` VALUES ('1073', '110', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1074', '110', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1075', '110', '911', '0', '1', '235', '');
INSERT INTO `pay_product_user` VALUES ('1076', '110', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1077', '110', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1078', '111', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1079', '111', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1080', '111', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1081', '111', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1082', '111', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1083', '111', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1084', '111', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1085', '111', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1086', '111', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1087', '111', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1088', '111', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1089', '112', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1090', '112', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1091', '112', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1092', '112', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1093', '112', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1094', '112', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1095', '112', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1096', '112', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1097', '112', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1098', '112', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1099', '112', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1100', '113', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1101', '113', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1102', '113', '903', '0', '1', '236', '');
INSERT INTO `pay_product_user` VALUES ('1103', '113', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1104', '113', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1105', '113', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1106', '113', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1107', '113', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1108', '113', '911', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('1109', '113', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1110', '113', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1111', '9', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1112', '9', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1113', '114', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1114', '114', '902', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('1115', '114', '903', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('1116', '114', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1117', '114', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1118', '114', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1119', '114', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('1120', '114', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1121', '114', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1122', '114', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1123', '114', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1124', '115', '901', '0', '1', '250', '');
INSERT INTO `pay_product_user` VALUES ('1125', '115', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1126', '115', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1127', '115', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1128', '115', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1129', '115', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1130', '115', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1131', '115', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1132', '115', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1133', '115', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1134', '115', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1135', '8', '914', '0', '1', '244', '');
INSERT INTO `pay_product_user` VALUES ('1136', '8', '915', '0', '1', '245', '');
INSERT INTO `pay_product_user` VALUES ('1137', '117', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1138', '117', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1139', '117', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1140', '117', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1141', '117', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1142', '117', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1143', '117', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1144', '117', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1145', '117', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1146', '117', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1147', '117', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1148', '116', '901', '0', '1', '250', '');
INSERT INTO `pay_product_user` VALUES ('1149', '116', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1150', '116', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1151', '116', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1152', '116', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1153', '116', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1154', '116', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1155', '116', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1156', '116', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1157', '116', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1158', '116', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1159', '118', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1160', '118', '902', '0', '1', '199', '');
INSERT INTO `pay_product_user` VALUES ('1161', '118', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1162', '118', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1163', '118', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1164', '118', '907', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1165', '118', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1166', '118', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1167', '118', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1168', '118', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1169', '118', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1170', '119', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1171', '119', '902', '0', '1', '199', '');
INSERT INTO `pay_product_user` VALUES ('1172', '119', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1173', '119', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1174', '119', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1175', '119', '907', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1176', '119', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1177', '119', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1178', '119', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1179', '119', '912', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1180', '119', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1181', '120', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1182', '120', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1183', '120', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1184', '120', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1185', '120', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1186', '120', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1187', '120', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1188', '120', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1189', '120', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1190', '120', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1191', '121', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1192', '121', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1193', '121', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1194', '121', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1195', '121', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1196', '121', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1197', '121', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1198', '121', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1199', '121', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1200', '121', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1201', '123', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1202', '123', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1203', '123', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1204', '123', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1205', '123', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1206', '123', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1207', '123', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1208', '123', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1209', '123', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1210', '123', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1211', '124', '901', '0', '1', '250', '');
INSERT INTO `pay_product_user` VALUES ('1212', '124', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1213', '124', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1214', '124', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1215', '124', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1216', '124', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1217', '124', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1218', '124', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1219', '124', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1220', '124', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1221', '125', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1222', '125', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1223', '125', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1224', '125', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1225', '125', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1226', '125', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1227', '125', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1228', '125', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1229', '125', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1230', '125', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1231', '126', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1232', '126', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1233', '126', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1234', '126', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1235', '126', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1236', '126', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1237', '126', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1238', '126', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1239', '126', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1240', '126', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1241', '127', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1242', '127', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1243', '127', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1244', '127', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1245', '127', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1246', '127', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1247', '127', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1248', '127', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1249', '127', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1250', '127', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1251', '128', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1252', '128', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1253', '128', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1254', '128', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1255', '128', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1256', '128', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1257', '128', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1258', '128', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1259', '128', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1260', '128', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1261', '129', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1262', '129', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1263', '129', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1264', '129', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1265', '129', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1266', '129', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1267', '129', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1268', '129', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1269', '129', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1270', '129', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1271', '131', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1272', '131', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1273', '131', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1274', '131', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1275', '131', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1276', '131', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1277', '131', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1278', '131', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1279', '131', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1280', '131', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1281', '130', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1282', '130', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1283', '130', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1284', '130', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1285', '130', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1286', '130', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1287', '130', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('1288', '130', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1289', '130', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1290', '130', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1291', '132', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1292', '132', '902', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('1293', '132', '903', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('1294', '132', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1295', '132', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1296', '132', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1297', '132', '908', '0', '1', '0', '');
INSERT INTO `pay_product_user` VALUES ('1298', '132', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1299', '132', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1300', '132', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1301', '134', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1302', '134', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1303', '134', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1304', '134', '904', '0', '1', '247', '');
INSERT INTO `pay_product_user` VALUES ('1305', '134', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1306', '134', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1307', '134', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1308', '134', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1309', '134', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1310', '134', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1311', '139', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1312', '139', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1313', '139', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1314', '139', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1315', '139', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1316', '139', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1317', '139', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1318', '139', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1319', '139', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1320', '139', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1321', '138', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1322', '138', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1323', '138', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1324', '138', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1325', '138', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1326', '138', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1327', '138', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1328', '138', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1329', '138', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1330', '138', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1331', '137', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1332', '137', '902', '0', '0', '237', '');
INSERT INTO `pay_product_user` VALUES ('1333', '137', '903', '0', '0', '238', '');
INSERT INTO `pay_product_user` VALUES ('1334', '137', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1335', '137', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1336', '137', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1337', '137', '908', '0', '0', '239', '');
INSERT INTO `pay_product_user` VALUES ('1338', '137', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1339', '137', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1340', '137', '913', '0', '0', '232', '');
INSERT INTO `pay_product_user` VALUES ('1341', '136', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1342', '136', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1343', '136', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1344', '136', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1345', '136', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1346', '136', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1347', '136', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1348', '136', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1349', '136', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1350', '136', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1351', '135', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1352', '135', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1353', '135', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1354', '135', '904', '0', '1', '213', '');
INSERT INTO `pay_product_user` VALUES ('1355', '135', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1356', '135', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1357', '135', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1358', '135', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1359', '135', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1360', '135', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1361', '140', '901', '0', '1', '250', '');
INSERT INTO `pay_product_user` VALUES ('1362', '140', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1363', '140', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1364', '140', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1365', '140', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1366', '140', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1367', '140', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1368', '140', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1369', '140', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1370', '140', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1371', '141', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1372', '141', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1373', '141', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1374', '141', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1375', '141', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1376', '141', '907', '0', '0', '214', '');
INSERT INTO `pay_product_user` VALUES ('1377', '141', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1378', '141', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1379', '141', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1380', '141', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1381', '142', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1382', '142', '902', '0', '1', '237', '');
INSERT INTO `pay_product_user` VALUES ('1383', '142', '903', '0', '1', '238', '');
INSERT INTO `pay_product_user` VALUES ('1384', '142', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1385', '142', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1386', '142', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1387', '142', '908', '0', '1', '239', '');
INSERT INTO `pay_product_user` VALUES ('1388', '142', '910', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1389', '142', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1390', '142', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1391', '144', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1392', '144', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1393', '144', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1394', '144', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1395', '144', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1396', '144', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1397', '144', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1398', '144', '911', '0', '1', '215', '');
INSERT INTO `pay_product_user` VALUES ('1399', '144', '913', '0', '1', '232', '');
INSERT INTO `pay_product_user` VALUES ('1400', '145', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1401', '145', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1402', '145', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1403', '145', '904', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1404', '145', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1405', '145', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1406', '145', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1407', '145', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1408', '145', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1409', '147', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1410', '147', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1411', '147', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1412', '147', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1413', '147', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1414', '147', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1415', '147', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1416', '147', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1417', '147', '913', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1418', '148', '901', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1419', '148', '902', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1420', '148', '903', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1421', '148', '904', '0', '1', '249', '');
INSERT INTO `pay_product_user` VALUES ('1422', '148', '905', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1423', '148', '907', '0', '1', '214', '');
INSERT INTO `pay_product_user` VALUES ('1424', '148', '908', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1425', '148', '911', '0', '0', '0', '');
INSERT INTO `pay_product_user` VALUES ('1426', '148', '913', '0', '0', '0', '');

-- ----------------------------
-- Table structure for `pay_reconciliation`
-- ----------------------------
DROP TABLE IF EXISTS `pay_reconciliation`;
CREATE TABLE `pay_reconciliation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT '0' COMMENT '用户ID',
  `order_total_count` int(11) DEFAULT '0' COMMENT '总订单数',
  `order_success_count` int(11) DEFAULT '0' COMMENT '成功订单数',
  `order_fail_count` int(11) DEFAULT '0' COMMENT '未支付订单数',
  `order_total_amount` decimal(15,4) DEFAULT '0.0000' COMMENT '订单总额',
  `order_success_amount` decimal(15,4) DEFAULT '0.0000' COMMENT '订单实付总额',
  `date` date DEFAULT NULL COMMENT '日期',
  `ctime` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_reconciliation
-- ----------------------------
INSERT INTO `pay_reconciliation` VALUES ('1', '145', '4', '1', '3', '1520.0000', '9.9000', '2018-09-14', '1536931593');
INSERT INTO `pay_reconciliation` VALUES ('2', '145', '4', '0', '4', '4.0000', null, '2018-09-16', '1537084043');
INSERT INTO `pay_reconciliation` VALUES ('3', '145', '0', '0', '0', null, null, '2018-09-15', '1537084043');

-- ----------------------------
-- Table structure for `pay_redo_order`
-- ----------------------------
DROP TABLE IF EXISTS `pay_redo_order`;
CREATE TABLE `pay_redo_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作管理员',
  `money` decimal(15,4) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：增加 2：减少',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '冲正备注',
  `date` datetime NOT NULL COMMENT '冲正周期',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_redo_order
-- ----------------------------
INSERT INTO `pay_redo_order` VALUES ('1', '8', '1', '100.0000', '1', '测试【冲正周期:2018-09-13】', '2018-09-13 00:00:00', '1536816241');
INSERT INTO `pay_redo_order` VALUES ('2', '8', '1', '5000.0000', '1', 'dafs【冲正周期:2018-09-18】', '2018-09-18 00:00:00', '1537272785');

-- ----------------------------
-- Table structure for `pay_route`
-- ----------------------------
DROP TABLE IF EXISTS `pay_route`;
CREATE TABLE `pay_route` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `urlstr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_route
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_sms`
-- ----------------------------
DROP TABLE IF EXISTS `pay_sms`;
CREATE TABLE `pay_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_key` varchar(255) DEFAULT NULL COMMENT 'App Key',
  `app_secret` varchar(255) DEFAULT NULL COMMENT 'App Secret',
  `sign_name` varchar(255) DEFAULT NULL COMMENT '默认签名',
  `is_open` int(11) DEFAULT '0' COMMENT '是否开启，0关闭，1开启',
  `admin_mobile` varchar(255) DEFAULT NULL COMMENT '管理员接收手机',
  `is_receive` int(11) DEFAULT '0' COMMENT '是否开启，0关闭，1开启',
  `sms_channel` varchar(20) NOT NULL DEFAULT 'aliyun' COMMENT '短信通道',
  `smsbao_user` varchar(50) NOT NULL DEFAULT '' COMMENT '短信宝账号',
  `smsbao_pass` varchar(50) NOT NULL DEFAULT '' COMMENT '短信宝密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_sms
-- ----------------------------
INSERT INTO `pay_sms` VALUES ('2', 'LTAIRR5X8fMzp3do', 'Ku8NjuKhx9N6igyaHYstZFsc8GplwV', '乐百付', '0', null, '0', 'aliyun', '', '');

-- ----------------------------
-- Table structure for `pay_sms_template`
-- ----------------------------
DROP TABLE IF EXISTS `pay_sms_template`;
CREATE TABLE `pay_sms_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `template_code` varchar(255) DEFAULT NULL COMMENT '模板代码',
  `call_index` varchar(255) DEFAULT NULL COMMENT '调用字符串',
  `template_content` text COMMENT '模板内容',
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_sms_template
-- ----------------------------
INSERT INTO `pay_sms_template` VALUES ('3', '修改支付密码', 'SMS_111795375', 'editPayPassword', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1512202260');
INSERT INTO `pay_sms_template` VALUES ('4', '修改登录密码', 'SMS_111795375', 'editPassword', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1512190115');
INSERT INTO `pay_sms_template` VALUES ('5', '异地登录', 'SMS_111795375', 'loginWarning', '您的账号于${time}登录异常，异常登录地址：${address}，如非本人操纵，请及时修改账号密码。', '1512202260');
INSERT INTO `pay_sms_template` VALUES ('6', '申请结算', 'SMS_111795375', 'clearing', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1512202260');
INSERT INTO `pay_sms_template` VALUES ('7', '委托结算', 'SMS_111795375', 'entrusted', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1512202260');
INSERT INTO `pay_sms_template` VALUES ('8', '绑定手机', 'SMS_119087905', 'bindMobile', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1514534290');
INSERT INTO `pay_sms_template` VALUES ('9', '更新手机', 'SMS_119087905', 'editMobile', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1514535688');
INSERT INTO `pay_sms_template` VALUES ('10', '更新银行卡 ', 'SMS_119087905 ', 'addBankcardSend', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1514535688');
INSERT INTO `pay_sms_template` VALUES ('11', '更新银行卡 ', 'SMS_119087905 ', 'addBankcardSend', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1514535688');
INSERT INTO `pay_sms_template` VALUES ('12', '修改个人资料', 'SMS_0', 'saveProfile', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', null);
INSERT INTO `pay_sms_template` VALUES ('13', '绑定管理员手机号码', 'SMS_119087905', 'adminbindMobile', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('14', '修改管理员手机号码', 'SMS_119087905', 'admineditMobile', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('15', '批量删除订单', 'SMS_119087905', 'delOrderSend', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('16', '解绑谷歌身份验证器', 'SMS_119087905', 'unbindGoogle', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('17', '绑定管理员手机号码', 'SMS_119087905', 'adminbindMobile', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('18', '修改管理员手机号码', 'SMS_119087905', 'admineditMobile', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('19', '批量删除订单', 'SMS_119087905', 'delOrderSend', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('20', '设置订单为已支付', 'SMS_119087905', 'setOrderPaidSend', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('21', '增加/减少余额（冲正）', 'SMS_119087905', 'adjustUserMoneySend', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('22', '提交代付', 'SMS_119087905', 'submitDfSend', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('23', '测试短信', 'SMS_119087905', 'test', '您的验证码为：${code} ，你正在进行${opration}操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');
INSERT INTO `pay_sms_template` VALUES ('24', '系统配置', 'SMS_119087905', 'sysconfig', '您的验证码为：${code} ，您正在进行重要操作，该验证码 5 分钟内有效，请勿泄露于他人。', '1527670734');

-- ----------------------------
-- Table structure for `pay_systembank`
-- ----------------------------
DROP TABLE IF EXISTS `pay_systembank`;
CREATE TABLE `pay_systembank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bankcode` varchar(100) DEFAULT NULL,
  `bankname` varchar(300) DEFAULT NULL,
  `images` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COMMENT='结算银行';

-- ----------------------------
-- Records of pay_systembank
-- ----------------------------
INSERT INTO `pay_systembank` VALUES ('162', 'BOB', '北京银行', 'BOB.gif');
INSERT INTO `pay_systembank` VALUES ('164', 'BEA', '东亚银行', 'BEA.gif');
INSERT INTO `pay_systembank` VALUES ('165', 'ICBC', '中国工商银行', 'ICBC.gif');
INSERT INTO `pay_systembank` VALUES ('166', 'CEB', '中国光大银行', 'CEB.gif');
INSERT INTO `pay_systembank` VALUES ('167', 'GDB', '广发银行', 'GDB.gif');
INSERT INTO `pay_systembank` VALUES ('168', 'HXB', '华夏银行', 'HXB.gif');
INSERT INTO `pay_systembank` VALUES ('169', 'CCB', '中国建设银行', 'CCB.gif');
INSERT INTO `pay_systembank` VALUES ('170', 'BCM', '交通银行', 'BCM.gif');
INSERT INTO `pay_systembank` VALUES ('171', 'CMSB', '中国民生银行', 'CMSB.gif');
INSERT INTO `pay_systembank` VALUES ('172', 'NJCB', '南京银行', 'NJCB.gif');
INSERT INTO `pay_systembank` VALUES ('173', 'NBCB', '宁波银行', 'NBCB.gif');
INSERT INTO `pay_systembank` VALUES ('174', 'ABC', '中国农业银行', '5414c87492ad8.gif');
INSERT INTO `pay_systembank` VALUES ('175', 'PAB', '平安银行', '5414c0929a632.gif');
INSERT INTO `pay_systembank` VALUES ('176', 'BOS', '上海银行', 'BOS.gif');
INSERT INTO `pay_systembank` VALUES ('177', 'SPDB', '上海浦东发展银行', 'SPDB.gif');
INSERT INTO `pay_systembank` VALUES ('178', 'SDB', '深圳发展银行', 'SDB.gif');
INSERT INTO `pay_systembank` VALUES ('179', 'CIB', '兴业银行', 'CIB.gif');
INSERT INTO `pay_systembank` VALUES ('180', 'PSBC', '中国邮政储蓄银行', 'PSBC.gif');
INSERT INTO `pay_systembank` VALUES ('181', 'CMBC', '招商银行', 'CMBC.gif');
INSERT INTO `pay_systembank` VALUES ('182', 'CZB', '浙商银行', 'CZB.gif');
INSERT INTO `pay_systembank` VALUES ('183', 'BOC', '中国银行', 'BOC.gif');
INSERT INTO `pay_systembank` VALUES ('184', 'CNCB', '中信银行', 'CNCB.gif');
INSERT INTO `pay_systembank` VALUES ('193', 'ALIPAY', '支付宝', '58b83a5820644.jpg');
INSERT INTO `pay_systembank` VALUES ('194', 'WXZF', '微信支付', '58b83a757a298.jpg');

-- ----------------------------
-- Table structure for `pay_template`
-- ----------------------------
DROP TABLE IF EXISTS `pay_template`;
CREATE TABLE `pay_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT ' ' COMMENT '模板名称',
  `theme` varchar(255) NOT NULL DEFAULT ' ' COMMENT '模板代码',
  `is_default` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认模板:1是，0否',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `remarks` varchar(255) NOT NULL DEFAULT ' ' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of pay_template
-- ----------------------------
INSERT INTO `pay_template` VALUES ('1', ' 默认模板', 'default', '0', '1524299660', '1524299660', ' 默认模板');
INSERT INTO `pay_template` VALUES ('2', '模板一', 'view1', '0', '1524299660', '1524299660', '模板一');
INSERT INTO `pay_template` VALUES ('3', '模板二', 'view2', '0', '0', '1524623473', '模板二');
INSERT INTO `pay_template` VALUES ('4', '模板三', 'view3', '1', '0', '1524623494', '模板三');

-- ----------------------------
-- Table structure for `pay_tikuanconfig`
-- ----------------------------
DROP TABLE IF EXISTS `pay_tikuanconfig`;
CREATE TABLE `pay_tikuanconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户编号',
  `tkzxmoney` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔最小提款金额',
  `tkzdmoney` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔最大提款金额',
  `dayzdmoney` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当日提款最大总金额',
  `dayzdnum` int(11) NOT NULL DEFAULT '0' COMMENT '当日提款最大次数',
  `t1zt` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'T+1 ：1开启 0 关闭',
  `t0zt` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'T+0 ：1开启 0 关闭',
  `gmt0` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '购买T0',
  `tkzt` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '提款设置 1 开启 0 关闭',
  `tktype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '提款手续费类型 1 每笔 0 比例 ',
  `systemxz` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 系统规则 1 用户规则',
  `sxfrate` varchar(20) DEFAULT NULL COMMENT '单笔提款比例',
  `sxffixed` varchar(20) DEFAULT NULL COMMENT '单笔提款手续费',
  `issystem` tinyint(1) unsigned DEFAULT '0' COMMENT '平台规则 1 是 0 否',
  `allowstart` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '提款允许开始时间',
  `allowend` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '提款允许结束时间',
  `daycardzdmoney` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单人单卡单日最高提现额',
  `auto_df_switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自动代付开关',
  `auto_df_maxmoney` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单笔代付最大金额限制',
  `auto_df_stime` varchar(20) NOT NULL DEFAULT '' COMMENT '自动代付开始时间',
  `auto_df_etime` varchar(20) NOT NULL DEFAULT '' COMMENT '自动代付结束时间',
  `auto_df_max_count` int(11) NOT NULL DEFAULT '0' COMMENT '商户每天自动代付笔数限制',
  `auto_df_max_sum` int(11) NOT NULL DEFAULT '0' COMMENT '商户每天自动代付最大总金额限制',
  `tk_charge_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '扣除手续费方式，0：从到账金额里扣，1：从商户余额里扣',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IND_UID` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_tikuanconfig
-- ----------------------------
INSERT INTO `pay_tikuanconfig` VALUES ('28', '1', '1.00', '49998.00', '10000000.00', '10000', '0', '0', '200.00', '1', '1', '0', '2', '2', '1', '7', '22', '0.00', '0', '0.00', '', '', '0', '0', '1');

-- ----------------------------
-- Table structure for `pay_tikuanholiday`
-- ----------------------------
DROP TABLE IF EXISTS `pay_tikuanholiday`;
CREATE TABLE `pay_tikuanholiday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排除日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='排除节假日';

-- ----------------------------
-- Records of pay_tikuanholiday
-- ----------------------------
INSERT INTO `pay_tikuanholiday` VALUES ('5', '1503676800');
INSERT INTO `pay_tikuanholiday` VALUES ('6', '1503763200');
INSERT INTO `pay_tikuanholiday` VALUES ('8', '1504281600');
INSERT INTO `pay_tikuanholiday` VALUES ('9', '1504368000');

-- ----------------------------
-- Table structure for `pay_tikuanmoney`
-- ----------------------------
DROP TABLE IF EXISTS `pay_tikuanmoney`;
CREATE TABLE `pay_tikuanmoney` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '结算用户ID',
  `websiteid` int(11) NOT NULL DEFAULT '0',
  `payapiid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '结算通道ID',
  `t` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '结算方式: 1 T+1 ,0 T+0',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `datetype` varchar(2) NOT NULL,
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=691 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_tikuanmoney
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_tikuantime`
-- ----------------------------
DROP TABLE IF EXISTS `pay_tikuantime`;
CREATE TABLE `pay_tikuantime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `baiks` tinyint(2) unsigned DEFAULT '0' COMMENT '白天提款开始时间',
  `baijs` tinyint(2) unsigned DEFAULT '0' COMMENT '白天提款结束时间',
  `wanks` tinyint(2) unsigned DEFAULT '0' COMMENT '晚间提款开始时间',
  `wanjs` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='提款时间';

-- ----------------------------
-- Records of pay_tikuantime
-- ----------------------------
INSERT INTO `pay_tikuantime` VALUES ('1', '24', '17', '18', '24');

-- ----------------------------
-- Table structure for `pay_tklist`
-- ----------------------------
DROP TABLE IF EXISTS `pay_tklist`;
CREATE TABLE `pay_tklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `bankname` varchar(300) NOT NULL,
  `bankzhiname` varchar(300) NOT NULL,
  `banknumber` varchar(300) NOT NULL,
  `bankfullname` varchar(300) NOT NULL,
  `sheng` varchar(300) NOT NULL,
  `shi` varchar(300) NOT NULL,
  `sqdatetime` datetime DEFAULT NULL,
  `cldatetime` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `tkmoney` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sxfmoney` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000',
  `money` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000',
  `t` int(4) NOT NULL DEFAULT '1',
  `payapiid` int(11) NOT NULL DEFAULT '0',
  `memo` text COMMENT '备注',
  `tk_charge_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '扣除手续费方式，0：从到账金额里扣，1：从商户余额里扣',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_tklist
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_transaction_config`
-- ----------------------------
DROP TABLE IF EXISTS `pay_transaction_config`;
CREATE TABLE `pay_transaction_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `min_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔最小金额',
  `max_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔最大金额',
  `unit_all_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位时间内交易总金额',
  `all_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当天交易总金额',
  `start_time` tinyint(10) unsigned NOT NULL DEFAULT '0' COMMENT '一天交易开始时间',
  `end_time` tinyint(10) unsigned NOT NULL DEFAULT '0' COMMENT '一天交易结束时间',
  `unit_number` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '单位时间内交易的总笔数',
  `is_system` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否平台规则',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态:1开通，0关闭',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `time_unit` char(1) NOT NULL DEFAULT 'i' COMMENT '限制的时间单位',
  `unit_interval` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '单位时间值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='交易配置';

-- ----------------------------
-- Records of pay_transaction_config
-- ----------------------------
INSERT INTO `pay_transaction_config` VALUES ('1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '1', '0', '0', '0', 'i', '0');

-- ----------------------------
-- Table structure for `pay_updatelog`
-- ----------------------------
DROP TABLE IF EXISTS `pay_updatelog`;
CREATE TABLE `pay_updatelog` (
  `version` varchar(20) NOT NULL,
  `lastupdate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_updatelog
-- ----------------------------

-- ----------------------------
-- Table structure for `pay_user_channel_account`
-- ----------------------------
DROP TABLE IF EXISTS `pay_user_channel_account`;
CREATE TABLE `pay_user_channel_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `account_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '子账号id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启指定账号',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户指定指账号';

-- ----------------------------
-- Records of pay_user_channel_account
-- ----------------------------
INSERT INTO `pay_user_channel_account` VALUES ('1', '141', '297', '0');

-- ----------------------------
-- Table structure for `pay_user_channel_num`
-- ----------------------------
DROP TABLE IF EXISTS `pay_user_channel_num`;
CREATE TABLE `pay_user_channel_num` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT ' ' COMMENT '名称',
  `mch_id` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT ' ' COMMENT '商户号',
  `signkey` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ' ' COMMENT 'MD5密钥',
  `appid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '公众号APPID或商家账号',
  `appsecret` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '公众号APPSECRET或安全码',
  `public_key` text CHARACTER SET utf8 COMMENT '公钥证书',
  `private_key` text CHARACTER SET utf8 COMMENT '私钥证书',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COMMENT='用户接口账号关联表';

-- ----------------------------
-- Records of pay_user_channel_num
-- ----------------------------
INSERT INTO `pay_user_channel_num` VALUES ('4', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '8', '1');
INSERT INTO `pay_user_channel_num` VALUES ('5', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '25', '1');
INSERT INTO `pay_user_channel_num` VALUES ('6', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '24', '1');
INSERT INTO `pay_user_channel_num` VALUES ('7', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '23', '1');
INSERT INTO `pay_user_channel_num` VALUES ('8', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '22', '1');
INSERT INTO `pay_user_channel_num` VALUES ('9', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '20', '1');
INSERT INTO `pay_user_channel_num` VALUES ('10', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '19', '1');
INSERT INTO `pay_user_channel_num` VALUES ('11', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '18', '1');
INSERT INTO `pay_user_channel_num` VALUES ('12', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '16', '1');
INSERT INTO `pay_user_channel_num` VALUES ('13', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '13', '1');
INSERT INTO `pay_user_channel_num` VALUES ('14', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '11', '1');
INSERT INTO `pay_user_channel_num` VALUES ('15', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '9', '1');
INSERT INTO `pay_user_channel_num` VALUES ('16', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '27', '1');
INSERT INTO `pay_user_channel_num` VALUES ('17', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '42', '1');
INSERT INTO `pay_user_channel_num` VALUES ('18', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '29', '0');
INSERT INTO `pay_user_channel_num` VALUES ('19', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '39', '1');
INSERT INTO `pay_user_channel_num` VALUES ('20', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '43', '1');
INSERT INTO `pay_user_channel_num` VALUES ('21', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '41', '1');
INSERT INTO `pay_user_channel_num` VALUES ('22', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '40', '1');
INSERT INTO `pay_user_channel_num` VALUES ('23', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '26', '1');
INSERT INTO `pay_user_channel_num` VALUES ('24', ' ', '8060', '0b44204596c523dc65883fe01a9a714b', '', '', '', '', '36', '1');

-- ----------------------------
-- Table structure for `pay_user_code`
-- ----------------------------
DROP TABLE IF EXISTS `pay_user_code`;
CREATE TABLE `pay_user_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '0找回密码',
  `code` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `ctime` int(11) DEFAULT NULL,
  `uptime` int(11) DEFAULT NULL COMMENT '更新时间',
  `endtime` int(11) DEFAULT NULL COMMENT '有效时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_user_code
-- ----------------------------
INSERT INTO `pay_user_code` VALUES ('6', '0', '78476', 'lbf13046180387', '3250809982@qq.com', null, '0', '1524406193', null, '1524406793');
INSERT INTO `pay_user_code` VALUES ('7', '0', '79593', 'lbf13046180387', '3250809982@qq.com', null, '0', '1524406844', null, '1524407444');
INSERT INTO `pay_user_code` VALUES ('8', '0', '89753', 'lbf13046180387', '3250809982@qq.com', null, '0', '1524407123', null, '1524407723');
INSERT INTO `pay_user_code` VALUES ('9', '0', '23826', 'lbf13046180387', '3250809982@qq.com', null, '0', '1524483318', null, '1524483918');
INSERT INTO `pay_user_code` VALUES ('10', '0', '84076', 'lbf10097', '929368356@qq.com', null, '0', '1531625902', null, '1531626502');

-- ----------------------------
-- Table structure for `pay_user_riskcontrol_config`
-- ----------------------------
DROP TABLE IF EXISTS `pay_user_riskcontrol_config`;
CREATE TABLE `pay_user_riskcontrol_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `min_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔最小金额',
  `max_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔最大金额',
  `unit_all_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单位时间内交易总金额',
  `all_money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当天交易总金额',
  `start_time` tinyint(10) unsigned NOT NULL DEFAULT '0' COMMENT '一天交易开始时间',
  `end_time` tinyint(10) unsigned NOT NULL DEFAULT '0' COMMENT '一天交易结束时间',
  `unit_number` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '单位时间内交易的总笔数',
  `is_system` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否平台规则',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态:1开通，0关闭',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `time_unit` char(1) NOT NULL DEFAULT 'i' COMMENT '限制的时间单位',
  `unit_interval` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '单位时间值',
  `domain` varchar(255) NOT NULL DEFAULT ' ' COMMENT '防封域名',
  `systemxz` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 系统规则 1 用户规则',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='交易配置';

-- ----------------------------
-- Records of pay_user_riskcontrol_config
-- ----------------------------
INSERT INTO `pay_user_riskcontrol_config` VALUES ('1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '1', '0', '1522289886', '0', 'i', '0', '', '0');

-- ----------------------------
-- Table structure for `pay_userrate`
-- ----------------------------
DROP TABLE IF EXISTS `pay_userrate`;
CREATE TABLE `pay_userrate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `payapiid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '通道ID',
  `feilv` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '运营费率',
  `fengding` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '封顶费率',
  `t0feilv` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT 'T0运营费率',
  `t0fengding` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT 'T0封顶费率',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1391 DEFAULT CHARSET=utf8 COMMENT='商户通道费率';

-- ----------------------------
-- Records of pay_userrate
-- ----------------------------
INSERT INTO `pay_userrate` VALUES ('21', '2', '907', '0.0030', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('22', '2', '901', '0.0250', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('23', '2', '902', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('24', '3', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('25', '3', '902', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('26', '3', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('27', '3', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('28', '3', '907', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('29', '4', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('30', '4', '902', '0.0600', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('31', '4', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('32', '4', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('33', '4', '907', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('34', '5', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('35', '5', '902', '0.0900', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('36', '5', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('37', '5', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('38', '5', '907', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('39', '6', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('40', '6', '902', '0.1000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('41', '6', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('42', '6', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('43', '6', '907', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('44', '8', '901', '0.0300', '0.0500', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('45', '8', '902', '0.0250', '0.0500', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('46', '8', '903', '0.0250', '0.0500', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('47', '8', '904', '0.0350', '0.0500', '0.0350', '0.0000');
INSERT INTO `pay_userrate` VALUES ('48', '8', '905', '0.0320', '0.0500', '0.0320', '0.0000');
INSERT INTO `pay_userrate` VALUES ('49', '8', '907', '0.0060', '0.0100', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('50', '8', '908', '0.0220', '0.0500', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('51', '8', '910', '0.0150', '0.0200', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('52', '8', '911', '0.0150', '0.0200', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('53', '21', '901', '0.0320', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('54', '21', '902', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('55', '21', '903', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('56', '21', '904', '0.0420', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('57', '21', '905', '0.0320', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('58', '21', '907', '0.0060', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('59', '21', '908', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('60', '21', '910', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('61', '21', '911', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('62', '20', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('63', '20', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('64', '20', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('65', '20', '904', '0.0400', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('66', '20', '905', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('67', '20', '907', '0.0060', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('68', '20', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('69', '20', '910', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('70', '20', '911', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('71', '19', '901', '0.0320', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('72', '19', '902', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('73', '19', '903', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('74', '19', '904', '0.0420', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('75', '19', '905', '0.0320', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('76', '19', '907', '0.0060', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('77', '19', '908', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('78', '19', '910', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('79', '19', '911', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('80', '18', '901', '0.0280', '0.0500', '0.0280', '0.0000');
INSERT INTO `pay_userrate` VALUES ('81', '18', '902', '0.0180', '0.0500', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('82', '18', '903', '0.0180', '0.0500', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('83', '18', '904', '0.0260', '0.0500', '0.0260', '0.0000');
INSERT INTO `pay_userrate` VALUES ('84', '18', '905', '0.0100', '0.0500', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('85', '18', '907', '0.0060', '0.0500', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('86', '18', '908', '0.0180', '0.0500', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('87', '18', '910', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('88', '18', '911', '0.0100', '0.0500', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('89', '16', '901', '0.0300', '0.0500', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('90', '16', '902', '0.0100', '0.0500', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('91', '16', '903', '0.0100', '0.0500', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('92', '16', '904', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('93', '16', '905', '0.0300', '0.0500', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('94', '16', '907', '0.0030', '0.0500', '0.0030', '0.0000');
INSERT INTO `pay_userrate` VALUES ('95', '16', '908', '0.0100', '0.0500', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('96', '16', '910', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('97', '16', '911', '0.0080', '0.0500', '0.0080', '0.0000');
INSERT INTO `pay_userrate` VALUES ('98', '15', '901', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('99', '15', '902', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('100', '15', '903', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('101', '15', '904', '0.0400', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('102', '15', '905', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('103', '15', '907', '0.0060', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('104', '15', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('105', '15', '910', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('106', '15', '911', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('107', '13', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('108', '13', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('109', '13', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('110', '13', '904', '0.0400', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('111', '13', '905', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('112', '13', '907', '0.0060', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('113', '13', '908', '0.0140', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('114', '13', '910', '0.0140', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('115', '13', '911', '0.0140', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('116', '12', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('117', '12', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('118', '12', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('119', '12', '904', '0.0400', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('120', '12', '905', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('121', '12', '907', '0.0050', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('122', '12', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('123', '12', '910', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('124', '12', '911', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('125', '11', '901', '0.0250', '0.0500', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('126', '11', '902', '0.0180', '0.0500', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('127', '11', '903', '0.0180', '0.0500', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('128', '11', '904', '0.0280', '0.0500', '0.0280', '0.0000');
INSERT INTO `pay_userrate` VALUES ('129', '11', '905', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('130', '11', '907', '0.0060', '0.0500', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('131', '11', '908', '0.0180', '0.0500', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('132', '11', '910', '0.0100', '0.0500', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('133', '11', '911', '0.0100', '0.0500', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('134', '9', '901', '0.0320', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('135', '9', '902', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('136', '9', '903', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('137', '9', '904', '0.0420', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('138', '9', '905', '0.0320', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('139', '9', '907', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('140', '9', '908', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('141', '9', '910', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('142', '9', '911', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('143', '2', '903', '0.0250', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('144', '2', '904', '0.0350', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('145', '2', '905', '0.0250', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('146', '2', '908', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('147', '2', '910', '0.0080', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('148', '2', '911', '0.0060', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('149', '22', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('150', '22', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('151', '22', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('152', '22', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('153', '22', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('154', '22', '907', '0.0050', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('155', '22', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('156', '22', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('157', '22', '911', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('158', '24', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('159', '24', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('160', '24', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('161', '24', '904', '0.0400', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('162', '24', '905', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('163', '24', '907', '0.0060', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('164', '24', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('165', '24', '910', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('166', '24', '911', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('167', '25', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('168', '25', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('169', '25', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('170', '25', '904', '0.0400', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('171', '25', '905', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('172', '25', '907', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('173', '25', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('174', '25', '910', '0.0000', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('175', '25', '911', '0.0180', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('176', '26', '901', '0.0300', '0.0500', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('177', '26', '902', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('178', '26', '903', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('179', '26', '904', '0.0400', '0.0500', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('180', '26', '905', '0.0300', '0.0500', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('181', '26', '907', '0.0060', '0.0500', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('182', '26', '908', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('183', '26', '910', '0.0000', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('184', '26', '911', '0.0120', '0.0500', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('185', '27', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('186', '27', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('187', '27', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('188', '27', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('189', '27', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('190', '27', '907', '0.0045', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('191', '27', '908', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('192', '27', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('193', '27', '911', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('194', '28', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('195', '28', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('196', '28', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('197', '28', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('198', '28', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('199', '28', '907', '0.0045', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('200', '28', '908', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('201', '28', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('202', '28', '911', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('203', '29', '901', '0.0300', '0.0500', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('204', '29', '902', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('205', '29', '903', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('206', '29', '904', '0.0400', '0.0500', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('207', '29', '905', '0.0110', '0.0500', '0.0110', '0.0000');
INSERT INTO `pay_userrate` VALUES ('208', '29', '907', '0.0060', '0.0500', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('209', '29', '908', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('210', '29', '910', '0.0110', '0.0500', '0.0110', '0.0000');
INSERT INTO `pay_userrate` VALUES ('211', '29', '911', '0.0110', '0.0500', '0.0110', '0.0000');
INSERT INTO `pay_userrate` VALUES ('212', '30', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('213', '30', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('214', '30', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('215', '30', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('216', '30', '905', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('217', '30', '907', '0.0080', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('218', '30', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('219', '30', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('220', '30', '911', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('221', '31', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('222', '31', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('223', '31', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('224', '31', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('225', '31', '905', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('226', '31', '907', '0.0045', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('227', '31', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('228', '31', '910', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('229', '31', '911', '0.0090', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('230', '32', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('231', '32', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('232', '32', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('233', '32', '904', '0.0420', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('234', '32', '905', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('235', '32', '907', '0.0080', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('236', '32', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('237', '32', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('238', '32', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('239', '33', '904', '0.0420', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('240', '33', '907', '0.0080', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('241', '33', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('242', '33', '912', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('243', '19', '912', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('244', '29', '912', '0.0220', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('245', '24', '912', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('246', '13', '912', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('247', '31', '912', '0.0220', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('248', '32', '912', '0.0220', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('249', '36', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('250', '36', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('251', '36', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('252', '36', '904', '0.0600', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('253', '36', '905', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('254', '36', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('255', '36', '908', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('256', '36', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('257', '36', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('258', '36', '912', '0.0280', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('259', '35', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('260', '35', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('261', '35', '907', '0.0070', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('262', '35', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('263', '35', '912', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('264', '35', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('265', '35', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('266', '35', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('267', '35', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('268', '35', '910', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('269', '38', '905', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('270', '38', '907', '0.0070', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('271', '38', '911', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('272', '38', '912', '0.0250', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('273', '39', '901', '0.0270', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('274', '39', '902', '0.0170', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('275', '39', '903', '0.0170', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('276', '39', '904', '0.0380', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('277', '39', '905', '0.0110', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('278', '39', '907', '0.0040', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('279', '39', '908', '0.0170', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('280', '39', '910', '0.0110', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('281', '39', '911', '0.0080', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('282', '39', '912', '0.0210', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('283', '40', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('284', '40', '902', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('285', '40', '903', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('286', '40', '904', '0.0420', '0.0000', '0.0420', '0.0000');
INSERT INTO `pay_userrate` VALUES ('287', '40', '905', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('288', '40', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('289', '40', '908', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('290', '40', '910', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('291', '40', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('292', '40', '912', '0.0280', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('293', '8', '912', '0.0220', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('294', '38', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('295', '38', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('296', '38', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('297', '38', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('298', '38', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('299', '38', '910', '0.0150', '0.5000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('300', '16', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('301', '42', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('302', '42', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('303', '42', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('304', '42', '904', '0.0350', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('305', '42', '905', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('306', '42', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('307', '42', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('308', '42', '910', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('309', '42', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('310', '42', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('311', '43', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('312', '43', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('313', '43', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('314', '43', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('315', '43', '905', '0.0110', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('316', '43', '907', '0.0050', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('317', '43', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('318', '43', '910', '0.0110', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('319', '43', '911', '0.0110', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('320', '43', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('321', '44', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('322', '44', '902', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('323', '44', '903', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('324', '44', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('325', '44', '905', '0.0280', '0.0000', '0.0280', '0.0000');
INSERT INTO `pay_userrate` VALUES ('326', '44', '907', '0.0050', '0.0000', '0.0050', '0.0000');
INSERT INTO `pay_userrate` VALUES ('327', '44', '908', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('328', '44', '910', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('329', '44', '911', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('330', '44', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('331', '45', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('332', '45', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('333', '45', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('334', '45', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('335', '45', '905', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('336', '45', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('337', '45', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('338', '45', '910', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('339', '45', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('340', '45', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('341', '20', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('342', '46', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('343', '46', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('344', '46', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('345', '46', '904', '0.0420', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('346', '46', '905', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('347', '46', '907', '0.0070', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('348', '46', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('349', '46', '910', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('350', '46', '911', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('351', '46', '912', '0.0000', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('352', '47', '901', '0.0300', '0.0500', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('353', '47', '902', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('354', '47', '903', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('355', '47', '904', '0.0400', '0.0500', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('356', '47', '905', '0.0300', '0.0500', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('357', '47', '907', '0.0060', '0.0500', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('358', '47', '908', '0.0200', '0.0500', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('359', '47', '910', '0.0150', '0.0500', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('360', '47', '911', '0.0150', '0.0500', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('361', '47', '912', '0.0000', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('362', '48', '901', '0.0280', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('363', '48', '902', '0.0180', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('364', '48', '903', '0.0180', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('365', '48', '904', '0.0380', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('366', '48', '905', '0.0280', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('367', '48', '907', '0.0045', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('368', '48', '908', '0.0180', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('369', '48', '910', '0.0130', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('370', '48', '911', '0.0100', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('371', '48', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('372', '18', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('373', '49', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('374', '49', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('375', '49', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('376', '49', '904', '0.0400', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('377', '49', '905', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('378', '49', '907', '0.0060', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('379', '49', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('380', '49', '910', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('381', '49', '911', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('382', '49', '912', '0.0000', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('383', '50', '901', '0.0320', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('384', '50', '902', '0.0220', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('385', '50', '903', '0.0220', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('386', '50', '904', '0.0420', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('387', '50', '905', '0.0320', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('388', '50', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('389', '50', '908', '0.0220', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('390', '50', '910', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('391', '50', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('392', '50', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('393', '51', '901', '0.0280', '0.0000', '0.0280', '0.0000');
INSERT INTO `pay_userrate` VALUES ('394', '51', '902', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('395', '51', '903', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('396', '51', '904', '0.0260', '0.0000', '0.0260', '0.0000');
INSERT INTO `pay_userrate` VALUES ('397', '51', '905', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('398', '51', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('399', '51', '908', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('400', '51', '910', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('401', '51', '911', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('402', '51', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('403', '52', '901', '0.0320', '0.0000', '0.0320', '0.0000');
INSERT INTO `pay_userrate` VALUES ('404', '52', '902', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('405', '52', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('406', '52', '905', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('407', '52', '907', '0.0080', '0.0000', '0.0080', '0.0000');
INSERT INTO `pay_userrate` VALUES ('408', '52', '908', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('409', '52', '910', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('410', '52', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('411', '52', '903', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('412', '52', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('413', '53', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('414', '53', '902', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('415', '53', '903', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('416', '53', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('417', '53', '905', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('418', '53', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('419', '53', '908', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('420', '53', '910', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('421', '53', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('422', '53', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('423', '37', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('424', '37', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('425', '37', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('426', '37', '904', '0.0400', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('427', '37', '905', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('428', '37', '907', '0.0050', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('429', '37', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('430', '37', '910', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('431', '37', '911', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('432', '37', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('433', '54', '901', '0.0320', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('434', '54', '902', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('435', '54', '903', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('436', '54', '904', '0.0400', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('437', '54', '905', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('438', '54', '907', '0.0070', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('439', '54', '908', '0.0220', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('440', '54', '910', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('441', '54', '911', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('442', '54', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('443', '26', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('444', '55', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('445', '55', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('446', '55', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('447', '55', '904', '0.0380', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('448', '55', '905', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('449', '55', '907', '0.0060', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('450', '55', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('451', '55', '910', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('452', '55', '911', '0.0150', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('453', '55', '912', '0.0000', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('454', '56', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('455', '56', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('456', '56', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('457', '56', '904', '0.0370', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('458', '56', '905', '0.0110', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('459', '56', '907', '0.0050', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('460', '56', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('461', '56', '910', '0.0110', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('462', '56', '911', '0.0110', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('463', '56', '912', '0.0000', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('464', '57', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('465', '57', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('466', '57', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('467', '57', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('468', '57', '905', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('469', '57', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('470', '57', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('471', '57', '910', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('472', '57', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('473', '57', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('474', '58', '901', '0.0300', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('475', '58', '902', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('476', '58', '903', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('477', '58', '904', '0.0400', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('478', '58', '905', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('479', '58', '907', '0.0060', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('480', '58', '908', '0.0200', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('481', '58', '910', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('482', '58', '911', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('483', '58', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('484', '18', '913', '0.0110', '0.0000', '0.0110', '0.0000');
INSERT INTO `pay_userrate` VALUES ('485', '20', '913', '0.0110', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('486', '8', '913', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('487', '58', '913', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('488', '19', '913', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('489', '54', '913', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('490', '52', '913', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('491', '39', '913', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('492', '56', '913', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('493', '53', '913', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('494', '40', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('495', '59', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('496', '59', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('497', '59', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('498', '59', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('499', '59', '905', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('500', '59', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('501', '59', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('502', '59', '910', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('503', '59', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('504', '59', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('505', '59', '913', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('506', '43', '913', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('507', '29', '913', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('508', '42', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('509', '45', '913', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('510', '47', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('511', '55', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('512', '60', '901', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('513', '60', '902', '0.0180', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('514', '60', '903', '0.0180', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('515', '60', '904', '0.0380', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('516', '60', '905', '0.0180', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('517', '60', '907', '0.0045', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('518', '60', '908', '0.0180', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('519', '60', '910', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('520', '60', '911', '0.0080', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('521', '60', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('522', '60', '913', '0.0120', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('523', '50', '913', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('524', '31', '913', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('525', '11', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('526', '11', '913', '0.0110', '0.0000', '0.0110', '0.0000');
INSERT INTO `pay_userrate` VALUES ('527', '61', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('528', '61', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('529', '61', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('530', '61', '907', '0.0055', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('531', '61', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('532', '61', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('533', '61', '911', '0.0090', '0.0500', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('534', '61', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('535', '61', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('536', '62', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('537', '62', '904', '0.0350', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('538', '62', '905', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('539', '62', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('540', '62', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('541', '62', '910', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('542', '62', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('543', '62', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('544', '62', '913', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('545', '63', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('546', '63', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('547', '63', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('548', '63', '907', '0.0065', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('549', '63', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('550', '63', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('551', '63', '911', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('552', '63', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('553', '63', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('554', '64', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('555', '64', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('556', '64', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('557', '64', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('558', '64', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('559', '64', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('560', '64', '911', '0.0095', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('561', '64', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('562', '64', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('563', '66', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('564', '66', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('565', '66', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('566', '66', '907', '0.0100', '0.0100', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('567', '66', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('568', '66', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('569', '66', '911', '0.0150', '0.0150', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('570', '66', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('571', '66', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('572', '69', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('573', '69', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('574', '69', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('575', '69', '907', '0.0070', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('576', '69', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('577', '69', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('578', '69', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('579', '69', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('580', '69', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('581', '70', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('582', '70', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('583', '70', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('584', '70', '907', '0.0100', '0.0100', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('585', '70', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('586', '70', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('587', '70', '911', '0.0140', '0.0140', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('588', '70', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('589', '70', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('590', '71', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('591', '71', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('592', '71', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('593', '71', '907', '0.0100', '0.0100', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('594', '71', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('595', '71', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('596', '71', '911', '0.0150', '0.0150', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('597', '71', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('598', '71', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('599', '72', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('600', '72', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('601', '72', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('602', '72', '907', '0.0100', '0.0100', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('603', '72', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('604', '72', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('605', '72', '911', '0.0150', '0.0150', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('606', '72', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('607', '72', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('608', '73', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('609', '73', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('610', '73', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('611', '73', '907', '0.0070', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('612', '73', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('613', '73', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('614', '73', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('615', '73', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('616', '73', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('617', '74', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('618', '74', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('619', '74', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('620', '74', '907', '0.0100', '0.0100', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('621', '74', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('622', '74', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('623', '74', '911', '0.0150', '0.0150', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('624', '74', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('625', '74', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('626', '75', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('627', '75', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('628', '75', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('629', '75', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('630', '75', '905', '0.0220', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('631', '75', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('632', '75', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('633', '75', '910', '0.0180', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('634', '75', '911', '0.0110', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('635', '75', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('636', '75', '913', '0.0160', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('637', '76', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('638', '76', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('639', '76', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('640', '76', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('641', '76', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('642', '76', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('643', '76', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('644', '76', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('645', '76', '911', '0.0110', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('646', '76', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('647', '76', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('648', '78', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('649', '78', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('650', '78', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('651', '78', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('652', '78', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('653', '78', '907', '0.0070', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('654', '78', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('655', '78', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('656', '78', '911', '0.0110', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('657', '78', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('658', '78', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('659', '26', '913', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('660', '79', '901', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('661', '79', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('662', '79', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('663', '79', '904', '0.0380', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('664', '79', '905', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('665', '79', '907', '0.0045', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('666', '79', '908', '0.0180', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('667', '79', '910', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('668', '79', '911', '0.0090', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('669', '79', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('670', '79', '913', '0.0110', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('671', '80', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('672', '80', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('673', '80', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('674', '80', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('675', '80', '905', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('676', '80', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('677', '80', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('678', '80', '910', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('679', '80', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('680', '80', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('681', '80', '913', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('682', '81', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('683', '81', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('684', '81', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('685', '81', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('686', '81', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('687', '81', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('688', '81', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('689', '81', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('690', '81', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('691', '81', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('692', '81', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('693', '82', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('694', '82', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('695', '82', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('696', '82', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('697', '82', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('698', '82', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('699', '82', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('700', '82', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('701', '82', '911', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('702', '82', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('703', '82', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('704', '83', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('705', '83', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('706', '83', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('707', '83', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('708', '83', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('709', '83', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('710', '83', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('711', '83', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('712', '83', '911', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('713', '83', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('714', '83', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('715', '24', '913', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('716', '84', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('717', '84', '902', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('718', '84', '903', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('719', '84', '904', '0.0310', '0.0000', '0.0310', '0.0000');
INSERT INTO `pay_userrate` VALUES ('720', '84', '905', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('721', '84', '907', '0.0080', '0.0000', '0.0080', '0.0000');
INSERT INTO `pay_userrate` VALUES ('722', '84', '908', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('723', '84', '910', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('724', '84', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('725', '84', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('726', '84', '913', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('727', '85', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('728', '85', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('729', '85', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('730', '85', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('731', '85', '905', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('732', '85', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('733', '85', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('734', '85', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('735', '85', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('736', '85', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('737', '85', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('738', '86', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('739', '86', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('740', '86', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('741', '86', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('742', '86', '905', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('743', '86', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('744', '86', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('745', '86', '910', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('746', '86', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('747', '86', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('748', '86', '913', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('749', '87', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('750', '87', '902', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('751', '87', '903', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('752', '87', '904', '0.0310', '0.0000', '0.0310', '0.0000');
INSERT INTO `pay_userrate` VALUES ('753', '87', '905', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('754', '87', '907', '0.0080', '0.0000', '0.0080', '0.0000');
INSERT INTO `pay_userrate` VALUES ('755', '87', '908', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('756', '87', '910', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('757', '87', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('758', '87', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('759', '87', '913', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('760', '88', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('761', '88', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('762', '88', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('763', '88', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('764', '88', '905', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('765', '88', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('766', '88', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('767', '88', '910', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('768', '88', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('769', '88', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('770', '88', '913', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('771', '89', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('772', '89', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('773', '89', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('774', '89', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('775', '89', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('776', '89', '907', '0.0350', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('777', '89', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('778', '89', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('779', '89', '911', '0.0075', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('780', '89', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('781', '89', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('782', '90', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('783', '90', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('784', '90', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('785', '90', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('786', '90', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('787', '90', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('788', '90', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('789', '90', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('790', '90', '911', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('791', '90', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('792', '90', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('793', '91', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('794', '91', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('795', '91', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('796', '91', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('797', '91', '905', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('798', '91', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('799', '91', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('800', '91', '910', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('801', '91', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('802', '91', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('803', '91', '913', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('804', '92', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('805', '92', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('806', '92', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('807', '92', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('808', '92', '905', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('809', '92', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('810', '92', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('811', '92', '910', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('812', '92', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('813', '92', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('814', '92', '913', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('815', '93', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('816', '93', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('817', '93', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('818', '93', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('819', '93', '905', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('820', '93', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('821', '93', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('822', '93', '910', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('823', '93', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('824', '93', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('825', '93', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('826', '94', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('827', '94', '902', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('828', '94', '903', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('829', '94', '904', '0.0310', '0.0000', '0.0310', '0.0000');
INSERT INTO `pay_userrate` VALUES ('830', '94', '905', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('831', '94', '907', '0.0080', '0.0000', '0.0080', '0.0000');
INSERT INTO `pay_userrate` VALUES ('832', '94', '908', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('833', '94', '910', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('834', '94', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('835', '94', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('836', '94', '913', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('837', '51', '913', '0.0110', '0.0000', '0.0110', '0.0000');
INSERT INTO `pay_userrate` VALUES ('838', '95', '901', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('839', '95', '902', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('840', '95', '903', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('841', '95', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('842', '95', '905', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('843', '95', '907', '0.0045', '0.0000', '0.0045', '0.0000');
INSERT INTO `pay_userrate` VALUES ('844', '95', '908', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('845', '95', '910', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('846', '95', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('847', '95', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('848', '95', '913', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('849', '96', '901', '0.0300', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('850', '96', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('851', '96', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('852', '96', '904', '0.0420', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('853', '96', '905', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('854', '96', '907', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('855', '96', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('856', '96', '910', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('857', '96', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('858', '96', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('859', '96', '913', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('860', '97', '901', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('861', '97', '902', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('862', '97', '903', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('863', '97', '904', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('864', '97', '905', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('865', '97', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('866', '97', '908', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('867', '97', '910', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('868', '97', '911', '0.0110', '0.0000', '0.0110', '0.0000');
INSERT INTO `pay_userrate` VALUES ('869', '97', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('870', '97', '913', '0.0110', '0.0000', '0.0110', '0.0000');
INSERT INTO `pay_userrate` VALUES ('871', '98', '901', '0.0250', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('872', '98', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('873', '98', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('874', '98', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('875', '98', '905', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('876', '98', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('877', '98', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('878', '98', '910', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('879', '98', '911', '0.0120', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('880', '98', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('881', '98', '913', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('882', '99', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('883', '99', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('884', '99', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('885', '99', '904', '0.0380', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('886', '99', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('887', '99', '907', '0.0450', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('888', '99', '908', '0.0180', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('889', '99', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('890', '99', '911', '0.0080', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('891', '99', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('892', '99', '913', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('893', '100', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('894', '100', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('895', '100', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('896', '100', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('897', '100', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('898', '100', '907', '0.0042', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('899', '100', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('900', '100', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('901', '100', '911', '0.0065', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('902', '100', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('903', '100', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('904', '101', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('905', '101', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('906', '101', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('907', '101', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('908', '101', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('909', '101', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('910', '101', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('911', '101', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('912', '101', '911', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('913', '101', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('914', '101', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('915', '102', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('916', '102', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('917', '102', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('918', '102', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('919', '102', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('920', '102', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('921', '102', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('922', '102', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('923', '102', '911', '0.0075', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('924', '102', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('925', '102', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('926', '103', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('927', '103', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('928', '103', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('929', '103', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('930', '103', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('931', '103', '907', '0.0070', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('932', '103', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('933', '103', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('934', '103', '911', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('935', '103', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('936', '103', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('937', '104', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('938', '104', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('939', '104', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('940', '104', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('941', '104', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('942', '104', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('943', '104', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('944', '104', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('945', '104', '911', '0.0075', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('946', '104', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('947', '104', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('948', '105', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('949', '105', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('950', '105', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('951', '105', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('952', '105', '905', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('953', '105', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('954', '105', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('955', '105', '910', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('956', '105', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('957', '105', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('958', '105', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('959', '106', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('960', '106', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('961', '106', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('962', '106', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('963', '106', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('964', '106', '907', '0.0070', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('965', '106', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('966', '106', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('967', '106', '911', '0.0130', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('968', '106', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('969', '106', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('970', '107', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('971', '107', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('972', '107', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('973', '107', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('974', '107', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('975', '107', '907', '0.0045', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('976', '107', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('977', '107', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('978', '107', '911', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('979', '107', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('980', '107', '913', '0.0110', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('981', '108', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('982', '108', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('983', '108', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('984', '108', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('985', '108', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('986', '108', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('987', '108', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('988', '108', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('989', '108', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('990', '108', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('991', '108', '913', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('992', '109', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('993', '109', '902', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('994', '109', '903', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('995', '109', '904', '0.0380', '0.0000', '0.0380', '0.0000');
INSERT INTO `pay_userrate` VALUES ('996', '109', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('997', '109', '907', '0.0050', '0.0000', '0.0050', '0.0000');
INSERT INTO `pay_userrate` VALUES ('998', '109', '908', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('999', '109', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1000', '109', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1001', '109', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1002', '109', '913', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1003', '110', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1004', '110', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1005', '110', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1006', '110', '904', '0.0400', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1007', '110', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1008', '110', '907', '0.0060', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1009', '110', '908', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1010', '110', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1011', '110', '911', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1012', '110', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1013', '110', '913', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1014', '16', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1015', '111', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1016', '111', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1017', '111', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1018', '111', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1019', '111', '905', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1020', '111', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1021', '111', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1022', '111', '910', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1023', '111', '911', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1024', '111', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1025', '111', '913', '0.0110', '0.0000', '0.0110', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1026', '112', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1027', '112', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1028', '112', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1029', '112', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1030', '112', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1031', '112', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1032', '112', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1033', '112', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1034', '112', '911', '0.0160', '0.0000', '0.0160', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1035', '112', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1036', '112', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1037', '113', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1038', '113', '902', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1039', '113', '903', '0.0200', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1040', '113', '904', '0.0420', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1041', '113', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1042', '113', '907', '0.0100', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1043', '113', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1044', '113', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1045', '113', '911', '0.0160', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1046', '113', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1047', '113', '913', '0.0150', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1048', '114', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1049', '114', '902', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1050', '114', '903', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1051', '114', '904', '0.0310', '0.0000', '0.0310', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1052', '114', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1053', '114', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1054', '114', '908', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1055', '114', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1056', '114', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1057', '114', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1058', '114', '913', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1059', '115', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1060', '115', '902', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1061', '115', '903', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1062', '115', '904', '0.0310', '0.0000', '0.0310', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1063', '115', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1064', '115', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1065', '115', '908', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1066', '115', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1067', '115', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1068', '115', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1069', '115', '913', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1070', '117', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1071', '117', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1072', '117', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1073', '117', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1074', '117', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1075', '117', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1076', '117', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1077', '117', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1078', '117', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1079', '117', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1080', '117', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1081', '116', '901', '0.0300', '0.0000', '0.0300', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1082', '116', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1083', '116', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1084', '116', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1085', '116', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1086', '116', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1087', '116', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1088', '116', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1089', '116', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1090', '116', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1091', '116', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1092', '118', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1093', '118', '902', '0.0160', '0.0000', '0.0160', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1094', '118', '903', '0.0160', '0.0000', '0.0160', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1095', '118', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1096', '118', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1097', '118', '907', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1098', '118', '908', '0.0160', '0.0000', '0.0160', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1099', '118', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1100', '118', '911', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1101', '118', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1102', '118', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1103', '119', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1104', '119', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1105', '119', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1106', '119', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1107', '119', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1108', '119', '907', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1109', '119', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1110', '119', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1111', '119', '911', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1112', '119', '912', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1113', '119', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1114', '120', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1115', '120', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1116', '120', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1117', '120', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1118', '120', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1119', '120', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1120', '120', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1121', '120', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1122', '120', '911', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1123', '120', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1124', '121', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1125', '121', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1126', '121', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1127', '121', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1128', '121', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1129', '121', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1130', '121', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1131', '121', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1132', '121', '911', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1133', '121', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1134', '122', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1135', '122', '902', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1136', '122', '903', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1137', '122', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1138', '122', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1139', '122', '907', '0.0045', '0.0000', '0.0045', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1140', '122', '908', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1141', '122', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1142', '122', '911', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1143', '122', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1144', '123', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1145', '123', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1146', '123', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1147', '123', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1148', '123', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1149', '123', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1150', '123', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1151', '123', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1152', '123', '911', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1153', '123', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1154', '124', '901', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1155', '124', '902', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1156', '124', '903', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1157', '124', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1158', '124', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1159', '124', '907', '0.0170', '0.0000', '0.0170', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1160', '124', '908', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1161', '124', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1162', '124', '911', '0.0170', '0.0000', '0.0170', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1163', '124', '913', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1164', '125', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1165', '125', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1166', '125', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1167', '125', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1168', '125', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1169', '125', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1170', '125', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1171', '125', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1172', '125', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1173', '125', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1174', '126', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1175', '126', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1176', '126', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1177', '126', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1178', '126', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1179', '126', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1180', '126', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1181', '126', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1182', '126', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1183', '126', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1184', '127', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1185', '127', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1186', '127', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1187', '127', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1188', '127', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1189', '127', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1190', '127', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1191', '127', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1192', '127', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1193', '127', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1194', '44', '913', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1195', '128', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1196', '128', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1197', '128', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1198', '128', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1199', '128', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1200', '128', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1201', '128', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1202', '128', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1203', '128', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1204', '128', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1205', '129', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1206', '129', '902', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1207', '129', '903', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1208', '129', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1209', '129', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1210', '129', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1211', '129', '908', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1212', '129', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1213', '129', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1214', '129', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1215', '131', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1216', '131', '902', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1217', '131', '903', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1218', '131', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1219', '131', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1220', '131', '907', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1221', '131', '908', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1222', '131', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1223', '131', '911', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1224', '131', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1225', '130', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1226', '130', '902', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1227', '130', '903', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1228', '130', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1229', '130', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1230', '130', '907', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1231', '130', '908', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1232', '130', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1233', '130', '911', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1234', '130', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1235', '132', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1236', '132', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1237', '132', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1238', '132', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1239', '132', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1240', '132', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1241', '132', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1242', '132', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1243', '132', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1244', '132', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1245', '133', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1246', '133', '902', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1247', '133', '903', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1248', '133', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1249', '133', '905', '0.0380', '0.0000', '0.0380', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1250', '133', '907', '0.0055', '0.0000', '0.0055', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1251', '133', '908', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1252', '133', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1253', '133', '911', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1254', '133', '913', '0.0120', '0.0000', '0.0120', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1255', '134', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1256', '134', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1257', '134', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1258', '134', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1259', '134', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1260', '134', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1261', '134', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1262', '134', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1263', '134', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1264', '134', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1265', '139', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1266', '139', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1267', '139', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1268', '139', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1269', '139', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1270', '139', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1271', '139', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1272', '139', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1273', '139', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1274', '139', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1275', '138', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1276', '138', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1277', '138', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1278', '138', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1279', '138', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1280', '138', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1281', '138', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1282', '138', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1283', '138', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1284', '138', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1285', '137', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1286', '137', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1287', '137', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1288', '137', '904', '0.0280', '0.0000', '0.0280', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1289', '137', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1290', '137', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1291', '137', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1292', '137', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1293', '137', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1294', '137', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1295', '136', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1296', '136', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1297', '136', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1298', '136', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1299', '136', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1300', '136', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1301', '136', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1302', '136', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1303', '136', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1304', '136', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1305', '135', '901', '0.0000', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1306', '135', '902', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1307', '135', '903', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1308', '135', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1309', '135', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1310', '135', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1311', '135', '908', '0.0200', '0.0000', '0.0200', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1312', '135', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1313', '135', '911', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1314', '135', '913', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1315', '140', '901', '0.0310', '0.0000', '0.0310', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1316', '140', '902', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1317', '140', '903', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1318', '140', '904', '0.0310', '0.0000', '0.0310', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1319', '140', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1320', '140', '907', '0.0080', '0.0000', '0.0080', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1321', '140', '908', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1322', '140', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1323', '140', '911', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1324', '140', '913', '0.0140', '0.0000', '0.0140', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1325', '141', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1326', '141', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1327', '141', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1328', '141', '904', '0.0220', '0.0000', '0.0220', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1329', '141', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1330', '141', '907', '0.0040', '0.0000', '0.0040', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1331', '141', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1332', '141', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1333', '141', '911', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1334', '141', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1335', '142', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1336', '142', '902', '0.0230', '0.0000', '0.0230', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1337', '142', '903', '0.0230', '0.0000', '0.0230', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1338', '142', '904', '0.0400', '0.0000', '0.0400', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1339', '142', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1340', '142', '907', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1341', '142', '908', '0.0230', '0.0000', '0.0230', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1342', '142', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1343', '142', '911', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1344', '142', '913', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1345', '143', '901', '0.0270', '0.0000', '0.0270', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1346', '143', '902', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1347', '143', '903', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1348', '143', '904', '0.0270', '0.0000', '0.0270', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1349', '143', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1350', '143', '907', '0.0055', '0.0000', '0.0055', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1351', '143', '908', '0.0180', '0.0000', '0.0180', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1352', '143', '910', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1353', '143', '911', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1354', '143', '913', '0.0130', '0.0000', '0.0130', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1355', '144', '901', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1356', '144', '902', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1357', '144', '903', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1358', '144', '904', '0.0250', '0.0000', '0.0250', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1359', '144', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1360', '144', '907', '0.0050', '0.0000', '0.0050', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1361', '144', '908', '0.0150', '0.0000', '0.0150', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1362', '144', '911', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1363', '144', '913', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1364', '145', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1365', '145', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1366', '145', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1367', '145', '904', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1368', '145', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1369', '145', '907', '0.0100', '0.0000', '0.0100', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1370', '145', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1371', '145', '911', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1372', '145', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1373', '147', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1374', '147', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1375', '147', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1376', '147', '904', '0.0260', '0.0000', '0.0260', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1377', '147', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1378', '147', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1379', '147', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1380', '147', '911', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1381', '147', '913', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1382', '148', '901', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1383', '148', '902', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1384', '148', '903', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1385', '148', '904', '0.0260', '0.0000', '0.0260', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1386', '148', '905', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1387', '148', '907', '0.0060', '0.0000', '0.0060', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1388', '148', '908', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1389', '148', '911', '0.0000', '0.0000', '0.0000', '0.0000');
INSERT INTO `pay_userrate` VALUES ('1390', '148', '913', '0.0000', '0.0000', '0.0000', '0.0000');

-- ----------------------------
-- Table structure for `pay_version`
-- ----------------------------
DROP TABLE IF EXISTS `pay_version`;
CREATE TABLE `pay_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL DEFAULT '0' COMMENT '版本',
  `author` varchar(255) NOT NULL DEFAULT ' ' COMMENT '作者',
  `save_time` varchar(255) NOT NULL DEFAULT '0000-00-00' COMMENT '修改时间,格式YYYY-mm-dd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='数据库版本表';

-- ----------------------------
-- Records of pay_version
-- ----------------------------
INSERT INTO `pay_version` VALUES ('1', '5.5', '陈嘉杰', '2018-4-8');
INSERT INTO `pay_version` VALUES ('2', '5.6', ' mapeijian', '2018/4/17 17:45:33');
INSERT INTO `pay_version` VALUES ('3', '5.7', ' mio', '2018-4-17');

-- ----------------------------
-- Table structure for `pay_websiteconfig`
-- ----------------------------
DROP TABLE IF EXISTS `pay_websiteconfig`;
CREATE TABLE `pay_websiteconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `websitename` varchar(300) DEFAULT NULL COMMENT '网站名称',
  `domain` varchar(300) DEFAULT NULL COMMENT '网址',
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `qq` varchar(30) DEFAULT NULL,
  `directory` varchar(100) DEFAULT NULL COMMENT '后台目录名称',
  `icp` varchar(100) DEFAULT NULL,
  `tongji` varchar(1000) DEFAULT NULL COMMENT '统计',
  `login` varchar(100) DEFAULT NULL COMMENT '登录地址',
  `payingservice` tinyint(1) unsigned DEFAULT '0' COMMENT '商户代付 1 开启 0 关闭',
  `authorized` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商户认证 1 开启 0 关闭',
  `invitecode` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邀请码注册',
  `company` varchar(200) DEFAULT NULL COMMENT '公司名称',
  `serverkey` varchar(50) DEFAULT NULL COMMENT '授权服务key',
  `withdraw` tinyint(1) DEFAULT '0' COMMENT '提现通知：0关闭，1开启',
  `login_warning_num` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '前台可以错误登录次数',
  `login_ip` varchar(1000) NOT NULL DEFAULT ' ' COMMENT '登录IP',
  `is_repeat_order` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许重复订单:1是，0否',
  `google_auth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启谷歌身份验证登录',
  `df_api` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启代付API',
  `admin_alone_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT '管理员是否只允许同时一次登录',
  `register_need_activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户注册是否需激活',
  `random_mchno` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启随机商户号',
  `max_auth_error_times` int(10) NOT NULL DEFAULT '5' COMMENT '验证错误最大次数',
  `auth_error_ban_time` int(10) NOT NULL DEFAULT '10' COMMENT '验证错误超限冻结时间（分钟）',
  `admin_login_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '管理员登录是否需要短信验证 0：不需要 1：需要',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_websiteconfig
-- ----------------------------
INSERT INTO `pay_websiteconfig` VALUES ('1', 'API支付系统', 'www.u527.com', '12399078@qq.com', '4001234456', '12399078', 'manage', '苏ICP备11049344号-1', '11', '12395916', '1', '1', '1', '卡帝亚网络科技有限公司', '0d6de302cbc615de3b09463acea87662', '1', '5', ' ', '0', '1', '1', '1', '0', '0', '5', '10', '0');

-- ----------------------------
-- Table structure for `pay_wttklist`
-- ----------------------------
DROP TABLE IF EXISTS `pay_wttklist`;
CREATE TABLE `pay_wttklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `bankname` varchar(300) NOT NULL,
  `bankzhiname` varchar(300) NOT NULL,
  `banknumber` varchar(300) NOT NULL,
  `bankfullname` varchar(300) NOT NULL,
  `sheng` varchar(300) NOT NULL,
  `shi` varchar(300) NOT NULL,
  `sqdatetime` datetime DEFAULT NULL,
  `cldatetime` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `tkmoney` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sxfmoney` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '手续费',
  `money` decimal(15,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '实际到账',
  `t` int(4) NOT NULL DEFAULT '1',
  `payapiid` int(11) NOT NULL DEFAULT '0',
  `memo` text COMMENT '备注',
  `additional` varchar(1000) NOT NULL DEFAULT ' ' COMMENT '额外的参数',
  `code` varchar(64) NOT NULL DEFAULT ' ' COMMENT '代码控制器名称',
  `df_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '代付通道id',
  `df_name` varchar(64) NOT NULL DEFAULT ' ' COMMENT '代付名称',
  `orderid` varchar(100) NOT NULL DEFAULT ' ' COMMENT '订单id',
  `cost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本',
  `cost_rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '成本费率',
  `rate_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '费率类型：按单笔收费0，按比例收费：1',
  `extends` text COMMENT '扩展数据',
  `out_trade_no` varchar(30) DEFAULT '' COMMENT '下游订单号',
  `df_api_id` int(11) DEFAULT '0' COMMENT '代付API申请ID',
  `auto_submit_try` int(10) NOT NULL DEFAULT '0' COMMENT '自动代付尝试提交次数',
  `is_auto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自动提交',
  `last_submit_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后提交时间',
  `df_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '代付锁，防止重复提交',
  `auto_query_num` int(10) NOT NULL DEFAULT '0' COMMENT '自动查询次数',
  `channel_mch_id` varchar(50) NOT NULL DEFAULT '' COMMENT '通道商户号',
  `df_charge_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '代付API扣除手续费方式，0：从到账金额里扣，1：从商户余额里扣',
  `transaction_id` varchar(50) NOT NULL DEFAULT '' COMMENT '上游订单号',
  `billno` varchar(50) NOT NULL DEFAULT '' COMMENT '上游交易流水号',
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `df_id` (`df_id`),
  KEY `orderid` (`orderid`),
  KEY `df_api_id` (`df_api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_wttklist
-- ----------------------------
INSERT INTO `pay_wttklist` VALUES ('1', '8', '中国银行', '海门腾达支行', '6217856100076884441', '周运河', '江苏', '南通', '2018-09-13 13:24:34', '2018-09-13 13:25:40', '3', '10.0000', '2.0000', '10.0000', '0', '0', '余额不足', '', 'Ans', '11', '爱农T0(承德向友)', 'H0913162741347077', '0.00', '0.0000', '0', '', '', '0', '0', '0', '0', '0', '0', '929080095023568', '1', '', '');
INSERT INTO `pay_wttklist` VALUES ('2', '8', '中国银行', '海门腾达支行', '6217856100076884441', '周运河', '江苏', '南通', '2018-09-13 13:25:30', '2018-09-13 13:25:53', '2', '10.0000', '2.0000', '10.0000', '0', '0', '交易成功(成功)', '', 'AnsT1', '13', '爱农普通(承德向友)', 'H0913163305737448', '0.00', '0.0000', '0', '', '', '0', '0', '0', '0', '0', '0', '929080095023568', '1', '', '');
INSERT INTO `pay_wttklist` VALUES ('3', '8', '中国邮政储蓄银行', '灌云县支行', '6217993000261656865', '房友梅', '江苏', '连云港', '2018-09-18 20:16:28', '2018-09-18 20:19:01', '2', '5000.0000', '2.0000', '5000.0000', '0', '0', '交易成功', '', 'AnsT1', '13', '爱农普通(承德向友)', 'H0918729883086375', '0.00', '0.0000', '0', '', '', '0', '0', '0', '0', '0', '3', '929080095023568', '1', '', '');
