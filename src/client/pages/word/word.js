Page({
  data: {
    vocabulary: [],
    start: 0, //从第一条开始
    limit: 1,// 一次查询几条
    userAnswer: '',
    rightAnswer: '',
    show: true,
    hidedui: false,
    hidecuo: false,
    right: '',
    omoney:'',
    words:'',
    rightsum:''
    // vocabulary_content:''
  },
  



 

   // success: function (res) {
      //   console.log(res.data);
      //   that.setData({
      //     vocabulary_content: res.data.vocabulary_content,
      //     right: res.data.right,
      //   })
      // }




 

  // 自定义的方法，加载数据
  loadData: function () {
    wx.request({
      url: 'https://408665640.shuyishu.club/../vocabulary/get_vocabulary',
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
            start: this.data.start + 1,
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
  
    var that = this;
    var ouserid = getApp().globalData.myuserid;
    if (ouserid) {
      wx.request({
        url: 'https://408665640.shuyishu.club/index.php/vocabulary/get_user_list',//根据openid获取用户叶子币数he单词数，对题数,start
        data: {
          ouserid: ouserid
        },
        header: {
          'Content-Type': 'application/json'
        },
        success: function (res) {
          //console.log(res.data[0].user_lmoney);
          that.setData({
            omoney: res.data[0].leaves,
            words:res.data[0].words,
            rightsum:res.data[0].quizzes,
           
          })
        }
      })
    }
  },
  
  
  next: function () {
    this.loadData();
  },
  re: function () {
    this.fanhui();
    this.loadData();

  },
  // ListenerRadioGroup: function (e) {
  //   console.log(e)
  // },
  radioChange: function (e) {
    console.log('radio发生change事件，携带value值为：', e.currentTarget.id)
    this.setData({
      userAnswer: e.currentTarget.id
    });
    this.panDuan();
  },
  panDuan: function () {
   
    var ouserid = getApp().globalData.myuserid;
    this.setData({
      words: parseInt(this.data.words) + 1
    })
    wx.request({
      url: 'https://408665640.shuyishu.club/index.php/vocabulary/user_list_words',//根据openid修改用户单词数
      data: {
        words: parseInt(this.data.words) + 1,
        start: parseInt(this.data.start) + 1,
        ouserid: ouserid,
      },
      header: {
        'Content-Type': 'application/json'
      },
    })

    var ouserid = getApp().globalData.myuserid; console.log(ouserid);
    if (ouserid) {
    if (this.data.userAnswer == this.data.rightAnswer) {
      this.setData({
        hidedui: this.data.hidedui = true,
        show: this.data.show = false,
        hidecuo: this.data.hidecuo = false,
        omoney: parseInt(this.data.omoney) + 1,
        rightsum: parseInt(this.data.rightsum) + 1
      })
      wx.request({
        url: 'https://408665640.shuyishu.club/index.php/vocabulary/user_list_omoney',//根据openid修改用户yezi数
        data: {
          omoney: parseInt(this.data.omoney) + 1,
          ouserid: ouserid,
        },
        header: {
          'Content-Type': 'application/json'
        },
      })
    
      wx.request({
        url: 'https://408665640.shuyishu.club/index.php/vocabulary/user_list_rights',//根据openid修改用户duide单词数
        data: {
          rights: parseInt(this.data.rightsum) + 1,
          ouserid: ouserid,
        },
        header: {
          'Content-Type': 'application/json'
        },
      })
    }
    else {
      this.setData({
        hidedui: this.data.hidedui = false,
        show: this.data.show = false,
        hidecuo: this.data.hidecuo = true,
      })
    }
    }
   else {
    wx.showModal({
      title: '提示',
      content: '未登录，请先登录',
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