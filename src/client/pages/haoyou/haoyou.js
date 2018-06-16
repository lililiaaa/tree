// pages/haoyou/haoyou.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    headimg:'',
    username:'',
    usermoney:0,
    petimg: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529031790&di=9c4b509bfb5bebc16747f0f4d662d3fd&imgtype=jpg&er=1&src=http%3A%2F%2Fimages.17173.com%2F2015%2Fnews%2F2015%2F03%2F12%2Fmj0312dl01s.jpg',
    houseimg: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528576630809&di=ea29f0fdd0da77f725b9a4e885dcf584&imgtype=0&src=http%3A%2F%2Fdimg02.c-ctrip.com%2Fimages%2Ffd%2Ftg%2Fg4%2FM00%2F84%2F8C%2FCggYHlX5iwWAdcKEAAFWwHvqf5o229_R_1024_10000.jpg',
    hide: false,
    show: true
  },
  rechange: function () {
    this.setData({
      hide: this.data.hide = false,
      show: this.data.show = true,
    })
  },
  change: function () {
    this.setData({
      hide: this.data.hide = true,
      show: this.data.show = false,
    })
  },
  change2: function () {
    this.setData({
      hide: this.data.hide = false,
      show: this.data.show = false,
      hide1: this.data.hide1 = false,
      hide2: this.data.hide2 = true,
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this;
    this.setData({
      headimg: options.headimg,
      username: options.username,
      usermoney: options.usermoney
    })
    wx.request({
      url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_houseandpet', //获取好友树屋和精灵
      data:{
        headimg: options.headimg,
        username: options.username,
        usermoney: options.usermoney
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(res) {
        console.log(res.data);
        // that.setData({
        //   petimg: res.data[0].user_house,
        //   houseimg: res.data[0].user_pet
        // })
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