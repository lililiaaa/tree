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
    petimg: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529031775&di=f2d73b08750bcbcfb47031f6e93d7dd3&imgtype=jpg&er=1&src=http%3A%2F%2Fimgq.duitang.com%2Fuploads%2Fitem%2F201501%2F17%2F20150117203244_aHKHx.jpeg',
    petimg2: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529031790&di=9c4b509bfb5bebc16747f0f4d662d3fd&imgtype=jpg&er=1&src=http%3A%2F%2Fimages.17173.com%2F2015%2Fnews%2F2015%2F03%2F12%2Fmj0312dl01s.jpg',
    petimg3: 'http://p3.so.qhimgs1.com/bdr/_240_/t01baccea1e61a9cf23.jpg',
  },
  duihuan: function () {
    var that = this;
    var oopenid = getApp().globalData.myopenid;
    var huan = getApp().duihuan.duihuan;
    if (huan != 0) {
      wx.showToast({
        title: '获得600叶子币',
        icon: 'warn',
        duration: 2000
      })
    }
    else {
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
    // var that = this;
    // if (getApp().fangwu.pflg == 1) {
    //   that.setData({
    //     petname: getApp().fangwu.pname,
    //     petimg: getApp().fangwu.pimg,
    //     petimg1: getApp().fangwu.pimg,
    //     petimg2: getApp().fangwu.pimg,
    //   })
    // }
    // else {
    //   wx.showToast({
    //     title: '敬请期待',
    //     icon: 'warn',
    //     duration: 2000
    //   })
    // }
    var ourseid = getApp().globalData.myuserid;
    var that = this;
    if (ourseid) {
      wx.request({
        url: 'https://408665640.shuyishu.club/index.php/sentencedata/get_userpet_list',//获取精灵列表
        data: {
          ourseid: ourseid
        },
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {
          console.log(res.data);
          that.setData({
            petname: res.data[0].sprite_name,
            petimg: res.data[0].img_child,
            petimg2: res.data[0].img_young,
            petimg3: res.data[0].img_old,
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