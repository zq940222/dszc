// pages/component/riderapplication/riderapplication.js
const config = require('../../../utils/config.js');
const app = getApp();
var appUrl = app.globalData.url;
var interval = null //倒计时函数
Component({
  /**
   * 组件的属性列表
   */
  properties: {

  },

  /**
   * 组件的初始数据
   */
  data: {
    nickname:"",
    mobile: "",
    code: "",
    date: '请选择日期',
    fun_id: 2,
    time: '获取验证码', //倒计时 
    currentTime: 60
  },

  /**
   * 组件的方法列表
   */
  methods: {
    getCode: function (options) {
      var that = this;
      var currentTime = that.data.currentTime
      interval = setInterval(function () {
        currentTime--;
        that.setData({
          time: currentTime + '秒'
        })
        if (currentTime <= 0) {
          clearInterval(interval)
          that.setData({
            time: '获取验证码',
            currentTime: 60,
            disabled: false
          })
        }
      }, 1000)
    },
    nickname: function (e) {
      console.log(e.detail.value)
      this.data.nickname = e.detail.value;
    },
    mobile: function (e) {
      console.log(e.detail.value)
      this.data.mobile = e.detail.value;
    },
    code: function (e) {
      console.log(e.detail.value)
      this.data.code = e.detail.value;
    },
    send_code: function () {
      console.log(this.data.mobile)
      config.request('POST', '/api/v1/send_code', {
        mobile: this.data.mobile
      }, (res) => {
        console.log(res)
      })
      this.getCode();
      var that = this
      that.setData({
        disabled: true
      })
    },
    ridersuc: function () {
      console.log(wx.getStorageSync('token'))
      wx.request({
        url: appUrl + '/api/v1/horseman',
        method: 'POST',
        header: {
          //请求头和ajax写法一样
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        data: {
          nickname:this.data.nickname,
          mobile: this.data.mobile,
          code: this.data.code
        },
        success: function (res) {
          console.log(res)
          if (res.data.code ==201 ) {
            wx.navigateTo({
              url: '../ridersuc/ridersuc',
            })
          }

        }
      });

    }
  }
})
