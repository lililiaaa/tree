// pages/petchange/petchange.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    index: 0,
    housename: "洛神",
    houseimg:
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529031775&di=f2d73b08750bcbcfb47031f6e93d7dd3&imgtype=jpg&er=1&src=http%3A%2F%2Fimgq.duitang.com%2Fuploads%2Fitem%2F201501%2F17%2F20150117203244_aHKHx.jpeg",
    sentence: []
  },
  confirm: function (e) {
    var oname = e.currentTarget.dataset.name;
    var oimage = e.currentTarget.dataset.image;
    getApp().petData.petname = oname;
    getApp().petData.petimg = oimage;
    var ourseid = getApp().globalData.myuserid;
    var that = this;
    if (ourseid) {
      wx.request({
        url: 'https://408665640.shuyishu.club/index.php/sentencedata/update_user_pet',//修改用户精灵
        data: {
          ourseid: ourseid,
          housename: oname,
          houseimg: oimage
        },
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {
          wx.showToast({
            title: '更换成功',
            icon: 'warn',
            duration: 2000
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
    // wx.showToast({
    //   title: '更换成功',
    //   icon: 'warn',
    //   duration: 2000
    // })
    getApp().fangwu.pflg = 0;
  },
  change: function (e) {
    var index = parseInt(e.currentTarget.dataset.index);
    this.setData({
      houseimg: this.data.sentence[index].img,
      housename: this.data.sentence[index].sprite_name
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
        url: 'https://408665640.shuyishu.club/index.php/sentencedata/get_person_list',//获取精灵列表
        data: {
          ourseid: ourseid
        },
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {
          if (res.data == false) {
            wx.showModal({
              title: '提示',
              content: '您还没有精灵',
            })
          }
          else {
            that.setData({
              sentence: res.data,
              houseimg: res.data[0].img,
              housename: res.data[0].sprite_name,
            })
          }
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