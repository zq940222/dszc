// pages/component/ridersuc/ridersuc.js
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
      config.request('GET', '/api/v1/horseman', {
        //参数
      }, (res) => {
        console.log(res)
      
        this.setData({
          nickname: res.data.nickname,
          mobile: res.data.mobile
        })
        //成功函数回调区间，必写
      }, (res) => {
        //可写可不写，写即为失败回调
      }, (res) => {
        //可写可不写，写即为不管失败或成功都进行回调
      })
    }
  }
})
