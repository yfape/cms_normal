/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : scdjcenter

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-07-29 17:01:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `createdate` int(255) DEFAULT NULL,
  `editor` int(3) DEFAULT NULL,
  `col` int(11) DEFAULT '1',
  `faceimg` varchar(255) DEFAULT NULL,
  `faceintro` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `style` int(2) DEFAULT NULL,
  `isphone` int(2) DEFAULT NULL,
  `isweixin` int(2) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=69957 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('17', '测试文章1', '四川党建网', '1594857600', '1', '105', 'upload/20200716/9c04654af97f4c414ee7d9dc937303c3.png', '', 'thumbnail/20200716/5f1016dd74b8b.jpg', '', '10', '1', '1', '1');
INSERT INTO `article` VALUES ('69953', '省纪委监委出台十八条措施服务保障民营经济健康发展', '四川省纪委监委', '1594828800', '99', '106', null, null, null, null, '10', '1', null, null);
INSERT INTO `article` VALUES ('69954', '唱好成渝“双城记”的成都思路：打造中国经济发展第四极 成渝加强合作强化极核效应', '华西都市报', '1594828800', '99', '12', null, null, null, null, '10', '1', null, null);
INSERT INTO `article` VALUES ('69955', '全省区域中心城市热议省委十一届七次全会精神 借势借力 深化与成渝双核协作配套', '四川日报', '1594828800', '99', '2', null, null, null, null, '10', '1', null, null);
INSERT INTO `article` VALUES ('69956', '《求是》杂志发表习近平总书记重要文章《中国共产党领导是中国特色社会主义最本质的特征》', '四川党建网', '1594944000', '1', '2', 'upload/20200717/b4217e9992f0f49462072a7346e657c8.jpg', '', 'thumbnail/20200717/5f11172928918.jpg', 'audio/20200717/5f1116e63eb56.mp3', '10', '3', '1', '1');
INSERT INTO `article` VALUES ('69781', '做好脱贫“必答题”', '四川党的建设杂志社', '1594051200', '99', '106', null, null, null, null, '10', '1', null, null);
INSERT INTO `article` VALUES ('69782', '让年轻干部在基层淬炼成长', '四川党的建设杂志社', '1594051200', '99', '106', null, null, null, null, '10', '1', null, null);

