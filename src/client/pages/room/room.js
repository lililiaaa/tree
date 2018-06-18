// pages/room/room.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    pic1: [],
    pic2: [],
    name: '',
    hide: false,
    show: true,
  },
  look: function (e) {
    var id;
    if (this.data.show) {
      id = this.data.pic1[e.currentTarget.dataset.index].house_id;
    } else {
      id = this.data.pic2[e.currentTarget.dataset.index].house_id;
    }
    wx.navigateTo({
      url: '../lroom/lroom?id=' + id + '&name=' + this.data.name + '',
    })
  },
  man: function () {
    this.setData({
      hide: this.data.hide = true,
      show: this.data.show = false,
    })
  },
  xie: function () {
    this.setData({
      hide: this.data.hide = false,
      show: this.data.show = true,
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({ classify: [options.classify1, options.classify2], name: options.name });
    var that = this
    if (options.name == 'house') {
      wx.request({
        url: 'https://stnr2jjf.qcloud.la/house/shop',
        data: {},
        header: { 'Content-Type': 'application/json' },
        success: function (res) {
          var urlArr1 = [];
          var urlArr2 = [];
          for (var i = 0; i < res.data.length; i++) {
            if (res.data[i].kind == 'manhua') {
              urlArr1.push(res.data[i]);
            } else {
              urlArr2.push(res.data[i])
            }
          }
          that.setData({
            pic1: urlArr1,
            pic2: urlArr2
          });
          console.log(that.data.pic1);
          console.log(that.data.pic2);

        }
      });
    }

  },


  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    // console.log(this.data.name)
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