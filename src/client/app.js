//app.js
var qcloud = require('./vendor/wafer2-client-sdk/index')
var config = require('./config')

App({ 
    onLaunch: function () {
        qcloud.setLoginUrl(config.service.loginUrl)
    
    },
    petData: {
      petname: null,
      petimg: null
    },
    houseData: {
      housename: null,
      houseimg: null
    },
    globalData: {
      myuserid: null
    },
    dayData: {
      todaydao: 0,
      todaydui: 0
    },
    duihuan:{
      duihuan:0
    },
    fangwu:{
      pname:'洛神',
      pimg:'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1541844883,2396913807&fm=27&gp=0.jpg',
      fname:'少女时代',
      fimg:'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529169936&di=8c589e3d9938cb99d7589e80e62c36cd&imgtype=jpg&er=1&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201512%2F31%2F20151231212334_G5fwt.thumb.700_0.jpeg',
      fflg:1,
      pflg:1
    }
})