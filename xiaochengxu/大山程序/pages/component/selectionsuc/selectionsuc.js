// pages/component/selectionsuc/selectionsuc.js
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
      config.request('GET', '/api/v1/handpick', {
        //参数
      }, (res) => {
       console.log(res)
        this.setData({
          nickname: res.data.nickname,
          mobile: res.data.mobile,
          address: res.data.address,
          company_name: res.data.company_name,
          goods_name: res.data.goods_name,
          goods_intro: res.data.goods_intro,
          goods_images: res.data.goods_images,
        })
        //成功函数回调区间，必写
      })
    }
  }
})
