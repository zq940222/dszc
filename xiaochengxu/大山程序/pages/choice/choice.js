// pages/choice/choice.js
const config = require('../../utils/config.js');
const app = getApp();
var appUrl = app.globalData.url;
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

    //请求分类数据
    config.request('GET', '/api/v1/goods/category', {
      //参数
    }, (res) => {
      var flarr=res.data
      this.setData({
        flarr: flarr
      })
      //console.log(flarr)
     })



    //  请求列表数据
    config.request('GET', '/api/v1/goods/recommend', {
      //参数
    }, (res) => {
      // console.log(res)
      var data = res.data.data
      var current_page = res.data.current_page
      this.setData({
        arr: data,
        current_page: current_page
      })
      //console.log(this.data.arr)
      //成功函数回调区间，必写
    })



  },
  //下拉刷新
  // onPullDownRefresh: function () {
  //   console.log('1')
  //   // 显示顶部刷新图标
  //   wx.showNavigationBarLoading();
  //   config.request('GET', '/api/v1/goods/recommend', {
  //     //参数
  //   }, (res) => {
  //     var data = res.data.data
  //     this.setData({
  //       arr: data
  //     })
  //     console.log(this.data.arr)
     
  //     }, (res) => {
  //       //可写可不写，写即为失败回调
  //     }, (res) => {

  //       // 隐藏导航栏加载框
  //       wx.hideNavigationBarLoading();
  //       // 停止下拉动作
  //       wx.stopPullDownRefresh();

  //     })
   
  // },

  /**
     * 页面上拉触底事件的处理函数
     */
  onReachBottom: function () {
    
    var that = this;
    // 显示加载图标
    wx.showLoading({
      title: '玩命加载中',
    })
    // 页数+1
    var page = this.data.current_page + 1;
    that.setData({
      current_page:page
    })
    wx.request({
      url: appUrl+'/api/v1/goods/recommend?page=' + page,
      method: "GET",
      // 请求头部
      header: {
        'content-type': 'application/json',
        'token': wx.getStorageSync('token')
      },
      success: function (res) {
        // console.log(res)
        // 回调函数
          var arr = that.data.arr
          for (var i = 0; i < res.data.data.length; i++) {
            arr.push(res.data.data[i]);
          }
          // 设置数据
          that.setData({
            arr: that.data.arr
          })
        // 隐藏加载框
        wx.hideLoading();
     
      }
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
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  },
  suo:function (e) {
    wx.navigateTo({
      url: '../component/search/search',
    })
  },
  ingenuity:function (e) {
    console.log(e)
    var id = e.currentTarget.dataset.id
    wx.navigateTo({
      url: '../component/ingenuity/ingenuity?id=' +id,
    })
  },
  skipxq: function (e) {
    var id = e.currentTarget.dataset.id
    wx.navigateTo({
      url: '../component/xqlist/xqlist?id='+id,
    })
  }
})