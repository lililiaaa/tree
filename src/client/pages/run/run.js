// pages/petchange/petchange.js
Page({
 
  /**
   * 页面的初始数据
   */
  data: {
    step: 0
  },
  buy: function (e) {
    var that = this; 
    var step = e.currentTarget.dataset.step;
    var ouserid = getApp().globalData.myuserid;
    var otodaydui = getApp().dayData.todaydui;
    var timestamp = Date.parse(new Date());
    timestamp = timestamp / 1000;
    console.log("当前时间戳为：" + timestamp);
    var n = timestamp * 1000;
    var date = new Date(n);
    var d = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
    if (ouserid){
    var changenmoney = 0;
    if (step < 1000) { changenmoney = 0; }
    else if (step >= 1000 && step < 6000) { changenmoney = 5; }
    else if (step >= 6000 && step < 10000) { changenmoney = 10; }
    else if (step >= 10000 && step < 16000) { changenmoney = 15; }
    else if (step >= 16000 && step < 20000) { changenmoney = 25; }
    else if (step >= 20000 && step < 26000) { changenmoney = 35; }
    else if (step >= 26000 && step < 50000) { changenmoney = 50; }
    else if (step >= 50000) { changenmoney = 100; }
    
    if (otodaydui != d) {
      wx.request({
        url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/modify_lmoney',//根据userid修改用户叶子币数
        data: {
          ouserid: ouserid,
          changenmoney: changenmoney
        },
        header: {
          'Content-Type': 'application/json'
        },
      })
      wx.showToast({
        title: '兑换成功',
        icon: 'warn',
        duration: 2000
      })
      getApp().dayData.todaydui = d;
    }
    else if (otodaydui == d) {
      wx.showModal({
        title: '提示',
        content: '您今天已兑换',
      })
    }
    }
    else{
      wx.showModal({
        title: '提示',
        content: '未登录，请先登录',
      })
    }
  },
  /**
   * 生命周期函数--监听页面加载
   */
  //获取运动步数
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
      url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_sessionId',//由code获取sessionId
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
      url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_step', //解密的数据；
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