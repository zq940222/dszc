// pages/component/armanage/armanage.js
const config = require('../../../utils/config.js');
const app = getApp();
var appUrl = app.globalData.url;
var obj={};
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
    img:"../../../images/duoxuan_copy.jpg"
  },
  /**
   * 组件的方法列表
   */
  methods: {
    checkTap:function(e){
     // console.log(e)
      var address = this.data.address
      var idx = e.currentTarget.dataset.index
      var that=this
      this.data.address.forEach(function(el,index){
        el.is_default="0"
      })
      address[idx].is_default = false
      var id = address[idx].id
      console.log(address)
      that.setData({
        address: address
      })
      // 向后台传递默认ID
      wx.request({
        url: appUrl + '/api/v1/default_address/' + id,
        method: 'PUT',
        header: {
          //请求头和ajax写法一样
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        data: {
          id:id
        },
        success: function (res) {
          console.log(res)
        }
      });
    },
    onLoad:function(){
      config.request('GET', '/api/v1/address', {
        //参数
      }, (res) => {
         console.log(res)
        var address = res.data
        address.forEach(function(el,idx){
          el.mobile = el.mobile.substr(0, 3) + "****" + el.mobile.substr(7)
        })
        this.setData({
          address:address
        })
        // console.log(this.data.address)
        wx.setStorageSync('address',address)
      })
    },
    edit:function(e){
      console.log(e)
      var id = e.currentTarget.dataset.id
      wx.navigateTo({
        url: '../edit/edit?id='+id,
      })
    },
    delete:function(e){
      var that=this
      var id = e.currentTarget.dataset.id
      wx.request({
        url: appUrl + '/api/v1/address/' + id,
        method: 'DELETE',
        header: {
          //请求头和ajax写法一样
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        data: {},
        success: function (res) {
        
        

   
          config.request('GET', '/api/v1/address', {
            //参数
          }, (res) => {
            //  console.log(res)
            var address = res.data
            that.setData({  
              address: address
            })
            // console.log(this.data.address)
            wx.setStorageSync('address', address)
          })




        }
      });
    },
    myaddress:function(){
      wx.navigateTo({
        url: '../myaddress/myaddress',
      })
    },
    jporder:function(e){
      var address = this.data.address
      console.log(address)
      var idx = e.currentTarget.dataset.index
      obj["consignee"] = address[idx].consignee
      obj["mobile"] = address[idx].mobile
      obj["id"] = address[idx].id
      var city = address[idx].city
      obj["citys"]=city.join(" ")
      obj["detai"] = address[idx].detail
      wx.navigateBack({
         delta:1
      })

        var pages = getCurrentPages()

        // var prevPage = pages[pages.length - 1]  //当前界面

        var prevPage = pages[pages.length - 2]  //上一个页面

        var that = this

        prevPage.setData({
          order_address:obj
        })

      


    }
  }
})