-- ----------------------------
-- Table structure for article_audit
-- ----------------------------
DROP TABLE IF EXISTS `article_audit`;
CREATE TABLE `article_audit` (
  `aid` int(11) NOT NULL,
  `auditor` int(3) DEFAULT NULL,
  `posttime` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_audit
-- ----------------------------
INSERT INTO `article_audit` VALUES ('17', '0', null);
INSERT INTO `article_audit` VALUES ('69953', '99', '1594919211');
INSERT INTO `article_audit` VALUES ('69954', '99', '1594919212');
INSERT INTO `article_audit` VALUES ('69955', '99', '1594919212');
INSERT INTO `article_audit` VALUES ('69956', '0', null);
INSERT INTO `article_audit` VALUES ('69781', '99', '1594956574');
INSERT INTO `article_audit` VALUES ('69782', '99', '1594956575');

-- ----------------------------
-- Table structure for article_check
-- ----------------------------
DROP TABLE IF EXISTS `article_check`;
CREATE TABLE `article_check` (
  `aid` int(11) NOT NULL,
  `check` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_check
-- ----------------------------
INSERT INTO `article_check` VALUES ('17', '{\"textcensor\":[],\"ecnet\":[]}');
INSERT INTO `article_check` VALUES ('69953', '');
INSERT INTO `article_check` VALUES ('69954', '');
INSERT INTO `article_check` VALUES ('69955', '');
INSERT INTO `article_check` VALUES ('69956', '{\"textcensor\":[{\"conclusion\":\"不合规\",\"msg\":\"存在政治敏感不合规\",\"words\":[\"共产党 执政\",\"习近平\",\"总书记\",\"国家主席\",\"中国特色\",\"主席习近\"]}],\"ecnet\":[{\"error_text\":\"使我们党\",\"correct_text\":\"是我们党\"}]}');
INSERT INTO `article_check` VALUES ('69781', '');
INSERT INTO `article_check` VALUES ('69782', '');

-- ----------------------------
-- Table structure for article_content
-- ----------------------------
DROP TABLE IF EXISTS `article_content`;
CREATE TABLE `article_content` (
  `aid` int(8) NOT NULL,
  `content` varchar(20000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_content
-- ----------------------------
INSERT INTO `article_content` VALUES ('17', '&amp;lt;p&amp;gt;测试文章：阿斯顿发射点从拉萨扩大娜拉看到i手机支付v办理宽带近三十快乐的妇女们爱上了斯达舒了；德拉克斯卡死【卡撒大苏打阿三阿三&amp;lt;/p&amp;gt;&amp;lt;p style=&amp;quot;max-width:100%;text-align:center;&amp;quot;&amp;gt;&amp;lt;img style=&amp;quot;max-width:100%;&amp;quot; src=&amp;quot;http://file.scdjw.net/upload/20200716/9c04654af97f4c414ee7d9dc937303c3.png&amp;quot;&amp;gt;&amp;lt;/p&amp;gt;');
INSERT INTO `article_content` VALUES ('69953', '<div style=\"text-align: center;\"><font face=\"宋体\" size=\"3\"><b>省纪委监委出台十八条措施服务保障民营经济健康发展</b></font></div><div style=\"text-align: center;\"><font face=\"宋体\" size=\"3\"><b><br></b></font></div><div style=\"text-align: center;\"><font face=\"宋体\" size=\"3\"><b>坚持问题导向推动惠企政策落地落实</b></font></div><div style=\"text-align: center;\"><br></div><div><font face=\"宋体\" size=\"3\">近日，省纪委监委印发《关于服务保障民营经济健康发展的十八条措施的通知》（以下简称《措施》），要求全省各级纪检监察机关把督促落实“六稳”“六保”部署要求、服务保障民营经济健康发展作为当前一项重要工作摆在突出位置，立足发展大局，聚焦主责主业，创造性地抓好贯彻落实，努力为全省夺取疫情防控和实现经济社会发展目标双胜利提供坚强保障。</font></div><div><font face=\"宋体\" size=\"3\"><br></font></div><div><font face=\"宋体\" size=\"3\">《措施》立足纪检监察职能职责，明确了7个方面18条举措，包括推动惠企政策落地、持续优化营商环境、引导政商亲清交往、联动处置信访举报、保护干事创业激情等，切实发挥纪检监察机关监督保障执行、促进完善发展作用。</font></div><div><font face=\"宋体\" size=\"3\"><br></font></div><div><font face=\"宋体\" size=\"3\">为确保《措施》的针对性、指导性和可操作性，在制定出台过程中，省市两级纪检监察机关召开座谈会22场次，先后听取了300余名民营企业家代表的意见建议，并征求了法检、统战、发改、市场监管等16个省直部门的意见。民营企业家代表认为，《措施》是继去年省委出台《关于推动构建亲清新型政商关系的意见（试行）》之后，又一份为民营经济发展“量身定制”“保驾护航”的重磅文件，措施内容丰富、“干货”满满，给民营企业应对疫情冲击影响、坚定信心谋发展提供了有力保障。</font></div><div><font face=\"宋体\" size=\"3\"><br></font></div><div><font face=\"宋体\" size=\"3\">《措施》坚持问题导向，聚焦民营企业反映强烈的“政策落地有差距”“营商环境有短板”“亲清交往有顾虑”三个方面，立足纪检监察职能职责逐项回应。在政策落地上，提出督促相关部门严格落实中央“六稳”“六保”部署要求，切实解决民营企业反映集中的融资“难贵险”、生产要素成本高、“新官不理旧事”、拖欠账款等问题，加大对受疫情影响民营企业“减负输血”力度。在营商环境上，提出要督促相关职能部门落实好优化营商环境、公平竞争系列具体部署，分层分类开展重点行业领域突出问题系统治理，持续正风肃纪，坚决查处对企业提出的合理诉求故意刁难、推诿扯皮、不作为、慢作为等行为，坚决查处在服务民营经济发展中权力寻租、利益输送、吃拿卡要、徇私舞弊、涉黑涉恶“保护伞”等问题。在规范政商交往上，提出对照政商交往正负面“清单”，旗帜鲜明支持鼓励公职人员帮助民营企业争取政策、项目和资金，为企业发展提供信息咨询、政策解读。</font></div><div><font face=\"宋体\" size=\"3\"><br></font></div><div><font face=\"宋体\" size=\"3\">《措施》坚持实事求是原则，从信访举报、案件查办、案件信息发布等纪检监察业务流程入手，明确依规依纪依法，尽全力保护民营企业合法权益，积极构建民营企业信访举报“绿色通道”，用好“阳光问廉”媒体监督平台，优先办理涉及妨碍民营企业发展、损害营商环境的违纪违法检举控告，选取典型进行挂牌督办。</font></div><div><font face=\"宋体\" size=\"3\"><br></font></div><div><font face=\"宋体\" size=\"3\">打铁必须自身硬。《措施》注重强化自身约束，强调纪检监察机关在监督检查和审查调查过程中，应改进方式方法，最大限度减少对民营企业正常生产经营秩序的影响，严禁借工作之名违规插手民营企业经济纠纷、工程招投标和物资采购，严禁泄露民营企业商业秘密，注重发挥特约监察员作用，自觉接受民主监督、群众监督和舆论监督。（侯荣）</font></div>');
INSERT INTO `article_content` VALUES ('69954', '<p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); text-align: center;\"><font size=\"3\" style=\"\" face=\"宋体\"><img alt=\"\" src=\"https://sichuan.scol.com.cn/items/202007/20071607405676900016FA7B.jpg\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; border: 0px none; max-width: 100%; overflow: hidden;\"><br style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"></font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">自宋代以后归统一体的成渝，一直是引领川渝乃至西部地区发展的“双子星”。重庆直辖后，在经济版图上也延续着双核格局。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">这里既是“一带一路”和长江经济带的战略交汇点，如今也成为国内大循环的战略腹地和国际国内双循环的重要枢纽。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">如何唱好成渝双城记，打造中国经济第四极？成渝如何加强合作，强化极核效应？</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">7月15日，成都市委十三届七次全会举行，会上对这些问题进行了解答。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">产业合作</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">成渝计算机产品产量已占全球1/3</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">从区域市场定位到亚欧大市场</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">强化极核效应，成渝要共建具有国际竞争力和区域带动力的开放型现代化产业体系，加快形成具有全国影响力的重要经济中心。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">成渝的产业家底如何？一组数据可以说明。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">2019年成渝经济总量分别为1.7万亿和2.36万亿，在全球国家经济总量排名的第46和第38位，两地产业结构相似系数达0.96，产业同质构成了对外竞争的规模优势，计算机产品的总量已占全球1/3，汽车整车产量已占全国18%，具备了参与全球竞争、带动区域发展的实力。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">面向未来，成渝的合作要从区域市场定位到亚欧大市场。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">以电子信息全产业链、汽车制造、航空装备、能源装备、轨道交通为重点，深入推动两地产业链发展，建设世界级电子信息和装备制造产业集群。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">在成都，要以这里为远点绘制产业生态全景图、组建产业联盟，促进研发、设计、制造、封装、测试、运营、结算等生态圈功能性节点布局，在更大范围内筑起以成都为枢纽、具有区域带动力的产业生态圈优势。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">科创合作</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">全国第五科教资源集聚区</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">提升成渝在国家创新网络中位势能级</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">成渝要共建推动高质量发展的创新策源地和先进要素洼地，加快形成具有全国影响力的科技创新中心。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">成渝拥有129所高校、61家科研院所，是全国第五大科教资源集聚区，区域创新能力位居全国第一方阵。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">但同时，重大科技研发方向与产业发展重点方向不匹配、城市发展战略与高素质人才结构不匹配、科技创新成果与企业现实需求不匹配等情况客观存在，国家工程技术重点产业匹配度低于50%，高技能人才求人倍率高达3.0以上，吸纳技术成交总额不足北京的1/4，极大制约了创新体系整体效能。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">要提升成渝在国家创新网络中的位势能级，优化科技创新结构，全面增强对城市发展、产业升级的支撑作用。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">因此，要加快共建西部科学城，推出更多“源于成都、引领前沿”的硬核科技，努力在前沿医学、区块链、能源互联网、航空航天等领域实现“并跑领跑”。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">紧扣城市战略目标和产业体系建设，支持高校院所、功能区、创新企业组建创新联盟。深入实施“技能成都”建设和“城市猎头”行动计划，围绕主导产业大力推动职教城建设，搭建链接全球人力资源市场的技能培训和供需对接平台。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">改革开放新高地</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">中西部为腹地泛欧泛亚为目标市场</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">全面建设供应链体系</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">成渝要共建面向世界链接亚欧的战略通道和门户枢纽，加快形成具有全国影响力的改革开放新高地。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">2019年，成渝进出口总额1681亿美元、较2010年增长4.6倍，但仅占全国4.1%，外贸依存度仅29%，对外开放水平并不算高。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">差距的背后是战略通道能力、开放经济层次和全球供应链体系构建水平的差距。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">如今，“一带一路”深刻改变了西部地区对外开放格局，“双循环”把成渝亚欧大陆经济带重要节点和航空陆海战略通道主枢纽地位提升到新高度。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">如何改变？</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">事实上，成渝在对外开放平台和交通方式上各有优势，要以共建现代化立体交通枢纽和全球供应链体系为战略目标，加强政府合作和行业协作，统一规划、优势互补、市场运作、共建共享，构建服务中西部向西向南开放的门户枢纽。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">要依托成渝“三场三港”联动实施枢纽协同、航线拓展、结构优化和能力提升行动，推进渝蓉欧班列集结中心示范工程和西部陆海新通道区域物流组织中心建设，完善泛欧泛亚节点网络和四向拓展服务体系，构建连接东盟、衔接日韩、覆盖中亚、联通欧洲进而链接全球的亚蓉欧陆海空联运战略大通道。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">要以中西部为腹地、泛欧泛亚为目标市场全面建设供应链体系，打通从生产到消费、国内到国际的供应链运作流程，打造“一带一路”进出口商品集散中心、供应链枢纽城市。大力发展适欧适亚、适空适铁产业，借力中日合作示范项目推动现代服务业提档升级，提高参与全球资源配置能力和整体经济效率。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">高品质生活宜居地</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">成就独特烟火味</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent;\"><font size=\"3\" face=\"宋体\">让“像成都人那样生活”成为潮流</font></strong></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">成渝要共建高质量公共服务体系，加快形成具有全国影响力的高品质生活宜居地。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">10年来，成都人口总量增长的同时，结构也在发生变化。面向未来，城市的人口政策将由追求规模的增长转向质量的提高，户籍政策、住房政策、人才政策、公共服务政策都要聚焦面向全球吸引青年大学生、高技能人才和新职业群体。成都应该注重生产圈、生活圈、生态圈的合理布局，建设近悦远来、巴适安逸的生活城市和幸福家园，构筑起吸引人、留住人、激励人、成就人的综合竞争优势。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">要以产城融合职住平衡的理念，统筹产业功能区和新型社区建设，启动编制社区邻里中心布局方案，加快建设适应特定群体需求的15分钟公共服务圈和生活微场景。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" face=\"宋体\">要聚焦市民多元化需求，建设睦邻友好、托幼养老、管理服务、智慧健康等功能复合的社区服务体系，全面倡导绿色低碳、简约适度的生活方式和社会风尚，用隐在市井中的花艺茶坊、落在街角的小书店、开在奢侈品店中的艺术展、藏在街巷里的咖啡厅、写在民宿里的天府文化，推动美学体验和城市文化融入衣食住行游购娱，让更加丰富美好的城市生活体验成就独特的烟火气和休闲味，让“像成都人那样生活”成为引领时代潮流的价值选择，“公园城市让市民生活更美好”成为现代城市最广泛的社会共识。</font></p><p style=\"margin: 0px 0px 30px; padding: 0px; list-style: none; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); text-align: justify; background-color: rgb(255, 255, 255); text-indent: 2em;\"><font size=\"3\" style=\"\" face=\"宋体\">华西都市报-封面新闻记者 谢燃岸 刘秋凤 秦怡 罗田怡 实习生 杨欣可 张弋凌宇 制图 高翔</font></p>');
INSERT INTO `article_content` VALUES ('69955', '<div><font size=\"3\" face=\"宋体\">省委十一届七次全会明确提出，要培育壮大区域中心城市，既借势借力、深化与成渝双核的协作配套，又苦练内功、提升要素集聚能力，科学论证、合理布局一批省级新区，真正将其建设成为承担区域发展战略任务的综合功能平台。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">全会精神在泸州、德阳、绵阳、乐山、南充、宜宾、达州等全省区域中心城市引起热议和强烈反响。大家一致认为，区域中心城市要借势借力、苦练内功，更好支撑国家战略的实施。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">在乐山市港航中心主任刘敏看来，通过推进岷江高等级航道建设，可让长江黄金水道向成都平原经济区腹地延伸162公里，让乐山港成为成都及周边适水货物就近下水的首选。“更关键的是高质量发展水上旅游产业，争取巴蜀文化旅游走廊沿成渝黄金水道布局，打造成都、重庆、乐山旅游‘金三角’，推动乐山加快建设世界重要旅游目的地。”乐山市文广旅局局长宋秋说。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">全会中关于产业协作的内容，让泸州、南充、宜宾、达州等地的经信部门负责人兴奋不已，不约而同地将“产业链”“协同配套”“承接”作为工作中心词。“设立川渝合作（达州·大竹）示范园区，重点承接重庆电子信息、智能终端等产业转移、延链配套。”达州市经信局局长李大兵说。宜宾看重“研发孵化在成渝、落地转化在宜宾”模式，积极承接成渝地区创新创业成果转移。南充瞄准“总部研发在成都重庆、生产制造在南充”的产业新格局，努力打造“高附加值的配套产业基地、成渝地区外溢产业承接基地、成渝地区餐桌市场供应基地”。同样看重配套的还有绵阳市三台县，“三台正在构筑现代综合交通运输体系，为川渝‘菜篮子’‘果盘子’提供物资后勤保障。”三台县县长李昊天说。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">如何发挥自身优势，实现协同发展？位于德阳广汉市的京东西南智能运营结算中心项目施工正抓紧收尾，预计8月投产运营。在这个总投资135亿元的项目背后蕴含的，是当地发挥交通区位优势，探索以物流为产业赋能的发展路径。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">全会精神鼓舞了新落户企业代表。总投资200亿元的恒力（泸州）产业园正加紧施工，恒力集团从长江下游的苏州溯流而上，瞄准的正是成渝市场。“这是一个重大机遇，有利于推动恒力纺织板块开启新的大提升、大发展。”恒力集团有限公司副总经理王茂凯说。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">成渝双核科技实力雄厚，要参与到科技创新的“裂变”中来，绵阳将优化环境、吸引人才放在更关键位置。“绵阳不断提升城市环境的生态宜居指数，推动形成科技创新发展的产业空间，为经济圈内科技创新发展作出更大贡献。”绵阳市住建委主任申泽说。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">人才成德阳热议关键词。7月14日，四川工业科技学院、德阳安装技师学院123名汽车相关专业学子赴渝，开启在长安汽车为期半年的实习之旅。“德阳拥有29家职业院校，要发挥人才优势，为两地现代产业发展提供坚实人力资源支撑。”德阳市人社局局长蔡绣鸿说。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">要承接成渝功能疏解和产业外溢，关键在园区平台。“南充承接相关产业转移优势明显，目前正加快建设推进四川自贸区南充协同改革试验区，保税物流中心（B型）9月将通过审批，创建国家级高新区、国家级经开区步伐加快，申建省级新区即将获批。”南充市发改委主任刘松说。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">为争创区域中心城市提供新动能，泸州国家高新区将提升园区承载能力作为当务之急。“作为全市产业经济发展主战场，不断提升要素集聚能力，同时为人才安家落户等提供便利。”泸州国家高新区管委会副主任熊正彪说。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">宜宾加快大学城科创城建设，培养引进高层次创新研发团队，打造高水平科技创新承载平台，激发创新创业资源活力。“要加强与毗邻地区创新资源的高端对接，充分发挥科技创新中心、大学科技园等平台作用，全面激发全市创新创业资源活力。”宜宾市科技局局长李华说。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">来自重庆的企业已计划投资30亿元在达州市通川区建设现代生物医药产业园。“客商看到了通川的颜值和活力，也要让他们感受到通川的温度、秩序和底蕴。”达州市通川区委书记张杰说，通川将主动在成渝地区双城经济圈建设和万达开川渝统筹发展示范区创建中找定位，围绕“3+2”主导产业，打造城市主城区落实国家战略的样板。</font></div><div><font size=\"3\" face=\"宋体\"><br></font></div><div><font size=\"3\" face=\"宋体\">（四川日报记者 祖明远 余如波 魏冯王博尔 王吉南 蒲南溪 袁城霖）</font></div>');
INSERT INTO `article_content` VALUES ('69956', '&amp;lt;p style=\\\'box-sizing: border-box; margin: 28px 10px; font: 400 16px / 2 &amp;quot;PingFang SC&amp;quot;, &amp;quot;Lantinghei SC&amp;quot;, simsun, &amp;quot;Microsoft YaHei&amp;quot;, Helvetica, Arial, sans-serif; color: rgb(43, 43, 43); display: block; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\'&amp;gt;&amp;lt;span style=&amp;quot;font-family: FangSong, sans-serif;&amp;quot;&amp;gt;　新华社北京7月15日电 7月16日出版的第14期《求是》杂志将发表中共中央总书记、国家主席、中央军委主席习近平的重要文章《中国共产党领导是中国特色社会主义最本质的特征》。&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p style=\\\'box-sizing: border-box; margin: 28px 10px; font: 400 16px / 2 &amp;quot;PingFang SC&amp;quot;, &amp;quot;Lantinghei SC&amp;quot;, simsun, &amp;quot;Microsoft YaHei&amp;quot;, Helvetica, Arial, sans-serif; color: rgb(43, 43, 43); display: block; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\'&amp;gt;&amp;lt;span style=&amp;quot;font-family: FangSong,sans-serif;&amp;quot;&amp;gt;　　文章强调，中国特色社会主义最本质的特征是中国共产党领导，中国特色社会主义制度的最大优势是中国共产党领导，党是最高政治领导力量。党政军民学，东西南北中，党是领导一切的。坚持和完善党的领导，是党和国家的根本所在、命脉所在，是全国各族人民的利益所在、幸福所在。中国有了中国共产党执政，是中国、中国人民、中华民族的一大幸事。在坚持党的领导这个决定党和国家前途命运的重大原则问题上，全党全国必须保持高度的思想自觉、政治自觉、行动自觉，丝毫不能动摇。&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p style=\\\'box-sizing: border-box; margin: 28px 10px; font: 400 16px / 2 &amp;quot;PingFang SC&amp;quot;, &amp;quot;Lantinghei SC&amp;quot;, simsun, &amp;quot;Microsoft YaHei&amp;quot;, Helvetica, Arial, sans-serif; color: rgb(43, 43, 43); display: block; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\'&amp;gt;&amp;lt;span style=&amp;quot;font-family: FangSong,sans-serif;&amp;quot;&amp;gt;　　文章指出，中国共产党是中国特色社会主义事业的领导核心。我国社会主义政治制度优越性的一个突出特点是党总揽全局、协调各方的领导核心作用，形象地说是&amp;amp;ldquo;众星捧月&amp;amp;rdquo;，这个&amp;amp;ldquo;月&amp;amp;rdquo;就是中国共产党。中国最大的国情就是中国共产党的领导。什么是中国特色？这就是中国特色。&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p style=\\\'box-sizing: border-box; margin: 28px 10px; font: 400 16px / 2 &amp;quot;PingFang SC&amp;quot;, &amp;quot;Lantinghei SC&amp;quot;, simsun, &amp;quot;Microsoft YaHei&amp;quot;, Helvetica, Arial, sans-serif; color: rgb(43, 43, 43); display: block; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\'&amp;gt;&amp;lt;span style=&amp;quot;font-family: FangSong,sans-serif;&amp;quot;&amp;gt;　　文章指出，坚持党的领导，首先是坚持党中央权威和集中统一领导，这是党的领导的最高原则，任何时候任何情况下都不能含糊、不能动摇。必须增强政治意识、大局意识、核心意识、看齐意识，自觉维护党中央权威和集中统一领导，自觉在思想上政治上行动上同党中央保持高度一致。&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p style=\\\'box-sizing: border-box; margin: 28px 10px; font: 400 16px / 2 &amp;quot;PingFang SC&amp;quot;, &amp;quot;Lantinghei SC&amp;quot;, simsun, &amp;quot;Microsoft YaHei&amp;quot;, Helvetica, Arial, sans-serif; color: rgb(43, 43, 43); display: block; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\'&amp;gt;&amp;lt;span style=&amp;quot;font-family: FangSong,sans-serif;&amp;quot;&amp;gt;　　文章指出，中国特色社会主义制度是一个严密完整的科学制度体系，起四梁八柱作用的是根本制度、基本制度、重要制度，其中具有统领地位的是党的领导制度。党的领导制度是我国的根本领导制度。我们推进各方面制度建设、推动各项事业发展、加强和改进各方面工作，都必须坚持党的领导，自觉贯彻党总揽全局、协调各方的根本要求。&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p style=\\\'box-sizing: border-box; margin: 28px 10px; font: 400 16px / 2 &amp;quot;PingFang SC&amp;quot;, &amp;quot;Lantinghei SC&amp;quot;, simsun, &amp;quot;Microsoft YaHei&amp;quot;, Helvetica, Arial, sans-serif; color: rgb(43, 43, 43); display: block; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\\\'&amp;gt;&amp;lt;span style=&amp;quot;font-family: FangSong, sans-serif;&amp;quot;&amp;gt;　　文章强调，中国的事情要办好首先中国共产党的事情要办好。应对和战胜前进道路上的各种风险和挑战，关键在党。我们要聚精会神抓好党的建设，使我们党越来越成熟、越来越强大、越来越有战斗力。&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;');
INSERT INTO `article_content` VALUES ('69781', '&lt;div&gt;&lt;span style=&quot;font-family: 宋体; font-size: medium;&quot;&gt;&lt;b&gt;文/刘继勇&lt;/b&gt;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;2020年现行标准下的农村贫困人口全部脱贫，是党中央向全国人民作出的郑重承诺。全面建成小康社会是实现中华民族伟大复兴中国梦的关键一步，而打赢脱贫攻坚战是全面建成小康社会的重中之重。在攻坚克难的关键时期，我们要聚焦“补短板”，实施精准攻坚，以咬定青山不松劲的定力、中流击水披荆斩棘的魄力、实事求是分类攻坚的辨别力、众人拾柴抱团取暖的合力，下足“绣花功夫”，实现脱贫收官。&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;要有咬定青山不松劲的定力。当前，脱贫攻坚工作面临的最大问题是防止松劲懈怠、精力转移。目前，全国还有52个贫困县未摘帽、2707个贫困村未出列、建档立卡贫困人口并未全部脱贫，虽然同过去相比总量大幅减少，但都是贫中之贫、困中之困，是最难啃的“硬骨头”。各级党员干部要继续履职尽责、不辱使命，保持清醒头脑，强化责任担当，坚持节奏不变、力度不减、尺度不松，不麻痹、不厌战、不松劲，以“钉钉子”精神在抓紧抓实抓细脱贫攻坚各项工作上下功夫，不获全胜决不轻言成功。&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;要有中流击水披荆斩棘的魄力。新冠肺炎疫情的突发，加大了脱贫攻坚的难度。入之愈深，其进愈难，部分群众可能会因“疫”返贫、因“疫”致贫。而在已脱贫的地区中，还存在产业基础薄弱、产业项目同质化严重、群众就业不稳定等现象。如今，决战决胜脱贫攻坚已到了最后冲刺阶段，党员干部必须以“功成不必在我，功成必定有我”的历史担当，以“不用扬鞭自奋蹄”的精神和干劲，坚定不移地干、久久为功地干、尽心竭力地干。&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;要有实事求是分类攻坚的辨别力。脱贫攻坚是一项复杂性、系统性工程，涉及贫困群众衣食住行等各个方面，抓住脱贫攻坚“牛鼻子”，明确“攻”的方向、把准“攻”的脉搏显得很重要。党员干部面对脱贫攻坚中的“短板”，要具体问题具体分析，避免“眉毛胡子一把抓”。比如要让贫困群众“富口袋”，就要让其先“富脑袋”，坚持“扶智”与“扶志”并行，靶向攻坚，确保贫困群众扔下“思想包袱”。再比如，要让贫困群众获得致富奔小康的“持久活力”，就要打造一批地方特色产业，给贫困群众培育“有盼头、有出路”的产业。&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;要有众人拾柴抱团取暖的合力。当前，脱贫攻坚力度之大、规模之广、影响之深，前所未有，其艰巨性、复杂性不言而喻。打好脱贫攻坚战，归根结底是维护好、发展好、实现好人民群众的根本利益，想群众之所想、急群众之所急、解群众之所困。要以人民为中心，坚持一切脱贫攻坚工作围着群众办，把工作做到位、做到群众心坎上。要紧紧依靠人民群众，群众是扶贫开发的受益者，更是推动者。要坚持问需于民、问计于民、问效于民，始终与人民群众心连心、同呼吸、共命运，凝聚强大合力，脱贫致富奔小康。（责编/范吴瑕）&lt;/font&gt;&lt;/div&gt;');
INSERT INTO `article_content` VALUES ('69782', '&lt;div&gt;&lt;span style=&quot;font-family: 宋体; font-size: medium;&quot;&gt;&lt;b&gt;文/闫华&lt;/b&gt;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;培养选拔优秀年轻干部是一件大事，关乎党的命运、国家的命运、民族的命运、人民的福祉，是百年大计。实现中华民族伟大复兴，巩固党的长期执政基础，需要培养一支符合新时期好干部标准、忠诚干净担当、充满活力的高素质专业化年轻干部队伍。改革开放以来，党的干部队伍基本形成了老、中、青梯次年龄结构，解决了年轻干部“有没有”“有多少”的问题，当前正着力解决年轻干部队伍“好不好”“优不优”的问题。&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;目前，“70后”“80后”“90后”的年轻干部成为干部队伍的主体，这些干部绝大多数受过高等教育，但他们也多是从家门到校门再到机关门的“三门干部”，学历高、经历少、阅历浅，缺乏在沾泥水、冒风雨的基层“练兵场”接受洗礼和历练的经历。&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;人在事上练，刀在石上磨。要推动年轻干部“走基层、接地气、练功夫”，就要让年轻干部到基层去“摸爬滚打”，多经历“风吹雨打”、多捧“烫手山芋”、当几回“热锅上的蚂蚁”，在打硬仗、扛重活、攻难关中练出真功夫，让年轻干部补上缺失的“基层课”，在基层这个大熔炉里经历一番政治思想淬炼、实践能力锻炼。同时，要警惕一些干部把基层历练当作“镀金”和“跳板”，成为捞取晋升的“资本”、开辟提拔的“捷径”，让走基层成了混基层、接地气成了搭天线、练功夫成了捞资本，这样不仅得不到淬炼，还带坏了作风、影响了事业。&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;“天将降大任于斯人也，必先苦其心志，劳其筋骨，饿其体肤，空乏其身，行拂乱其所为。”基层任务繁重、情况复杂、点多面广，是干部苦心志、劳筋骨的主战场。越是条件艰苦、矛盾复杂的地方，越能磨炼干部的意志、锻炼干部的才干。实践证明：在基层摸爬滚打过的干部，成长更快、走得更稳、行得更远。因此，推动年轻干部“走基层、接地气、练功夫”，就应真正把年轻干部放到改革发展的主战场、维护稳定的第一线、服务群众的最前沿，让年轻干部在脱贫攻坚、化解矛盾、处置事件等急难险重任务中得到“淬炼”，补足短板，涵养才气。&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font size=&quot;3&quot; face=&quot;宋体&quot;&gt;年轻干部到基层之后，还要持续跟踪教育管理，既“选苗浇水”，又“修枝打叉”，才能让干部“身”入基层、“心”更入基层。因此，要建立完善考察考核制度，既看日常的表现，又看重大关头的担当，让沉得下、干得好、有潜力的年轻干部及时得到提拔重用，对待不住、四处跑、不干事的年轻干部严肃谈话提醒，必要时进行组织处理，坚决防止镀金式挂职、应景式挂职、点卯式挂职，真正让年轻干部在基层锻炼中成长。（责编/范吴瑕）&lt;/font&gt;&lt;/div&gt;');

-- ----------------------------
-- Table structure for article_viewnum
-- ----------------------------
DROP TABLE IF EXISTS `article_viewnum`;
CREATE TABLE `article_viewnum` (
  `aid` int(8) NOT NULL,
  `viewnum` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_viewnum
-- ----------------------------
INSERT INTO `article_viewnum` VALUES ('17', '0');
INSERT INTO `article_viewnum` VALUES ('69953', '0');
INSERT INTO `article_viewnum` VALUES ('69954', '0');
INSERT INTO `article_viewnum` VALUES ('69955', '0');
INSERT INTO `article_viewnum` VALUES ('69956', '0');
INSERT INTO `article_viewnum` VALUES ('69781', '0');
INSERT INTO `article_viewnum` VALUES ('69782', '0');
INSERT INTO `article_viewnum` VALUES ('3', '0');
INSERT INTO `article_viewnum` VALUES ('4', '0');

-- ----------------------------
-- Table structure for col
-- ----------------------------
DROP TABLE IF EXISTS `col`;
CREATE TABLE `col` (
  `cid` int(3) NOT NULL AUTO_INCREMENT,
  `col` varchar(30) DEFAULT NULL,
  `sub` bit(1) DEFAULT NULL,
  `group` int(3) DEFAULT NULL,
  `sort` int(2) DEFAULT '0',
  `allsort` int(2) DEFAULT NULL,
  `valid` int(2) DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of col
-- ----------------------------
INSERT INTO `col` VALUES ('1', '时政', '\0', '1', '0', '0', '1');
INSERT INTO `col` VALUES ('2', '要闻', '', '1', '1', '0', '1');
INSERT INTO `col` VALUES ('3', '时评', '', '1', '2', '0', '1');
INSERT INTO `col` VALUES ('4', '人事任免', '', '1', '3', '0', '1');
INSERT INTO `col` VALUES ('5', '权威声音', '', '1', '4', '0', '1');
INSERT INTO `col` VALUES ('6', '领导动态', '', '1', '5', '0', '1');
INSERT INTO `col` VALUES ('7', '服务', '\0', '7', '0', '1', '1');
INSERT INTO `col` VALUES ('8', '党务助手', '', '7', '1', '1', '1');
INSERT INTO `col` VALUES ('9', '党员参考', '', '7', '2', '1', '1');
INSERT INTO `col` VALUES ('10', '党内规章', '', '7', '3', '1', '1');
INSERT INTO `col` VALUES ('11', '社会', '\0', '11', '0', '3', '1');
INSERT INTO `col` VALUES ('12', '民生', '', '11', '1', '3', '1');
INSERT INTO `col` VALUES ('13', '法制', '', '11', '2', '3', '1');
INSERT INTO `col` VALUES ('14', '党建', '\0', '14', '0', '2', '1');
INSERT INTO `col` VALUES ('15', '组织', '', '14', '1', '2', '1');
INSERT INTO `col` VALUES ('16', '思想', '', '14', '2', '2', '1');
INSERT INTO `col` VALUES ('17', '作风', '', '14', '3', '2', '1');
INSERT INTO `col` VALUES ('18', '廉政', '\0', '18', '0', '4', '1');
INSERT INTO `col` VALUES ('19', '理论', '\0', '19', '0', '5', '1');
INSERT INTO `col` VALUES ('20', '人物', '\0', '20', '0', '6', '1');
INSERT INTO `col` VALUES ('21', '视野', '\0', '21', '0', '7', '1');
INSERT INTO `col` VALUES ('45', '杂志', '\0', '45', '0', '8', '-1');
INSERT INTO `col` VALUES ('25', '制度', '', '14', '4', '2', '1');
INSERT INTO `col` VALUES ('26', '特稿', '', '14', '5', '2', '1');
INSERT INTO `col` VALUES ('27', '新闻纵深', '', '18', '3', '4', '1');
INSERT INTO `col` VALUES ('28', '通报曝光', '', '18', '4', '4', '1');
INSERT INTO `col` VALUES ('29', '工作荟萃', '', '18', '5', '4', '1');
INSERT INTO `col` VALUES ('30', '巡视巡察', '', '18', '6', '4', '1');
INSERT INTO `col` VALUES ('31', '阳光问廉', '', '18', '7', '4', '1');
INSERT INTO `col` VALUES ('32', '警示教育', '', '18', '8', '4', '1');
INSERT INTO `col` VALUES ('33', '学习文选', '', '19', '1', '5', '1');
INSERT INTO `col` VALUES ('34', '党课', '', '19', '2', '5', '1');
INSERT INTO `col` VALUES ('35', '干部论坛', '', '19', '3', '5', '1');
INSERT INTO `col` VALUES ('36', '优秀范文', '', '19', '4', '5', '1');
INSERT INTO `col` VALUES ('37', '第一书记', '', '20', '1', '6', '1');
INSERT INTO `col` VALUES ('39', '党建人物', '', '20', '3', '6', '1');
INSERT INTO `col` VALUES ('40', '史海', '', '21', '1', '7', '1');
INSERT INTO `col` VALUES ('41', '视川', '', '21', '2', '7', '1');
INSERT INTO `col` VALUES ('42', '文化', '', '21', '3', '7', '1');
INSERT INTO `col` VALUES ('43', '旅游', '', '21', '4', '7', '1');
INSERT INTO `col` VALUES ('44', '健康', '', '21', '5', '7', '1');
INSERT INTO `col` VALUES ('99', '未分类', '\0', '99', '0', '9', '-1');
INSERT INTO `col` VALUES ('104', '文章库', '\0', '104', '0', '10', '1');
INSERT INTO `col` VALUES ('105', '杂志', '', '104', '1', '10', '1');
INSERT INTO `col` VALUES ('106', '未分类', '', '104', '2', '10', '1');

-- ----------------------------
-- Table structure for ipwhite
-- ----------------------------
DROP TABLE IF EXISTS `ipwhite`;
CREATE TABLE `ipwhite` (
  `IP` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ipwhite
-- ----------------------------
INSERT INTO `ipwhite` VALUES ('127.0.0.0');
INSERT INTO `ipwhite` VALUES ('127.0.0.1');

-- ----------------------------
-- Table structure for magazine
-- ----------------------------
DROP TABLE IF EXISTS `magazine`;
CREATE TABLE `magazine` (
  `zid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `createdate` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `valid` bit(1) DEFAULT NULL,
  PRIMARY KEY (`zid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of magazine
-- ----------------------------
INSERT INTO `magazine` VALUES ('4', '[{\"aid\":\"0\",\"title\":\"卷首语\",\"text\":\"1\"},{\"aid\":\"0\",\"title\":\"时评\",\"text\":\"1\"},{\"aid\":\"0\",\"title\":\"向“形式主义”说“不”\\/林玲\",\"text\":\"0\"},{\"aid\":\"0\",\"title\":\"扶贫“扶上马”更需“送一程”\\/李兵\",\"text\":\"0\"},{\"aid\":\"17\",\"title\":\"测试文章1\",\"text\":\"0\",\"valid\":\"0\"},{\"aid\":\"69956\",\"title\":\"《求是》杂志发表习近平总书记重要文章《中国共产党领导是中国特色社会主义最本质的特征》\",\"text\":\"0\",\"valid\":\"0\"},{\"aid\":\"69956\",\"title\":\"《求是》杂志发表习近平总书记重要文章《中国共产党领导是中国特色社会主义最本质的特征》\",\"text\":\"0\",\"valid\":\"0\"}]', '5月上半月', '1591255014', 'http://www.scdjw.com.cn/zhuanti_img/1.jpg', '');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `indate` date NOT NULL,
  `num` int(6) DEFAULT NULL,
  PRIMARY KEY (`indate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('2020-06-09', '303');
INSERT INTO `member` VALUES ('2020-06-10', '1');
INSERT INTO `member` VALUES ('2020-07-28', '23');

-- ----------------------------
-- Table structure for mod
-- ----------------------------
DROP TABLE IF EXISTS `mod`;
CREATE TABLE `mod` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of mod
-- ----------------------------
INSERT INTO `mod` VALUES ('1', '列表页右一', '[{\"aid\":1,\"title\":\"《求是》杂志发表习近平总书记重要文章《中国共产党领导是中国特色社会主义最本质的特征》\",\"img\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200717\\/b4217e9992f0f49462072a7346e657c8.jpg\",\"url\":\"\\/article\\/69956\"},{\"aid\":2,\"title\":\"《求是》杂志发表习近平总书记重要文章《中国共产党领导是中国特色社会主义最本质的特征》\",\"url\":\"\\/article\\/69956\",\"img\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200717\\/b4217e9992f0f49462072a7346e657c8.jpg\"},{\"aid\":3,\"title\":\"外媒：中国汽车超美国夺智利市场销量季军\",\"img\":\"http:\\/\\/upload.cankaoxiaoxi.com\\/2020\\/0117\\/1579242771412.jpg?resize=p_4,w_310\"},{\"aid\":4,\"title\":\"《求是》杂志发表习近平总书记重要文章《中国共产党领导是中国特色社会主义最本质的特征》\",\"url\":\"\\/article\\/69956\",\"img\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200717\\/b4217e9992f0f49462072a7346e657c8.jpg\"},{\"aid\":5,\"title\":\"澳大利亚水火两重天 外媒：山火还没灭，洪灾又来袭\"}]');
INSERT INTO `mod` VALUES ('2', '列表页右二', '[{\"aid\":1,\"title\":\"内江市市中区：提升“三力”决战决胜脱贫攻坚\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/block\\/29\\/29e9abd2cd53e51916022615588ad731.jpg\"},{\"aid\":2,\"title\":\"旺苍县士大夫引进人才开辟“绿色通道”\"},{\"aid\":3,\"title\":\"外媒：中国汽车超美国夺智利市场销量季军\",\"img\":\"http:\\/\\/upload.cankaoxiaoxi.com\\/2020\\/0117\\/1579242771412.jpg?resize=p_4,w_310\"},{\"aid\":4,\"title\":\"哈里梅根将放弃“殿下”头衔 英美民众反应两极\"},{\"aid\":5,\"title\":\"《求是》杂志发表习近平总书记重要文章《中国共产党领导是中国特色社会主义最本质的特征》\",\"url\":\"\\/article\\/69956\",\"img\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200717\\/b4217e9992f0f49462072a7346e657c8.jpg\"}]');

-- ----------------------------
-- Table structure for nav
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nav
-- ----------------------------
INSERT INTO `nav` VALUES ('1', '[{\"text\":\"首页\",\"url\":\"\\/\",\"children\":[]},{\"text\":\"时政\",\"url\":\"\\/list\\/1\",\"children\":[{\"text\":\"要闻\",\"url\":\"\",\"cid\":\"2\"},{\"text\":\"时评\",\"url\":\"\",\"cid\":\"3\"},{\"text\":\"人事任免\",\"url\":\"\",\"cid\":\"4\"},{\"text\":\"权威声音\",\"url\":\"\",\"cid\":\"5\"},{\"text\":\"领导动态\",\"url\":\"\",\"cid\":\"6\"}],\"cid\":\"1\"},{\"text\":\"服务\",\"url\":\"\\/list\\/7\",\"children\":[{\"text\":\"党务助手\",\"url\":\"\",\"cid\":\"8\"},{\"text\":\"党员参考\",\"url\":\"\",\"cid\":\"9\"},{\"text\":\"党内规章\",\"url\":\"\",\"cid\":\"10\"}],\"cid\":\"7\"},{\"text\":\"社会\",\"url\":\"\\/list\\/11\",\"children\":[{\"text\":\"民生\",\"url\":\"\",\"cid\":\"12\"},{\"text\":\"法制\",\"url\":\"\",\"cid\":\"13\"}],\"cid\":\"11\"},{\"text\":\"党建\",\"url\":\"\\/list\\/14\",\"children\":[{\"text\":\"组织\",\"url\":\"\",\"cid\":\"15\"},{\"text\":\"思想\",\"url\":\"\",\"cid\":\"16\"},{\"text\":\"作风\",\"url\":\"\",\"cid\":\"17\"},{\"text\":\"制度\",\"url\":\"\",\"cid\":\"25\"},{\"text\":\"特稿\",\"url\":\"\",\"cid\":\"26\"}],\"cid\":\"14\"},{\"text\":\"廉政\",\"url\":\"\\/list\\/18\",\"children\":[{\"text\":\"新闻纵深\",\"url\":\"\",\"cid\":\"27\"},{\"text\":\"通报曝光\",\"url\":\"\",\"cid\":\"28\"},{\"text\":\"工作荟萃\",\"url\":\"\",\"cid\":\"29\"},{\"text\":\"巡视巡察\",\"url\":\"\",\"cid\":\"30\"},{\"text\":\"阳光问题\",\"url\":\"\",\"cid\":\"31\"},{\"text\":\"警示教育\",\"url\":\"\",\"cid\":\"32\"}],\"cid\":\"18\"},{\"text\":\"理论\",\"url\":\"\\/list\\/19\",\"children\":[{\"text\":\"学习文选\",\"url\":\"\",\"cid\":\"33\"},{\"text\":\"党课\",\"url\":\"\",\"cid\":\"34\"},{\"text\":\"干部论坛\",\"url\":\"\",\"cid\":\"35\"},{\"text\":\"优秀范文\",\"url\":\"\",\"cid\":\"36\"}],\"cid\":\"19\"},{\"text\":\"人物\",\"url\":\"\\/list\\/20\",\"children\":[{\"text\":\"第一书记\",\"url\":\"\",\"cid\":\"37\"},{\"text\":\"党建人物\",\"url\":\"\",\"cid\":\"39\"}],\"cid\":\"20\"},{\"text\":\"视野\",\"url\":\"\\/list\\/21\",\"children\":[{\"text\":\"史海\",\"url\":\"\",\"cid\":\"40\"},{\"text\":\"视川\",\"url\":\"\",\"cid\":\"41\"},{\"text\":\"文化\",\"url\":\"\",\"cid\":\"42\"},{\"text\":\"旅游\",\"url\":\"\",\"cid\":\"43\"},{\"text\":\"健康\",\"url\":\"\",\"cid\":\"44\"}],\"cid\":\"21\"},{\"text\":\"杂志\",\"url\":\"\\/magazines\",\"children\":[],\"cid\":\"0\"}]');

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `createdate` int(11) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backimg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backcolor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header` int(2) DEFAULT NULL,
  `footer` int(2) DEFAULT NULL,
  `valid` bit(1) DEFAULT NULL,
  `editor` int(2) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('1', '首页', '{\"m1\":{\"show\":0,\"valid\":1,\"backimg\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200715\\/d6dad25d9dffcc8981cd9162bb315737.jpg\",\"faceimg\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200715\\/3140d710a1d3a04181d5fa34ad917e8d.png\",\"url\":\"\\/topic\\/8\"},\"m2\":[{\"aid\":327,\"title\":\"深入学习贯彻党的十九届四中全会精神\",\"img\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200715\\/6f6c40759bb75932ffa9a032c2080b8e.jpg\",\"url\":\"\\/topic\\/8\"},{\"aid\":3,\"title\":\"新成昆铁路来了！攀枝花进入动车时代\",\"img\":\"https:\\/\\/www.scol.com.cn\\/items\\/202001\\/200109111154745000122967.jpg\"}],\"m3\":[{\"aid\":1,\"title\":\"台当局拒绝两岸联手护渔123\",\"size\":\"18px\",\"color\":\"\",\"bold\":1,\"url\":\"\\/article\\/11\"},{\"aid\":2,\"title\":\"本刊编辑部：让合作的阳光驱散疫情的阴霾\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":3,\"title\":\"万字长文！习近平这样谈抗疫国际合作\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":4,\"title\":\"习近平谈国际社会战胜疫情的最有力武器\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":5,\"title\":\"八个视角，读懂总书记陕西之行\",\"size\":\"18px\",\"color\":\"\",\"bold\":1},{\"aid\":6,\"title\":\"摆脱贫困，总书记一直在思考的重大问题\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":7,\"title\":\"从七个“战贫”瞬间读懂习近平的为民初心\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":8,\"title\":\"重温习近平殷殷嘱托 共建美丽家园\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":9,\"title\":\"应对突发事件是组织力建设的重大课题\",\"size\":\"18px\",\"color\":\"\",\"bold\":1},{\"aid\":10,\"title\":\"抗疫展现中国高效动员力组织力协调力\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":11,\"title\":\"战“疫”，求是网系列评论来啦！\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":-1,\"title\":\"应对突发事件是组织力建设的重大课题\"}],\"m4\":{\"show\":1,\"valid\":1,\"backimg\":\"\",\"faceimg\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200716\\/b06ecd1864c78c04140df9399c9ed017.jpg\",\"url\":\"\"},\"m6\":[{\"aid\":19,\"title\":\"“头雁”引领社区治理提档升级\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":20,\"title\":\"确保决胜全面小康圆满收官\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":21,\"title\":\"全面创新改革要有系统集成思维\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":22,\"title\":\"领导干部要做制度执行的表率\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":23,\"title\":\"新华社评论员：让初心和使命照亮新时代长征路\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":24,\"title\":\"领导干部要做制度执行的表率\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"}],\"m7\":[{\"pid\":1,\"img\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200716\\/0867b478bc11341cb4109df2de71d7fd.jpg\",\"title\":\"专题丨深入学习贯彻党的十九届四中全会精神\",\"url\":\"\\/topic\\/8\"},{\"pid\":2,\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202002\\/06\\/154151r1rf9ggigxt86h19.png\",\"title\":\"专题丨众志成城 抗击疫情\"},{\"pid\":3,\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/201910\\/16\\/162100j6fuz0qioof9oo9h.jpg\",\"title\":\"专题丨“初心故事”征稿活动\"},{\"pid\":4,\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/201904\\/10\\/173427ox6fbsf793fkfkmw.jpg\",\"title\":\"专题丨建和谐会东 立文明新风\"}],\"m8\":[{\"aid\":25,\"title\":\"战“疫”战贫 进行时\",\"intro\":\"疫情防控、脱贫攻坚一个也不能落后\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/block\\/47\\/474ec89604d037f773a5a25f610a0e18.jpg\"},{\"aid\":25,\"title\":\"全民战“疫”\",\"intro\":\"四川抗击新冠肺炎疫情进行时\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/block\\/26\\/26cd29e6513ade0c6fcc00e2ee73689d.jpg\"},{\"aid\":25,\"title\":\"基层“疫”线 的书记们\",\"intro\":\"他们是战“疫”的“主心骨”，是群众的“贴心人”\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/block\\/42\\/42017b01eaf63ae6d1f9f8bb55b17d23.jpg\"},{\"aid\":25,\"title\":\"“疫”中奋进\",\"intro\":\"全省精准有序复工\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/block\\/0e\\/0ebfffe2c98895dd2ad541edd6a92aae.jpg\"}],\"m9\":{\"show\":0,\"valid\":1,\"backimg\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200716\\/f5d8c40ae21ce1668fa0105f73540aa4.jpg\",\"faceimg\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200716\\/8b9813321408611f957d1b2671b3ad5b.png\",\"url\":\"\"},\"m10\":[{\"aid\":1,\"title\":\"内江市市中区：提升“三力”决战决胜脱贫攻坚\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/block\\/29\\/29e9abd2cd53e51916022615588ad731.jpg\"},{\"aid\":2,\"title\":\"旺苍县为引进人才开辟“绿色通道”\",\"img\":\"\"},{\"aid\":3,\"title\":\"外媒：中国汽车超美国夺智利市场销量季军\",\"img\":\"http:\\/\\/upload.cankaoxiaoxi.com\\/2020\\/0117\\/1579242771412.jpg?resize=p_4,w_310\"},{\"aid\":4,\"title\":\"哈里梅根将放弃“殿下”头衔 英美民众反应两极\",\"img\":\"\"},{\"aid\":5,\"title\":\"澳大利亚水火两重天 外媒：山火还没灭，洪灾又来袭\",\"img\":\"\"},{\"aid\":6,\"title\":\"俄媒：拉夫罗夫年度记者会猛批美国\",\"img\":\"\"},{\"aid\":7,\"title\":\"美媒披露五角大楼寻求卫星直接通信\",\"img\":\"\"},{\"aid\":8,\"title\":\"美参议院开启弹劾审理 特朗普扣留对乌军援被指违法\",\"img\":\"\"},{\"aid\":9,\"title\":\"美承认伊朗袭击致11人伤 哈梅内伊称“打了美国一记耳光”\",\"img\":\"\"},{\"aid\":10,\"title\":\"俄媒披露：俄拟打造未来新型航母 航程无限制\",\"img\":\"\"},{\"aid\":11,\"title\":\"俄媒：米舒斯京施政力推经济高速增长\",\"img\":\"\"},{\"aid\":12,\"title\":\"法媒文章：全球隐秘“水之战”早已打响\",\"img\":\"\"},{\"aid\":13,\"title\":\"法媒：今后30年，气候变暖将严重冲击社会经济\",\"img\":\"\"},{\"aid\":14,\"title\":\"外媒：中国正加速驶入新贸易规则时代\",\"img\":\"\"},{\"aid\":15,\"title\":\"美媒预测：美今年将掀银行合并潮\",\"img\":\"\"}],\"m11\":[{\"aid\":1,\"title\":\"内江市市中区：提升“三力”决战决胜脱贫攻坚\",\"img\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200716\\/b662e24bfc591afea2e3f6ca87fca804.jpg\"},{\"aid\":2,\"title\":\"旺苍县为引进人才开辟“绿色通道”\"},{\"aid\":3,\"title\":\"外媒：中国汽车超美国夺智利市场销量季军\"},{\"aid\":4,\"title\":\"哈里梅根将放弃“殿下”头衔 英美民众反应两极\"},{\"aid\":5,\"title\":\"澳大利亚水火两重天 外媒：山火还没灭，洪灾又来袭\"},{\"aid\":6,\"title\":\"俄媒：拉夫罗夫年度记者会猛批美国\"}],\"m12\":[{\"aid\":1,\"title\":\"内江市市中区：提升“三力”决战决胜脱贫攻坚\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/block\\/29\\/29e9abd2cd53e51916022615588ad731.jpg\"},{\"aid\":2,\"title\":\"旺苍县为引进人才开辟“绿色通道”\"},{\"aid\":3,\"title\":\"外媒：中国汽车超美国夺智利市场销量季军\",\"img\":\"http:\\/\\/upload.cankaoxiaoxi.com\\/2020\\/0117\\/1579242771412.jpg?resize=p_4,w_310\"},{\"aid\":4,\"title\":\"曾晓平：巾帼不让须眉 援藏当有女子\",\"url\":\"\\/article\\/328\"},{\"aid\":5,\"title\":\"澳大利亚水火两重天 外媒：山火还没灭，洪灾又来袭\"},{\"aid\":6,\"title\":\"俄媒：拉夫罗夫年度记者会猛批美国\"}],\"m13\":[{\"aid\":1,\"title\":\"内江市市中区：提升“三力”决战决胜脱贫攻坚\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/block\\/29\\/29e9abd2cd53e51916022615588ad731.jpg\"},{\"aid\":2,\"title\":\"旺苍县为引进人才开辟“绿色通道”\"},{\"aid\":3,\"title\":\"外媒：中国汽车超美国夺智利市场销量季军\",\"img\":\"http:\\/\\/upload.cankaoxiaoxi.com\\/2020\\/0117\\/1579242771412.jpg?resize=p_4,w_310\"},{\"aid\":4,\"title\":\"哈里梅根将放弃“殿下”头衔 英美民众反应两极\"},{\"aid\":5,\"title\":\"澳大利亚水火两重天 外媒：山火还没灭，洪灾又来袭\"},{\"aid\":6,\"title\":\"俄媒：拉夫罗夫年度记者会猛批美国\"},{\"aid\":7,\"title\":\"美媒披露五角大楼寻求卫星直接通信\"},{\"aid\":8,\"title\":\"美参议院开启弹劾审理 特朗普扣留对乌军援被指违法\"},{\"aid\":9,\"title\":\"美承认伊朗袭击致11人伤 哈梅内伊称“打了美国一记耳光”\"},{\"aid\":10,\"title\":\"俄媒披露：俄拟打造未来新型航母 航程无限制\"},{\"aid\":11,\"title\":\"俄媒：米舒斯京施政力推经济高速增长\"},{\"aid\":12,\"title\":\"法媒文章：全球隐秘“水之战”早已打响\"},{\"aid\":13,\"title\":\"法媒：今后30年，气候变暖将严重冲击社会经济\"},{\"aid\":14,\"title\":\"外媒：中国正加速驶入新贸易规则时代\"},{\"aid\":15,\"title\":\"美媒预测：美今年将掀银行合并潮\"}],\"m14\":[{\"aid\":1,\"title\":\"内江市市中区：提升“三力”决战决胜脱贫攻坚\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/block\\/29\\/29e9abd2cd53e51916022615588ad731.jpg\"},{\"aid\":2,\"title\":\"旺苍县为引进人才开辟“绿色通道”\",\"img\":\"\"},{\"aid\":3,\"title\":\"外媒：中国汽车超美国夺智利市场销量季军\",\"img\":\"http:\\/\\/upload.cankaoxiaoxi.com\\/2020\\/0117\\/1579242771412.jpg?resize=p_4,w_310\"},{\"aid\":4,\"title\":\"哈里梅根将放弃“殿下”头衔 英美民众反应两极\",\"img\":\"\"},{\"aid\":5,\"title\":\"澳大利亚水火两重天 外媒：山火还没灭，洪灾又来袭\",\"img\":\"\"},{\"aid\":6,\"title\":\"俄媒：拉夫罗夫年度记者会猛批美国\",\"img\":\"\"},{\"aid\":7,\"title\":\"美媒披露五角大楼寻求卫星直接通信\",\"img\":\"\"},{\"aid\":8,\"title\":\"美参议院开启弹劾审理 特朗普扣留对乌军援被指违法\",\"img\":\"\"},{\"aid\":9,\"title\":\"美承认伊朗袭击致11人伤 哈梅内伊称“打了美国一记耳光”\",\"img\":\"\"},{\"aid\":10,\"title\":\"俄媒披露：俄拟打造未来新型航母 航程无限制\",\"img\":\"\"},{\"aid\":11,\"title\":\"俄媒：米舒斯京施政力推经济高速增长\",\"img\":\"\"},{\"aid\":12,\"title\":\"法媒文章：全球隐秘“水之战”早已打响\",\"img\":\"\"},{\"aid\":13,\"title\":\"法媒：今后30年，气候变暖将严重冲击社会经济\",\"img\":\"\"},{\"aid\":14,\"title\":\"外媒：中国正加速驶入新贸易规则时代\",\"img\":\"\"},{\"aid\":15,\"title\":\"美媒预测：美今年将掀银行合并潮\",\"img\":\"\"}],\"m15\":[{\"aid\":1,\"title\":\"内江市市中区：提升“三力”决战决胜脱贫攻坚\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/block\\/29\\/29e9abd2cd53e51916022615588ad731.jpg\"},{\"aid\":2,\"title\":\"旺苍县为引进人才开辟“绿色通道”\",\"img\":\"\"},{\"aid\":3,\"title\":\"外媒：中国汽车超美国夺智利市场销量季军\",\"img\":\"http:\\/\\/upload.cankaoxiaoxi.com\\/2020\\/0117\\/1579242771412.jpg?resize=p_4,w_310\"},{\"aid\":4,\"title\":\"哈里梅根将放弃“殿下”头衔 英美民众反应两极\",\"img\":\"\"},{\"aid\":5,\"title\":\"澳大利亚水火两重天 外媒：山火还没灭，洪灾又来袭\",\"img\":\"\"},{\"aid\":6,\"title\":\"俄媒：拉夫罗夫年度记者会猛批美国\",\"img\":\"\"},{\"aid\":7,\"title\":\"美媒披露五角大楼寻求卫星直接通信\",\"img\":\"\"},{\"aid\":8,\"title\":\"美参议院开启弹劾审理 特朗普扣留对乌军援被指违法\",\"img\":\"\"},{\"aid\":9,\"title\":\"美承认伊朗袭击致11人伤 哈梅内伊称“打了美国一记耳光”\",\"img\":\"\"},{\"aid\":10,\"title\":\"俄媒披露：俄拟打造未来新型航母 航程无限制\",\"img\":\"\"},{\"aid\":11,\"title\":\"俄媒：米舒斯京施政力推经济高速增长\",\"img\":\"\"},{\"aid\":12,\"title\":\"法媒文章：全球隐秘“水之战”早已打响\",\"img\":\"\"},{\"aid\":13,\"title\":\"法媒：今后30年，气候变暖将严重冲击社会经济\",\"img\":\"\"},{\"aid\":14,\"title\":\"外媒：中国正加速驶入新贸易规则时代\",\"img\":\"\"},{\"aid\":15,\"title\":\"美媒预测：美今年将掀银行合并潮\",\"img\":\"\"}],\"m16\":[{\"title\":\"2025年5月上\\/第9期\",\"img\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200716\\/394a78ebee4fbdd251bc497ddc3a02db.jpg\"},{\"title\":\"2020年5月上\\/第8期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202004\\/09\\/112630gt81pea13l83taz8.jpg\"},{\"title\":\"2020年5月上\\/第7期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/zhuanti_img\\/1.jpg\"},{\"title\":\"2020年5月上\\/第6期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202004\\/24\\/104425jzlfqc7pwd0wgcwl.jpg\"},{\"title\":\"2020年5月上\\/第5期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202004\\/24\\/104425jzlfqc7pwd0wgcwl.jpg\"},{\"title\":\"2020年5月上\\/第4期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202004\\/24\\/104425jzlfqc7pwd0wgcwl.jpg\"},{\"title\":\"2020年5月上\\/第4期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202004\\/24\\/104425jzlfqc7pwd0wgcwl.jpg\"},{\"title\":\"2020年5月上\\/第1期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202004\\/24\\/104425jzlfqc7pwd0wgcwl.jpg\"},{\"title\":\"2020年5月上\\/第0期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202004\\/24\\/104425jzlfqc7pwd0wgcwl.jpg\"},{\"title\":\"2020年5月上\\/第6期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202004\\/24\\/104425jzlfqc7pwd0wgcwl.jpg\"},{\"title\":\"2020年5月上\\/第5期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202004\\/24\\/104425jzlfqc7pwd0wgcwl.jpg\"},{\"title\":\"2025年5月上\\/第6期\",\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202004\\/24\\/104425jzlfqc7pwd0wgcwl.jpg\"}],\"m17\":[{\"aid\":1,\"title\":\"国家博物馆限量预约开放 观众佩戴口罩有序看展\",\"img\":\"http:\\/\\/www.cnr.cn\\/2014jkpd\\/jkgdxw\\/20200505\\/W020200505330886714883.jpg\",\"zz\":\"2020年5月上\\/第9期\"},{\"aid\":2,\"title\":\"在战“疫”中“律”行使命\",\"img\":\"http:\\/\\/www.cnr.cn\\/2013qcpd\\/gdzx\\/20200505\\/W020200505328904000034.jpg\",\"zz\":\"2020年5月上\\/第9期\"},{\"aid\":3,\"title\":\"党员自愿捐款资金如何分配使用\",\"img\":\"http:\\/\\/www.cnr.cn\\/2013qcpd\\/gdzx\\/20200505\\/W020200505328275203435.jpg\",\"zz\":\"2020年4月下\\/第8期\"},{\"aid\":4,\"title\":\"管好用活项目 共享发展红利\",\"img\":\"http:\\/\\/www.cnr.cn\\/newscenter\\/local\\/sytj\\/dfjd\\/20200505\\/W020200505365735751872.jpg\",\"zz\":\"2020年4月下\\/第8期\"},{\"aid\":5,\"title\":\"直面战“疫”为企业“加油”\",\"img\":\"http:\\/\\/www.cnr.cn\\/newscenter\\/local\\/sytj\\/dfjd\\/20200505\\/W020200505365735751872.jpg\",\"zz\":\"2020年4月下\\/第8期\"},{\"aid\":6,\"title\":\"党员“小喇叭”响彻“山旮旯”\",\"img\":\"http:\\/\\/www.cnr.cn\\/newscenter\\/local\\/sytj\\/dfjd\\/20200505\\/W020200505365735751872.jpg\",\"zz\":\"2020年4月下\\/第8期\"},{\"aid\":7,\"title\":\"院落里的“智慧生活”\",\"img\":\"http:\\/\\/www.cnr.cn\\/newscenter\\/local\\/sytj\\/dfjd\\/20200505\\/W020200505365735751872.jpg\",\"zz\":\"2020年4月下\\/第8期\"},{\"aid\":8,\"title\":\"聚合力量谋幸福\",\"img\":\"http:\\/\\/www.cnr.cn\\/newscenter\\/local\\/sytj\\/dfjd\\/20200505\\/W020200505365735751872.jpg\",\"zz\":\"2020年4月下\\/第8期\"}],\"m18\":[{\"pid\":1,\"img\":\"http:\\/\\/www.scdjw.com.cn\\/data\\/attachment\\/portal\\/202002\\/26\\/111411uwthwh2lin29dg99.jpg\",\"url\":\"\\/magazines\"},{\"pid\":2,\"img\":\"http:\\/\\/www.qstheory.cn\\/titlepic\\/112434\\/1124348001_1564471221723_title0h.jpg\"},{\"pid\":3,\"img\":\"http:\\/\\/www.qstheory.cn\\/titlepic\\/112424\\/1124244611_1586016762622_title0h.jpg\"}],\"m5\":[{\"aid\":19,\"title\":\"“头雁”引领社区治理提档升级\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":20,\"title\":\"确保决胜全面小康圆满收官\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":21,\"title\":\"全面创新改革要有系统集成思维\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":22,\"title\":\"领导干部要做制度执行的表率\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":23,\"title\":\"新华社评论员：让初心和使命照亮新时代长征路\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"},{\"aid\":24,\"title\":\"领导干部要做制度执行的表率\",\"size\":\"\",\"color\":\"\",\"bold\":\"\"}]}', null, null, null, null, '1', '1', '', '1');
INSERT INTO `page` VALUES ('2', 'fsdfasdas', '[{\"col\":[{\"c\":\"6\",\"cp\":[{\"t\":\"imgtext1\",\"img\":\"http:\\/\\/file.scdjw.net\\/upload\\/20200717\\/b4217e9992f0f49462072a7346e657c8.jpg\",\"w\":\"100%\",\"c_t\":\"0\",\"i_t\":\"0\",\"title\":\"《求是》杂志发表习近平总书记重要文章《中国共产党领导是中国特色社会主义最本质的特征》\",\"url\":\"\\/article\\/undefined\",\"it\":\"0\",\"gra\":\"0\"}]},{\"c\":\"6\",\"cp\":[{\"t\":\"imgtext1\",\"img\":\"static\\/temp.jpg\",\"w\":\"100\"}]}],\"fw\":\"0\"},{\"col\":[{\"c\":\"8\",\"cp\":[]},{\"c\":\"4\",\"cp\":[{\"t\":\"imgtext2\",\"img\":\"static\\/temp.jpg\",\"ct\":\"0\",\"it\":\"0\",\"gra\":\"0\",\"tb\":\"0\",\"w\":\"100%\",\"tt\":\"阿萨发士大夫士大夫\"}]}],\"fw\":\"0\"}]', '1595383708', 'upload/20200722/425403960194e993e83c8bacb56d1de9.png', '', null, '3', '1', '', '1');

-- ----------------------------
-- Table structure for sourcewhite
-- ----------------------------
DROP TABLE IF EXISTS `sourcewhite`;
CREATE TABLE `sourcewhite` (
  `sourcewhite` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sourcewhite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sourcewhite
-- ----------------------------
INSERT INTO `sourcewhite` VALUES ('七一网');
INSERT INTO `sourcewhite` VALUES ('中国共产党新闻网');
INSERT INTO `sourcewhite` VALUES ('四川党建网');
INSERT INTO `sourcewhite` VALUES ('四川在线');
INSERT INTO `sourcewhite` VALUES ('四川新闻网');
INSERT INTO `sourcewhite` VALUES ('四川日报');
INSERT INTO `sourcewhite` VALUES ('求是网');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(3) NOT NULL AUTO_INCREMENT,
  `user` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headimg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity` int(2) NOT NULL,
  `cols` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` int(12) NOT NULL,
  `valid` bit(1) DEFAULT b'0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'UuRVv07oWopqxfg7S49O+Q==', '刘尧夫', 'system/headimg/2.gif', '469722592@qq.com', '1', '2,3,4,5,6,1,7,8,9,10,14,15,16,17,25,26,11,12,13,18,27,28,29,30,31,32,19,33,34,35,36,20,37,39,21,40,41,42,43,44,104,105,106', '1570519905', '');
INSERT INTO `user` VALUES ('99', 'jq', 'UuRVv07oWopqxfg7S49O+Q==', '机器人', 'system/headimg/1.gif', null, '1', '2,3,4,5,6,1,7,8,9,10,14,15,16,17,25,26,11,12,13,18,27,28,29,30,31,32,19,33,34,35,36,20,37,39,21,40,41,42,43,44,104,105,106', '1570519905', '\0');

-- ----------------------------
-- Table structure for user_deleted
-- ----------------------------
DROP TABLE IF EXISTS `user_deleted`;
CREATE TABLE `user_deleted` (
  `uid` int(11) NOT NULL,
  `data` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_deleted
-- ----------------------------

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_log
-- ----------------------------
INSERT INTO `user_log` VALUES ('3', '1', '1593582039', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU4MjAzOSwibmJmIjoxNTkzNTgyMDM5LCJleHAiOjE1OTM1OTY0MzksImRhdGEiOiJ0ZXN0In0.6yrxrwaD2Q-8t7iB37-LipRPsjEjRdidARsEwg-dbqk', '127.0.0.1');
INSERT INTO `user_log` VALUES ('4', '1', '1593586097', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU4NjA5NywibmJmIjoxNTkzNTg2MDk3LCJleHAiOjE1OTM2MDA0OTcsImRhdGEiOiJ0ZXN0In0.Ghh4N5RqK326sgShl2rwi9FU3oClj3MiWy9eKIqR0QU', '127.0.0.1');
INSERT INTO `user_log` VALUES ('5', '1', '1593591746', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MTc0NiwibmJmIjoxNTkzNTkxNzQ2LCJleHAiOjE1OTM2MDYxNDYsImRhdGEiOiJ0ZXN0In0.U65oDt-Tfe7HiUY2q_hJRGxQIhIqI4WE-XMrgCaAK0U', '127.0.0.1');
INSERT INTO `user_log` VALUES ('6', '1', '1593591887', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MTg4NywibmJmIjoxNTkzNTkxODg3LCJleHAiOjE1OTM2MDYyODcsImRhdGEiOiJ0ZXN0In0.VKoypJ128bYGugoPtr5ukc5412JTUBVhbLdaCEWhAHQ', '127.0.0.1');
INSERT INTO `user_log` VALUES ('7', '1', '1593591887', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MTg4NywibmJmIjoxNTkzNTkxODg3LCJleHAiOjE1OTM2MDYyODcsImRhdGEiOiJ0ZXN0In0.VKoypJ128bYGugoPtr5ukc5412JTUBVhbLdaCEWhAHQ', '127.0.0.1');
INSERT INTO `user_log` VALUES ('8', '1', '1593592017', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MjAxNywibmJmIjoxNTkzNTkyMDE3LCJleHAiOjE1OTM2MDY0MTcsImRhdGEiOiJ0ZXN0In0.8pGt4WfW6pCbV37A3myRvTlvSYwaQpIXi-XfcGqISRs', '127.0.0.1');
INSERT INTO `user_log` VALUES ('9', '1', '1593592194', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MjE5NCwibmJmIjoxNTkzNTkyMTk0LCJleHAiOjE1OTM2MDY1OTQsImRhdGEiOiJ0ZXN0In0.vDDTrALjdoxz1Hc4B6_xjxuwWeTxXLjHZnDi-BCVWx0', '127.0.0.1');
INSERT INTO `user_log` VALUES ('10', '1', '1593592246', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MjI0NiwibmJmIjoxNTkzNTkyMjQ2LCJleHAiOjE1OTM2MDY2NDYsImRhdGEiOiJ0ZXN0In0.mJXsEmPWWHcmPotG36LlHKdSwusXWd69jkDS1yHvuqk', '127.0.0.1');
INSERT INTO `user_log` VALUES ('11', '1', '1593592314', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MjMxNCwibmJmIjoxNTkzNTkyMzE0LCJleHAiOjE1OTM2MDY3MTQsImRhdGEiOiJ0ZXN0In0.Ga1e1G9-2OidBV0RWADo6521NoSaZbRJS2QpDtFU4FE', '127.0.0.1');
INSERT INTO `user_log` VALUES ('12', '1', '1593592379', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MjM3OSwibmJmIjoxNTkzNTkyMzc5LCJleHAiOjE1OTM2MDY3NzksImRhdGEiOiJ0ZXN0In0.88LNh5bH57Ul_VLeHX5WGQ7i2GrufRX8cpScHW7JPlA', '127.0.0.1');
INSERT INTO `user_log` VALUES ('13', '1', '1593592499', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MjQ5OSwibmJmIjoxNTkzNTkyNDk5LCJleHAiOjE1OTM2MDY4OTksImRhdGEiOiJ0ZXN0In0.yPiftiLpNYltlRKlxsqQXKqpDZXy0CLJGZzR6AAolfM', '127.0.0.1');
INSERT INTO `user_log` VALUES ('14', '1', '1593592506', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MjUwNiwibmJmIjoxNTkzNTkyNTA2LCJleHAiOjE1OTM2MDY5MDYsImRhdGEiOiJ0ZXN0In0.8mG9FWvZ9uZMM_qHsmw9IFzM66l1z8-fkSdc9d0LfKI', '127.0.0.1');
INSERT INTO `user_log` VALUES ('15', '1', '1593592738', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5MjczOCwibmJmIjoxNTkzNTkyNzM4LCJleHAiOjE1OTM2MDcxMzgsImRhdGEiOiJ0ZXN0In0.FIzK33UI5kH13pUfMOESto2InOkHbiOdEXGA9eEOP5E', '127.0.0.1');
INSERT INTO `user_log` VALUES ('16', '1', '1593592971', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5Mjk3MSwibmJmIjoxNTkzNTkyOTcxLCJleHAiOjE1OTM2MDczNzEsImRhdGEiOiJ0ZXN0In0.l26XOVuU8A2ZzkNb6WPJTSUhP0xDN3fov-p2WeTRLrE', '127.0.0.1');
INSERT INTO `user_log` VALUES ('17', '1', '1593592976', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5Mjk3NiwibmJmIjoxNTkzNTkyOTc2LCJleHAiOjE1OTM2MDczNzYsImRhdGEiOiJ0ZXN0In0.Ke3DMxM60CMRYfkYC82vvsp7oARM2jTLhNplYv7yVKc', '127.0.0.1');
INSERT INTO `user_log` VALUES ('18', '1', '1593594887', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5NDg4NywibmJmIjoxNTkzNTk0ODg3LCJleHAiOjE1OTM2MDkyODcsImRhdGEiOiJ0ZXN0In0.lL-FNT6qxGJePPYqCMzMziGgYXsJ-lSk34Wkj7ebfnk', '127.0.0.1');
INSERT INTO `user_log` VALUES ('19', '1', '1593595167', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5NTE2NiwibmJmIjoxNTkzNTk1MTY2LCJleHAiOjE1OTM2MDk1NjYsImRhdGEiOiJ0ZXN0In0.tXAgoWhTYdSFkbqHjOAeL1i2GhNktGFxduiY6ZMOC8c', '127.0.0.1');
INSERT INTO `user_log` VALUES ('20', '1', '1593596552', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzU5NjU1MiwibmJmIjoxNTkzNTk2NTUyLCJleHAiOjE1OTM2MTA5NTIsImRhdGEiOiJ0ZXN0In0.ccBh9vB_UAsLvbE5yEPPd1IfgnSPXd9pNp3e2c8BkGc', '127.0.0.1');
INSERT INTO `user_log` VALUES ('21', '1', '1593652179', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY1MjE3OSwibmJmIjoxNTkzNjUyMTc5LCJleHAiOjE1OTM2NjY1NzksImRhdGEiOiJ0ZXN0In0.xlVKjWNGiaLatEpFVKetJEX9dj8eOyu8fXpI3q-bcfs', '127.0.0.1');
INSERT INTO `user_log` VALUES ('22', '1', '1593658672', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY1ODY3MiwibmJmIjoxNTkzNjU4NjcyLCJleHAiOjE1OTM2NzMwNzIsImRhdGEiOiJ0ZXN0In0.pRlchtWuA64yzruNbwhFVxsOqQwVfUFxJSWSRLffwGY', '127.0.0.1');
INSERT INTO `user_log` VALUES ('23', '1', '1593658722', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY1ODcyMiwibmJmIjoxNTkzNjU4NzIyLCJleHAiOjE1OTM2NzMxMjIsImRhdGEiOiJ0ZXN0In0.F-5H9T_eGplJiHDyz57lOLbm3qfIgcX6DTx45r1QROg', '127.0.0.1');
INSERT INTO `user_log` VALUES ('24', '1', '1593658726', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY1ODcyNiwibmJmIjoxNTkzNjU4NzI2LCJleHAiOjE1OTM2NzMxMjYsImRhdGEiOiJ0ZXN0In0.u69JAojauOeDdErKp0kPESdmPLCqaYKzj9hchvB6oI4', '127.0.0.1');
INSERT INTO `user_log` VALUES ('25', '1', '1593660386', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY2MDM4NiwibmJmIjoxNTkzNjYwMzg2LCJleHAiOjE1OTM2NzQ3ODYsImRhdGEiOiJ0ZXN0In0.x_OTYrbx5SGXEWwgwwqAjbx99taunaaTjir8BgP5hW0', '127.0.0.1');
INSERT INTO `user_log` VALUES ('26', '1', '1593660468', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY2MDQ2OCwibmJmIjoxNTkzNjYwNDY4LCJleHAiOjE1OTM2NzQ4NjgsImRhdGEiOiJ0ZXN0In0.aacT3CMlv0dMNlPb8TPWyLpfdRuuFf5agT74dWhTqp0', '127.0.0.1');
INSERT INTO `user_log` VALUES ('27', '1', '1593661059', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY2MTA1OSwibmJmIjoxNTkzNjYxMDU5LCJleHAiOjE1OTM2NzU0NTksImRhdGEiOiJ0ZXN0In0.Dy49ve52eUXXJe3nnWhVCA_FU-cRlxxR9AsEnrpcplo', '127.0.0.1');
INSERT INTO `user_log` VALUES ('28', '1', '1593661072', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY2MTA3MiwibmJmIjoxNTkzNjYxMDcyLCJleHAiOjE1OTM2NzU0NzIsImRhdGEiOiJ0ZXN0In0.ouzVdRjF8yWFzZXfFbbEVjgkfxqGwY-K_MnGfmiP6Eg', '127.0.0.1');
INSERT INTO `user_log` VALUES ('29', '1', '1593678378', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY3ODM3OCwibmJmIjoxNTkzNjc4Mzc4LCJleHAiOjE1OTM2OTI3NzgsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.42w1RUAl-uHZ-imEKAGAr_cMVQcKsWUUPKUGZ1_0Ego', '127.0.0.1');
INSERT INTO `user_log` VALUES ('30', '1', '1593678422', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY3ODQyMiwibmJmIjoxNTkzNjc4NDIyLCJleHAiOjE1OTM2OTI4MjIsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.UM98I3jl-OMWZZdxr-NNxd_UwruQTf8ugw331QpGihQ', '127.0.0.1');
INSERT INTO `user_log` VALUES ('31', '1', '1593679517', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY3OTUxNywibmJmIjoxNTkzNjc5NTE3LCJleHAiOjE1OTM2OTM5MTcsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.y7LQ9Mh_YuoY986dB8VtA7A_AbDtztjuMMSEoiNKyss', '127.0.0.1');
INSERT INTO `user_log` VALUES ('32', '1', '1593679528', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY3OTUyOCwibmJmIjoxNTkzNjc5NTI4LCJleHAiOjE1OTM2OTM5MjgsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.jqw_XSIinUzsDyRWEWLp7srTeC8nRiO8i3moi67wsIU', '127.0.0.1');
INSERT INTO `user_log` VALUES ('33', '1', '1593679569', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5MzY3OTU2OSwibmJmIjoxNTkzNjc5NTY5LCJleHAiOjE1OTM2OTM5NjksImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19._sP-NPhkAmtUx4LXCT3AVvB3sRgVVGcMpGl2Go31bZQ', '127.0.0.1');
INSERT INTO `user_log` VALUES ('34', '1', '1593997856', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5Mzk5Nzg1NiwibmJmIjoxNTkzOTk3ODU2LCJleHAiOjE1OTQwMTIyNTYsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.wfbfsCeJ7yH2se8_EYWYlDiwWqCz96AcHamyX9DOlyo', '127.0.0.1');
INSERT INTO `user_log` VALUES ('35', '1', '1593997969', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5Mzk5Nzk2OSwibmJmIjoxNTkzOTk3OTY5LCJleHAiOjE1OTQwMTIzNjksImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.X_oVAGbh2PQcJVs7xErDc9h3SSIcXAdIMACbOsI_4k8', '127.0.0.1');
INSERT INTO `user_log` VALUES ('36', '1', '1593998285', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5Mzk5ODI4NSwibmJmIjoxNTkzOTk4Mjg1LCJleHAiOjE1OTQwMTI2ODUsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.f61PZBHaT2jkWjtvLIpQ3EezIhqJSvh7bI2LY-kASXU', '127.0.0.1');
INSERT INTO `user_log` VALUES ('37', '1', '1593998362', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5Mzk5ODM2MiwibmJmIjoxNTkzOTk4MzYyLCJleHAiOjE1OTQwMTI3NjIsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.Uio037y8y8-oN1xxoYrQXcqMLdFb8S5ytIiWUVoW-XE', '127.0.0.1');
INSERT INTO `user_log` VALUES ('38', '1', '1593998624', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5Mzk5ODYyNCwibmJmIjoxNTkzOTk4NjI0LCJleHAiOjE1OTQwMTMwMjQsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.eFYAHdEMLiVPRN6qEwOvrXweoGfPNGR3sTGVjRkrZqs', '127.0.0.1');
INSERT INTO `user_log` VALUES ('39', '1', '1593998749', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5Mzk5ODc0OCwibmJmIjoxNTkzOTk4NzQ4LCJleHAiOjE1OTQwMTMxNDgsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.EBzwQd-WOnHvgfHslG1VwS_vK_33U_WzaOwGDPMzgcs', '127.0.0.1');
INSERT INTO `user_log` VALUES ('40', '1', '1593998763', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5Mzk5ODc2MywibmJmIjoxNTkzOTk4NzYzLCJleHAiOjE1OTQwMTMxNjMsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.1SAHffyhDNr4UHNkJRxB1vlnmjEyLwGxktYgV3wrgyg', '127.0.0.1');
INSERT INTO `user_log` VALUES ('41', '1', '1593998792', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5Mzk5ODc5MiwibmJmIjoxNTkzOTk4NzkyLCJleHAiOjE1OTQwMTMxOTIsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.T1qFV7rgLBl_8J91WHfgt5XCmu56IXIWq4Gdom-3Ie4', '127.0.0.1');
INSERT INTO `user_log` VALUES ('42', '1', '1593998809', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5Mzk5ODgwOSwibmJmIjoxNTkzOTk4ODA5LCJleHAiOjE1OTQwMTMyMDksImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.Wy4PzC20IXSAavxpXxuiTTCJg36PKcUpcOCZBkBAD9w', '127.0.0.1');
INSERT INTO `user_log` VALUES ('43', '1', '1593999259', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5Mzk5OTI1OSwibmJmIjoxNTkzOTk5MjU5LCJleHAiOjE1OTQwMTM2NTksImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.2P4bacpE7kAPRIGIee1bvn15vB4ANcd1JD-szT56zvs', '127.0.0.1');
INSERT INTO `user_log` VALUES ('44', '1', '1594000399', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAwMDM5OSwibmJmIjoxNTk0MDAwMzk5LCJleHAiOjE1OTQwMTQ3OTksImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.61SHD91TbiCTVu0I4ifx59yTyZTD2VGiKrkPpGLxIbQ', '127.0.0.1');
INSERT INTO `user_log` VALUES ('45', '1', '1594017406', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAxNzQwNiwibmJmIjoxNTk0MDE3NDA2LCJleHAiOjE1OTQwMzE4MDYsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.rAgu4Kb5gWmxf6Lo7OCTFbkk_U-D_7dSIB5uKCj5KU4', '127.0.0.1');
INSERT INTO `user_log` VALUES ('46', '1', '1594022477', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyMjQ3NywibmJmIjoxNTk0MDIyNDc3LCJleHAiOjE1OTQwMzY4NzcsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.BItto1SfHwJacPI4TAB_Vp0XnI5GbLv4X2b17t8pjzI', '127.0.0.1');
INSERT INTO `user_log` VALUES ('47', '1', '1594022734', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyMjczNCwibmJmIjoxNTk0MDIyNzM0LCJleHAiOjE1OTQwMzcxMzQsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.JavW7EPOcxBNWLvjLaYzwNnGlVlPWDOIM-MTCr7KLP4', '127.0.0.1');
INSERT INTO `user_log` VALUES ('48', '1', '1594022761', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyMjc2MSwibmJmIjoxNTk0MDIyNzYxLCJleHAiOjE1OTQwMzcxNjEsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.4M3nYkKyqK8_Wtey7z_hAHENpK11ErgI3Ptr0UPbUc4', '127.0.0.1');
INSERT INTO `user_log` VALUES ('49', '1', '1594022829', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyMjgyOSwibmJmIjoxNTk0MDIyODI5LCJleHAiOjE1OTQwMzcyMjksImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.ePK1Fyt--JAj_VwkWAjeEpf4Wqzk8hyyePSvD_g6iG4', '127.0.0.1');
INSERT INTO `user_log` VALUES ('50', '1', '1594022861', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyMjg2MSwibmJmIjoxNTk0MDIyODYxLCJleHAiOjE1OTQwMzcyNjEsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.MKZyHzGNJ4O_NEp1hhU-WLC69OU7oGesvbAoXnNqIfs', '127.0.0.1');
INSERT INTO `user_log` VALUES ('51', '1', '1594022942', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyMjk0MiwibmJmIjoxNTk0MDIyOTQyLCJleHAiOjE1OTQwMzczNDIsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.Zp7-WCshRTW7ttXD64h6HlQNyr3u6Kjd445OxIVU2AM', '127.0.0.1');
INSERT INTO `user_log` VALUES ('52', '1', '1594023104', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyMzEwNCwibmJmIjoxNTk0MDIzMTA0LCJleHAiOjE1OTQwMzc1MDQsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.DxoZ1I028y7sf4CBfRRt3ZeJXQ_ZR7hmDj2XLyh-8Us', '127.0.0.1');
INSERT INTO `user_log` VALUES ('53', '1', '1594023191', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyMzE5MSwibmJmIjoxNTk0MDIzMTkxLCJleHAiOjE1OTQwMzc1OTEsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.P74UM1-NFSGDKrHeYMkwgI4mG2jdGU1njRkQ6kJUNso', '127.0.0.1');
INSERT INTO `user_log` VALUES ('54', '1', '1594023251', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyMzI1MSwibmJmIjoxNTk0MDIzMjUxLCJleHAiOjE1OTQwMzc2NTEsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.eRGcjgHwgNGdyXJO4l8ldbQ6DSwWPebj0SsddOVh_8M', '127.0.0.1');
INSERT INTO `user_log` VALUES ('55', '1', '1594024321', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyNDMyMSwibmJmIjoxNTk0MDI0MzIxLCJleHAiOjE1OTQwMzg3MjEsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.DFVAW116yNpF1zVW7qLa1ydMR5F2Ry_lXkCjwVBUVV0', '127.0.0.1');
INSERT INTO `user_log` VALUES ('56', '1', '1594024368', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyNDM2OCwibmJmIjoxNTk0MDI0MzY4LCJleHAiOjE1OTQwMzg3NjgsImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.Lfv7wsicWHqjUPw7sn8ZO9zv61Ktie6ZFcD_-XgFPFc', '127.0.0.1');
INSERT INTO `user_log` VALUES ('57', '1', '1594024953', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyNDk1MywibmJmIjoxNTk0MDI0OTUzLCJleHAiOjE1OTQwMzkzNTMsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.4p-7mBK0oen6PV3SHhOjQ2XIyuW1AOQz95l9tj5TcJE', '127.0.0.1');
INSERT INTO `user_log` VALUES ('58', '1', '1594025089', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyNTA4OSwibmJmIjoxNTk0MDI1MDg5LCJleHAiOjE1OTQwMzk0ODksImRhdGEiOnsidWlkIjoiMSIsInVzZXIiOiJhZG1pbiIsImlwIjoiMTI3LjAuMC4xIn19.rQkIEL2-Lk6pKR4b_936F6sryOmUo8Rlvl5qjCAdjag', '127.0.0.1');
INSERT INTO `user_log` VALUES ('59', '1', '1594025214', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDAyNTIxNCwibmJmIjoxNTk0MDI1MjE0LCJleHAiOjE1OTQwMzk2MTQsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.EPGgOGcavbgXLcXW06tmPM1jRt11VmuKP0PEEtwmM7Y', '127.0.0.1');
INSERT INTO `user_log` VALUES ('60', '1', '1594084986', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA4NDk4NiwibmJmIjoxNTk0MDg0OTg2LCJleHAiOjE1OTQwOTkzODYsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.ckQj8Wc94O2v_ZcHLqF74D8pknKFKzmWkJOhIPDtv7o', '127.0.0.1');
INSERT INTO `user_log` VALUES ('61', '1', '1594089816', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA4OTgxNiwibmJmIjoxNTk0MDg5ODE2LCJleHAiOjE1OTQxMDQyMTYsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.412Iv7ls5WqxEjHFDnZwdSZ4JS8BRKGDktso4YDN2cQ', '127.0.0.1');
INSERT INTO `user_log` VALUES ('62', '3', '1594089852', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA4OTg1MiwibmJmIjoxNTk0MDg5ODUyLCJleHAiOjE1OTQxMDQyNTIsImRhdGEiOnsidWlkIjozLCJ1c2VyIjoieWZzbyIsImlwIjoiMTI3LjAuMC4xIn19.uEoCQXGH1a5DFJjyV3438jEVuxpLh4iTqIBQmoNhFBg', '127.0.0.1');
INSERT INTO `user_log` VALUES ('63', '1', '1594089879', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA4OTg3OSwibmJmIjoxNTk0MDg5ODc5LCJleHAiOjE1OTQxMDQyNzksImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.QzF-aze9Y9HOhfe81cMj-XR6Ch5CxsveAjPV8sccJfk', '127.0.0.1');
INSERT INTO `user_log` VALUES ('64', '1', '1594091247', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA5MTI0NywibmJmIjoxNTk0MDkxMjQ3LCJleHAiOjE1OTQxMDU2NDcsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.LFu6whhVsSXTmPjT-ByqsJTrCnm-cbTPBnzYyvVUdUk', '127.0.0.1');
INSERT INTO `user_log` VALUES ('65', '1', '1594091682', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA5MTY4MiwibmJmIjoxNTk0MDkxNjgyLCJleHAiOjE1OTQxMDYwODIsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.nv9pUyO5Amq6tnGRRd_ws3OQJwvN0UMZ7NKOZSvVRVg', '127.0.0.1');
INSERT INTO `user_log` VALUES ('66', '1', '1594091805', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA5MTgwNSwibmJmIjoxNTk0MDkxODA1LCJleHAiOjE1OTQxMDYyMDUsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.8NY3uS-kky4OQ9fIFfYSvKaKGuNpgvjB7uchBbnF5y4', '127.0.0.1');
INSERT INTO `user_log` VALUES ('67', '1', '1594091870', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA5MTg3MCwibmJmIjoxNTk0MDkxODcwLCJleHAiOjE1OTQxMDYyNzAsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.KuAPYw0XI1IanWuYjCd2Up6gfXiJnaBwb9TKvh9fOY0', '127.0.0.1');
INSERT INTO `user_log` VALUES ('68', '1', '1594092389', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA5MjM4OSwibmJmIjoxNTk0MDkyMzg5LCJleHAiOjE1OTQxMDY3ODksImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.8AeS4Dj5I_QtrNn-ZniA-StOk5eQjMuJp70sIOqeB68', '127.0.0.1');
INSERT INTO `user_log` VALUES ('69', '1', '1594092401', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA5MjQwMSwibmJmIjoxNTk0MDkyNDAxLCJleHAiOjE1OTQxMDY4MDEsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.9FW0ruo5k3vXVp4TCCMXbM0Ldxhgto7hTjx12GzAwNU', '127.0.0.1');
INSERT INTO `user_log` VALUES ('70', '1', '1594092457', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA5MjQ1NywibmJmIjoxNTk0MDkyNDU3LCJleHAiOjE1OTQxMDY4NTcsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.8jbN-_nrW4yyqT5Qy2-CuomZWps8J1vBKIKFa4MTze4', '127.0.0.1');
INSERT INTO `user_log` VALUES ('71', '1', '1594092549', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA5MjU0OSwibmJmIjoxNTk0MDkyNTQ5LCJleHAiOjE1OTQxMDY5NDksImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.y1yyUaTPR91Eu2zsQihhDSvq1E0dnJ3_xOV6Gxa3_Ak', '127.0.0.1');
INSERT INTO `user_log` VALUES ('72', '1', '1594092563', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA5MjU2MywibmJmIjoxNTk0MDkyNTYzLCJleHAiOjE1OTQxMDY5NjMsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.f2kYcqSPsJZ9bRZ15n6yvxAXospsTnjPByUuhhsZCUU', '127.0.0.1');
INSERT INTO `user_log` VALUES ('73', '1', '1594092573', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDA5MjU3MywibmJmIjoxNTk0MDkyNTczLCJleHAiOjE1OTQxMDY5NzMsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.T2bOFLisiglJLbAgXBdDP5u52v-zZhzHTF3hBFj1TVk', '127.0.0.1');
INSERT INTO `user_log` VALUES ('74', '1', '1594106992', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDEwNjk5MiwibmJmIjoxNTk0MTA2OTkyLCJleHAiOjE1OTQxMjEzOTIsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.YJUfZzxt6cbPM0CKQHDK3OWm2SrRjYae_2dsvaE15iI', '127.0.0.1');
INSERT INTO `user_log` VALUES ('75', '1', '1594116951', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDExNjk1MSwibmJmIjoxNTk0MTE2OTUxLCJleHAiOjE1OTQxMzEzNTEsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.wInTbZKb08dxRB5bL2RInEg3rc8D6gEImKuWFpFYGTA', '127.0.0.1');
INSERT INTO `user_log` VALUES ('76', '1', '1594137253', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDEzNzI1MywibmJmIjoxNTk0MTM3MjUzLCJleHAiOjE1OTQxNTE2NTMsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.QDjnJL-uPGsFR4x-bMkmECgyN7S1q5qst0vzHJfkmFs', '127.0.0.1');
INSERT INTO `user_log` VALUES ('77', '1', '1594171948', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDE3MTk0OCwibmJmIjoxNTk0MTcxOTQ4LCJleHAiOjE1OTQxODYzNDgsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.MrH7o258cOUPjR62mj0ea5xOXHo8S-HDrbf_c5LqVXg', '127.0.0.1');
INSERT INTO `user_log` VALUES ('78', '1', '1594175408', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDE3NTQwOCwibmJmIjoxNTk0MTc1NDA4LCJleHAiOjE1OTQxODk4MDgsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.uZcjl2lTZ-Bx9TV60Y9sLQSyijuD0Ew1hT4UUSVUtYw', '127.0.0.1');
INSERT INTO `user_log` VALUES ('79', '1', '1594189967', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDE4OTk2NywibmJmIjoxNTk0MTg5OTY3LCJleHAiOjE1OTQyMDQzNjcsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.mGkjPFYY_SGZzgnjBZmqJBqW8Hw3una-bZIj_6VuH2Q', '127.0.0.1');
INSERT INTO `user_log` VALUES ('80', '1', '1594343945', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDM0Mzk0NSwibmJmIjoxNTk0MzQzOTQ1LCJleHAiOjE1OTQzNTgzNDUsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.UhsILsj-jTTr84T6ws9t_-P_7FaPY4bfUxBhG7OXi00', '127.0.0.1');
INSERT INTO `user_log` VALUES ('81', '1', '1594363249', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDM2MzI0OSwibmJmIjoxNTk0MzYzMjQ5LCJleHAiOjE1OTQzNzc2NDksImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.8b1VDFnfqhFBxlRqmc_yOz9H91yDx0fLW9gwj-km1rY', '127.0.0.1');
INSERT INTO `user_log` VALUES ('82', '1', '1594603526', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDYwMzUyNiwibmJmIjoxNTk0NjAzNTI2LCJleHAiOjE1OTQ2MTc5MjYsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.M0OxpDj1nVm609MbvJ34f7s4WtssMKRJMWSo3Ca5elQ', '127.0.0.1');
INSERT INTO `user_log` VALUES ('83', '1', '1594624134', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDYyNDEzNCwibmJmIjoxNTk0NjI0MTM0LCJleHAiOjE1OTQ2Mzg1MzQsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.SKUiJm16CDmWxV1b7thA3z3JNVgwIbDwu8t4zu04REI', '127.0.0.1');
INSERT INTO `user_log` VALUES ('84', '1', '1594688969', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDY4ODk2OSwibmJmIjoxNTk0Njg4OTY5LCJleHAiOjE1OTQ3MDMzNjksImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.sx3mHnnC9hkRPRk6ErKYuabYq9214MMYtjpIouvxZmk', '127.0.0.1');
INSERT INTO `user_log` VALUES ('85', '1', '1594708475', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDcwODQ3NSwibmJmIjoxNTk0NzA4NDc1LCJleHAiOjE1OTQ3MjI4NzUsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.jDYDDxbUZV-Fu7ci7C3flIIekeTbFoYygERgBUPi0iI', '127.0.0.1');
INSERT INTO `user_log` VALUES ('86', '1', '1594738100', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDczODEwMCwibmJmIjoxNTk0NzM4MTAwLCJleHAiOjE1OTQ3NTI1MDAsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.AMb5aEXoglRJ5_MdZYoYMfAwOeJGN2q_Xh9oUQPhxXQ', '127.0.0.1');
INSERT INTO `user_log` VALUES ('87', '1', '1594775741', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDc3NTc0MSwibmJmIjoxNTk0Nzc1NzQxLCJleHAiOjE1OTQ3OTAxNDEsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.u4x_2HZd7mb1FmKt5woGv_1Z6VtloiVsatEOOJGpNvY', '127.0.0.1');
INSERT INTO `user_log` VALUES ('88', '1', '1594793192', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDc5MzE5MiwibmJmIjoxNTk0NzkzMTkyLCJleHAiOjE1OTQ4MDc1OTIsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.GxGMFW7YwVOme4Sia44cdNuniW1xZd7ftRYLB7AvcSo', '127.0.0.1');
INSERT INTO `user_log` VALUES ('89', '1', '1594862141', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDg2MjE0MSwibmJmIjoxNTk0ODYyMTQxLCJleHAiOjE1OTQ4NzY1NDEsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.oxJ98ZgAR9tiz3v1stg4TxLc9KFYEXNTG6y65Dl0osg', '127.0.0.1');
INSERT INTO `user_log` VALUES ('90', '1', '1594881302', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDg4MTMwMiwibmJmIjoxNTk0ODgxMzAyLCJleHAiOjE1OTQ4OTU3MDIsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.GzS39If5m78qUZXJqvJIyRqqgyeShipmpkGylWejEHw', '127.0.0.1');
INSERT INTO `user_log` VALUES ('91', '1', '1594947550', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDk0NzU1MCwibmJmIjoxNTk0OTQ3NTUwLCJleHAiOjE1OTQ5NjE5NTAsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.qDzLHJuQ0ctAu2lCwZ4BU8QuyGXyIFKwpKhu5bl5fDY', '127.0.0.1');
INSERT INTO `user_log` VALUES ('92', '1', '1594955207', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDk1NTIwNywibmJmIjoxNTk0OTU1MjA3LCJleHAiOjE1OTQ5Njk2MDcsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.Z0jHWRPauvAIEtoM0fK1fWgb0rUKyajwrHJfZOGG9uY', '127.0.0.1');
INSERT INTO `user_log` VALUES ('93', '1', '1594955331', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDk1NTMzMSwibmJmIjoxNTk0OTU1MzMxLCJleHAiOjE1OTQ5Njk3MzEsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.12A92CKkC6MMNewtjCgmASBlaQL7xyQpfImaQCGY19g', '127.0.0.1');
INSERT INTO `user_log` VALUES ('94', '1', '1594973512', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NDk3MzUxMiwibmJmIjoxNTk0OTczNTEyLCJleHAiOjE1OTQ5ODc5MTIsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.jy8fYSuIFOJdP_RLi39syatAOb6bkPjO50OI7W5rpAo', '127.0.0.1');
INSERT INTO `user_log` VALUES ('95', '1', '1595207634', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTIwNzYzNCwibmJmIjoxNTk1MjA3NjM0LCJleHAiOjE1OTUyMjIwMzQsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.wVjQO5gBuCMNHFljpi4QWdxX28LPzVAQu4kLQLP-Qd8', '127.0.0.1');
INSERT INTO `user_log` VALUES ('96', '1', '1595226917', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTIyNjkxNywibmJmIjoxNTk1MjI2OTE3LCJleHAiOjE1OTUyNDEzMTcsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.JzScqThBD0-DRxqGqmb4-NklPZASyM8Y7gmbnD24eec', '127.0.0.1');
INSERT INTO `user_log` VALUES ('97', '1', '1595294183', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTI5NDE4MywibmJmIjoxNTk1Mjk0MTgzLCJleHAiOjE1OTUzMDg1ODMsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.ppxXsKA6UGE6vadTn1wn_EjUhzJNM0wZkvchOPHOszw', '127.0.0.1');
INSERT INTO `user_log` VALUES ('98', '1', '1595316131', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTMxNjEzMSwibmJmIjoxNTk1MzE2MTMxLCJleHAiOjE1OTUzMzA1MzEsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.eDpP3-ErrA9_c6nVeazJHiqkqX0cATbSHrK1rRY_1x8', '127.0.0.1');
INSERT INTO `user_log` VALUES ('99', '1', '1595380520', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTM4MDUyMCwibmJmIjoxNTk1MzgwNTIwLCJleHAiOjE1OTUzOTQ5MjAsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.G5geOjzQst0RjVwZfY9Kd4j5eDtcp-SpEbuF0QDeFto', '127.0.0.1');
INSERT INTO `user_log` VALUES ('100', '1', '1595402245', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTQwMjI0NSwibmJmIjoxNTk1NDAyMjQ1LCJleHAiOjE1OTU0MTY2NDUsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.nSuo2XAOSbWjEyd5ykK8MlhHOZj-sMfxUjE6eUsO_ew', '127.0.0.1');
INSERT INTO `user_log` VALUES ('101', '1', '1595431095', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTQzMTA5NSwibmJmIjoxNTk1NDMxMDk1LCJleHAiOjE1OTU0NDU0OTUsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.mPcIoUBpqCL_QSec3HvhTqzZG_A-B9tmLomrqdlcTW0', '127.0.0.1');
INSERT INTO `user_log` VALUES ('102', '1', '1595467073', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTQ2NzA3MywibmJmIjoxNTk1NDY3MDczLCJleHAiOjE1OTU0ODE0NzMsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.scRtJahqG7_HVMvw06mZE9dOjbzaR0Gim9dv7ZCA8zk', '127.0.0.1');
INSERT INTO `user_log` VALUES ('103', '1', '1595487121', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTQ4NzEyMSwibmJmIjoxNTk1NDg3MTIxLCJleHAiOjE1OTU1MDE1MjEsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.dounxegV6Hpd3aQl-s0vSKgMA8W_7azv7y-5RvtEvkY', '127.0.0.1');
INSERT INTO `user_log` VALUES ('104', '1', '1595556582', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTU1NjU4MiwibmJmIjoxNTk1NTU2NTgyLCJleHAiOjE1OTU1NzA5ODIsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.gVO1x_tA-RwzS79Nn3brbNxqz_7TIYp-Up7rwRBvkRM', '127.0.0.1');
INSERT INTO `user_log` VALUES ('105', '1', '1595573047', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTU3MzA0NywibmJmIjoxNTk1NTczMDQ3LCJleHAiOjE1OTU1ODc0NDcsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.NZb0WwoHID_WCTIb4ckboCJjQ_zjQyyU5cdGpmvSyCo', '127.0.0.1');
INSERT INTO `user_log` VALUES ('106', '1', '1595832589', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTgzMjU4OSwibmJmIjoxNTk1ODMyNTg5LCJleHAiOjE1OTU4NDY5ODksImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.WEOwwR4Q2XKIr2vQYlk7WtxEHlVaHAOIUOVQwIt6nto', '127.0.0.1');
INSERT INTO `user_log` VALUES ('107', '1', '1595859244', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTg1OTI0NCwibmJmIjoxNTk1ODU5MjQ0LCJleHAiOjE1OTU4NzM2NDQsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.jLcxRZEe4hjcQ9PVdKnuA5a-FWP_2wjfJmJLtmF9VU0', '127.0.0.1');
INSERT INTO `user_log` VALUES ('108', '1', '1595898753', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTg5ODc1MywibmJmIjoxNTk1ODk4NzUzLCJleHAiOjE1OTU5MTMxNTMsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.WHPJLAA_3EULfljLn_NuA1fpTwoFz2xRaD9CpKV6ps8', '127.0.0.1');
INSERT INTO `user_log` VALUES ('109', '1', '1595918985', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTkxODk4NSwibmJmIjoxNTk1OTE4OTg1LCJleHAiOjE1OTU5MzMzODUsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.Yew1azOTuvFvSHwQzRAI2Evp1onQwCg1LgGpj28-koQ', '127.0.0.1');
INSERT INTO `user_log` VALUES ('110', '1', '1595943277', 'login', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2NkancubmV0IiwiYXVkIjoid3d3LnNjZGp3Lm5ldCIsImlhdCI6MTU5NTk0MzI3NywibmJmIjoxNTk1OTQzMjc3LCJleHAiOjE1OTU5NTc2NzcsImRhdGEiOnsidWlkIjoxLCJ1c2VyIjoiYWRtaW4iLCJpcCI6IjEyNy4wLjAuMSJ9fQ.3Cqg9_NeXQNtXYwfFdBZYDcFjXUEY--wClERdPdOwy0', '127.0.0.1');

-- ----------------------------
-- Table structure for viewnum
-- ----------------------------
DROP TABLE IF EXISTS `viewnum`;
CREATE TABLE `viewnum` (
  `indate` date NOT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`indate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewnum
-- ----------------------------
INSERT INTO `viewnum` VALUES ('2020-06-05', '16516');
INSERT INTO `viewnum` VALUES ('2020-06-06', '22626');
INSERT INTO `viewnum` VALUES ('2020-06-07', '22114');
INSERT INTO `viewnum` VALUES ('2020-06-08', '11435');
INSERT INTO `viewnum` VALUES ('2020-06-09', '4463');
INSERT INTO `viewnum` VALUES ('2020-06-04', '12312');
INSERT INTO `viewnum` VALUES ('2020-06-03', '41122');
INSERT INTO `viewnum` VALUES ('2020-06-02', '11111');
INSERT INTO `viewnum` VALUES ('2020-06-01', '23111');
INSERT INTO `viewnum` VALUES ('2020-05-31', '43422');
INSERT INTO `viewnum` VALUES ('2020-05-30', '23432');
INSERT INTO `viewnum` VALUES ('2020-05-29', '33211');
INSERT INTO `viewnum` VALUES ('2020-05-28', '12131');
INSERT INTO `viewnum` VALUES ('2020-05-27', '34122');
INSERT INTO `viewnum` VALUES ('2020-05-26', '33111');
INSERT INTO `viewnum` VALUES ('2020-05-25', '32323');
INSERT INTO `viewnum` VALUES ('2020-06-24', '34321');
INSERT INTO `viewnum` VALUES ('2020-06-23', '51233');
INSERT INTO `viewnum` VALUES ('2020-06-22', '45123');
INSERT INTO `viewnum` VALUES ('2020-05-21', '23444');
INSERT INTO `viewnum` VALUES ('2020-05-20', '62324');
INSERT INTO `viewnum` VALUES ('2020-05-19', '14443');
INSERT INTO `viewnum` VALUES ('2020-05-18', '55321');
INSERT INTO `viewnum` VALUES ('2020-06-10', '14');
