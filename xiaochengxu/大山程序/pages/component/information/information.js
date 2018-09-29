// pages/component/information/information.js
const config = require('../../../utils/config.js');
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
    birthday:'',
    mobile:''

  },
  // ready: function () {
  //   var that = this
  //   this.onLoad(that)
  // },
  /**
   * 组件的方法列表
   */
  methods: {
    onLoad: function () {
      //console.log(wx.getStorageSync('token'))
      var that=this
      wx.request({
        url: appUrl + '/api/v1/my_info',
        method: 'GET',
        header: {
          //请求头和ajax写法一样
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        data:{},
        success: function (res){
           //console.log(res)
          var birthday = res.data.birthday
          var mobile = res.data.mobile
          that.setData({
            birthday: birthday,
            mobile: mobile
          })
          //console.log(that.data.birthday,that.data.mobile)
          // 判断是否有绑定过生日
          if (!that.data.birthday){
            that.setData({
              birthday:"未绑定"
            })
          }else{
            that.setData({
              birthday: birthday
            })
          }
          // 判断是否有绑定过手机号
          if (that.data.mobile=="") {
            that.setData({
              mobile: "未绑定"
            })
          } else {
            that.setData({
              mobile: mobile
            })
          }

        }
      });
    },
    // 点击生日日期组件确定事件 
    bindDateChange: function (e) {
      //console.log(e.detail.value)
      // var datas = e.detail.value
      this.setData({
        birthday: e.detail.value
      })
      wx.request({
        url: appUrl + '/api/v1/birthday',
        method: 'PUT',
        header: {
          //请求头和ajax写法一样
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        data: {birthday: this.data.birthday},
        success: function (res) {
          console.log(res)

        }
      });
    },
    bdphone:function(){
      if(this.data.mobile == "未绑定"){
        wx.navigateTo({
          url: '../bdphone/bdphone',
        })
      }
       
    },
    myaddress:function(){
      config.request('GET', '/api/v1/address', {
      }, (res) => {
        var len= res.data.length
        if(len>0){
          wx.navigateTo({
            url: '../armanage/armanage'
          })
        }else{
          wx.navigateTo({
            url: '../myaddress/myaddress'
          })
        }
      })
      
    }
  }
})
