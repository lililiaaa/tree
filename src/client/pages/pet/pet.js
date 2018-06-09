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
    da: false,
    petname:"洛神",
    petimg:'http://p2.so.qhimgs1.com/bdr/200_200_/t01f9da8c00bb4c7092.jpg',
    petimg2: 'http://p2.so.qhimgs1.com/bdr/200_200_/t01f9da8c00bb4c7092.jpg',
    petimg3: 'http://p2.so.qhimgs1.com/bdr/200_200_/t01f9da8c00bb4c7092.jpg',
  },

  duihuan: function () {
    var that=this;
    var oopenid = getApp().globalData.myopenid;
    var huan = getApp().duihuan.duihuan;
    if (huan!=0){
      wx.showToast({
        title: '获得600叶子币',
        icon: 'warn',
        duration: 2000
      })
      wx.request({
        url: '/index.php/',//根据openid修改用户叶子币数
        data: {
          oopenid: oopenid,
          changenmoney: 600
        },
        header: {
          'Content-Type': 'application/json'
        },
      })
     getApp().duihuan.duihuan= 0
    }
    else{
      wx.showModal({
        title: '提示',
        content: '您已兑换过',
      })
    }
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
    wx.request({
      url: '/index.php/',//根据openid修改用户叶子币数
      data: {
        oopenid: oopenid,
        changenmoney: -60
      },
      header: {
        'Content-Type': 'application/json'
      },
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
    wx.request({
      url: '/index.php/',//根据openid修改用户叶子币数
      data: {
        oopenid: oopenid,
        changenmoney: -60
      },
      header: {
        'Content-Type': 'application/json'
      },
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
    wx.request({
      url: '/index.php/',//根据openid修改用户叶子币数
      data: {
        oopenid: oopenid,
        changenmoney: -60
      },
      header: {
        'Content-Type': 'application/json'
      },
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
    wx.request({
      url: '/index.php/',//根据openid修改用户叶子币数
      data: {
        oopenid: oopenid,
        changenmoney: -60
      },
      header: {
        'Content-Type': 'application/json'
      },
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
    wx.request({
      url: '/index.php/',//根据openid修改用户叶子币数
      data: {
        oopenid: oopenid,
        changenmoney: -60
      },
      header: {
        'Content-Type': 'application/json'
      },
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
    var that = this;
    getApp().duihuan.duihuan = 1
    this.setData({
      petimg: options.petimg,
      petname: options.petname
    })
    wx.request({
      url: '', //由精灵图片链接后台获取两个精灵图片
      data: {
        petimg: petimg
      },
      header: {
        'content-type': 'application/json'
      },
      success: function (res) {
        //console.log(res.data)
        that.setData({
          petimg2: res.data,
          petimg3: res.data
        })
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