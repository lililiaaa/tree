// pages/shuwu/shuwu.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
      classify:['',''],
  },
search1:function(e){
  console.log(e.currentTarget.dataset.shopname);
  if(e.currentTarget.dataset.shopname=='house'){
    wx.navigateTo({
      url: '../room/room?name=house',
    })
  } else if (e.currentTarget.dataset.shopname=='elf'){
    wx.navigateTo({
      url: '../jingling/jingling?name=elf',
    })
  } 
},
hou:function(){
  wx.showLoading({
    title: '敬请期待',
  })
  setTimeout(function () {
    wx.hideLoading()
  }, 1000)
},
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
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