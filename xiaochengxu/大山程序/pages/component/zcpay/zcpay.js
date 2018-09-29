// pages/component/zcpay/zcpay.js
const config = require('../../../utils/config.js');
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
      var id = options.id
    config.request('GET', '/api/v1/dish_order/'+id, {
      //参数
    }, (res) => {
      var id= res.data.id
      this.setData({
        id:id
      })
      Date.prototype.toLocaleString = function () {
        return this.getFullYear() + "/" + (this.getMonth() + 1) + "/" + this.getDate() + "/ " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
      };
      var ontime = new Date(parseInt(res.data.createtime) * 1000).toLocaleString().replace(/:\d{1,2}$/, ' ');
      var zcarr = res.data
      console.log(zcarr)
      this.setData({
        zcarr:zcarr,
        ontime:ontime
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
  zcpay:function(){
    var id = this.data.id
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
            'success': function () {
              wx.navigateTo({
                url: '../component/myorder/myorder',
              })
            },
            'fail': function (res) {
              wx.navigateBack({
                delta: 1
              })
            },
            'complete': function (res) {

            }
          })
      }
    });
  }
})