// pages/mine/jingling/jingling.js
Page({

  /** 
   * 页面的初始数据
   */
  data: {
    show: true,
    hideone: false,
    hidetwo: false,
    hideth: false,
    hidefo: false,
    hidefive: false,
    xiao: true,
    zhong: false,
    da: false
  },

  duihuan: function () {
    wx.showToast({
      title: '获得600叶子币',
      icon: 'warn',
      duration: 2000
    })

  },

  duihua: function () {
    wx.showModal({
      title: '洛神',
      content: '亲，你今天还没有喂食哦，小洛神在等你呀，快去运动学习喽',
      // success: function (res) {
      //   if (res.confirm) {
      //     console.log('用户点击确定')
      //   } 
    })
  },


  one: function () {
    this.setData({
      hideone: this.data.hideone = true,
      hidetwo: this.data.hidetwo = false,
      show: this.data.show = false,
      hideth: this.data.hideth = false,
      hidefo: this.data.hidefo = false,
      hidefive: this.data.hidefive = false,

    })
  },
  two: function () {
    this.setData({
      hideone: this.data.hideone = false,
      hidetwo: this.data.hidetwo = true,
      show: this.data.show = false,
      hideth: this.data.hideth = false,
      hidefo: this.data.hidefo = false,
      hidefive: this.data.hidefive = false,
    })
  },
  three: function () {
    this.setData({
      hideone: this.data.hideone = false,
      hidetwo: this.data.hidetwo = false,
      show: this.data.show = false,
      hideth: this.data.hideth = true,
      hidefo: this.data.hidefo = false,
      hidefive: this.data.hidefive = false,
    })
  },
  four: function () {
    this.setData({
      hideone: this.data.hideone = false,
      hidetwo: this.data.hidetwo = false,
      show: this.data.show = false,
      hideth: this.data.hideth = false,
      hidefo: this.data.hidefo = true,
      hidefive: this.data.hidefive = false,
    })
  },
  five: function () {
    this.setData({
      hideone: this.data.hideone = false,
      hidetwo: this.data.hidetwo = false,
      show: this.data.show = false,
      hideth: this.data.hideth = false,
      hidefo: this.data.hidefo = false,
      hidefive: this.data.hidefive = true,
    })
  },
  success: function () {
    this.setData({
      xiao: this.data.xiao = false,
      zhong: this.data.zhong = true,

      da: this.data.da = false,
      hideone: this.data.hideone = false,
      hidetwo: this.data.hidetwo = false,
      show: this.data.show = true,
      hideth: this.data.hideth = false,
      hidefo: this.data.hidefo = false,
      hidefive: this.data.hidefive = false

    })
    wx.showToast({
      title: '长大啦！',
      icon: 'warn',
      duration: 1000
    })
  },
  grow: function () {
    this.setData({
      xiao: this.data.xiao = false,
      zhong: this.data.zhong = false,
      da: this.data.da = true,
      hideone: this.data.hideone = false,
      hidetwo: this.data.hidetwo = false,
      show: this.data.show = true,
      hideth: this.data.hideth = false,
      hidefo: this.data.hidefo = false,
      hidefive: this.data.hidefive = false
    })
    wx.showToast({
      title: '长大啦！',
      icon: 'warn',
      duration: 1000
    })
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