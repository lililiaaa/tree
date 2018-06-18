// pages/housechange/housechange.js
Page({
 
  /**
   * 页面的初始数据
   */
  data: {
    index: 0,
    housename:  "篝火别墅",
    houseimg: 
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528560534913&di=394f9ddba4ee7f7d131d2f6b7097c9d1&imgtype=0&src=http%3A%2F%2Fpic.shejiben.com%2Fcase%2F2014%2F03%2F04%2F20140304174410-c7bf50ce.jpg",
    sentence:[]
  },
  confirm: function (e) {
    var oname = e.currentTarget.dataset.name;
    var oimage = e.currentTarget.dataset.image;
    getApp().houseData.housename = oname;
    getApp().houseData.houseimg = oimage;

    var ourseid = getApp().globalData.myuserid;
    var that = this;
    if (ourseid) {
      wx.request({
        url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/update_user_house',//修改用户房屋
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
    getApp().fangwu.fflg = 0;
  },
  change: function (e) {
    var index = parseInt(e.currentTarget.dataset.index);
    this.setData({
      houseimg: this.data.sentence[index].img_inside,
      housename: this.data.sentence[index].house_name
    })
    
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var ourseid = getApp().globalData.myuserid;
    var that=this;
    if (ourseid) {
      wx.request({
        url: 'https://stnr2jjf.qcloud.la/index.php/sentencedata/get_house_list',//获取房屋列表
        data: {
          ourseid: ourseid
        },
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {
          console.log(res.data);
          if (res.data==false){
            wx.showModal({
              title: '提示',
              content: '您还没有房屋',
            })
          }
          else{
            that.setData({
              sentence: res.data,
              houseimg: res.data[0].img_inside,
              housename: res.data[0].house_name,
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