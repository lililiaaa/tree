// pages/housechange/housechange.js
Page({
 
  /**
   * 页面的初始数据
   */
  data: {
    index: 0,
    housename: "少女时代",
    omyhouseimg: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528576011732&di=26e7922a6919f5b6f0987bcfa0df16ff&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201512%2F07%2F20151207094037_vhU4j.jpeg",
    houseimg:
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528576011732&di=26e7922a6919f5b6f0987bcfa0df16ff&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201512%2F07%2F20151207094037_vhU4j.jpeg",
    sentence: []
  },
  change: function (e) {
    var index = parseInt(e.currentTarget.dataset.index);
    this.setData({
      houseimg: this.data.sentence[index].housein_img,
    })
  },
  ochange:function(e){
    this.setData({
      houseimg: e.currentTarget.dataset.omyh,
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
        url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_userinhouse_list',//获取房屋列表
        data: {
          ourseid: ourseid
        },
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {
          that.setData({
            houseimg: res.data[0].img_inside,
            omyhouseimg:res.data[0].img_inside,
            housename: res.data[0].house_name
          })
        }
      })
      wx.request({
        url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_myuserinhouse_list',//获取房屋列表
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