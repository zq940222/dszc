// pages/component/jppay/jppay.js
const config = require('../../../utils/config.js');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    isdialoge: false
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
   var that =this
    //接收下单送优惠券弹窗数据
    config.request('GET', '/api/v1/get_coupon/by_order', {
      //参数
    }, (res) => {
      console.log(res)
      var jp = res.data
      that.setData({
        jp: jp
      })
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
    
  },
  jpdetail: function () {
    wx.navigateTo({
      url: '../jpdetail/jpdetail',
    })
  }
})
