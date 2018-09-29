// pages/component/myaddress/myaddress.js
const app = getApp();
var appUrl = app.globalData.url;
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
    region: ["", "", ""],
    check:false
  },

  /**
   * 组件的方法列表
   */
  methods: {
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
      console.log(wx.getStorageSync('token'))
      //console.log(this.data.region)
      wx.request({
        url: appUrl + '/api/v1/address',
        method: 'POST',
        header: {
          //请求头和ajax写法一样
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        data: {
          check:this.data.check,
          consignee: this.data.consignee,
          mobile: this.data.mobile,
          city: this.data.region,
          detail:this.data.address
        },
        success: function (res) {
           console.log("1",res)
          if(res.data.code==201){
            wx.navigateTo({
              url: '../armanage/armanage',
            })
          }
        }
      });
      
        
      
    }
  }
})
