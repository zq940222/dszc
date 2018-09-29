// pages/first/first.js
Page({

  /**
   * 页面的初始数据
   */
  data: {

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

  },
  // 用户授权
  welcome: function (e) {
    if (!e.detail.userInfo) {
      wx.showToast({
        title: "您已拒绝微信授权,小程序将不能正常运行,请重新授权后，正常使用！",
        icon: "none",
        duration: 3000
      })
      return
    }
    wx.getUserInfo({
      success: function (res) {
        //授权跳到首页
        wx.switchTab({
          url: '../index/index',
        })
        if (res.userInfo) {
          wx.login({
            success: function (res) {
             
            }
          })
        }
      },
      fail:function(){
         // 未授权，跳转到授权页面
        wx.reLaunch({
          url: '/pages/first/first',
        })
      }
    })    
  }
})