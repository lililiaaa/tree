// pages/lroom/lroom.js
Page({
 
  /**
   * 页面的初始数据
   */
  data: {
    pic:'',
    kind:'',
    detail:'',
    name:'',
    price:'',
    id:'',
    tip:'',
  
  },
// json2Form(json){  
//     var str = [];  
//     for(var p in json){  
//   str.push(encodeURIComponent(p) + "=" + encodeURIComponent(json[p]));
// }
// return str.join("&");  
// },
  buy(){
    var ouserid = getApp().globalData.myuserid;
    var that=this;
    wx.request({
      url: 'https://408665640.shuyishu.club/house/get_leaves',
      method: 'GET',
      data: { u_id: ouserid },
      header: { 'Content-Type': 'application/json' },
      success: function (res){
          var leaves=res.data.leaves;
          var left = leaves - that.data.price;
          if (that.data.kind == 'house') {
            if(leaves-that.data.price>=0){
              wx.request({
                url: 'https://408665640.shuyishu.club/house/buy',
                method: 'GET',
                data: { user_id: ouserid, house_id: that.data.id, leaves:left},
                header: { 'Content-Type': 'application/json' },
                success: function (res) { 
                  wx.showToast({
                    title: '购买成功',
                    icon: 'warn',
                    duration: 2000
                  });
                }
              })
              }else{
              wx.showModal({
                content: '余额不足',
                showCancel: false, //不显示取消按钮
                confirmText: '确定'
              })
              }
          } else if (that.data.kind == 'elf'){
            if (leaves - that.data.price >= 0) {
              wx.request({
                url: 'https://408665640.shuyishu.club/sprite/buy',
                method: 'GET',
                data: { user_id: ouserid, sprite_id: that.data.id, leaves: left },
                header: { 'Content-Type': 'application/json' },
                success: function (res) { 
                  wx.showToast({
                    title: '购买成功',
                    icon: 'warn',
                    duration: 2000
                  });
                }
              })
            } else {
              wx.showModal({
                content: '余额不足',
                showCancel: false, //不显示取消按钮
                confirmText: '确定'
              })
            }
       }
    }
  })
    
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var ourseid = getApp().globalData.myuserid;console.log(ourseid);
    var that = this;
    var id = options.id;
    var name = options.name;
    this.setData({
      kind:options.name,
      id: options.id
    })
    if (name=='house'){
      wx.request({
        url: 'https://408665640.shuyishu.club/house/get_details',
        method: 'GET',
        data: { id: id },
        header: { 'Content-Type': 'application/json' },
        success: function (res) {
          console.log(res.data);
          that.setData({
            pic:res.data.img_inside,
            name: res.data.house_name,
            detail: res.data.intro,
            price: res.data.price,
            tip:'提示：只有购买商品后才能查看内部细节'
          })
        }
      })

    }else if(name=='elf'){
      console.log(this.data.id);
      wx.request({
        url: 'https://408665640.shuyishu.club/sprite/get_details',
        method: 'GET',
        data: { id: id },
        header: { 'Content-Type': 'application/json' },
        success: function (res) {
          console.log(res.data);
          that.setData({
            name: res.data.sprite_name,
            detail: res.data.intro,
            price: res.data.price,
             pic: res.data.img,
             tip: '提示：精灵分为幼年，青年，成年，购买前查看成年，购买后由幼年开始喂养'
          })
        }
      })
    }
    
    // console.log(id);
    
    // this.setData({
    //   detail: this.data.d[options.name][options.index],
    // })
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