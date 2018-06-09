// pages/house/house.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    houseimg: 'http://p0.so.qhimgs1.com/bdr/_240_/t019dc82594b357f4da.jpg',
    housename: "少女时代",
    sentence: []
  },

  
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this;
    this.setData({
      houseimg: options.houseimg,
      housename: options.housename
    }) 
    wx.request({
      url: '', //由房屋链接后台获取房屋数据列表
      data: {
        houseimg: houseimg
      },
      header: {
        'content-type': 'application/json'
      },
      success: function(res){
        //console.log(res.data)
        that.setData({
          sentence: res.data
        })
      }
    })
    // for (var j = 0; j < oIcon.length; j++) {
    //   oIcon[j].index = j;
    //   oIcon[j].onmouseover = function () {
    //     change(this.index)
    //   }

    //   function change(index) {
    //     nowIndex = index;
    //     for (var i = 0; i < oIcon.length; i++) {

    //       oImg[i].className = "";
    //     }

    //     oImg[index].className = "active";
    //   }
    // }
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