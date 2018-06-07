// pages/mine/mine.js
var qcloud = require('../../vendor/wafer2-client-sdk/index')
var config = require('../../config')
var util = require('../../utils/util.js')
var appId = 'wxdc3e0648f98f4400'; //填写微信小程序appid 
var secret = '4cff70639c92bbefc5a47859c41cd6a3'; //填写微信小程序secret 
Page({
  data: {
    sentence: [],
    _num: 0,
    userInfo: {},
    logged: false,
    takeSession: false,
    requestResult: '',
    code: '',
    openid: '',
    hide: false,
    show: true,
    hide1: false,
    hide2: false,
    petimg: 'http://p2.so.qhimgs1.com/bdr/200_200_/t01f9da8c00bb4c7092.jpg',
    houseimg: 'http://p0.so.qhimgs1.com/bdr/_240_/t019dc82594b357f4da.jpg',
    housename:'少女时代',
    petname:'洛神'
  },
  rechange: function () {
    this.setData({
      hide: this.data.hide = false,
      show: this.data.show = true,
      hide1: this.data.hide1 = false,
      hide2: this.data.hide2 = false,

    })
  },
  presscoll: function (e) {//叶子币充值
    this.setData({
      _num: e.currentTarget.dataset.num
    })
  },
  change: function () {
    this.setData({
      hide: this.data.hide = true,
      show: this.data.show = false,
      hide1: this.data.hide1 = false,
      hide2: this.data.hide2 = false,
    })

  },


  change1: function () {
    this.setData({
      hide: this.data.hide = false,
      show: this.data.show = false,
      hide1: this.data.hide1 = true,
      hide2: this.data.hide2 = false,
    })

  },

  addfriend: function (e) {
    var that = this;
    var oname = e.currentTarget.dataset.addname;
    var omoney = e.currentTarget.dataset.addmoney;
    var oranking = e.currentTarget.dataset.addranking;
    var oheadimg = e.currentTarget.dataset.addheadimg;
    var oopenid = getApp().globalData.myopenid;
    if (oopenid) {
      wx.request({
        url: 'https://stnr2jjf.qcloud.la/index.php/',//后台查找该用户数据，找到返回“此人已添加”，找不到加入好友数据库中
        data: {
          oheadimg: oheadimg,
          oname: oname,
          omoney: omoney,
          oranking: oranking,
          oopenid: oopenid
        },
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {//后台在好友数据库中查找此人信息，如果找到返回“此人您已添加”
          // console.log(res.data);
          if (res.data == '此人您已添加') {
            wx.showModal({
              title: '提示',
              content: '此人您已添加',
            })
          }
          else {
            wx.showToast({
              title: '添加成功',
              icon: 'warn',
              duration: 2000
            })
          }
        }
      })
    }
    else {
      wx.showModal({
        title: '提示',
        content: '未登录，请先登录',
      })
    }
  },
  buybuy: function () {
    wx.showToast({
      title: '支付成功',
      icon: 'warn',
      duration: 2000
    })
  },
  change2: function () {
    this.setData({
      hide: this.data.hide = false,
      show: this.data.show = false,
      hide1: this.data.hide1 = false,
      hide2: this.data.hide2 = true,
    })

  },
  // 用户登录示例
  login: function () {
    var that = this;
    var openId = (wx.getStorageSync('openId'));
    //console.log(e.detail.userInfo)
    if (e.detail.userInfo) {//用户按了授权按钮
      if (openId) {//之前获取过openId
        that.setData({
          userInfo: e.detail.userInfo,
          logged: true,
          showView: false
        })
        console.log("登陆成功");
        getApp().globalData.myopenid = openId;//全局变量获取openid

      }
      else {//之前没有获取过openId，
        wx.login({
          success: function (res) {
            console.log(res.code);
            if (res.code) {
              var ocode = res.code;//利用code获取openid
              wx.getUserInfo({
                success: function (res_user) {
                  wx.request({
                    url: 'https://stnr2jjf.qcloud.la/index.php/',//后台获取openid返回出来，并将openid放入用户表中
                    data: {
                      oocode: ocode
                    },
                    header: {
                      'Content-Type': 'application/json'
                    },
                    success: function (res) {
                      that.setData({
                        userInfo: e.detail.userInfo,
                        logged: true,
                        showView: false
                      })
                      wx.setStorageSync('openId', res.data);
                      console.log(res.data);//接收返回的的openid
                      getApp().globalData.myopenid = res.data;//将openid赋给全局变量
                    },
                    fail: function () {
                      console.log("失败");
                    }
                  })
                },
                fail: function () {
                  console.log("失败");
                }
              })
            }
          }
        })
      }
    } else {
      //用户按了拒绝按钮
    }
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    wx.request({
      url: 'https://stnr2jjf.qcloud.la/index.php/', //获取排行榜数据
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: res => {
        this.setData({
          sentence: res.data
        })
      }
    })
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    var that = this;
    if (getApp().petData.petimg != null) {
      that.setData({
        petimg: getApp().petData.petimg,
        petname:getApp().petData.petname
      })
    }
    if (getApp().houseData.houseimg != null) {
      that.setData({
        houseimg: getApp().houseData.houseimg,
        housename: getApp().houseData.housename,
      })
    }
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})