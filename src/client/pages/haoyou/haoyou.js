// pages/haoyou/haoyou.js
Page({
  
  /**
   * 页面的初始数据
   */
  data: {
    headimg:'',
    username:'',
    usermoney:0,
    petimg: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528561278860&di=65de0451543f39a94dbae90e04402541&imgtype=0&src=http%3A%2F%2Fstatic-xiaoguotu.17house.com%2F000%2F170%2F201406190858211687.jpg',
    houseimg: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528573567334&di=4ef72aa4373aafe45165314a7539ff91&imgtype=jpg&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D1545202919%2C536120645%26fm%3D214%26gp%3D0.jpg',
    hide: false,
    show: true,
    housenum:0,
    petnum:0
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
      url: 'https://408665640.shuyishu.club/index.php/sentencedata/getfriend_hap_num', //获取好友树屋和精灵个数
      data: {
        headimg: options.headimg,
        username: options.username,
        usermoney: options.usermoney
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function (res) {
        //console.log(res.data);
        that.setData({
          housenum: res.data[0][0],
          petnum: res.data[1][0]
        })
      }
    })
    wx.request({
      url: 'https://408665640.shuyishu.club/index.php/sentencedata/get_houseandpet', //获取好友树屋和精灵
      data:{
        headimg: options.headimg,
        username: options.username,
        usermoney: options.usermoney
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(res) {
        // console.log(res.data[0][0] + "   " + res.data[1][0]);
        that.setData({
          petimg: res.data[0][0],
          houseimg: res.data[1][0]
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