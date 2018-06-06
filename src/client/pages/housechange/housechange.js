// pages/housechange/housechange.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    changeimg: 0,
    housename: ["萌萌爱心", "少女时代", "蔚蓝海岸", "蓝色梦乡", "薰衣草庄园", "热情似火"],
    houseimg: [
      "http://p0.so.qhimgs1.com/bdr/_240_/t011350fdd391ddf88a.jpg",
      "http://p0.so.qhimgs1.com/bdr/_240_/t019dc82594b357f4da.jpg",
      "http://p0.so.qhimgs1.com/bdr/_240_/t013d17fe4c0a05de70.jpg",
      "http://p3.so.qhimgs1.com/bdr/_240_/t01993b1eb53f2c3f73.jpg",
      "http://www.civilcn.com/d/file/zhuangxiu/xiaoguotu/2011-06-15/5d0734b48e8f14c691e1f7fbff0e583f.jpg",
      "http://p3.so.qhimgs1.com/bdr/_240_/t016d211e5680f4b223.jpg"
    ]
  },
  confirm: function (e) {
    var oname = e.currentTarget.dataset.name;
    var oimage = e.currentTarget.dataset.image;
    getApp().houseData.housename = oname;
    getApp().houseData.houseimg = oimage;
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