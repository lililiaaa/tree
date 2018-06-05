// pages/moodFruit/moodFruit.js
Page({
  data: {
    leaves_num:520,
    click_num:3,
    message1:"请点击红色苹果，有几率触发中奖事件，轻松获得叶子币哦!",
    message2: "每天只能点击五次，也可用三个叶子币兑换一次点击次数。",
    flag_re: true,
    flag_jo:true,
    flag_msg:false,
  },
  joke: function () {

    this.setData({ 
      flag_jo: false,
      joke_content:"从前有个剑客，他心是冷的，剑是冷的，手是冷的，于是他冻死了……"
      })

  },
  reward: function () {

    this.setData({ flag_re: false })

  },
  hide: function () {
    this.setData({ flag_re: true, flag_jo: true, flag_msg: true})
  },
})