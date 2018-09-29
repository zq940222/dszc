// pages/component/ingenuity/ingenuity.js
const config = require('../../../utils/config.js');
const app = getApp();
var appUrl = app.globalData.url;
var flagStatus = 'zonghe';
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
    newup: true,
    priceup: true,
    newdown: true,
    pricedown: true,
    active: true,
    newactive: false,
    priceactive: false,
     id:0,
     num:""
  },
  /**
   * 组件的方法列表
   */
  methods: {
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
      var num = options.id
      this.setData({
        num:num
      })
      //获取分类数据
      config.request('GET', '/api/v1/goods/list', {
        sort: 1, category_id:num
      }, (res) => {
        //console.log(res)
       var flarray = res.data.data;
       this.setData({
         flarray:flarray
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
      console.log(this.data.num)
      config.request('GET', '/api/v1/goods/list', {
        sort: 0, category_id:this.data.num
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
          sort: 3, category_id: this.data.num
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
            sort: 4, category_id: this.data.num
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
            sort: 3, category_id: this.data.num
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
          sort: 2, category_id: this.data.num
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
            sort: 1, category_id: this.data.num
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
            sort: 2, category_id: this.data.num
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
  }
})
