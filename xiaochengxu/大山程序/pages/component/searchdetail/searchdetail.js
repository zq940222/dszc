// pages/component/searchdetail/searchdetail.js
const config = require('../../../utils/config.js');
const app = getApp();
var appUrl = app.globalData.url;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    newup: true,
    priceup: true,
    newdown: true,
    pricedown: true,
    active: true,
    newactive: false,
    priceactive: false,
    id: 0,
    flag:true
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
      current_page: page
    })
    wx.request({
      url: appUrl + '/api/v1/goods/list?page=' + page,
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
  onLoad: function (options) {
    var value = options.value
    this.setData({
      value: value
    })
    //获取分类数据
    config.request('GET', '/api/v1/goods/list', {
      sort: 0, keywords: value
    }, (res) => {
      //console.log(res)
      var flarray = res.data.data;
      this.setData({
        flarray: flarray
      })
     
      //console.log(this.data.flarray)
      //成功函数回调区间，必写
    })
  },
  skipxq: function (e) {
    var id = e.currentTarget.dataset.id
    wx.navigateTo({
      url: '../xqlist/xqlist?id=' + id,
    })
  },
  searchValueInput: function (e) {
    console.log(e.detail.value)
    this.data.searchValueInput = e.detail.value;
  },
  suo:function(){
    config.request('GET', '/api/v1/goods/list', {
      sort: 0, keywords: this.data.searchValueInput
    }, (res) => {
      console.log(res)
      var flarray = res.data.data;
      this.setData({
        flarray: flarray
      })
      console.log(this.data.flarray.length)
      if (this.data.flarray.length<=0) {
            this.data.flag = false
      }
      //console.log(this.data.flarray)
      //成功函数回调区间，必写
    })
  },
  // 上架时间
  synthesize() {
    this.setData({
      newup: true,
      priceup: true,
      newdown: true,
      pricedown: true,
      active: true,
      newactive: false,
      priceactive: false
    })
    config.request('GET', '/api/v1/goods/list', {
      sort: 0, keywords: this.data.searchValueInput
    }, (res) => {
      console.log(res)
      var flarray = res.data.data;
      this.setData({
        flarray: flarray
      })
    })
  },
  newFun() {
    if (this.data.newactive == false) {
      this.setData({
        newup: false,
        newdown: true,
        priceup: true,
        active: false,
        newactive: true,
        priceactive: false
      })

      config.request('GET', '/api/v1/goods/list', {
        sort: 3, keywords: this.data.searchValueInput
      }, (res) => {
        console.log(res)
        var flarray = res.data.data;
        this.setData({
          flarray: flarray
        })
      })
    } else {
      if (this.data.newup == false) {
        this.setData({
          newup: true,
          newdown: false,
          priceup: true,
          active: false,
          newactive: true,
          priceactive: false
        })
        config.request('GET', '/api/v1/goods/list', {
          sort: 4, keywords: this.data.searchValueInput
        }, (res) => {
          console.log(res)
          var flarray = res.data.data;
          this.setData({
            flarray: flarray
          })
        })
      } else if (this.data.newdown == false) {
        this.setData({
          newup: false,
          newdown: true,
          priceup: true,
          active: false,
          newactive: true,
          priceactive: false
        })
        config.request('GET', '/api/v1/goods/list', {
          sort: 3, keywords: this.data.searchValueInput
        }, (res) => {
          console.log(res)
          var flarray = res.data.data;
          this.setData({
            flarray: flarray
          })
        })
      }

    }

  },
  priceFun() {
    if (this.data.priceactive == false) {
      this.setData({
        newup: true,
        newdown: true,
        priceup: false,
        pricedown: true,
        active: false,
        newactive: false,
        priceactive: true
      })
      config.request('GET', '/api/v1/goods/list', {
        sort: 2, keywords: this.data.searchValueInput
      }, (res) => {
        console.log(res)
        var flarray = res.data.data;
        this.setData({
          flarray: flarray
        })
      })
    } else {
      if (this.data.priceup == false) {
        this.setData({
          newup: true,
          newdown: true,
          priceup: true,
          pricedown: false,
          active: false,
          newactive: false,
          priceactive: true
        })
        config.request('GET', '/api/v1/goods/list', {
          sort: 1, keywords: this.data.searchValueInput
        }, (res) => {
          console.log(res)
          var flarray = res.data.data;
          this.setData({
            flarray: flarray
          })
        })
      } else if (this.data.pricedown == false) {
        this.setData({
          newup: true,
          newdown: true,
          priceup: false,
          pricedown: true,
          active: false,
          newactive: false,
          priceactive: true
        })
        config.request('GET', '/api/v1/goods/list', {
          sort: 2, keywords: this.data.searchValueInput
        }, (res) => {
          console.log(res)
          var flarray = res.data.data;
          this.setData({
            flarray: flarray
          })
        })
      }

    }
  }

})