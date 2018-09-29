// pages/component/bdphone/bdphone.js
const config = require('../../../utils/config.js');
const app = getApp();
var appUrl = app.globalData.url;
var nickName = app.globalData.nickName;
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
    mobile:"",
    code:"",
    date: '请选择日期',
    fun_id: 2,
    time: '获取验证码', //倒计时 
    currentTime: 60,
    isdialoge:true,//弹窗
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
    complete_phone:function(){
     var that=this
      
      // 传送手机号和验证码接口
      wx.request({
        url: appUrl+'/api/v1/bing_mobile',
        method: 'POST',
        header: {
          //请求头和ajax写法一样
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        data: { 
                mobile: this.data.mobile,
                code: this.data.code 
                },
        success: function (res) {
          
          console.log(res)
          if(res.data.code==201){
            that.setData({
              isdialoge: false
            })
            //接收绑定手机号送优惠券弹窗数据
            config.request('GET', '/api/v1/get_coupon/by_bind_mobile', {
              //参数
            }, (res) => {
              console.log(res)
              var tc = res.data
              that.setData({
                tc: tc
              })
            })
            
          }
         
        }
      });
      

      
    },
    cancle: function (e) {
      this.setData({
        isdialoge: true
      })
      wx.navigateBack({
        delta:1
      })
    },//关闭优惠券弹窗
  }
})
