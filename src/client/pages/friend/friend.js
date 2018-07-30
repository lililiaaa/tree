// pages/friend/friend.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    sentence: []
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this;
    var ouserid = getApp().globalData.myuserid;
    if (ouserid) {
      wx.request({
        url: 'https://408665640.shuyishu.club/index.php/sentencedata/get_friend_list', //后台获取好友数据列表
        data: {
          ouserid: ouserid
        },
        header: {
          'content-type': 'application/json'
        },
        success: function(res){
          that.setData({
            sentence: res.data
          })
        }
      })
    }
    else{
      wx.showModal({
        title: '提示',
        content: '未登录，请先登录',
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
    var that = this;
    var ouserid = getApp().globalData.myuserid;
    if (ouserid) {
      wx.request({
        url: 'https://408665640.shuyishu.club/index.php/sentencedata/get_friend_list', //后台获取好友数据列表
        data: {
          ouserid: ouserid
        },
        header: {
          'content-type': 'application/json'
        },
        success: function (res) {
          // console.log(res.data)
          that.setData({
            sentence: res.data
          })
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