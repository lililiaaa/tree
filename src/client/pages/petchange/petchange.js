// pages/petchange/petchange.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    changeimg: 0,
    name: ["依诺", "爱丽", "梅丽莎", "梦莎", "索菲娜", "诺兰"],
    image: [
      "http://p3.so.qhimgs1.com/bdr/_240_/t016745331ddbd5acc3.jpg",
      "http://p0.so.qhimgs1.com/bdr/_240_/t01ff77dcbd9a607cf0.jpg",
      "http://ent.chinadaily.com.cn/img/attachement/jpg/site1/20170719/448a5bd66a811ad93f9d26.jpg",
      "http://img.zcool.cn/community/0120e956ad92eb32f875520f7b4156.jpg",
      "http://p3.so.qhimgs1.com/bdr/_240_/t01baccea1e61a9cf23.jpg",
      "http://p1.so.qhimgs1.com/bdr/_240_/t01a02d0c4bfbae41d1.jpg"
    ]
  },
  confirm: function (e) {
    var oname = e.currentTarget.dataset.name;
    var oimage = e.currentTarget.dataset.image;
    getApp().petData.petname = oname;
    getApp().petData.petimg = oimage;
    wx.showToast({
      title: '更换成功',
      icon: 'warn',
      duration: 2000
    })
  },
  change0: function () {
    this.setData({
      changeimg: 0
    });
  },
  change1: function () {
    this.setData({
      changeimg: 1
    });
  },
  change2: function () {
    this.setData({
      changeimg: 2
    });
  },
  change3: function () {
    this.setData({
      changeimg: 3
    });
  },
  change4: function () {
    this.setData({
      changeimg: 4
    });
  },
  change5: function () {
    this.setData({
      changeimg: 5
    });
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

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