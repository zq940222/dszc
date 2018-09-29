// pages/component/xqlist/xqlist.js
const config = require('../../../utils/config.js');
var selectIndexArray = [
];//选择属性名字的数组
var selectAttrid = [];//选择的属性id
var catrarray = []//存储购物车数据
Page({

  /**
   * 页面的初始数据
   */
  data: {
    isdialoge: true,
    num: 1,
    imgUrls: [],
    autoplay: true,
    interval: 5000,
    duration: 1000,
    beforeColor: "rgba(255,255,255,0.3)",//指示点颜色
    afterColor: "#ffc836",//当前选中的指示点颜色
    selectName: "", //已选的属性名字
    selectAttrid: [], //选择的属性id
    bhprice:"",
    obj: {},
    catrarray_len:"",
    check:true
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onShow: function (options) {
    var catrarray_arr = wx.getStorageSync("catrarray")
    var catrarray_len = catrarray_arr.length
    this.setData({
      catrarray_len: catrarray_len
    })
    //请求整体数据
    var id=this.options.id
    this.setData({
      id:id
    })
    //console.log(id)
    config.request('GET', '/api/v1/goods/'+id, {
      //参数
    }, (res) => {
     var data=res.data
     var xq_id=res.data.id
     this.setData({
       data:data,
       xq_id:xq_id
     })
      console.log(this.data.data)
      this.init_attr();
    })
    
    //请求评论数据
    var id = this.options.id
    //console.log(id)
    config.request('GET', '/api/v1/goods/comment/' + id, {
      //参数
    }, (res) => {
      var comment = res.data.data
      var ontime= res.data.data[0].createtime
      Date.prototype.toLocaleString = function () {
        return this.getFullYear() + "年" + (this.getMonth() + 1) + "月" + this.getDate() + "日 " + this.getHours() + "点" + this.getMinutes() + "分" + this.getSeconds() + "秒";
      };
      var ontime = new Date(parseInt(res.data.data[0].createtime) * 1000).toLocaleString().replace(/:\d{1,2}$/, ' '); 

      this.setData({
        ontime:ontime,
        comment: comment
      })
      //console.log(this.data.comment)
    })
  
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    
  },

  /**
   * 生命周期函数--监听页面显示
   */
  // onShow: function () {
  //   console.log(1)
  //   this.init_attr();
  // },

 

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
  preventTouchMove:function(){},
  jpgwc: function () {
    var selectAttrid = []
    // console.log(selectAttrid)
    this.setData({
      selectAttrid: []
    });
   // console.log(this.data.selectAttrid)
    wx.navigateTo({
      url: '../jpgwc/jpgwc',
    })
  },
  preventTouchMove: function (e) {

  },
  skipcomment: function (e) {
    var xq_id=this.data.xq_id
    wx.navigateTo({
      url: '../comment/comment?xq_id=' + xq_id,
    })
  },
  skippopup: function () {
    this.setData({
      isdialoge: false
    })
  },
  skipcancle: function () {
    this.setData({
      isdialoge: true
    })
  },
  add: function () {
    var num1 = this.data.num + 1
    this.data.obj["num"]=num1
    this.setData({
      num: num1,
      obj:this.data.obj
    })
  },
  reduce: function (e) {
    var num1 = this.data.num - 1
    this.data.obj["num"] = num1
    this.setData({
      num: num1,
      obj: this.data.obj
    })
    var reducenum = this.data.num
    console.log(reducenum)
    if (reducenum < 1) {
      this.setData({
        num: 1,
        isdialoge: true
      })
    }
  },
  ruler:function(e){
   // console.log("1",this.data.obj)
    var selectAttrid1 = this.data.selectAttrid1
    var selectAttrid = selectAttrid1.split(",")
    var that= this;
    var index =e.currentTarget.dataset.index
    var indextwo = e.currentTarget.dataset.indextwo
    var rulerdata = this.data.data
    var spec = rulerdata.spec
    var name = spec[index].item[indextwo].name; //点击属性的名称
    var attrid = spec[index].item[indextwo].id;//点击属性的id
     var count = spec[index].item.length
     for(var i=0;i<count;i++){
       spec[index].item[i].isselect=99999   
     }
        spec[index].item[indextwo].isselect = indextwo
   
    var selectName = "";
    var selectid = "";
    var data = this.data.data;
    var dataprice = data.spec_goods_price
    selectIndexArray[index].value = name;
    selectAttrid[index] = attrid;
    var selectIndexArraySize = selectIndexArray.length;
    //将数组的所有属性名拼接起来
    for (var i = 0; i < selectIndexArraySize; i++) {
      selectName +=selectIndexArray[i].value+" ";
    }
    //console.log(selectName)
    //字符串截取
    var selectName1 = selectName.split(" ")
    //console.log(selectName1, selectAttrid);
    var selectName2 = selectName1.splice(0, 2)
    //console.log(selectName2, selectAttrid);
    var selectName = selectName2.join()
     //console.log(selectName, selectAttrid);
    var selectAttrid1 = selectAttrid.splice(0, 2).join()
    dataprice.forEach(function (el, index) {
      // console.log(selectAttrid1, el.key)
      if (el.key == selectAttrid1) {
        that.setData({
          bhprice: el.price
        })
        // console.log(el.price)
      
        that.data.obj["check"] = that.data.check;
        that.data.obj["key"] = selectAttrid1;
        that.data.obj["id"] = that.data.id;
        that.data.obj["bhprice"] = el.price;
        that.data.obj["selectName"] = selectName;
        that.data.obj["num"] = that.data.num;
        that.data.obj["image"] = data.cover_image;
        that.data.obj["name"] = data.name;
      }
    })
    //console.log(that.data.obj)
    this.setData({
      data: rulerdata,
      selectName: selectName,
      selectAttrid: selectAttrid,
      obj: that.data.obj
    })
         
  },
  init_attr: function () {
    var that=this;
    //初始化规格选择
    var name = "";
    var id = [];
    
    var data = this.data.data;
    var dataprice = data.spec_goods_price
    // console.log(data)
    var spec=data.spec
    var size = spec.length;
    for (var i =
      0; i < size; i++) {
      selectIndexArray.push({
        key: i,
        value: spec[i].item[0].name
      });
      selectAttrid.push(spec[i].item[0].id)
      name +=selectIndexArray[i].value+" ";
    }
    var selectName = this.data.selectName;
    selectName = name;
    this.setData({
      selectName: selectName,
      selectAttrid: selectAttrid
    });
     console.log(selectAttrid)
    var selectAttrid1 = selectAttrid.splice(0,2).join()
    this.setData({
      selectAttrid1: selectAttrid1
    })
    //console.log(selectAttrid1)
    dataprice.forEach(function(el,index){
      
      if (el.key == selectAttrid1){
        that.setData({
          bhprice : el.price
        })
        
        // console.log(el.price)
        that.data.obj["check"] = that.data.check;
        that.data.obj["key"] = selectAttrid1;
        that.data.obj["id"] = that.data.id;
        that.data.obj["bhprice"] = el.price;
        that.data.obj["selectName"] = selectName;
        that.data.obj["num"] = that.data.num;
        that.data.obj["image"] = data.cover_image;
        that.data.obj["name"] = data.name;
      }
    })
    that.setData({
      obj: that.data.obj
    })
     //console.log(that.data.obj)
    
  },
  addcart:function(){
    console.log(this.data.data.freight)
    this.data.obj["freight"] = this.data.data.freight;
    if (catrarray.length > 0) {
      var that=this;
     var flag="";
      flag =  catrarray.every(function (el, index) {  
          return el.id != that.data.obj.id || el.key != that.data.obj.key 
      })
      if (flag) {
        catrarray.push(that.data.obj)
      }else{
        console.log("123")
      }
    } else {
      catrarray.push(this.data.obj)
    }
    var catrarray_len = catrarray.length
    this.setData({
      catrarray_len: catrarray_len
    })
    console.log(this.data.catrarray_len)
    var obj=this.data.obj
    wx.setStorageSync("addcart", obj)
    wx.setStorageSync("catrarray", catrarray)
    var addcart = wx.getStorageSync("addcart")
    this.setData({
      obj:addcart
    })
    //console.log(this.data.obj)
  },
  /**
  * 生命周期函数--监听页面隐藏
  */
  onUnload: function () {
   this.data.selectName=""
    var selectAttrid = []
    // console.log(selectAttrid)
    this.setData({
      selectAttrid: [],
    });
    
  }
})