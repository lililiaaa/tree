// pages/mine/mine.js
var qcloud = require('../../vendor/wafer2-client-sdk/index')
var config = require('../../config')
var util = require('../../utils/util.js')
var appId = 'wxdc3e0648f98f4400'; //填写微信小程序appid 
var secret = '4cff70639c92bbefc5a47859c41cd6a3'; //填写微信小程序secret 
Page({
  data: {
    userInfo: {},
    logged: false,
    takeSession: false,
    requestResult: '',
    code:'',
    openid:'',
    hide:false,
    show:true,
    hide1:false,
    hide2:false
  },
  rechange:function(){
    this.setData({
      hide: this.data.hide = false,
      show: this.data.show = true,
      hide1:this.data.hide1=false,
      hide2:this.data.hide2=false,
    })
  },
  getOpenId: function () {
    wx.login({
      success: function (res) {
        if (res.code) {
          //发起网络请求
          wx.request({
            // url: 'https://api.weixin.qq.com/sns/jscode2session?appid=' + appId + '&secret=' + secret + '&js_code=' + res.code + '&grant_type=authorization_code',
            url:'https://stnr2jjf.qcloud.la/../welcome/askweixin',
            method: POST,
            data: {
              code:res.code
            },
            success: function (res2) {
              console.log(res2.data);
              // {
              //   uid:12
              //   session_key:shdfj
              // }
            }
          });
        } else {
          console.log('登录失败！' + res.errMsg)
        }
      }
      });
  },
  change:function(){
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

  buy: function () {
    wx.showToast({
      title: '添加成功',
      icon: 'warn',
      duration: 2000
    })
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
    if (this.data.logged) return

    util.showBusy('正在登录')
    var that = this

    // 调用登录接口
    qcloud.login({
      success(result) {
        if (result) {
          util.showSuccess('登录成功')
          that.setData({
            userInfo: result,
            logged: true
          })
        } else {
          // 如果不是首次登录，不会返回用户信息，请求用户信息接口获取
          qcloud.request({
            url: config.service.requestUrl,
            login: true,
            success(result) {
              util.showSuccess('登录成功')
              that.setData({
                userInfo: result.data.data,
                logged: true
              })
            },

            fail(error) {
              util.showModel('请求失败', error)
              console.log('request fail', error)
            }
          })
        }
      },

      fail(error) {
        util.showModel('登录失败', error)
        console.log('登录失败', error)
      }
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

     
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
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
    return {
      title: '自定义转发标题',
      path: '/page/user?id=123'
    }
  },
})