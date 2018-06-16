// pages/room/room.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    pic1: [],
    pic2:[],
    name:'',
    hide: false,
    show: true,
  },
look:function(e){
  var id = this.data.pic1[e.currentTarget.dataset.index].house_id;
  wx.navigateTo({
    url: '../lroom/lroom?id='+id+'&name='+this.data.name+'',
  })
  // console.log(e.currentTarget.dataset.index);
},
man:function(){
  wx.showLoading({
    title: '敬请期待',
  })
  setTimeout(function () {
    wx.hideLoading()
  }, 1000)
  console.log(1212);
  
},
xie:function(){
  console.log(3344);
  // this.setData({
  //   hide: this.data.hide = false,
  //   show: this.data.show = true,
  // })
},
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
      this.setData({classify:[options.classify1,options.classify2],name:options.name});
      var that=this
      if(options.name=='house'){
        wx.request({
          url: 'https://stnr2jjf.qcloud.la/house/shop',
          data: {},
          header: { 'Content-Type': 'application/json' },
          success: function (res) {
            console.log(res.data)
            var urlArr = [];
            for (var i = 0; i < res.data.length; i++) {
              urlArr[i] = res.data[i];
            }
            that.setData({
              pic1: urlArr,
            });
            console.log(that.data.pic1);

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