// pages/person/person.js
const config = require('../../utils/config.js');
const app = getApp();
var appUrl = app.globalData.url;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo')
  },
  skip1:function(e){
    wx.navigateTo({
      url: '../component/information/information',
    })
  },
  skip2: function (e) {
    wx.navigateTo({
      url: '../component/myorder/myorder',
    })
  },
  skip3: function (e) {
    var id="0"
    wx.navigateTo({
      url: '../component/mycoupon/mycoupon?coupon_id='+id,
    })
  },
  skip4: function (e) {
    wx.navigateTo({
      url: '../component/riderapplication/riderapplication',
    })
  },
  skip5: function (e) {
    wx.navigateTo({
      url: '../component/selectionapp/selectionapp',
    })
  },
  skip6: function (e) {
    wx.navigateTo({
      url: '../component/contactus/contactus',
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    
    var that = this
    //调用应用实例的方法获取全局数据
    app.getUserInfo(function (res) {
      console.log(res)
      var nickname = res.nickName
      var avatar = res.avatarUrl
      var gender = res.gender
      // 给后台传送用户信息
      wx.request({
        url: appUrl + '/api/v1/user_info',
        method: 'POST',
        header: {
          //请求头和ajax写法一样
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        data: {
          nickname: nickname,
          avatar: avatar,
          gender: gender
        },
        success: function (res) {
          // console.log(res)

        }
      });
        
    })
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