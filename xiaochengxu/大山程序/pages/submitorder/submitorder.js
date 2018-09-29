// pages/submitorder/submitorder.js
const config = require('../../utils/config.js');
var order_address={}
const app = getApp();
var appUrl = app.globalData.url;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    coupon_id:"0",//优惠券ID
    prices:'',
    order_address:"",//地址
    coupon_price: '',//优惠券价格
    order_total: ""//最终价格
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    config.request('GET', '/api/v1/address', {
      //参数
    }, (res) => {
      //console.log(res)
      var jpaddress = res.data
      var len = jpaddress.length
      order_address["consignee"] = jpaddress[0].consignee
      var mobile = jpaddress[0].mobile
      order_address["id"] = jpaddress[0].id
      order_address["mobile"] = mobile.substr(0, 3) + "****" + mobile.substr(7)
      // order_address["mobile"] = jpaddress[0].mobile
      // var str2 = str.substr(0, 3) + "****" + str.substr(7)
      var city = jpaddress[0].city
      order_address["citys"] = city.join(" ")
      order_address["detai"] = jpaddress[0].detail
      this.setData({
        len: len,
        order_address: order_address
      })
      console.log(this.data.order_address)
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
    var arr = wx.getStorageSync('goodslist')
    var totals = wx.getStorageSync('totals')
    totals = totals.toFixed(2)
    this.setData({
      array: arr,
      total: totals
    })
    this.data.array.forEach(function (el, index) {
      //console.log(el)
    })
    console.log(this.data.array)
    var order_total = this.data.total - this.data.coupon_price
    var order_total = order_total.toFixed(2)
    this.setData({
      order_total: order_total
    })
    //设置最终价格缓存
    wx.setStorageSync("order_total", order_total)
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
  paycomplete:function(){
    var that=this
    var products = []
    var address_id = this.data.order_address.id
    var array = this.data.array
    for (let i = 0; i < array.length; i++) {
      // console.log(jporder[i].key)
      var id = Number(array[i].id)
      if (id) {
        var obj = {};
        obj.product_id = id;
        obj.key = ' ';
        obj.count = array[i].num;
        products.push(obj);
        // console.log(obj)
      }

    }
    //console.log(products)
    // 向后台传递下单数据
    wx.request({
      url: appUrl + '/api/v1/dish_order/place',
      method: 'POST',
      header: {
        //请求头和ajax写法一样
        'content-type': 'application/json',
        'token': wx.getStorageSync('token')
      },
      data: {
        address_id: address_id,
        "coupon_id": this.data.coupon_id,
        "products": products
      },
      success: function (res) {
        console.log(res)
        var id = res.data.order_id
        that.setData({
          zcid:id
        })
        wx.request({
          url: appUrl + '/api/v1/pay/dish_order',
          method: 'POST',
          header: {
            //请求头和ajax写法一样
            'content-type': 'application/json',
            'token': wx.getStorageSync('token')
          },
          data: {
            id: id
          },
          success: function (res) {
            var preData = res.data;
            console.log(preData);
            wx.requestPayment({
              timeStamp: preData.timeStamp.toString(),
              nonceStr: preData.nonceStr,
              package: preData.package,
              signType: preData.signType,
              paySign: preData.paySign,
                'success': function (res) { 
                  var id = that.data.zcid
                  wx.navigateTo({
                    url: '../component/paycomplete/paycomplete?id='+id,
                  })
                },
                'fail': function (res) { 
                   wx.navigateBack({
                     delta:1
                   })
                },
                'complete': function (res) {

                 }
              })
          }
        });
      }
    });
    // wx.navigateTo({
    //   url: '../component/paycomplete/paycomplete',
    // })
  },
  armanage: function () {
    wx.navigateTo({
      url: '../component/armanage/armanage',
    })
  },
  coupon: function () {
    var id = "1"
    wx.navigateTo({
      url: '../component/mycoupon/mycoupon?coupon_id=' + id,
    })
  }
})