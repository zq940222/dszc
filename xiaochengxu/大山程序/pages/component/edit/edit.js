// pages/component/edit/edit.js
const app = getApp();
var appUrl = app.globalData.url;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    region: ["", "", ""],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this
  var address= wx.getStorageSync('address')
    var id = options.id
    console.log(id)
    this.setData({
      address:address,
      id:id
    })
    console.log(this.data.address)
   
    this.data.address.forEach(function(el,index){
      console.log(el)
      if(el.id==id){
        that.setData({
          consignee: el.consignee,
          detail: el.detail,
          region:el.city,
          mobile:el.mobile
        })
      }
    })
    console.log(this.data.detail)
    
  },
  consignee:function(e){
    console.log(e)
    e.detail.value = this.data.consignee

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
  consignee: function (e) {
    console.log(e.detail.value)
    this.data.consignee = e.detail.value;
  },
  mobile: function (e) {
    console.log(e.detail.value)
    this.data.mobile = e.detail.value;
  },
  changeRegin(e) {
    this.setData({ region: e.detail.value });
  },
  address: function (e) {
    console.log(e.detail.value)
    this.data.address = e.detail.value;
  },
  complete_address: function () {
    console.log(this.data.id)
    var id = this.data.id
    wx.request({
      url: appUrl + '/api/v1/address/'+id,
      method: 'PUT',
      header: {
        //请求头和ajax写法一样
        'content-type': 'application/json',
        'token': wx.getStorageSync('token')
      },
      data: {
        consignee: this.data.consignee,
        mobile: this.data.mobile,
        city: this.data.region,
        detail: this.data.address
      },
      success: function (res) {
        // console.log("1",res)
        if (res.data.code == 201) {
          wx.navigateTo({
            url: '../armanage/armanage',
          })
        }
      }
    });



  }
})