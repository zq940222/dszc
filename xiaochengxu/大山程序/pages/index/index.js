//index.js
//获取应用实例
const app = getApp()
const config = require('../../utils/config.js');
var goodsarr = [];
var heights = [];
var totals = '';
var spec = [];
var selectIndex;//选择的大规格key
var attrIndex;//选择的小规格的key
var selectIndexArray = [
];//选择属性名字的数组
var selectAttrid = [];//选择的属性id
var tcobj = {}//套餐选好拼接的对象
Page({
  data: {
    selectName: "", //已选的属性名字
    selectAttrid: [], //选择的属性id
    scrollTopId: "",
    leftindex: 0,
    list: [],
    name: [],
    total: 0, //总金额
    // 左侧点击类样式
    scrollTop: 0,
    // 定义一个空数组，用来存放右侧滑栏中每一个商品分类的 Height
    motto: '大山早餐',
    isdialoge: true,
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    disabled: true,
    iscart: true, //购物车弹窗
    isdetail: false, //早餐详情弹窗
    issetmeal: false, //套餐弹窗
    imgsrc: "", //普通弹出图片路径
    tcimgsrc: "", //套餐弹出图片路径
    num: '', //数量
    arrlist: [], //添加购物车数组
    array: [], //获取购物车缓存
    title: "", //早餐弹窗标题
    content: "", //早餐弹窗内容
    price: "", //价格
    tcarr: [],
    selectName: "", //已选的属性名字
    selectAttrid: [], //选择的属性id
  },
  onLoad: function () {
    var that = this
    //请求套餐弹窗数据
    config.request('GET', '/api/v1/coupon_list/by_login', {
      //参数
    }, (res) => {
      console.log(res)
      if(res.data.length==0){
        that.setData({
          isdialoge:true
        })
      }else{
        var zc = res.data
        that.setData({
          zc: zc,
          isdialoge: false
        })
      }
    })
    //请求左右联动数据
    config.request('GET', '/api/v1/dish/category', {
      //参数
    }, (res) => {
      //console.log(res)
      this.data.name = res.data
      //console.log(this.data.name)
      this.setData({
        name: this.data.name
      })
      var query = wx.createSelectorQuery().in(this) //创建节点查询器 query
      for (let i = 0; i < this.data.name.length; i++) {
        //这段代码的意思是选择Id=scroll-item_的节点，获取节点位置信息的查询请求
        query.selectAll("#scroll-item_" + i).boundingClientRect((react) => {
          //console.log(query.selectAll("#scroll-item_" + i));
          //console.log(react)
          react.forEach((res) => {
            var top = res.top - 190;
            // 把所有项距离顶部的高度存到一个数组中
            heights.push(top)
          })
          heights = Array.from(new Set(heights));
        }).exec();
      }
    })
    
  },
  onShow:function(){
    
  },
  //右边的滚动左边的联动
  scroll: function (e) {
    var that = this
    // 实时获取距离顶部的距离
    let offsettop = e.detail.scrollTop;
    heights.forEach(function (val, index) {
      if (offsettop >= heights[index] && offsettop <= heights[index + 1] || (index + 1) == heights.length && offsettop >= heights[index]) {
        //判断属于那个区间，index+1 == heights.length 的时候是最下面的那个
        that.setData({
          leftindex: index,
        })
      }
    })
  },
  //点击左侧 tab ，右侧列表相应位置联动 置顶
  switchRightTab: function (e) {
    var id = e.target.dataset.index;
    this.setData({
      // 左侧点击类样式
      scrollTopId: "scroll-item_" + e.currentTarget.dataset.index,
      leftindex: id,
    })
  },
  cancle: function (e) {
    this.setData({
      isdialoge: true
    })
  },//关闭优惠券弹窗
  submitorder: function () {
    wx.navigateTo({
      url: '../submitorder/submitorder',
    })
  }, //跳转到提交订单页面
  setmealcolse: function () {
    this.setData({
      issetmeal: false
    })
    
  }, //关闭套餐弹窗
  detailpopup: function (e) {
    console.log(e)
    let id = e.currentTarget.dataset.id;
    this.setData({
      imgsrc: e.currentTarget.dataset.src,
      title: e.currentTarget.dataset.title,
      content: e.currentTarget.dataset.content,
      price: e.currentTarget.dataset.price,
      numnum: e.currentTarget.dataset.num,
      isdetail: true,
      id: id
    })
  }, //打开早餐详情弹窗
  detailpopup1: function (e) {
    //console.log(e)
    this.setData({
      tcimgsrc: e.currentTarget.dataset.src,
      title: e.currentTarget.dataset.title,
      content: e.currentTarget.dataset.content,
      price: e.currentTarget.dataset.price,
      numnum: e.currentTarget.dataset.num,
      id: e.currentTarget.dataset.id,
      issetmeal: true
    })
    var id = e.target.dataset.id;
    //请求套餐弹窗数据
    config.request('GET', '/api/v1/dish/detail/' + id, {
      //参数
    }, (res) => {
      //console.log(res)
      var tcarray=res
      var tcarr = res.data.spec
      this.setData({
        tcarray: tcarray,
        tcarr: tcarr
      })
      //console.log(this.data.tcarr)
      }, (res) => {}, (res) => { 
        selectIndexArray=[]
        this.init_attr()
      })
   
  }, //打开套餐详情弹窗
  detailcolse: function () {
    this.setData({
      isdetail: false
    })
  }, //关闭早餐详情弹窗
  gwcpopup: function (e) {
    this.setData({
      iscart: false,
    })
    // var array = wx.getStorageSync('cart')
    // console.log(array)

  }, //打开购物车弹窗
  gwcbck: function () { //点击蒙层
    this.setData({
      iscart: true
    })
  },
  tcadd:function(e){
    var total_num=this.data.number
    total_num = 0
    var index = e.currentTarget.dataset.index;
    var spec = this.data.tcarr;
    // ++
    spec.forEach(function(el,i){
      if(el.choose_num==2){
        el.spec_item[index].num++
      }
    })
    // 计算总数
    spec.forEach(function (el, i) {
      if (el.choose_num == 2) {
        el.spec_item.forEach(function(ele,idx){
          total_num += ele.num
        })
      }
    })
    //循环显示规格
    spec.forEach(function (el, i) {
      if (el.choose_num == 2) {
        el.spec_item.forEach(function (ele, idx) {
          if(ele.num>0){
            ele.isselect = 1
          }else{
            ele.isselect = 9999
          }
        })
      }
    })
    //重新渲染
    this.setData({
      tcarr: spec
    })
    this.setData({
      number: total_num
    })
    console.log(spec,total_num,index)
  },//套餐弹窗加
  tcminu:function(e){
    var total_num = this.data.number
    total_num = 0
    var index = e.currentTarget.dataset.index;
    var spec = this.data.tcarr;
    // --
    spec.forEach(function (el, i) {
      if (el.choose_num == 2) {
        el.spec_item[index].num--
      }
    })
    // 计算总数
    spec.forEach(function (el, i) {
      if (el.choose_num == 2) {
        el.spec_item.forEach(function (ele, idx) {
          total_num += ele.num
        })
      }
    })
    //循环显示规格
    spec.forEach(function (el, i) {
      if (el.choose_num == 2) {
        el.spec_item.forEach(function (ele, idx) {
          if (ele.num > 0) {
            ele.isselect = 1
          } else {
            ele.isselect = 9999
          }
        })
      }
    })
    //重新渲染
    this.setData({
      tcarr: spec
    })
    this.setData({
      number: total_num
    })
    console.log(spec, total_num, index)
  },//套餐弹窗减
  clickAttr: function (e) {
    var index = e.currentTarget.dataset.index;
    var indextwo = e.currentTarget.dataset.indextwo;
    var spec = this.data.tcarr;
    //console.log(spec)
    var count = spec[index].spec_item.length;
    //console.log(count); return;
      if (spec[index].choose_num==1){
        for (var i = 0; i < count; i++) {
          spec[index].spec_item[i].isselect = 99999999;
        }
        spec[index].spec_item[indextwo].isselect = indextwo;
      } else if (spec[index].choose_num == 2){
         spec[index].spec_item.forEach(function(el,index){
           if(el.num>0){
             el.isselect = 1;
           } else if (el.num = 0){
             el.isselect = 99999;
           }
         })
      }    
    var name = spec[index].spec_item[indextwo].name;//点击属性的名称
    console.log(name)
    var attrid = spec[index].spec_item[indextwo].id;
    var selectName ="";
    //点击过，修改属性
    selectIndexArray[index].value = name;
    //console.log(selectIndexArray)
    var selectIndexArraySize = selectIndexArray.length;
    spec.forEach(function (el, index) {
      //console.log(el)
      if (el.choose_num == 2) {
        el.spec_item.forEach(function(ele,idx){
          //console.log(ele)
        })
      }
    })
    this.setData({
      tcarr: spec
    })
    //将数组的所有属性名拼接起来
    for (var i =0; i < selectIndexArraySize; i++) {
      selectName += selectIndexArray[i].value +
        ',' + selectIndexArray[i].tcnum + ' ';
    }
    //console.log(selectName)
    var name1 = selectName.split(' ')
    var name2 = name1.pop()
    //console.log(name1)
    var name3 = []
    name1.forEach(function (ele, idx) {
      name3.push(ele.split(','))

    })
    name3.forEach(function (el, idx) {
      if (!(el[1] > 0)) {
        el.pop()
      }
    })
    var name = name3.join(' ')
    //console.log(name)
    selectName = name;
    this.setData({
      tcarr: spec,//变换选择框
      selectName: selectName,
      selectAttrid: selectAttrid
    });
    console.log(this.data.tcarr);
  },
  //初始化规格选择
  init_attr: function () {
    // //初始化规格选择
    var tcarray = this.data.tcarray
    //console.log(tcarray)
    var name = "";
    var spec = this.data.tcarr;
   // console.log(spec)
    var number = 0//判断消失出现加号
    spec.forEach(function (el, index) {
      if (el.choose_num == 2) {
        el.spec_item[0].num = 1
        el.spec_item[1].num = 1
        el.spec_item[1].isselect = 1
        el.spec_item[0].isselect = 1

        el.spec_item.forEach(function (ele, index) {
          //console.log(el)
          number += ele.num
        })
      } else if (el.choose_num == 1){
        el.spec_item[0].isselect = 1
      }
    })
    this.setData({
      tcarr: spec
    })
    this.setData({
      number: number
      })
    console.log("number:",this.data.number)
    spec.forEach(function (el, index) {
      if (el.choose_num == 2) {
        console.log(el.spec_item)
        el.spec_item.forEach(function(ele,idx){
         if(ele.num>0){
             selectIndexArray.push({
               value: ele.name,
               tcnum: ele.num
             });

             //selectAttrid.push(spec[i].spec_item[0].id)
            
           }
         
        })
       
      } else if (el.choose_num == 1){
          
          selectIndexArray.push({
            value: el.spec_item[0].name,
            tcnum: el.spec_item[0].num
          });

          //selectAttrid.push(spec[i].spec_item[0].id)
          
        
      }
      
     
    })
    selectIndexArray.forEach(function (e, i) {
      name += e.value + ',' + e.tcnum + ' ';
    })
    console.log(selectIndexArray)
    console.log(name)
    var selectName =this.data.selectName;
    var name1 = name.split(' ')
    var name2=name1.pop()
   // console.log(name1)
    var name3=[]
    name1.forEach(function(ele,idx){
        name3.push(ele.split(','))
      
    })
    name3.forEach(function(el,idx){
      if(!(el[1]>0)){
          el.pop()
      }
    })
    var name = name3.join(' ')
    //console.log(name)
    selectName = name;
    this.setData({
      selectName: selectName,
      selectAttrid: selectAttrid
    });
    console.log(this.data.tcarr)
  },
  numoperation(e) {
    // console.log(e)
    //console.log(this.data.name)
    // console.log(this.data.name[1].dish[0].num)
    var that = this;
    // 获取当前餐品的id
    var id = e.currentTarget.dataset.id;
    //console.log(id)
    // z暂时存储所选餐品
    var obj = {}
    // 判断是加还是减
    var method = e.currentTarget.dataset.method;
    if (method == 'add') {
      this.setData({
        issetmeal: false
      })
     //console.log(this.data.name)
      // 更改相应系列相应餐品的数量
      this.data.name.forEach(function (el, index) {
        that.data.name[index].dish.forEach(function (element, index) {
          //console.log(element.num)
          if (element.id == id) {
            element.num = Number(element.num) + 1
            // console.log(element.desc)
            obj['num'] = element.num;
            obj['id'] = element.id;
            obj['names'] = element.name;
            obj['price'] = element.price;
            obj['picture'] = element.dish_image;
            obj['desc'] = element.desc;
            that.setData({
              numnum: element.num
            })
          }
         // console.log(that.data.numnum)
        })
      })
    } else if (method == 'tcadd') {
      var selectIndexArray=[]
      var tcarray = this.data.tcarray
      //console.log(tcarray)
      var name = "";
      var spec = this.data.tcarr;
      console.log(spec)
      spec.forEach(function (el, index) {
        if (el.choose_num == 2) {
          //console.log(el.spec_item)
          el.spec_item.forEach(function (ele, idx) {
            if (ele.num > 0) {
              selectIndexArray.push({
                value: ele.name,
                tcnum: ele.num
              });

              //selectAttrid.push(spec[i].spec_item[0].id)
            }

          })

        } else if (el.choose_num == 1) {

          el.spec_item.forEach(function (ele, idx) {
            if (ele.isselect == 1) {
              selectIndexArray.push({
                value: ele.name,
                tcnum: ele.num
              });

              //selectAttrid.push(spec[i].spec_item[0].id)
            }

          })

          //selectAttrid.push(spec[i].spec_item[0].id)


        }


      })
      selectIndexArray.forEach(function (e, i) {
        name += e.value + ',' + e.tcnum + ' ';
      })
      //console.log(selectIndexArray)
      //console.log(name)
      var selectName = this.data.selectName;
      var name1 = name.split(' ')
      var name2 = name1.pop()
      // console.log(name1)
      var name3 = []
      name1.forEach(function (ele, idx) {
        name3.push(ele.split(','))

      })
      name3.forEach(function (el, idx) {
        if (!(el[1] > 0)) {
          el.pop()
        }
      })
      var name = name3.join(' ')
      //console.log(name)
      selectName = name;
      this.setData({
        selectName: selectName,
        selectAttrid: selectAttrid
      });
      this.setData({
        issetmeal: false
      })
      //console.log(this.data.name)
      // 更改相应系列相应餐品的数量
      //console.log(this.data.name)
      this.data.name.forEach(function (el, index) {
        that.data.name[index].dish.forEach(function (element, index) {
          //console.log(element.num)
          if (element.id == id) {
            element.num = Number(element.num) + 1
            // console.log(element.desc)
            obj['num'] = element.num;
            obj['id'] = element.id;
            obj['names'] = element.name;
            obj['price'] = element.price;
            obj['picture'] = element.dish_image;
            obj['desc'] = that.data.selectName;
            that.setData({
              numnum: element.num
            })
          }
          // console.log(that.data.numnum)
        })
      })
    } else if (method == 'minu') {
      this.data.name.forEach(function (el, index) {
        el.dish.forEach(function (element, index) {
        
          if (element.id == id) {
            element.num = Number(element.num) - 1;
            obj['num'] = element.num;
            obj['id'] = element.id;
            obj['names'] = element.name;
            obj['price'] = element.price;
            obj['picture'] = element.dish_image;
            obj['desc'] = element.desc;
            that.setData({
              numnum: element.num
            })
          }
        })
      })
    } else if (method == 'tcadd') {
     
    } 
    this.setData({
      name: that.data.name
    })
    if (goodsarr.length > 0) {
      // 判断该餐品是否被点过（true未被点过）
      var flag = goodsarr.every(function (element, index) {
        return element.id != id
      })
      if (flag) {
        goodsarr.push(obj)
      } else {
        goodsarr.forEach(function (element, index) {
          if (element.id == id) {
            goodsarr[index] = obj
          }

        })
      }
    } else {
      goodsarr.push(obj)
    }
    //console.log(obj)
    // 存储所选餐品
    // wx.removeStorageSync('goodslist')
    goodsarr.forEach(function (element, index) {
      if (element.num <= 0) {
        goodsarr.splice(index, 1)
      }
    })
    // 
    var total = 0;
    for (let k = 0; k < goodsarr.length; k++) {
      total += goodsarr[k].num * goodsarr[k].price;
    }
    this.setData({
      total: total.toFixed(2)
    })
    wx.setStorageSync('totals', total)
    wx.setStorageSync('goodslist', goodsarr)
    this.setData({
      array: wx.getStorageSync('goodslist')
    })
  },
  preventTouchMove: function (e) {

  }
})