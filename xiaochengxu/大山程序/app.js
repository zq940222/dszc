//app.js
import { Token } from 'utils/token.js';
App({
  onLaunch: function () {
    var token = new Token();
    token.verify();
    // 展示本地存储能力
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    // 登录
    // wx.login({
    //   success: res => {
    //     wx.request({
    //       url: 'http://ds.sharexwd.top/api/v1/token/user',
    //       method: 'post',
    //       header: {
    //         //请求头和ajax写法一样
    //         "Content-Type": "application/x-www-form-urlencoded"
    //       },
    //       data: {},
    //       success: function (res) {
    //         console.log(res)
    //       }
    //     });
    //     // config.request('post', '/api/v1/token/user', {
    //     //   //参数
    //     // }, (res) => {
    //     //   console.log(res)
    //     //   })
    //     // 发送 res.code 到后台换取 openId, sessionKey, unionId
    //   }
    // })


    // wx.checkSession({
    //   success: function () {
    //     //session 未过期，并且在本生命周期一直有效
    //   },
    //   fail: function () {
    //     //登录态过期
    //     wx.login() //重新登录
    //   }
    // })
    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
          wx.getUserInfo({
            success: res => {
             
              // 可以将 res 发送给后台解码出 unionId
              this.globalData.userInfo = res.userInfo

              // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
              // 所以此处加入 callback 以防止这种情况
              if (this.userInfoReadyCallback) {
                this.userInfoReadyCallback(res)
              }
            }
          })
        }
      }
    })
  },
  getUserInfo: function (cb) {
    var that = this;
    if (this.globalData.userInfo) {
      typeof cb == "function" && cb(this.globalData.userInfo)
    } else {
      //调用登录接口
      wx.login({
        success: function () {
          wx.getUserInfo({
            success: function (res) {
              console.log(res)
              that.globalData.userInfo = res.userInfo;
              typeof cb == "function" && cb(that.globalData.userInfo)
            }
          })
        }
      });
    }
  },
  globalData: {
    userInfo: null,
    url: 'https://ds.sharexwd.top',    
  }

})