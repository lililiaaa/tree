// pages/moodFruit/moodFruit.js
Page({
  data: {
    leaves_num:520,
    click_num:5,
    message1:"请点击红色苹果，有几率触发中奖事件，轻松获得叶子币哦!",
    message2: "每天只能点击五次，也可用三个叶子币兑换一次点击次数。",
    flag_re: true,
    flag_jo:true,
    flag_msg:false,
  },
  open(){
    var that=this;
    var ouserid = getApp().globalData.myuserid;
      console.log(this.data.click_num);
      if (this.data.click_num<=0){
        wx.showModal({
          content: '机会用完了',
          showCancel: false, //不显示取消按钮
          confirmText: '确定'
        })
      } else{
        this.setData({
          click_num: that.data.click_num - 1
        });
    //     wx.request({
    //       url: 'https://stnr2jjf.qcloud.la/mindfruit/ud_chance',
    //       method: 'GET',
    //       data: {
    //         u_id: ouserid,
    //         chance: that.data.click_num
    //         },
    //       header: { 'Content-Type': 'application/json' },
    //       success: function (res) {
        
    //   }
    // })
    var random = Math.round(Math.random()*10);
    if(random<2){
       this.setData({ flag_re: false });
       wx.request({
         url: 'https://stnr2jjf.qcloud.la/mindfruit/add_leaves',
         method: 'GET',
         data: {
           u_id: ouserid,
         },
         header: { 'Content-Type': 'application/json' },
         success: function (res) {
           that.setData({
             leaves_num: res.data.leaves,
           })
         }
       })
    }else{
      this.setData({ 
        flag_jo: false,
        joke_content:"从前有个剑客，他心是冷的，剑是冷的，手是冷的，于是他冻死了……"
        })

    }
     }
  },
  joke: function () {


  },
  reward: function () {


  },
  hide: function () {
    var ouserid = getApp().globalData.myuserid;
    if (ouserid) {
    this.setData({ flag_re: true, flag_jo: true, flag_msg: true})}
    else {
      wx.showModal({
        title: '提示',
        content: '未登录，请先登录',
      })
    }
  },
  
  onLoad: function (options) {
    var ouserid = getApp().globalData.myuserid;
    var that=this;
    console.log(ouserid);
    wx.request({
      url: 'https://stnr2jjf.qcloud.la/mindfruit/get_leaves',
      method: 'GET',
      data: { u_id: ouserid },
      header: { 'Content-Type': 'application/json' },
      success: function (res) {
        console.log(res.data.leaves);
        that.setData({
          leaves_num: res.data.leaves,
          // click_num: res.data.chance
        })
      }
    });


  }
  
  
})
  