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
    petimg: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529031775&di=f2d73b08750bcbcfb47031f6e93d7dd3&imgtype=jpg&er=1&src=http%3A%2F%2Fimgq.duitang.com%2Fuploads%2Fitem%2F201501%2F17%2F20150117203244_aHKHx.jpeg',
    houseimg: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529169936&di=8c589e3d9938cb99d7589e80e62c36cd&imgtype=jpg&er=1&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201512%2F31%2F20151231212334_G5fwt.thumb.700_0.jpeg',
    housename:'少女时代',
    petname:'洛神',
    mynum:0,
    mylmoney:0
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
    var oheadimg = e.currentTarget.dataset.addheadimg;
    var ourseid = getApp().globalData.myuserid;
    if (ourseid) {
      wx.request({
        url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/add_friend_list',//后台查找该用户数据，找到返回“此人已添加”，找不到加入好友数据库中
        data: {
          oheadimg: oheadimg,
          oname: oname,
          omoney: omoney,
          ourseid: ourseid
        },
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {//后台在好友数据库中查找此人信息，如果找到返回“此人您已添加”
        // console.log(res.data);
          if (res.data == '添加自己'){
            wx.showModal({
              title: '提示',
              content: '不能添加自己',
            })
          }
          else if (res.data == '此人您已添加') {
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
  login: function (e) {
    var that = this;
    var userId = (wx.getStorageSync('userId'));
    //console.log(e.detail.userInfo)
    if (e.detail.userInfo) {//用户按了授权按钮
      if (userId) {//之前获取过userId
        that.setData({
          userInfo: e.detail.userInfo,
          logged: true,
          showView: false
        })
        console.log("登陆成功");
        getApp().globalData.myuserid = userId;//全局变量获取openid
        wx.request({
          url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_paimon_list', //获取排行和叶子币
          header: {
            'content-type': 'application/json' // 默认值
          },
          success: function (res){
            for(var i=0;i<res.data.length;i++){
              if (res.data[i].u_id==userId){
                that.setData({
                  mynum: res.data[i].rowNo,
                  mylmoney: res.data[i].leaves
                })
              }
            }
            
          }
        })
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
                    url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_user_list',//后台获取openid返回userid，并将openid放入用户表中
                    data: {
                      oonickName:res_user.userInfo.nickName,
                      ooheadimg:res_user.userInfo.avatarUrl,
                      oocode: ocode
                    },
                    header: {
                      'Content-Type': 'application/json'
                    },
                    success: function (res) {
                      that.setData({
                        userInfo: e.detail.userInfo,
                        logged: true,
                      })
                      wx.setStorageSync('userId', res.data);
                      getApp().globalData.myuserid = res.data;//将openid赋给全局变量
                      wx.request({
                        url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_paimon_list', //获取排行和叶子币
                        header: {
                          'content-type': 'application/json' // 默认值
                        },
                        success: function (res_u) {
                          for (var i = 0; i < res_u.data.length; i++) {
                            if (res_u.data[i].u_id == res.data) {
                              that.setData({
                                mynum: res_u.data[i].rowNo,
                                mylmoney: res_u.data[i].leaves
                              })
                            }
                          }

                        }
                      })
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
    var that = this;
    wx.request({
      url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_list', //获取排行榜数据
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