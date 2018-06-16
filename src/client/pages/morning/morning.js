// pages/morning/morning.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    omoney: 520,
    oday: 99
  },
  qiandao: function (e) {
    var that = this;
    var oday = e.currentTarget.dataset.oday;
    var omoney = e.currentTarget.dataset.omoney;
    var ouserid = getApp().globalData.myuserid;
    var otodaydao = getApp().dayData.todaydao;
    if (ouserid) {
      var timestamp = Date.parse(new Date());
      timestamp = timestamp / 1000;
      console.log("当前时间戳为：" + timestamp);
      var n = timestamp * 1000;
      var date = new Date(n);
      var d = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
      var h = date.getHours();
      if (otodaydao != d) {
        if (h < 7) {
          wx.showToast({
            title: '签到成功',
            icon: 'warn',
            duration: 2000
          })
          getApp().dayData.todaydao = d;
          that.setData({
            omoney: parseInt(omoney)+5,
            oday: parseInt(oday)+1,
          })
          wx.request({
            url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/modify_user_list',//根据openid修改用户叶子币数he签到天数（叶子币数+5，签到天数+1）
            data: {
              omoney: parseInt(omoney)+5,
              oday: parseInt(oday)+1,
              ouserid: ouserid,
            },
            header: {
              'Content-Type': 'application/json'
            },
          })
        }
        else {
          wx.showModal({
            title: '提示',
            content: '签到时间已过',
          })
        }
      }
      else {
        wx.showModal({
          title: '提示',
          content: '您已签到',
        })
      }
    }
    else {
      wx.showModal({
        title: '提示',
        content: '未登录，请先登录',
      })
    }
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    var ouserid = getApp().globalData.myuserid;
    if (ouserid) {
      wx.request({
        url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_signin_list',//根据openid获取用户叶子币数he签到天数
        data: {
          ouserid: ouserid
        },
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {
          //console.log(res.data[0].user_lmoney);
          that.setData({
            omoney: res.data[0].leaves,
            oday: res.data[0].mark
          })
        }
      })
    }
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