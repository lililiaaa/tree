// pages/housechange/housechange.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    index: 0,
    housename: "少女时代",
    houseimg:
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529169936&di=8c589e3d9938cb99d7589e80e62c36cd&imgtype=jpg&er=1&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201512%2F31%2F20151231212334_G5fwt.thumb.700_0.jpeg",
    sentence: []
  },
  change: function (e) {
    var index = parseInt(e.currentTarget.dataset.index);
    this.setData({
      houseimg: this.data.sentence[index].img_inside,
      housename: this.data.sentence[index].housename
    })

  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var ourseid = getApp().globalData.myuserid;
    var that = this;
    if (ourseid) {
      wx.request({
        url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_house_list',//获取房屋列表
        data: {
          ourseid: ourseid
        },
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {
          console.log(res.data);
          that.setData({
            sentence: res.data,
            houseimg: res.data[0].img_inside,
            housename: res.data[0].house_name,
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