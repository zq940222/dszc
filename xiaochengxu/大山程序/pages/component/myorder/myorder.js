// pages/component/myorder/myorder.js
const config = require('../../../utils/config.js');
const app = getApp();
var appUrl = app.globalData.url;
var tabs = [
  {
    name: "早餐订单",
    id:"1"
  },
  {
    name: "精选订单",
    id:"2"
  }
];
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
    tabs: tabs,     //展示的数据
    slideOffset:0,//指示器每次移动的距离
    activeIndex: 0,//当前展示的Tab项索引
    sliderWidth: 48,//指示器的宽度,计算得到
    contentHeight: 0//页面除去头部Tabbar后，内容区的总高度，计算得到
  },
  ready: function () {
    var that = this
    that.onload(that)
  },

  /**
   * 组件的方法列表
   */
  methods: {
    onload: function (that) {
      var that= this
      wx.getSystemInfo({
        success: function (res) {
          that.setData({
            //计算相关宽度
            sliderWidth: res.windowWidth / that.data.tabs.length * 2,
            sliderOffset: res.windowWidth / that.data.tabs.length * that.data.activeIndex,
            contentHeight: res.windowHeight - res.windowWidth / 750 * 18//计算内容区高度，rpx -> px计算
          });
        }
      });
    },
    zcxq:function(e){
      console.log(e)
      var id = e.currentTarget.dataset.id
      wx.navigateTo({
        url: '../zcpay/zcpay?id='+id,
      })
    },//早餐待支付
    zccomplete:function(e){
      var id = e.currentTarget.dataset.id
      wx.navigateTo({
        url: '../zccomplete/zccomplete?id='+id,
      })
    },//早餐完成
    extract:function(e){
      var id = e.currentTarget.dataset.id
      wx.navigateTo({
        url: '../extract/extract?id='+id,
      })
    },//早餐待提取
    jxpay:function(e){
      var id = e.currentTarget.dataset.id
      wx.navigateTo({
        url: '../jxpay/jxpay?id='+id,
      })
    },//精选待支付
    jxdfh: function (e) {
      var id = e.currentTarget.dataset.id
      wx.navigateTo({
        url: '../jxdfh/jxdfh?id=' + id,
      })
    },//精选待发货
    jxdsh: function (e) {
      var id = e.currentTarget.dataset.id
      wx.navigateTo({
        url: '../jxdsh/jxdsh?id=' + id,
      })
    },//精选待收货
    jxdpj: function (e) {
      var id = e.currentTarget.dataset.id
      wx.navigateTo({
        url: '../jxdpj/jxdpj?id=' + id,
      })
    },//精选待评价
    jxcomplete:function(e){
      var id = e.currentTarget.dataset.id
      wx.navigateTo({
        url: '../jxcomplete/jxcomplete?id='+id,
      })
    },//精选待提取
    onShow: function (options) {
      var that = this;
     
      //获取早餐列表
      config.request('GET', '/api/v1/order/dish', {
        //参数
      }, (res) => {
        console.log(res)
        var data = res.data.data
        var current_page = res.data.current_page
        Date.prototype.toLocaleString = function () {
          return this.getFullYear() + "/" + (this.getMonth() + 1) + "/" + this.getDate() + "/ " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
        };
        this.setData({
          zcarr: data,
          current_page: current_page
        })
        this.data.zcarr.forEach(function(el,index){
          el.len = el.item.length
          el.ontime = new Date(parseInt(res.data.data[index].createtime) * 1000).toLocaleString().replace(/:\d{1,2}$/, ' ');
          that.setData({
            zcarr:that.data.zcarr
          })
        })
      })
      //获取精选列表
      config.request('GET', '/api/v1/order/handpick', {
        //参数
      }, (res) => {
        console.log(res)
        var datas = res.data.data
        var current_pages = res.data.current_page
        Date.prototype.toLocaleString = function () {
          return this.getFullYear() + "/" + (this.getMonth() + 1) + "/" + this.getDate() + "/ " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
        };
        this.setData({
          jparr: datas,
          current_pages: current_pages
        })
        this.data.jparr.forEach(function (el, index) {
          el.len = el.item.length
          el.ontime = new Date(parseInt(res.data.data[index].createtime) * 1000).toLocaleString().replace(/:\d{1,2}$/, ' ');
          that.setData({
            jparr: that.data.jparr
          })
        })
      })
    },
    bindChange: function (e) {
      console.log(this.data.tabs.length)
      var current = e.detail.current;
      this.setData({
        activeIndex: current,
        sliderOffset: this.data.sliderWidth * current
      });
      console.log("bindChange:" + current);
    },

    navTabClick: function (e) {
      //console.log(e)
      this.setData({
        sliderOffset: e.currentTarget.offsetLeft,
        activeIndex: e.currentTarget.id
      });
      console.log("navTabClick:" + e.currentTarget.id);
      console.log(this.data.activeIndex)
    },
    onReachBottom: function () {

      var that = this;
      // 显示加载图标
      wx.showLoading({
        title: '玩命加载中',
      })
      // 页数+1
      console.log(this.data.activeIndex)
      if (this.data.activeIndex==0){
        var page = this.data.current_page + 1;
        that.setData({
          current_page: page
        })
        wx.request({
          url: appUrl + '/api/v1/order/dish?page=' + page,
          method: "GET",
          // 请求头部
          header: {
            'content-type': 'application/json',
            'token': wx.getStorageSync('token')
          },
          success: function (res) {
            console.log("20",res)
            // 回调函数

            var zcarr = that.data.zcarr

            for (var i = 0; i < res.data.data.length; i++) {
              zcarr.push(res.data.data[i]);
            }
            Date.prototype.toLocaleString = function () {
              return this.getFullYear() + "/" + (this.getMonth() + 1) + "/" + this.getDate() + "/ " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
            };
            // 设置数据
            zcarr.forEach(function (el, index) {
              //console.log(el)
              el.len = el.item.length
              el.ontime = new Date(parseInt(that.data.zcarr[index].createtime) * 1000).toLocaleString().replace(/:\d{1,2}$/, ' ');
              that.setData({
                zcarr: that.data.zcarr
              })
            })
            // 隐藏加载框
            wx.hideLoading();

          },
          complete: function (res) {

          }
        })
      } else if (this.data.activeIndex == 1){
        var page = this.data.current_pages + 1;
        that.setData({
          current_pages: page
        })
        wx.request({
          url: appUrl + '/api/v1/order/handpick?page=' + page,
          method: "GET",
          // 请求头部
          header: {
            'content-type': 'application/json',
            'token': wx.getStorageSync('token')
          },
          success: function (res) {
            //console.log("20",res)
            // 回调函数

            var jparr = that.data.jparr

            for (var i = 0; i < res.data.data.length; i++) {
              jparr.push(res.data.data[i]);
            }
            Date.prototype.toLocaleString = function () {
              return this.getFullYear() + "/" + (this.getMonth() + 1) + "/" + this.getDate() + "/ " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
            };
            // 设置数据
            jparr.forEach(function (el, index) {
              //console.log(el)
              el.len = el.item.length
              el.ontime = new Date(parseInt(that.data.jparr[index].createtime) * 1000).toLocaleString().replace(/:\d{1,2}$/, ' ');
              that.setData({
                jparr: that.data.jparr
              })
            })
            // 隐藏加载框
            wx.hideLoading();

          },
          complete: function (res) {

          }
        })
      }
    },
    delectzc:function(e){
      var that = this
      console.log(e)
      var id = e.currentTarget.dataset.id
      wx.request({
        url: appUrl + '/api/v1/dish_order/'+id,
        method: 'DELETE',
        header: {
          //请求头和ajax写法一样
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        data: {
          id: id
        },
        success: function (res) {
          if (getCurrentPages().length != 0) {
            //刷新当前页面的数据
            getCurrentPages()[getCurrentPages().length - 1].onShow()
          }
        }
      });
    },//删除订单
    againzc:function(e){
      console.log(e)
      var id = e.currentTarget.dataset.id
      wx.navigateTo({
        url: '../zcsubmitorder/zcsubmitorder?id='+id,
      })
    }
  }
})
