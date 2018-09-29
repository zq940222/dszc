// pages/component/swiper/swiper.js
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
    imgUrls: [],
    autoplay: true,
    interval: 5000,
    duration: 1000,
    beforeColor: "rgba(255,255,255,0.3)",//指示点颜色
    afterColor: "#ffc836"//当前选中的指示点颜色
  },
  ready:function(){
    var that= this
    this.onLoad(that)
  },
  /**
   * 组件的方法列表
   */
  methods: {
    onLoad: function (that){      
      config.request('GET', '/api/v1/banner/1', {
        //参数
      }, (res) => {
        var imgUrls = res.data.items
       that.setData({
         imgUrls:imgUrls
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
