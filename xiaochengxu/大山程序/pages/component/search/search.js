// pages/component/search/search.js
const config = require('../../../utils/config.js');
const app = getApp();
var appUrl = app.globalData.url;
var searchValue = ''
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
    centent_Show: true,
    searchValue: '',
    img: '',
    nanshen_card: ''
  },
  ready: function () {
    var that = this
    this.onLoad(that)
  },
  /**
   * 组件的方法列表
   */
  methods: {
    onLoad: function (that) {
      config.request('GET', '/api/v1/hot_search', {
        //参数
      }, (res) => {
        //console.log(res)
        var ssarr = res.data.name
        this.setData({
          ssarr: ssarr
        })
        //console.log(this.data.arr)
        //成功函数回调区间，必写
      }, (res) => {
        //可写可不写，写即为失败回调
      }, (res) => {
        //可写可不写，写即为不管失败或成功都进行回调
      })
    },
    searchValueInput: function (e) {
      console.log(e.detail.value)
      this.data.searchValueInput = e.detail.value;
    },
    suo: function (e) {
      var value = this.data.searchValueInput
      wx.navigateTo({
        url: '../searchdetail/searchdetail?value=' + value,
      })
    }

  }
})
