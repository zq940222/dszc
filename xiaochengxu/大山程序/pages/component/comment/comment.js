// pages/component/comment/comment.js
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

  },

  /**
   * 组件的方法列表
   */
  methods: {
   onLoad:function(options){
     //请求评论数据
     var id = options.xq_id
     //console.log(id)
     config.request('GET', '/api/v1/goods/comment/' + id, {
       //参数
     }, (res) => {
       console.log(res)
       var current_page = res.data.current_page
       var comment = res.data.data
       var ontime = res.data.data.createtime
       Date.prototype.toLocaleString = function () {
         return this.getFullYear() + "年" + (this.getMonth() + 1) + "月" + this.getDate() + "日 " + this.getHours() + "点" + this.getMinutes() + "分" + this.getSeconds() + "秒";
       };
       for(var i=0;i<comment.length;i++){
         var ontime = new Date(parseInt(res.data.data[i].createtime) * 1000).toLocaleString().replace(/:\d{1,2}$/, ' ');
       }

       this.setData({
         ontime: ontime,
         comment: comment,
         current_page:current_page,
         id: id
       })
       //console.log(this.data.comment)
     })
   },
    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function () {
      var id =this.data.id
      var that = this;
      // 显示加载图标
      wx.showLoading({
        title: '玩命加载中',
      })
      // 页数+1
      var page = this.data.current_page + 1;
      that.setData({
        current_page: page
      })
      wx.request({
        url: appUrl + '/api/v1/goods/comment/'+id+'&page='+page,
        method: "GET",
        // 请求头部
        header: {
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        success: function (res) {
           console.log(res)
          // 回调函数
          var arr = that.data.comment
          for (var i = 0; i < res.data.data.length; i++) {
            arr.push(res.data.data[i]);
          }
          // 设置数据
          that.setData({
            comment: arr
          })
          // 隐藏加载框
          wx.hideLoading();

        }
      })

    }
  }
})
