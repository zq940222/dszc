// pages/component/mycoupon/mycoupon.js
const config = require('../../../utils/config.js');
var obj = [];
var obj1 = [];
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
    var id = options.coupon_id
    var that = this
    this.setData({
      id: id
    })
    console.log()
    config.request('GET', '/api/v1/coupon/user', {
      //参数
    }, (res) => {
      console.log(res)
      var coupn = res.data
      console.log(coupn)
      this.setData({
        coupn: coupn
      })
      if (this.data.id == 1 || this.data.id == 2) {
        this.data.coupn.forEach(function (el, index) {
          if (el.type == that.data.id || el.type == 0) {
            obj.push(el)
          } else {
            obj1.push(el)
          }
        })
      } else {
        this.data.coupn.forEach(function (el, index) { 
            obj.push(el)
        })
      }
      if (this.data.id == 0){
        obj:coupn
      }
      this.setData({
        obj: obj,
        obj1: obj1,
      })
    })
    this.data.coupn = []
    var obj = []
    var obj1 = []
    this.setData({
      obj: [],
      obj1: [],
      coupn: []
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
  jporder:function(e){
    var coupon_price = e.currentTarget.dataset.coupon_price
    var coupon_id = e.currentTarget.dataset.coupon_id
    var pages = getCurrentPages()

    // var prevPage = pages[pages.length - 1]  //当前界面

    var prevPage = pages[pages.length - 2]  //上一个页面

    var that = this

    prevPage.setData({
      coupon_price: coupon_price,
      coupon_id: coupon_id
    })
    wx.navigateBack({
      delta:1
    })
  }
})