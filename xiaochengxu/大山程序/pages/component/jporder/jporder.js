// pages/component/jporder/jporder.js
const config = require('../../../utils/config.js');
var order_address={};
const app = getApp();
var appUrl = app.globalData.url;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    coupon_id:"0",
    freight_total: "", //邮费
    order_address:"",//地址
    coupon_price:'',
    order_total:""//最终价格
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
    var that=this
    var jporder = wx.getStorageSync("jparray")
    var jptotal = wx.getStorageSync("jptotal")
    this.setData({
      jporder: jporder,
      jptotal: jptotal,
    })
    console.log(this.data.jporder, this.data.jptotal)
    //  获取邮费
    this.data.jporder.forEach(function (el, index) {
      that.data.freight_total = Number(el.freight) * Number(el.num) + Number(that.data.freight_total)
    })
    // console.log(that.data.freight_total)
    that.setData({
      freight_total: that.data.freight_total
    })
    console.log(this.data.jptotal,that.data.freight_total,this.data.coupon_price)
    var order_total = this.data.jptotal - that.data.freight_total - this.data.coupon_price
    var order_total = order_total.toFixed(2)
    this.setData({
      order_total:order_total
    })
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  this.setData({
      freight_total:0
    })
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
  onLoad: function () {
    var that=this
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
      //console.log(this.data.order_address)
    })

    
  },
  jppay: function () {
    var products=[]
    var address_id = this.data.order_address.id
    var jporder = this.data.jporder
    for (let i = 0; i < jporder.length;i++){
     // console.log(jporder[i].key)
      var id = Number(jporder[i].id)
      if(id){
        var obj = {};
        obj.product_id = id;
        obj.key = jporder[i].key;
        obj.count = jporder[i].num;
        products.push(obj);
       // console.log(obj)
    }
  
    }
    //console.log(products)
    // 向后台传递下单数据
    wx.request({
      url: appUrl + '/api/v1/goods_order/place',
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
        wx.setStorageSync("order_id", id)
        wx.request({
          url: appUrl + '/api/v1/pay/goods_order',
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
                  wx.navigateTo({
                    url: '../jppay/jppay',
                  })
                 },
                'fail': function (res) {
                  wx.navigateBack({
                    delta:1
                  })
                 },
                'complete': function (res) { }
              })
          }
        });
      }
    });
    
  },
  armanage:function(){
    wx.navigateTo({
      url: '../armanage/armanage',
    })
  },
  coupon:function(){
    var id = "2"
    wx.navigateTo({
      url: '../mycoupon/mycoupon?coupon_id='+id,
    })
  },
  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
    wx.removeStorageSync("jparray")
    //console.log(wx.getStorageSync("jparray"))
    var jporder=[];
    this.setData({
      jporder: []
    })
    //console.log(this.data.jporder)
  }
})

