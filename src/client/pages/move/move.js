// pages/move/move.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    step: 0
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var ouserid = getApp().globalData.myuserid;
    if (ouserid) {
      let that = this
      wx.login({
        success: function (res) {
          let code = res.code
          that.setData({ code: code })
          wx.getWeRunData({//解密微信运动
            success(res) {
              const wRunEncryptedData = res.encryptedData
              that.setData({ encryptedData: wRunEncryptedData })
              that.setData({ iv: res.iv })
              that.get3rdSession()//解密请求函数
            }
          })
        }
      })
    }
  },
  get3rdSession: function () {
    let that = this
    wx.request({
      url: 'https://408665640.shuyishu.club/index.php/sentencedata/get_sessionId',//由code获取sessionId
      data: {
        code: this.data.code
      },
      method: 'GET', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
      success: function (res) {
        var sessionId = res.data;
        that.setData({ sessionId: sessionId })
        wx.setStorageSync('sessionId', sessionId)
        that.decodeUserInfo()
      }
    })
  },
  decodeUserInfo: function () {
    let that = this;
    wx.request({
      url: 'https://408665640.shuyishu.club/index.php/sentencedata/get_step', //解密的数据；
      data: {
        encryptedData: that.data.encryptedData,
        iv: that.data.iv,
        session: wx.getStorageSync('sessionId'),
      },
      method: 'GET', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
      // header: {}, // 设置请求的 header
      success: function (res) {
        //console.log(res.data.stepInfoList.pop().step);
        let todayStep = res.data.stepInfoList.pop()
        that.setData({
          step: todayStep.step
        });
      }
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
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
  
  }
})