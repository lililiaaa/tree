-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-07-30 13:27:30
-- 服务器版本： 5.7.18
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tree`
--

-- --------------------------------------------------------

--
-- 表的结构 `answer`
--

CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL,
  `vocabulary_id` int(11) NOT NULL COMMENT '题id',
  `panduan` bit(1) NOT NULL COMMENT '判断',
  `answer` varchar(255) NOT NULL COMMENT '错误答案'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `answer`
--

INSERT INTO `answer` (`answer_id`, `vocabulary_id`, `panduan`, `answer`) VALUES
(1, 1, b'0', 'vi.加速，增长'),
(2, 1, b'0', 'n.新闻报道，覆盖范围，承保范围'),
(3, 1, b'0', 'adj.防...的，抵抗的'),
(4, 1, b'1', 'v.使投入，使陷入，暴跌'),
(5, 2, b'0', 'adj.创造性的，创意的'),
(6, 2, b'0', 'n.面包，烤面包'),
(7, 2, b'1', 'n.额，下巴'),
(8, 2, b'0', 'n.灌溉'),
(9, 3, b'1', 'n.说谎的人'),
(10, 3, b'0', 'v.使联合，使统一'),
(11, 3, b'0', 'v.浸泡，深入，吸入'),
(12, 3, b'0', 'n.对话，对白'),
(13, 4, b'0', 'v.造反，反抗，反派'),
(14, 4, b'0', 'n.教科书'),
(15, 4, b'0', 'n.建筑物，结构'),
(16, 4, b'1', 'adj.光滑的，平稳的'),
(17, 5, b'1', 'v.烤，烘焙'),
(18, 5, b'0', 'n.电信，远程通信'),
(19, 5, b'0', 'n.隧道，挖地道'),
(20, 5, b'0', 'adj.比例的，相称的'),
(21, 6, b'0', 'n.昆虫'),
(22, 6, b'0', 'n.手套'),
(23, 6, b'1', 'vi辞职，顺从，投降'),
(24, 6, b'0', 'vi.刹住，刹车'),
(25, 7, b'0', 'n.卫星，人造卫星'),
(26, 7, b'0', 'adv.在室内，在屋里'),
(27, 7, b'1', 'n.姿势，装腔作势'),
(28, 7, b'0', 'n.激光，激光器'),
(29, 8, b'0', 'v.丢弃，抛弃，遗弃'),
(30, 8, b'1', 'n.航站楼，终点，终点站'),
(31, 8, b'0', 'n.X射线'),
(32, 8, b'0', 'prep.减去，负的'),
(33, 9, b'0', 'n.门栓，螺栓，闪电'),
(34, 9, b'1', 'n.方便，便利，舒适'),
(35, 9, b'0', 'n.同伴，同志，战友'),
(36, 9, b'0', 'pron.我自己，我亲自'),
(37, 10, b'0', 'v.调整，调节，矫正'),
(38, 10, b'0', 'v.磨碎，碾碎，折磨'),
(39, 10, b'0', 'n.公升'),
(40, 10, b'1', 'n.盎司，英两，一点点'),
(41, 11, b'1', 'n.负担，重担，担子'),
(42, 11, b'0', 'adj.迅速的，急促的'),
(43, 11, b'0', 'adj.黏的，闷热的'),
(44, 11, b'0', 'adj.中间的');

-- --------------------------------------------------------

--
-- 表的结构 `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL COMMENT '车的',
  `car_name` varchar(16) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `price` int(8) NOT NULL DEFAULT '0' COMMENT '价格',
  `img_inside` varchar(255) NOT NULL COMMENT '车内图',
  `img_outside` varchar(255) NOT NULL COMMENT '车外图',
  `kinds` varchar(255) NOT NULL COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `friend`
--

