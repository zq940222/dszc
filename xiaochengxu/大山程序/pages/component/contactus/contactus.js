// pages/component/contactus/contactus.js
const config = require('../../../utils/config.js');
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

  },

  /**
   * 组件的方法列表
   */
  methods: {
    onLoad: function () {
      config.request('GET', '/api/v1/customer_service', {
        //参数
      }, (res) => {
        console.log(res.data.customer_service)
        this.setData({
          customer_service: res.data.customer_service
        })
        
      })
    },
   tel:function(event){
     console.log(event)
     wx.makePhoneCall({
       phoneNumber: '0571-88388925',
     })
   }
  }
})
