Page({
  data: {
    vocabulary: [],
    items: [
      { name: 'USA', value: '风力' },
      { name: 'CHN', value: '太阳', checked: 'true' },
      { name: 'BRA', value: '雷电' },
      { name: 'JPN', value: '月光' },
    ],
    start: 0, //从第一条开始
    limit: 1,// 一次查询几条
    userAnswer: '',
    rightAnswer: '',
    show: true,
    hidedui: false,
    hidecuo: false,
    right: ''
  },


  right: function () {

    this.setData({
      hidedui: this.data.hidedui = false,
      show: this.data.show = false,
      hidecuo: this.data.hidedui = true,
    })

  },


  re: function () {

    this.setData({
      hidedui: this.data.hidedui = false,
      show: this.data.show = true,
      hidecuo: this.data.hidedui = false,
    })

  },








  // 自定义的方法，加载数据
  loadData: function () {
    wx.request({
      url: 'https://stnr2jjf.qcloud.la/../vocabulary/get_vocabulary',
      data: {
        start: this.data.start,
        limit: this.data.limit
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: res => {
        let answers = res.data[0].answer;
        for (let i = 0; i < answers.length; i++) {
          // console.log(res.data.answers);
          if (answers[i].panduan == '1') {
            this.setData({
              rightAnswer: answers[i].answer_id,
              right: answers[i].answer,

            })
          }

        }
        if (res.data.length > 0) {
          this.setData({
            vocabulary: res.data,
            start: this.data.start + 1
          })
        } else {
          wx.showToast({
            title: '已经最后一题了',
            icon: 'warn',
            duration: 2000
          })
        }

      },
    })
  },
  // /**
  //  * 生命周期函数--监听页面加载
  //  */
  onLoad: function () {
    this.loadData();
  },
  next: function () {
    this.loadData();
  },
  renext: function () {
    this.fanhui();
    this.loadData();

  },
  // ListenerRadioGroup: function (e) {
  //   console.log(e)
  // },
  radioChange: function (e) {
    this.setData({
      userAnswer: e.detail.value
    });
  },
  panDuan: function () {
    if (this.data.userAnswer == this.data.rightAnswer) {
      this.setData({
        hidedui: this.data.hidedui = true,
        show: this.data.show = false,
        hidecuo: this.data.hidedui = false,
      })
    }
    else {
      this.setData({
        hidecuo: this.data.hidedui = true,
        show: this.data.show = false,
        hidedui: this.data.hidedui = false,
      })
    }
  },
  fanhui: function () {
    this.setData({
      hidecuo: this.data.hidedui = false,
      show: this.data.show = true,
      hidedui: this.data.hidedui = false,
    })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {



  },

  /**x
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