CREATE TABLE `friend` (
  `friend_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL COMMENT '用户自己的OpenID ',
  `f_u_id` int(11) NOT NULL COMMENT '朋友的OpenID '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `friend`
--

INSERT INTO `friend` (`friend_id`, `u_id`, `f_u_id`) VALUES
(6, 8, 6),
(7, 8, 1),
(8, 9, 8),
(9, 9, 6),
(10, 9, 7),
(11, 10, 9),
(12, 11, 9),
(13, 11, 10),
(14, 10, 11),
(15, 9, 10),
(16, 9, 11),
(17, 8, 11),
(18, 8, 9),
(19, 13, 9),
(20, 14, 9),
(21, 9, 12),
(22, 15, 9),
(23, 15, 7),
(24, 15, 6),
(25, 16, 14),
(26, 16, 9),
(27, 9, 14),
(28, 9, 15),
(29, 9, 16),
(30, 18, 9),
(31, 20, 14),
(32, 21, 9),
(33, 9, 17);

-- --------------------------------------------------------

--
-- 表的结构 `f_share`
--

CREATE TABLE `f_share` (
  `f_share_id` int(11) NOT NULL,
  `u_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'uid',
  `f_share_title` varchar(255) DEFAULT NULL COMMENT '分享标题',
  `f_share_content` varchar(255) DEFAULT NULL COMMENT '内容',
  `img` varchar(255) DEFAULT NULL COMMENT '配图'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `house`
--

CREATE TABLE `house` (
  `house_id` int(11) NOT NULL,
  `house_name` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL COMMENT '树屋介绍',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `img_inside` varchar(255) NOT NULL COMMENT '内图',
  `img_outside` varchar(255) NOT NULL COMMENT '外图',
  `kind` varchar(255) NOT NULL COMMENT '屋子分类'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `house`
--

INSERT INTO `house` (`house_id`, `house_name`, `intro`, `price`, `img_inside`, `img_outside`, `kind`) VALUES
(1, '萌萌爱心', '本房为三房二厅二卫一厨的多层住宅. 环境优美,为一四口之家为依据进行设计,突出温馨且不失时尚之感。本案设计师以温馨浪漫的设计风格为主调,全面考虑,在总体布局方面,尽量满足四口之家生活上的需求,主要装修风格为粉色布局为装饰饰面', 0, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3325466204,75536372&fm=27&gp=0.jpg', '', 'manhua'),
(2, '少女时代', '本房为三房二厅二卫一厨的多层住宅. 环境优美,为一四口之家为依据进行设计,突出温馨且不失时尚之感。本案设计师以温馨浪漫的设计风格为主调,全面考虑,在总体布局方面,尽量满足四口之家生活上的需求,主要装修风格为粉色布局为装饰饰面', 10, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528580719032&di=19b82124268c634c23a06e1fc94d9616&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201512%2F31%2F20151231212334_G5fwt.thumb.700_0.jpeg', '', 'manhua'),
(3, '蔚蓝海岸', '室内设有多个房屋，采用蓝色主调，将银滩的碧海蓝天尽收眼底,绝对是这个夏日享海的好住处! 2 小众又适合拍照的无边泳池 泡在无边际泳池里直面一望无垠的太平洋,给你带来至高无上的度假体验。', 30, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528576630809&di=ea29f0fdd0da77f725b9a4e885dcf584&imgtype=0&src=http%3A%2F%2Fdimg02.c-ctrip.com%2Fimages%2Ffd%2Ftg%2Fg4%2FM00%2F84%2F8C%2FCggYHlX5iwWAdcKEAAFWwHvqf5o229_R_1024_10000.jpg', '', 'manhua'),
(4, '薰衣草庄园', '本房为三房二厅二卫一厨的多层住宅. 环境优美,为一四口之家为依据进行设计,突出温馨且不失时尚之感。本…格为主调,全面考虑,在总体布局方面,尽量满足四口之家生活上的需求,主要装修风格为紫色色布局为装饰饰面', 50, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528577058109&di=7036e4140b7f85bfe15fa1261b4b9358&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F08f790529822720e0cf1e2ee71cb0a46f21fabe2.jpg', '', 'manhua'),
(5, '绿意盎然', '绿色住宅是基于人与自然持续共生原则和资源高效利用原则而设计建造的一种能使住宅内外物质能源系统良性循环，无废、无污、能源实现一定程度自给的新型住宅，采用绿色主调设计，给予你身处大自然之感', 6000, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529175456&di=81c972b1f1f3e50249232cf6a6ef6b27&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.10ihome.com%2Fuploads%2Fallimg%2F110331%2F1_110331111110_5.jpg', '', 'manhua'),
(6, '怦然心动', '采用了粉色主调的设计，美的事物总动人心魄,不管多久那种惊艳依旧让你心生涟漪。这套150㎡的大房子就是这样的效果,采用了现代简约的风格,美的不像样子,设计师匠心独用的设计,任何人瞅一眼都会心动,爱上它吧', 9000, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528580846684&di=0b58483fa9658efa8552fa1de13f45d7&imgtype=0&src=http%3A%2F%2Fimg.cndesign.com%2Fupload%2Fnews%2F20170517%2F770878cc1fe84c47acbc60fe9b0edc2c.jpg', '', 'manhua'),
(7, '暖黄阳光', '本案为三房二厅二卫一厨的多层住宅.室内使用面积为117.1m2. 环境优美,突出温馨且不失时尚之感。本案设计师以简洁明快的设计风格为主调,全面考虑,在总体布局方面,尽量满足生活上的需求,主要装修材料为黄色为装饰饰面,优美含蓄的线条装饰玄关及各种景点,创造一个温馨,健康的现代家庭环境.环境室内设计区别于简单的装饰设计就在于环境艺术设计是从全局出发,而不仅仅着眼某一点或某一个墙面的装饰.利求达到统一中带有变化，和谐中产生对比的要求', 8000, 'http://file30.mafengwo.net/M00/32/DD/wKgBpVU07q-AUmK7AAKaJ8mUkUM95.groupinfo.w600.jpeg', '', 'manhua'),
(8, '绿色小居', '绿色小屋是基于人与自然持续共生原则和资源高效利用原则而设计建造的一种能使住宅内外物质能源系统良性循环...', 5000, 'http://bpic.588ku.com/element_origin_min_pic/20/16/02/0556b4688210014.jpg', '', 'manhua'),
(9, '蓝色梦乡', '面朝大海,春暖花开”的感觉是我们心之所往的,一个惬意的午后,一杯香醇的咖啡,一个', 8000, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528576670161&di=fc3c64c12e2604a95af6b37fb9f2d03e&imgtype=0&src=http%3A%2F%2Fwww.xyxinmei.com%2Fdata%2Fuploads%2F2014%2F0529%2F19%2F53871aa9f062a.jpg', '', 'manhua'),
(10, '冰雪城堡', '这座城堡由冰雪建造的一座临时建筑，整座建筑用纯冰打造，将电影中的场景真实还原。虽然没有活泼机灵的雪宝(Olaf)，但亲们可以漫步冰洞状的时光隧道，还可以亲自坐上冰雪女王的纯冰宝座，实现冰雪女王梦。', 15000, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528616826791&di=ee175343674f57bd42996d0000200f8b&imgtype=0&src=http%3A%2F%2Ff10.topitme.com%2Fl%2F201002%2F03%2F12652099938359.jpg', '', 'manhua'),
(11, '威廉古堡', '欧式古典风格比较注重背景色调，由墙纸、地毯、帘幔等装饰织物组成的背景色调对控制室内整体效果起了决定性的作用。欧式古典风格的色彩也分为两个极端：常见的是以白色、淡色为底色搭配白色或深色家具营造优雅高贵的氛围;或者强调以华丽、浓烈的色彩配以精美的造型达到雍容华贵的装饰效果。', 15000, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528617044990&di=ace6678b25a3e8c8bbefd8c3a9e173ef&imgtype=0&src=http%3A%2F%2Fimg1.cache.netease.com%2Fcatchpic%2FB%2FBC%2FBC6FDF1C0A2AF5A1F5BFDAF63482DC23.png', '', 'manhua'),
(12, '糖果世界', '在这里选中一片天地，用快乐和自信打了地基，青苹果味的糖块用来垒墙，薄荷味的糖片作屋顶，青色的墙你可以依靠，蓝色透明的屋顶下你可看到苍穹，还有纯色荔枝糖镶边，\r\n黄色菠萝糖装裱的门　在用草莓软糖作只床\r\n牛奶糖捏个小茶几 ，这里时间老人从不光顾\r\n，这里只属于我自己，四 三 二 一 魔法开启', 15000, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529211826&di=5645fe175127d513de0ee13e86b3df2b&imgtype=jpg&er=1&src=http%3A%2F%2Fimg4q.duitang.com%2Fuploads%2Fitem%2F201504%2F11%2F20150411H3033_zmQSK.thumb.700_0.jpeg', '', 'manhua'),
(13, '乡间小屋', '通过装饰装修体现出田园的感觉，充分表现出贴近自然，向往自然的气息，才能在当今快节奏的都市生活获得生理和心理的平衡', 6942, 'http://pagsinzi5.bkt.clouddn.com/4.png', '', 'xieshi'),
(14, '梦幻田野', '里面装修风格独树一帜，既奢华却不庸俗，古典中透漏张扬。雅致却不失高贵，笔墨难以形容的富丽堂皇。\r\n\r\n房子装修风格为简约式即白色的墙面线条简练的家具，整体感觉明亮清爽', 8962, 'http://pagsinzi5.bkt.clouddn.com/8.jpg', '', 'xieshi'),
(15, '石头居', '雕梁画栋，琼楼玉宇，美轮美奂，错落有致，玲珑剔透，高楼广厦，金碧辉煌，别具匠心，别具一格，别有洞天，古色古香', 3542, 'http://pagsinzi5.bkt.clouddn.com/7.png', '', 'xieshi'),
(16, '篱笆居', '淡淡的檀木香充斥在身旁，镂空的雕花窗桕中射入斑斑点点细碎的阳光，细细打量一番，身下是一张柔软的木床，精致的雕花装饰的是不凡，身上是一床锦被，侧过身，一房古代女子的闺房映入眼帘，古琴立在角落，铜镜置在木制的梳妆台上，满屋子都是那么清新闲适。', 0, 'http://pagsinzi5.bkt.clouddn.com/2.png', '', 'xieshi'),
(17, '梨花落', '缓缓睁开眼睛，映入眼帘的竟是粉黄色的帐幔，暮色微凉。头顶是一袭一袭的流苏，随风轻摇。不适的动了动，却发现身下的床榻冰冷坚硬，即使那繁复华美的云罗绸如水色荡漾的铺于身下，总是柔软却也单薄无比。不时飘来一阵紫檀香，幽静美好。榻边便是窗，精致的雕工，稀有的木质。窗外一片旖旎之景，假山，小池，碧色荷藕，粉色水莲。不时有小婢穿过，脚步声却极轻，谈话声也极轻。', 0, 'http://pagsinzi5.bkt.clouddn.com/3.png', '', 'xieshi'),
(18, '织静屋', '房间收拾得十分整洁，墙角边放一张简单的床铺，一头是棋盘格花纹的帐幔，另一头却只有粉刷的墙壁。地下铺着泥砖，真是一尘不染，但是很潮湿，好像上回冲洗以后，再也不肯干了。地下室的窗口对着街道，因为怕小孩子们扔石头，装上一面百叶窗，又挂满了从篱笆上，沟渠边和田野间采来的奇形怪状的野草，……。那屋子里到处挂着药草，光线也受了障碍；药草在风干的时候，随着散发出一种不大好闻的气味。', 6454, 'http://pagsinzi5.bkt.clouddn.com/6.png', '', 'xieshi'),
(19, '清风阁', ' 树影在地毡上移动，大宣炉里一炉好香的烟气，袅袅不断的上升。东面的壁衣浴在太阳光里，上面附着的金碧锦绣，反射出耀目的光彩。中堂挂着的一幅陈所翁的墨龙，张牙舞爪的像要飞舞下来。西壁是一幅马和之的山水，那种细软柔和的笔触，直欲凸出绢面来，令人忘记了是坐在京市的宅院里。', 9521, 'http://pagsinzi5.bkt.clouddn.com/5.png', '', 'xieshi'),
(20, '乌兰屋', ' 树影在地毡上移动，大宣炉里一炉好香的烟气，袅袅不断的上升。东面的壁衣浴在太阳光里，上面附着的金碧锦绣，反射出耀目的光彩。中堂挂着的一幅陈所翁的墨龙，张牙舞爪的像要飞舞下来。西壁是一幅马和之的山水，那种细软柔和的笔触，直欲凸出绢面来，令人忘记了是坐在京市的宅院里。', 6122, 'http://pagsinzi5.bkt.clouddn.com/2.png', '', 'xieshi'),
(21, '云杉屋', '淡淡的檀木香充斥在身旁，镂空的雕花窗桕中射入斑斑点点细碎的阳光，细细打量一番，身下是一张柔软的木床，精致的雕花装饰的是不凡，身上是一床锦被，侧过身，一房古代女子的闺房映入眼帘，古琴立在角落，铜镜置在木制的梳妆台上，满屋子都是那么清新闲适。', 1211, 'http://pagsinzi5.bkt.clouddn.com/9.png', '', ''),
(24, '白浅画屋', '淡淡的檀木香充斥在身旁，镂空的雕花窗桕中射入斑斑点点细碎的阳光，细细打量一番，身下是一张柔软的木床，精致的雕花装饰的是不凡，身上是一床锦被，侧过身，一房古代女子的闺房映入眼帘，古琴立在角落，铜镜置在木制的梳妆台上，满屋子都是那么清新闲适。', 0, 'http://pagsinzi5.bkt.clouddn.com/11.png', 'http://pagsinzi5.bkt.clouddn.com/9.png', ''),
(25, '都市丽人', '每当黄辉，拔地而起的高楼大厦在灿烂的余晖下似一个个巍峨的巨人，两排立交桥直升到天，错落有致的商店、写字楼、居民房……鳞次栉比，巧夺天工。', 9521, 'http://pagsinzi5.bkt.clouddn.com/1.png', '', ''),
(26, '明光家园', '整座建筑从上到下，都铺满了碧蓝色的钢化玻璃。两根巨大的避雷针高高伫立在顶层上。远观如一个巨人站立在深圳的中央。晚上，地王大厦顶层上还会射出碧绿色的激光。', 2556, 'http://pagsinzi5.bkt.clouddn.com/16.png', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `house_inside`
--

CREATE TABLE `house_inside` (
  `house_id` int(11) NOT NULL,
  `housein_img` varchar(500) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `house_inside`
--

INSERT INTO `house_inside` (`house_id`, `housein_img`) VALUES
(2, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528576011732&di=26e7922a6919f5b6f0987bcfa0df16ff&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201512%2F07%2F20151207094037_vhU4j.jpeg'),
(2, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528576030273&di=09b750bd93f6f94cb18ed1520d6a0619&imgtype=0&src=http%3A%2F%2Ftgi13.jia.com%2F115%2F735%2F15735308.jpg'),
(2, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528576208625&di=1aaa42d91c2f0e2429694cabbf59880e&imgtype=0&src=http%3A%2F%2Fimg1.image.lfang.com%2F2013_09%2F201309160905353239.jpg'),
(2, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528575802562&di=7773fde2de7ca5d69b81da31cd2352e3&imgtype=0&src=http%3A%2F%2Fimages.ccd.com.cn%2FFile%2Fuploadpic%2F201509%2F10%2Fs_6357749880893840004877-4-3306-gc-eartha2000.jpg'),
(2, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1315424070,235351420&fm=27&gp=0.jpg'),
(1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529338622648&di=0c6cb1eb9951bfd97713ac78ebba8548&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fln%2Fpics%2Fhv1%2F52%2F117%2F2251%2F146401162.jpg'),
(1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529933255&di=67377005bb093337ba2200b7dbb44e97&imgtype=jpg&er=1&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201110%2F10%2F20111010203236_8Hfah.jpg'),
(1, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1893599690,2806727690&fm=27&gp=0.jpg'),
(1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529338735076&di=cc681915c1a941943b669eff05eb9113&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F359b033b5bb5c9eae79b6df0df39b6003af3b3bd.jpg'),
(1, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2648331859,3878109538&fm=27&gp=0.jpg'),
(3, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529339003588&di=b702bb2f6c9b7589027946dd42538756&imgtype=0&src=http%3A%2F%2Fs6.sinaimg.cn%2Fmw690%2F004i1QR7gy71D2hFdS515'),
(3, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529933602&di=4ad532fd5fc77998282a7885d0a4ca3f&imgtype=jpg&er=1&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F13%2F45%2F10%2F61g58PIC6Mu_1024.jpg'),
(3, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529338840116&di=6683cceac84d012783739a0e46dca0f5&imgtype=0&src=http%3A%2F%2Fcq.fzg360.com%2Fueditor%2Fphp%2Fupload%2Fimage%2F20150730%2F1438248073252803.jpg'),
(3, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529338966299&di=87bd1eb9f9d4edefb83e6de7ac9722ab&imgtype=0&src=http%3A%2F%2Fimg1n.soufunimg.com%2Fviewimage%2Fjiancai%2Fbusiness%2Fto8to%2F201508%2F21%2F656%2F36d3d1f5753d4008ff5a880741874f4b%2F432x324c.jpg'),
(3, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1976478733,3241198442&fm=27&gp=0.jpg5'),
(4, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1505324995,3041719735&fm=27&gp=0.jpg'),
(4, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3210991368,3172255116&fm=27&gp=0.jpg'),
(4, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3608403464,4294338213&fm=27&gp=0.jpg'),
(4, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=525646590,3027804843&fm=27&gp=0.jpg'),
(5, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=98886919,2620553952&fm=200&gp=0.jpg'),
(5, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3811574215,3630526858&fm=27&gp=0.jpg'),
(5, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1845401833,342625433&fm=27&gp=0.jpg'),
(5, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1585069612,3704471121&fm=27&gp=0.jpg'),
(5, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529934141&di=a5e5ea4a2482bf6b5d0337e29c3cfdac&imgtype=jpg&er=1&src=http%3A%2F%2Fpic.58pic.com%2F00%2F94%2F14%2F18bOOOPICfa.jpg'),
(8, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3779883241,2600575480&fm=27&gp=0.jpg'),
(8, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1446697955,2577405378&fm=27&gp=0.jpg'),
(8, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3407973329,2241699224&fm=27&gp=0.jpg'),
(8, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1744970858,2071568872&fm=27&gp=0.jpg'),
(8, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=264453618,747453403&fm=27&gp=0.jpg'),
(6, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529339824677&di=bc5467dd95e4cfe4caac5cd0123b774a&imgtype=0&src=http%3A%2F%2Fpic6.wed114.cn%2F20150421%2F2015042113220709904299.jpg'),
(6, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529339691981&di=c2d387bf037974806f9d40907e0d453e&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201201%2F26%2F20120126122223_E8TAS.thumb.700_0.jpg'),
(6, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529339723875&di=929a35eb4473d8106dd5197b7fe53574&imgtype=0&src=http%3A%2F%2Frich.online.sh.cn%2Frich%2Fgb%2Fcontent%2Fattachement%2Fjpg%2Fsite1%2F20170711%2FIMG488ad248871a44975746126.jpg'),
(6, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529339762458&di=a879f10e97acd49e1d639ab1835106f2&imgtype=0&src=http%3A%2F%2Fstatic-xiaoguotu.17house.com%2F000%2F138%2F201405291604492279.jpg'),
(6, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529339786351&di=60280fb35749b37cb86fbb8179a3574f&imgtype=0&src=http%3A%2F%2Fqnm.hunliji.com%2Fo_1aa79o2ob1f8m126j3fk193i7fk15.jpg%3FimageView%2F2%2Fw%2F680%257Cwatermark%2F1%2Fimage%2FaHR0cDovL3FucGljLmh1bmxpamkuY29tL3dhdGVybWFyay5wbmc%3D%2Fdx%2F20%2Fdy%2F20%2Fdissolve%2F80'),
(7, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529339905333&di=7cf998e5d753dbad1d7e67a9652408ed&imgtype=0&src=http%3A%2F%2Fimg.zhuangxiubaike.cn%2F201210%2F20121026_9eeaf6f3aea80207a1d7kdXRelYVys6L.jpg'),
(7, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3676991438,561338839&fm=27&gp=0.jpg'),
(7, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529339983800&di=4f2d752983e19ccc91ea9613b89341b0&imgtype=0&src=http%3A%2F%2Fimg1n.soufunimg.com%2Fviewimage%2Fzxb%2F2016_01%2F21%2F53%2F81%2Fpic%2F006316056600%2F432x324c.jpg'),
(7, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529340028751&di=9eec7ca60205f2102f493418365500ae&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Ff703738da9773912c2bc3d73f2198618367ae20e.jpg'),
(9, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3334009808,3926550925&fm=27&gp=0.jpg'),
(9, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529340111124&di=0a4aef8b1ba0ff5bdf786ef0c2a92e67&imgtype=0&src=http%3A%2F%2Fimg1.cache.netease.com%2Fcatchpic%2F4%2F40%2F40685FE39723CB18D4273378F14573DD.jpg'),
(9, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529340160423&di=d954c39da9ce5b0124a04cfe55c74eb1&imgtype=0&src=http%3A%2F%2Fwww.shiyuidc.com.cn%2Fuploadfile%2F2015%2F0413%2F20150413071547488.jpg'),
(9, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3658201248,2415981124&fm=27&gp=0.jpg'),
(9, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529340255370&di=8dfbd4015daae4946ed6b79d34269057&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F012e4859d983c2a80120446340fcc7.jpg%401280w_1l_2o_100sh.jpg'),
(10, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529340412929&di=497c44ebe1ad0f8c7fe50b726b202d68&imgtype=0&src=http%3A%2F%2Fqnm.hunliji.com%2Fo_1ahc6eq26i5drqhu7j17uv1v4911.jpg%3FimageView%2F2%2Fw%2F680%257Cwatermark%2F1%2Fimage%2FaHR0cDovL3FucGljLmh1bmxpamkuY29tL3dhdGVybWFyay5wbmc%3D%2Fdx%2F20%2Fdy%2F20%2Fdissolve%2F80'),
(10, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529340480012&di=38c089c7f553200b9b2d20f6feb46e3d&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D699ccb5aa7345982d187edd1649d5bd8%2Fb3b7d0a20cf431ad35ae1c174136acaf2edd98a4.jpg'),
(10, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529340551110&di=8766a2c98c0c90cff7d74384ae1cce78&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F902397dda144ad34e0071881daa20cf431ad8578.jpg'),
(10, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1650079794,2546137520&fm=27&gp=0.jpg'),
(10, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=360893912,3080658641&fm=27&gp=0.jpg'),
(11, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529935676&di=c06b572204eca52243422c54df76250b&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F3c6d55fbb2fb4316fca1d45d2ba4462309f7d35f.jpg'),
(11, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529340865804&di=5288011803f67cd445c3d068de3e09f3&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fa9d3fd1f4134970a41e3610695cad1c8a7865d02.jpg'),
(11, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529340915326&di=eadf607922a277b5eb37d14b51c82cba&imgtype=0&src=http%3A%2F%2Fr.lvyouquan.cn%2FKEPicFolder%2Fdefault%2Fattached%2Fimage%2F20140908%2F20140908200217_0656.jpg'),
(11, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529340987157&di=e8f2a2aacd2de973784685beee85772d&imgtype=0&src=http%3A%2F%2Fs2.sinaimg.cn%2Fbmiddle%2F006a4VmZgy6W91uJWUh21%26690'),
(11, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3182252068,445907742&fm=200&gp=0.jpg'),
(12, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529341251169&di=cc2c7496664be366549b95863ee2cf8f&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F63%2F74%2F77B58PICX7j_1024.jpg'),
(12, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529935844&di=474931e37d15eaee29d3ccd6a6bf7e3f&imgtype=jpg&er=1&src=http%3A%2F%2Fimg4.cache.netease.com%2Fphoto%2F0010%2F2014-07-28%2FA28OHKO45PAJ0010.jpg'),
(12, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529341271307&di=402825d4dc688f86e78cee3c5139ecfe&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F74%2F76%2F19t58PICnvG_1024.jpg'),
(12, 'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1529331244&di=c57c7b1c40996b46bc93dbfc3e9a092f&src=http://img4.duitang.com/uploads/blog/201603/25/20160325181920_NPEsR.thumb.700_0.jpeg');

-- --------------------------------------------------------

--
-- 表的结构 `knl`
--

CREATE TABLE `knl` (
  `knl_id` int(11) NOT NULL COMMENT '问答ID',
  `knl_content` varchar(255) NOT NULL COMMENT '问答内容',
  `right` varchar(255) NOT NULL COMMENT '正确答案',
  `open_id` varchar(255) NOT NULL COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `knl`
--

INSERT INTO `knl` (`knl_id`, `knl_content`, `right`, `open_id`) VALUES
(1, '中国农业银行发行的信用卡是:', '金穗卡', ''),
(2, '被称为“诗圣”的唐代诗人为', '杜甫', ''),
(3, '“打蛇打七寸”的七寸是指', '心脏', ''),
(4, '哪两种动物被称为“海洋变色龙', '乌贼和章鱼', ''),
(5, '“美人鱼”的学名叫什么', '鲤艮', ''),
(6, '.有哪些鸟类能模仿人语？', '八哥', ''),
(7, '刺猬以什么为食', '蚂蚁', ''),
(8, '澳大利亚的国宝是什么动物', '袋鼠', ''),
(9, '大袋鼠吃什么', '树叶 ', ''),
(10, '屎壳郎学名是什么', '蜣螂', '');

-- --------------------------------------------------------

--
-- 表的结构 `knl_answer`
--

CREATE TABLE `knl_answer` (
  `knl_answer_id` int(11) NOT NULL,
  `knl_id` int(11) NOT NULL COMMENT '题id',
  `knl_panduan` bit(1) NOT NULL COMMENT '判断',
  `knl_answer` varchar(255) NOT NULL COMMENT '错误答案'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `knl_answer`
--

INSERT INTO `knl_answer` (`knl_answer_id`, `knl_id`, `knl_panduan`, `knl_answer`) VALUES
(1, 1, b'0', '龙卡'),
(2, 1, b'1', '金穗卡'),
(3, 1, b'0', '牡丹卡'),
(4, 1, b'0', '农行卡'),
(5, 2, b'0', '李白'),
(6, 2, b'0', '李清照'),
(7, 2, b'1', '杜甫'),
(8, 2, b'0', '白居易'),
(9, 3, b'0', '脖子'),
(10, 3, b'0', '肝脏'),
(11, 3, b'0', '肚子'),
(12, 3, b'1', '心脏'),
(13, 4, b'0', '海马和乌贼'),
(14, 4, b'1', '乌贼和章鱼'),
(15, 4, b'0', '章鱼和海蜇 '),
(16, 4, b'0', '章鱼和海马'),
(17, 5, b'0', '儒艮'),
(18, 5, b'0', '美人鱼'),
(19, 5, b'1', '鲤艮'),
(20, 5, b'0', '锦鲤'),
(21, 6, b'1', '八哥'),
(22, 6, b'0', '乌鸦 '),
(23, 6, b'0', '鹦鹉 '),
(24, 6, b'0', '大雁'),
(25, 7, b'0', '鼠类'),
(26, 7, b'1', '蚂蚁'),
(27, 7, b'0', '蝼蛄 '),
(28, 7, b'0', '蚂蚱'),
(29, 8, b'1', '袋鼠'),
(30, 8, b'0', '鹰 '),
(31, 8, b'0', '熊猫'),
(32, 8, b'0', '树袋熊 '),
(33, 9, b'1', '树叶'),
(34, 9, b'0', '稻谷 '),
(35, 9, b'0', '青草 '),
(36, 9, b'0', '肉类'),
(37, 10, b'0', '屎壳郎'),
(38, 10, b'0', '臭虫'),
(39, 10, b'0', '蟑螂'),
(40, 10, b'1', '蜣螂');

-- --------------------------------------------------------

--
-- 表的结构 `mind_fruit`
--

CREATE TABLE `mind_fruit` (
  `fruit_id` int(11) NOT NULL,
  `u_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'OpenID ',
  `chance` varchar(5) NOT NULL DEFAULT '5' COMMENT '剩余机会 ',
  `content` varchar(255) NOT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mind_fruit`
--

INSERT INTO `mind_fruit` (`fruit_id`, `u_id`, `chance`, `content`) VALUES
(1, '17', '5', ''),
(2, '9', '69', '');

-- --------------------------------------------------------

--
-- 表的结构 `ouser_house`
--

CREATE TABLE `ouser_house` (
  `ouser_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `sentence` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `ouser_house`
--

INSERT INTO `ouser_house` (`ouser_id`, `u_id`, `house_id`, `sentence`) VALUES
(1, 8, 1, 'false'),
(2, 8, 2, 'false');

-- --------------------------------------------------------

--
-- 表的结构 `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL COMMENT '知识问答题目ID',
  `quiz_content` varchar(255) NOT NULL COMMENT '知识问答内容',
  `right` varchar(255) NOT NULL COMMENT '正确答案',
  `wrong_1` varchar(255) NOT NULL COMMENT '错误答案1',
  `wrong_2` varchar(255) NOT NULL COMMENT '错误答案2',
  `wrong_3` varchar(255) NOT NULL COMMENT '错误答案3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `quiz_content`, `right`, `wrong_1`, `wrong_2`, `wrong_3`) VALUES
(1, 'Vocabulary', '词汇', 'a', 'b', 'c');

-- --------------------------------------------------------

--
-- 表的结构 `share_competition`
--

CREATE TABLE `share_competition` (
  `competition_id` int(11) NOT NULL,
  `competition_title` char(16) NOT NULL COMMENT '比赛标题',
  `competition_content` char(255) NOT NULL COMMENT '比赛内容',
  `img` varchar(255) NOT NULL COMMENT '比赛宣传图',
  `competition_fee` int(11) NOT NULL DEFAULT '0' COMMENT '报名费 ',
  `award` int(11) DEFAULT '0' COMMENT '奖励'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sprite`
--

CREATE TABLE `sprite` (
  `sprite_id` int(255) NOT NULL COMMENT '精灵ID',
  `sprite_name` varchar(255) DEFAULT NULL COMMENT '精灵的名字',
  `sex` varchar(8) NOT NULL DEFAULT 'man' COMMENT '性别 man/woman',
  `levels` int(255) NOT NULL DEFAULT '0' COMMENT '等级',
  `price` varchar(255) NOT NULL DEFAULT '0' COMMENT '精灵价格',
  `intro` varchar(255) NOT NULL COMMENT '精灵介绍',
  `img_child` varchar(255) NOT NULL COMMENT '精灵图片（幼年）',
  `img_young` varchar(255) NOT NULL COMMENT '精灵图片（青年）',
  `img_old` varchar(255) NOT NULL COMMENT '精灵图片(老年)',
  `img` varchar(255) NOT NULL COMMENT '商店展示图',
  `dialog` varchar(255) NOT NULL DEFAULT '很高兴见到你！' COMMENT '对话',
  `kinds` varchar(255) NOT NULL COMMENT '精灵种类'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sprite`
--

INSERT INTO `sprite` (`sprite_id`, `sprite_name`, `sex`, `levels`, `price`, `intro`, `img_child`, `img_young`, `img_old`, `img`, `dialog`, `kinds`) VALUES
(1, '完颜墨染', 'woman', 0, '0', '墨染身份显贵，是皇亲国戚，他是皇帝最小的兄弟，成年后加封为钰王，\r\n钰王性格温柔，从不与人争抢，是众多皇子中性情最温和的，向往自由生活，但非常护短，如果你伤害了他重要的人，可不会善罢甘休', 'http://pagsinzi5.bkt.clouddn.com/%E5%AF%8C%E5%AE%B6%E5%B0%8F%E5%85%AC%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/20.png', 'http://pagsinzi5.bkt.clouddn.com/14.png', 'http://pagsinzi5.bkt.clouddn.com/14.png', '很高兴见到你！', ''),
(2, '苏昀卿', 'woman', 0, '10', '\r\n苏昀卿，活着的百宝箱，从小出身于普通家庭的他，性格要强，琴棋书画样样精通，在文学上成就极高，考取状元，师从墨贤真人，习得一手好琴技，并用作武器，独步武林，人称苏琴子\r\n性格神秘高冷，与人讲话不多于三句，但却耐人寻味，令人向往\r\n', 'http://pagsinzi5.bkt.clouddn.com/%E5%B0%8F%E5%B0%91%E5%B9%B4_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/17.png', 'http://pagsinzi5.bkt.clouddn.com/%E9%AB%98%E5%86%B7%E7%8E%8B%E7%88%B7_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E9%AB%98%E5%86%B7%E7%8E%8B%E7%88%B7_540.png', '很高兴见到你！', ''),
(3, '完颜岐渊', 'woman', 0, '500', '完颜岐渊是蟠龙国的皇帝，从小就是皇子，深得父皇的喜爱，心性善良，性格开朗，单纯，所以后来被皇兄陷害，流放边界，受尽人间疾苦，从此变得狠厉，遇事绝不留情，但聪明睿智，果断，渐渐成长为一名出色的国君，伴君如伴虎，请谨慎选择哦', 'http://pagsinzi5.bkt.clouddn.com/%E5%AF%8C%E5%AE%B6%E5%B0%8F%E5%85%AC%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%9A%87%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%9A%87%E5%B8%9D-%E6%9C%9D%E6%9C%8D_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%9A%87%E5%B8%9D-%E6%9C%9D%E6%9C%8D_540.png', '很高兴见到你！', ''),
(4, '尉迟风赤', 'woman', 0, '8000', '\r\n风赤是红衣教的小教主，从小就武功惊人，有着独步江湖的绝技，师从天风教主，以赤练剑为主要武器，擅长近身攻击\r\n但分赤的性格时而开朗时而冷漠，对于喜欢的人是个别扭的大男孩哦！要小心和风赤的接触', 'http://pagsinzi5.bkt.clouddn.com/%E5%BC%80%E6%9C%97%E5%B0%8F%E7%94%B7%E5%AD%A9%E5%B0%91%E5%B9%B4_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%BF%A9%E7%BF%A9%E5%B0%91%E5%B9%B4_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%BA%A2%E8%A1%A3%E5%B0%91%E5%B9%B4_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%BA%A2%E8%A1%A3%E5%B0%91%E5%B9%B4_540%281%29.png', '很高兴见到你！', ''),
(5, '秦暮羽', 'woman', 0, '7500', '秦暮羽，活着的百宝箱，从小出身于普通家庭的他，性格要强，琴棋书画样样精通，在文学上成就极高，考取状元，师从墨贤真人，习得一手好琴技，并用作武器，独步武林，人称苏琴子\r\n性格神秘高冷，与人讲话不多于三句，但却耐人寻味，令人向往\r\n', 'http://pagsinzi5.bkt.clouddn.com/%E5%86%85%E5%90%91%E5%B0%8F%E7%94%B7%E5%AD%A9%E5%B0%91%E5%B9%B4_540%282%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%99%BD%E5%8F%91%E5%85%AC%E5%AD%90_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E9%AB%98%E5%86%B7%E6%95%A3%E4%BB%99_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E9%AB%98%E5%86%B7%E6%95%A3%E4%BB%99_540%281%29.png', '很高兴见到你！', ''),
(6, '花倾落', 'woman', 0, '7300', '花倾落是魔教教的小教主，从小就武功惊人，有着独步江湖的绝技，师从天风教主，以赤练剑为主要武器，擅长近身攻击\r\n但分赤的性格时而开朗时而冷漠，对于喜欢的人是个别扭的大男孩哦！要小心和花倾落的接触', 'http://pagsinzi5.bkt.clouddn.com/%E6%AD%A3%E5%A4%AA_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/22.png', 'http://pagsinzi5.bkt.clouddn.com/15.png', 'http://pagsinzi5.bkt.clouddn.com/15.png', '很高兴见到你！', ''),
(7, '夜皓轩', 'woman', 0, '8500', '夜皓轩身份显贵，是皇亲国戚，他是皇帝最小的兄弟，成年后加封为钰王，\r\n钰王性格温柔，从不与人争抢，是众多皇子中性情最温和的，向往自由生活，但非常护短，如果你伤害了他重要的人，可不会善罢甘休', 'http://pagsinzi5.bkt.clouddn.com/%E5%86%85%E5%90%91%E5%B0%8F%E7%94%B7%E5%AD%A9%E5%B0%91%E5%B9%B4_540%282%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%AF%8C%E5%AE%B6%E5%85%AC%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%85%AC%E5%AD%90_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%85%AC%E5%AD%90_540%281%29.png', '很高兴见到你！', ''),
(8, '轩武残阳', 'woman', 0, '6700', '轩武残阳是蟠龙国的皇帝，从小就是皇子，深得父皇的喜爱，心性善良，性格开朗，单纯，所以后来被皇兄陷害，流放边界，受尽人间疾苦，从此变得狠厉，遇事绝不留情，但聪明睿智，果断，渐渐成长为一名出色的国君，伴君如伴虎，请谨慎选择哦', 'http://pagsinzi5.bkt.clouddn.com/%E5%BC%80%E6%9C%97%E5%B0%8F%E7%94%B7%E5%AD%A9%E5%B9%BC%E5%B9%B4_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E9%BB%84%E8%A1%A3%E5%B0%91%E5%B9%B4_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%9A%87%E5%B8%9D_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%9A%87%E5%B8%9D_540.png', '很高兴见到你！', ''),
(9, '羽凌风', 'woman', 0, '7802', '羽凌风是青灵殿师尊，号称羽灵仙人\r\n那剑越舞越快，就像一条银龙绕着他上下翻飞，左右盘绕。  只见他舞起宝剑来静若伏虎，动若飞龙，缓若游云，疾若闪电，又稳健又潇洒。那剑舞得果然不错，剑过处，习习生风，吹动丁香树上一片片白花瓣飘落下来。他按剑在手，收敛笑容，刷地亮开架式，两只眼睛像流星般一闪，眼波随着手势，精神抖擞地舞起来。', 'http://pagsinzi5.bkt.clouddn.com/%E6%AD%A3%E5%A4%AA_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%86%B7%E9%A2%9C%E5%85%AC%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E4%BB%99%E9%81%93-%E7%94%B7_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E4%BB%99%E9%81%93-%E7%94%B7_540%281%29.png', '很高兴见到你！', ''),
(10, '唐贞翌', 'woman', 0, '6523', '唐贞翌身躯凛凛，相貌堂堂。一双眼光射寒星，两弯眉浑如刷漆。胸脯横阔，有万夫难敌之威风。语话轩昂，吐千丈凌云之志气。心雄胆大，似撼天狮子下云端。骨健筋强，如摇地貔貅临座上。如同天上降魔主，真是人间太岁神。', 'http://pagsinzi5.bkt.clouddn.com/%E6%AD%A3%E5%A4%AA_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%99%BD%E8%A1%A3%E5%85%AC%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/13.png', 'http://pagsinzi5.bkt.clouddn.com/13.png', '很高兴见到你！', ''),
(11, '司徒皓佑', 'woman', 0, '3256', '俊美绝伦，脸如雕刻般五官分明，有棱有角的脸俊美异常。外表看起来好象放荡不拘，但眼里不经意流露出的精光让人不敢小看。一头乌黑茂密的头发被金冠高高挽起，一双剑眉下却是一对细长的桃花眼，充满了多情，让人一不小心就会沦陷进去。高挺的鼻子，厚薄适中的红唇这时却漾着另人目眩的笑容。', 'http://pagsinzi5.bkt.clouddn.com/%E6%AD%A3%E5%A4%AA_540.png', 'http://pagsinzi5.bkt.clouddn.com/21.png', 'http://pagsinzi5.bkt.clouddn.com/%E9%98%81%E4%B8%BB_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E9%98%81%E4%B8%BB_540%281%29.png', '很高兴见到你！', ''),
(12, '赫连冷焰', 'woman', 0, '7125', '一拢红衣，玄纹云袖，席地而坐，一男子低垂着眼脸，修长而优美的手指若行云流水般舞弄着琴弦，长长的睫毛在那心型脸上，形成了诱惑的弧度，人随音而动，偶尔抬起的头，让人呼吸一紧，好一张翩若惊鸿的脸！只是那双眼中忽闪而逝的某中东西，让人抓不住，却想窥视，不知不觉间人已经被吸引，与音与人，一同沉醉。', 'http://pagsinzi5.bkt.clouddn.com/%E5%AF%8C%E5%AE%B6%E6%AD%A3%E5%A4%AA_540.png', 'http://pagsinzi5.bkt.clouddn.com/22.png', 'http://pagsinzi5.bkt.clouddn.com/%E4%B8%96%E5%AE%B6%E5%B0%91%E7%88%B7%E5%A9%9A%E6%9C%8D_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E4%B8%96%E5%AE%B6%E5%B0%91%E7%88%B7%E5%A9%9A%E6%9C%8D_540.png', '很高兴见到你！', ''),
(13, '苏樱雪', 'man', 0, '0', '乌黑如泉的长发在雪白的指间滑动，一络络的盘成发髻，玉钗松松簪起，再插上一枝金步摇，长长的珠饰颤颤垂下，在鬓间摇曳，眉不描而黛，肤无需敷粉便白腻如脂，唇绛一抿，嫣如丹果，珊瑚链与红玉镯在腕间比划着，最后绯红的珠链戴上皓腕，白的如雪，红的如火，慑人目的鲜艳，明黄色的罗裙着身，翠色的丝带腰间一系，顿显那袅娜的身段，镜前徘徊，万种风情尽生。', 'http://pagsinzi5.bkt.clouddn.com/%E5%82%B2%E5%A8%87%E5%B0%8F%E6%A0%BC%E6%A0%BC_540%282%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E6%B4%BB%E6%B3%BC%E5%A6%83%E5%AD%90_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%8F%AF%E7%88%B1%E6%A0%BC%E6%A0%BC_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%8F%AF%E7%88%B1%E6%A0%BC%E6%A0%BC_540%281%29.png', '很高兴见到你！', ''),
(14, '古灵儿', 'man', 0, '10', '一身蓝色的翠烟衫，散花水雾绿草百褶裙，身披淡蓝色的翠水薄烟纱，肩若削成腰若约素，肌若凝脂气若幽兰。折纤腰以微步，呈皓腕于轻纱。眸含春水清波流盼，头上倭堕髻斜插一根镂空金簪，缀着点点紫玉,流苏洒在青丝上。香娇玉嫩秀靥艳比花娇，指如削葱根口如含朱丹，一颦一笑动人心魂。寐含春水脸如凝脂，白色茉莉烟罗软纱，逶迤白色拖地烟笼梅花百水裙，身系软烟罗，还真有点粉腻酥融娇欲滴的味道。', 'http://pagsinzi5.bkt.clouddn.com/%E8%93%9D%E8%A1%A3%E5%B0%91%E5%A5%B3_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E8%93%9D%E8%A1%A3%E5%A5%B3%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%90%B9%E7%AE%AB%E5%A5%B3%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%90%B9%E7%AE%AB%E5%A5%B3%E5%AD%90_540.png', '很高兴见到你！', ''),
(15, '曲华裳', 'man', 0, '6541', '一身白色的拖地长裙，宽大的衣摆上绣着粉色的花纹，臂上挽迤着丈许来长的烟罗紫轻绡。芊芊细腰，用一条紫色镶着翡翠织锦腰带系上。乌黑的秀发用一条淡紫色的丝带系起，几丝秀发淘气的垂落双肩，将弹指可破的肌肤衬得更加湛白。脸上未施粉黛，却清新动人', 'http://pagsinzi5.bkt.clouddn.com/%E5%86%B7%E6%BC%A0-%E5%8D%8E%E6%9C%8D_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%99%BD%E8%A1%A3%E5%A5%B3_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E4%BB%99%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E4%BB%99%E5%AD%90_540.png', '很高兴见到你！', ''),
(16, '柳瑟舞 ', 'man', 0, '7562', '身着淡黄衣裙，长及曳地，细腰以云带约束，更显出不盈一握，发间一支七宝珊瑚簪，映得面若芙蓉。面容艳丽无比，一双凤眼媚意天成，却又凛然生威，一头青丝梳成华髻，繁丽雍容，那小指大小的明珠，莹亮如雪，星星点点在发间闪烁，莲花移步来到殿前，柔柔俯身，甩帕】臣女离殇珞给皇上请安，皇上万福...', 'http://pagsinzi5.bkt.clouddn.com/%E5%A5%B3%E4%B8%BB%E5%B9%BC%E5%B9%B4-%E9%BB%84%E8%A1%AB_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E6%B4%9B%E7%A5%9E_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%9A%87%E5%90%8E1_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%9A%87%E5%90%8E1_540.png', '很高兴见到你！', ''),
(17, '碧莲 ', 'man', 0, '6532', '碧绿的翠烟衫，散花水雾绿草百褶裙，身披翠水薄烟纱，肩若削成腰若约素，肌若凝脂气若幽兰。娇媚无骨入艳三分，青螺眉黛长，弃了珠花流苏，三千青丝仅用一支雕工细致的梅簪绾起，淡上铅华。黛眉开娇横远岫，绿鬓淳浓染春烟，有一股巫山云雾般的灵气。听闻殿内宣自己入殿，立刻收敛裙摆莲步轻移', 'http://pagsinzi5.bkt.clouddn.com/%E5%B0%8F%E5%A5%B3%E5%AD%A9-%E4%B8%A4%E5%A5%97%E8%A1%A3%E6%9C%8D_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%A2%A7%E8%90%BD_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%BB%BF%E8%A1%A3%E4%BB%99%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%BB%BF%E8%A1%A3%E4%BB%99%E5%AD%90_540.png', '很高兴见到你！', ''),
(18, '芊芊姒儿', 'man', 0, '8621', '细致乌黑的长发，常常披于双肩之上，略显柔美，有时松散的数着长发，显出一种别样的风采，突然由成熟变得可爱，让人新生喜爱怜惜之情，洁白的皮肤犹如刚剥壳的鸡蛋，大大的眼睛一闪一闪仿佛会说话，小小的红唇与皮肤的白色，更显分明，一对小酒窝均匀的分布在脸颊两侧，浅浅一笑，酒窝在脸颊若隐若现，可爱如天仙', 'http://pagsinzi5.bkt.clouddn.com/%E8%90%9D%E8%8E%89_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E6%A1%83%E8%8A%B1_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E6%A1%83%E8%8A%B1%E5%A5%B3_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E6%A1%83%E8%8A%B1%E5%A5%B3_540.png', '很高兴见到你！', ''),
(19, '程绯染', 'man', 0, '7582', '翩然而来的少女仪容韶秀，有着说不出的清绝脱俗，她手提薄纱绮罗裙。身姿曼妙，墨黑的长发如瀑布般顺滑，似绸缎般轻柔。松松地绾起青丝，斜叉珠联璧合，垂银星弦月以衬之。再者，则眸如空灵，唇若樱瓣，纯稚无邪。', 'http://pagsinzi5.bkt.clouddn.com/%E7%BA%A2%E8%A1%A3%E5%B0%8F%E5%A7%91%E5%A8%98_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%BA%A2%E8%A1%A3%E5%A5%B3_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%BC%82%E5%9F%9F%E5%A5%B3%E5%AD%90_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%BC%82%E5%9F%9F%E5%A5%B3%E5%AD%90_540.png', '很高兴见到你！', ''),
(20, '紫罗', 'man', 0, '6782', '白皙的脸庞，线条柔和。淡淡的娥眉，颇带点不食人间烟火的味道。一双迷人的大眼睛忽闪忽闪的，灵动聪慧，只要眼睛一亮，准是想出了好点子。长长的睫毛。俊俏的粉鼻。樱桃小嘴润润的。一头青丝柔顺亮滑，随意的挽成一个髻，几缕发丝垂在耳边。腰肢纤细，双手柔若无骨，玉香双肩，双腿修长，体态婀娜。并不庸脂俗粉，清秀中透露出非凡的气质。', 'http://pagsinzi5.bkt.clouddn.com/%E5%86%B7%E6%BC%A0-%E5%B8%B8%E6%9C%8D-%E5%B0%91%E5%A5%B3_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%B4%AB%E9%99%8C_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E9%9B%8D%E5%AE%B9%E5%A4%A7%E5%85%AC%E4%B8%BB_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E9%9B%8D%E5%AE%B9%E5%A4%A7%E5%85%AC%E4%B8%BB_540.png', '很高兴见到你！', ''),
(21, ' 白飞飞 ', 'man', 0, '6552', '倾国倾城,眼瞳中带着淡淡忧伤,脸庞瘦削，花容月貌，漆黑的眸子如一泓溪水般清澈，目光温婉柔和有一种说不出的清纯笑容犹如世间昙花，释放幽静音律，绝美，倾入人心 ,有一种圣洁之美,另人一眼就将她铭记与心', 'http://pagsinzi5.bkt.clouddn.com/%E5%8F%A4%E8%A3%85%E9%BB%84%E8%A3%99%E8%90%9D%E8%8E%89_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%A4%A7%E5%A4%AA%E5%B9%B3_540%282%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%A5%B3%E5%B8%9D_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%A5%B3%E5%B8%9D_540.png', '很高兴见到你！', ''),
(22, '柳汀兰', 'man', 0, '6585', '笑春桃今，云堆翠簪；唇咧樱颗今，榴齿含香。其素若何，春梅蘸雪。其洁若何，秋菊披霜。其静若何，松声空谷。其艳若何，霞映澄塘。渐西子，愧王嫱。瑶池不二，樱雪无双，但用倾国倾城无法确切的来形容她的美。', 'http://pagsinzi5.bkt.clouddn.com/%E5%A5%B3%E4%B8%BB%E5%B9%BC%E5%B9%B4-%E9%BB%84%E8%A1%AB_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%89%A1%E4%B8%B9_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%9A%87%E5%A6%83_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E7%9A%87%E5%A6%83_540.png', '很高兴见到你！', ''),
(23, ' 思涵', 'man', 0, '6524', '她秀雅绝俗，自有一股轻灵之气，肌肤娇嫩、神态悠闲、美目流盼、桃腮带笑、含辞未吐、气若幽兰，说不尽的温柔可人。\r\n　　2 她肌肤胜雪，双目犹似一泓清水，顾盼之际，自有一番清雅高华的气质，让人为之所摄、自惭形秽、不敢亵渎。但那冷傲灵动中颇有勾魂摄魄之态，又让人不能不魂牵蒙绕。', 'http://pagsinzi5.bkt.clouddn.com/%E5%8F%A4%E8%A3%85%E7%B2%89%E8%A3%99%E8%90%9D%E8%8E%89_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E6%A1%83%E8%8A%B1_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%A5%B3%E5%AD%90-%E6%9C%8D%E9%A5%B01_540%282%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E5%A5%B3%E5%AD%90-%E6%9C%8D%E9%A5%B01_540%282%29.png', '很高兴见到你！', ''),
(24, '冰凌', 'man', 0, '6489', '只听琴音从雪帘下袅袅升起，似湉湉流水，如细语呢喃，婉转缠绵，在空气里荡漾出细小的波纹。轻掠下尾音，雪纱曼起，沿青白色的绣着银丝边的裙角向上望去，衣袖随风飘舞，伴着音韵的流逝而轻轻扬起，再优雅落下，美好的如同幻景。', 'http://pagsinzi5.bkt.clouddn.com/%E5%86%B7%E6%BC%A0-%E5%B8%B8%E6%9C%8D-%E5%B0%91%E5%A5%B3_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E6%B8%94%E5%A5%B3-%E5%8D%8E%E4%B8%BD%E6%9C%8D%E9%A5%B0_540.png', 'http://pagsinzi5.bkt.clouddn.com/%E6%A2%85%E8%8A%B1_540%281%29.png', 'http://pagsinzi5.bkt.clouddn.com/%E6%A2%85%E8%8A%B1_540%281%29.png', '很高兴见到你！', '');

-- --------------------------------------------------------

--
-- 表的结构 `sprite_dialog`
--

CREATE TABLE `sprite_dialog` (
  `dialog_id` varchar(255) NOT NULL COMMENT '用户id',
  `sprite_id` int(11) NOT NULL COMMENT '精灵ID',
  `dialog_content` int(11) NOT NULL COMMENT '对话'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL COMMENT 'uid',
  `open_id` varchar(255) NOT NULL COMMENT 'OpenID ',
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '用户' COMMENT '用户名',
  `sex` varchar(8) NOT NULL DEFAULT 'man' COMMENT 'man/woman 性别',
  `intro` varchar(255) DEFAULT NULL COMMENT '介绍',
  `avatarUrl` varchar(255) NOT NULL COMMENT '头像',
  `mark` int(11) NOT NULL DEFAULT '0' COMMENT '签到情况',
  `desire` varchar(255) DEFAULT NULL COMMENT '愿望',
  `leaves` int(255) NOT NULL DEFAULT '0' COMMENT '金叶子数',
  `words` int(255) NOT NULL DEFAULT '0' COMMENT '单词积累数',
  `quizzes` int(255) NOT NULL DEFAULT '0' COMMENT '知识问答正确题数',
  `steps` int(255) DEFAULT NULL COMMENT '运动步数',
  `start` int(11) NOT NULL,
  `knl` int(11) NOT NULL,
  `right_knl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`u_id`, `open_id`, `name`, `sex`, `intro`, `avatarUrl`, `mark`, `desire`, `leaves`, `words`, `quizzes`, `steps`, `start`, `knl`, `right_knl`) VALUES
(6, '', 'ghbjn', 'man', NULL, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2859410315,1608202772&fm=27&gp=0.jpg', 0, NULL, 71, 0, 0, NULL, 0, 0, 0),
(7, '', 'emmmm', 'man', NULL, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=16550438,2220103346&fm=27&gp=0.jpg', 0, NULL, 71, 0, 0, NULL, 0, 0, 0),
(9, 'on5jD5AEHkWVQZ6zBwiMgTTgKDQ8', '?', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ertLUWr6k3DOSSDUCBWnQYvYqC2KoWaia4jxL3TGvRFEnWIjGC3lia5MGj5pibib3QYgqiaW61GGm23o8A/132', 4, NULL, 2172, 77, 61, NULL, 0, 116, 20),
(10, 'on5jD5PFKL4IEBrgcVNRD0aAbMpM', '铁柱', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/qwc5jJ29Mic9OyWyHK8bnWUreBwjY2RjiaC5ZV2Pl7sBDG3AX5bPbicfPEicf3Ocjxmq8RHVnGNVBBKUVIs1ibg209g/132', 0, NULL, 71, 0, 0, NULL, 0, 0, 0),
(11, 'on5jD5CmtElKPgJ6kT7nQyDYmIC4', 'ANY  RY', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/NibfZOQCc73CEQg0p7w13IGsslQBGuibAQ0bSctqpoWylPYYWMhIqicnwjTy2QvsAvLnPRHwCtZCzWedB6IOCqicbA/132', 0, NULL, 71, 0, 0, NULL, 0, 0, 0),
(12, 'on5jD5KEupSAhHviul_5UQYFVQ-U', '单伟', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLaZrBxV8PAfY691Xwvk3bRic8fgAPYcpyUm7Y5dFMs3DAbl7oMCZOdPK5eoweaGUVRokHicz9Ofz8g/132', 0, NULL, 71, 0, 0, NULL, 0, 0, 0),
(13, 'on5jD5H6mrtbOSwmRB0KAeByWo_k', 'Cheshire Cat', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIMnnL2FymU786eC1FrrlIVDs3bkNVwcn1cgNXkiaPuicg5m002beEiaQR5g5XLdXKzyhEqSpPYbODqg/132', 0, NULL, 71, 0, 0, NULL, 0, 0, 0),
(14, 'on5jD5GyGPMYtkK_2ieKX5glhqK0', '三', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/ev4ibvyoa3TadicgO5MuITaicNP47UU6yKcxnxMiaJmkGLHUnH0CbaqQKTH67FolZfj2aBllszgZo3iavgVh2bLmbPg/132', 6, NULL, 3625, 0, 95, NULL, 0, 90, 89),
(15, 'on5jD5NkXuZrGVXlFvxzGw3eV_fI', '\' koreyoshi°', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKuLzYgj1icJxQP2KkZBTcvYpCG8jVbWAWGDyqbOZmbpOiaRrHQ6qrfgqPWicwobKtTwJMOTa7ArNVNw/132', 0, NULL, 71, 0, 0, NULL, 0, 0, 0),
(16, 'on5jD5CIAPxB-C0GFLB4uJin7Bv4', '梅梅', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIibw5w10blZgH12spauN9ibDPFldib6nvYC6zfbvLzs8X8YyfXRv45icVeZiasicwIGFkrmR1ElWiaROPsA/132', 0, NULL, 71, 0, 0, NULL, 0, 0, 0),
(17, 'on5jD5DYNdqUsgdcAjFhN45oc-kc', '青年柴郡', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLKJR55GicJWqKhKqwqWbjILTwD5e37u8k6OrMXKj2h4mibk1Gk7vhUrLtmHIhCpt7XAa3cxuMsIe4g/132', 0, NULL, 261, 0, 0, NULL, 0, 0, 0),
(20, 'on5jD5CmZoKthhZ739pxSjiCa00E', 'Ugvol', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/tTaIG6SAg0LwibWu6g0Y6MUGxBLUSeiby9gib5gbhoVpVoVfgzkxku1XSHMH2W2zXeK9ejFAFk8s7kyTsaGpn8HeA/132', 0, NULL, 7, 0, 7, NULL, 0, 0, 0),
(21, 'on5jD5EQsWh9dGi79BQr5aVMScAQ', '李发发', 'man', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epLJ1lJWAZ2LsVicbmFMyQv2dFRiatSvMMZFY9wQ8CyzLWhlicztKVicNticUvSzQMUtb6bBjXHPibIv2FQ/132', 0, NULL, 0, 0, 0, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `user_car`
--

CREATE TABLE `user_car` (
  `u_id` varchar(255) NOT NULL COMMENT '用户的openid',
  `car_id` int(11) NOT NULL COMMENT '车的id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_competition`
--

CREATE TABLE `user_competition` (
  `u_id` varchar(255) NOT NULL DEFAULT '' COMMENT '参与比赛的用户的u_id',
  `competition_id` int(11) NOT NULL COMMENT '用户参与的比赛'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_house`
--

CREATE TABLE `user_house` (
  `u_id` int(11) NOT NULL COMMENT '用户的u_id',
  `house_id` int(11) NOT NULL COMMENT '屋子id',
  `use_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_house`
--

INSERT INTO `user_house` (`u_id`, `house_id`, `use_status`) VALUES
(1, 2, NULL),
(6, 1, 'true'),
(6, 2, 'false'),
(9, 1, 'false'),
(9, 2, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 5, 'false'),
(9, 6, 'false'),
(9, 10, 'false'),
(9, 11, 'false'),
(9, 12, 'true'),
(9, 14, 'false'),
(10, 3, NULL),
(13, 3, 'true'),
(14, 1, NULL),
(14, 2, NULL),
(14, 3, NULL),
(14, 4, NULL),
(14, 10, 'true'),
(16, 1, 'false'),
(16, 2, 'false'),
(16, 3, 'false'),
(16, 4, 'true'),
(17, 1, NULL),
(17, 2, NULL),
(17, 4, NULL),
(19, 1, 'false'),
(19, 2, 'false'),
(20, 2, 'false'),
(20, 3, 'true');

-- --------------------------------------------------------

--
-- 表的结构 `user_sprite`
--

CREATE TABLE `user_sprite` (
  `u_id` varchar(255) NOT NULL COMMENT '用户u_id',
  `sprite_id` int(11) NOT NULL COMMENT '使用中的精灵ID',
  `use_status` varchar(255) NOT NULL DEFAULT 'false' COMMENT '是否使用',
  `status` varchar(255) NOT NULL DEFAULT 'child' COMMENT '成长阶段',
  `percent` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_sprite`
--

INSERT INTO `user_sprite` (`u_id`, `sprite_id`, `use_status`, `status`, `percent`) VALUES
('1', 1, 'false', 'child ', '20'),
('14', 1, 'false', 'child', '0'),
('14', 2, 'false', 'child', '0'),
('14', 3, 'true', 'child', '0'),
('14', 13, 'false', 'child', '0'),
('14', 14, 'false', 'child', '0'),
('16', 1, 'false', 'child', '0'),
('16', 2, 'true', 'child', '0'),
('16', 3, 'false', 'child', '0'),
('16', 13, 'false', 'child', '0'),
('16', 14, 'false', 'child', '0'),
('19', 1, 'false', 'child', '0'),
('6', 1, 'true', 'child', '0'),
('6', 2, 'false', 'child', '0'),
('9', 4, 'false', 'child', '0'),
('9', 6, 'false', 'child', '0'),
('9', 7, 'false', 'child', '0'),
('9', 14, 'true', 'child', '0'),
('9', 18, 'false', 'child', '0'),
('9', 19, 'false', 'child', '0');

-- --------------------------------------------------------

--
-- 表的结构 `vocabulary`
--

CREATE TABLE `vocabulary` (
  `vocabulary_id` int(11) NOT NULL COMMENT '单词ID',
  `vocabulary_content` varchar(255) NOT NULL COMMENT '单词内容',
  `right` varchar(255) NOT NULL COMMENT '正确答案',
  `open_id` varchar(255) NOT NULL COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vocabulary`
--

INSERT INTO `vocabulary` (`vocabulary_id`, `vocabulary_content`, `right`, `open_id`) VALUES
(1, 'plunge', 'v.使投入，使陷入，暴跌', ''),
(2, 'jaw', 'n.额，下巴', ''),
(3, 'liar', 'n.说谎的人', ''),
(4, 'smooth', 'adj.光滑的，平稳的', ''),
(5, 'roast', 'v.烤，烘焙', ''),
(6, 'resign', 'vi.辞职，顺从，投降', ''),
(7, 'pose', 'n.姿势，装腔作势', ''),
(8, 'terminal', 'n.航站楼，终点，终点站', ''),
(9, 'convenience', 'n.方便，便利，舒适', ''),
(10, 'ounce', 'n.盎司，英两，一点点', ''),
(11, 'burden', 'n.负担，重担，担子', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`answer_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`friend_id`) USING BTREE;

--
-- Indexes for table `f_share`
--
ALTER TABLE `f_share`
  ADD PRIMARY KEY (`f_share_id`,`u_id`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`house_id`);

--
-- Indexes for table `knl`
--
ALTER TABLE `knl`
  ADD PRIMARY KEY (`knl_id`);

--
-- Indexes for table `knl_answer`
--
ALTER TABLE `knl_answer`
  ADD PRIMARY KEY (`knl_answer_id`);

--
-- Indexes for table `mind_fruit`
--
ALTER TABLE `mind_fruit`
  ADD PRIMARY KEY (`fruit_id`,`u_id`);

--
-- Indexes for table `ouser_house`
--
ALTER TABLE `ouser_house`
  ADD PRIMARY KEY (`ouser_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`);

--
-- Indexes for table `share_competition`
--
ALTER TABLE `share_competition`
  ADD PRIMARY KEY (`competition_id`);

--
-- Indexes for table `sprite`
--
ALTER TABLE `sprite`
  ADD PRIMARY KEY (`sprite_id`);

--
-- Indexes for table `sprite_dialog`
--
ALTER TABLE `sprite_dialog`
  ADD PRIMARY KEY (`dialog_id`,`sprite_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `user_car`
--
ALTER TABLE `user_car`
  ADD PRIMARY KEY (`u_id`,`car_id`);

--
-- Indexes for table `user_competition`
--
ALTER TABLE `user_competition`
  ADD PRIMARY KEY (`competition_id`,`u_id`);

--
-- Indexes for table `user_house`
--
ALTER TABLE `user_house`
  ADD PRIMARY KEY (`u_id`,`house_id`);

--
-- Indexes for table `user_sprite`
--
ALTER TABLE `user_sprite`
  ADD PRIMARY KEY (`u_id`,`sprite_id`);

--
-- Indexes for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`vocabulary_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `answer`
--
ALTER TABLE `answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- 使用表AUTO_INCREMENT `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车的';
--
-- 使用表AUTO_INCREMENT `friend`
--
ALTER TABLE `friend`
  MODIFY `friend_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `f_share`
--
ALTER TABLE `f_share`
  MODIFY `f_share_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `house`
--
ALTER TABLE `house`
  MODIFY `house_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- 使用表AUTO_INCREMENT `knl`
--
ALTER TABLE `knl`
  MODIFY `knl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问答ID', AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `knl_answer`
--
ALTER TABLE `knl_answer`
  MODIFY `knl_answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- 使用表AUTO_INCREMENT `mind_fruit`
--
ALTER TABLE `mind_fruit`
  MODIFY `fruit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ouser_house`
--
ALTER TABLE `ouser_house`
  MODIFY `ouser_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '知识问答题目ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `share_competition`
--
ALTER TABLE `share_competition`
  MODIFY `competition_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `sprite`
--
ALTER TABLE `sprite`
  MODIFY `sprite_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '精灵ID', AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uid', AUTO_INCREMENT=22;
--
-- 使用表AUTO_INCREMENT `user_competition`
--
ALTER TABLE `user_competition`
  MODIFY `competition_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户参与的比赛';
--
-- 使用表AUTO_INCREMENT `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `vocabulary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单词ID', AUTO_INCREMENT=12;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
