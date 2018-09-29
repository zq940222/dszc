// pages/component/scroll-view/scroll-view.js
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
    itemsid:"tty1",
    cart: [], //数据
    count: 1,   //商品数量默认是1
    total: 0,    //总金额
    goodsCount: 0, //数量
    disabled:true,
    iscart:true,//购物车弹窗
    isdetail:false,//早餐详情弹窗
    issetmeal:false//套餐弹窗
  },
  /**
   * 组件的方法列表
   */
  // onShow: function () {
  //   var that = this;
  //   // 获取产品展示页保存的缓存数据（购物车的缓存数组，没有数据，则赋予一个空数组）
  //   var arr = wx.getStorageSync('cart') || [];
  //   // 有数据的话，就遍历数据，计算总金额 和 总数量
  //   if (arr.length > 0) {
  //     for (var i in arr) {
  //       that.data.total += Number(arr[i].price) * Number(arr[i].count);
  //       that.data.goodsCount += Number(arr[i].count);
  //     }
  //     // 更新数据
  //     this.setData({
  //       iscart: true,
  //       cart: arr,
  //       total: that.data.total,
  //       goodsCount: that.data.goodsCount
  //     });
  //   }
  // },
  // onHide: function () {
  //   // 清除数据
  //   this.setData({
  //     iscart: false,
  //     cart: [], //数据
  //     total: 0,    //总金额
  //     goodsCount: 0 //数量
  //   });
  // },
  methods: {
    submitorder:function(){
      wx.navigateTo({
        url: '../component/submitorder/submitorder',
      })
    },//跳转到提交订单页面
    opensetmeal:function(){
      this.setData({
        issetmeal: true
      })
    },//打开套餐弹窗
    setmealcolse:function(){
       this.setData({
         issetmeal:false
       })
    },//关闭套餐弹窗
    detailpopup:function(){
      this.setData({
        isdetail: true
      })  
    },//打开早餐详情弹窗
    detailcolse:function(){
      this.setData({
        isdetail: false
      }) 
    },//关闭早餐详情弹窗
    gwcpopup:function(e){
      this.setData({
       iscart:false
      })  
    },//打开购物车弹窗
    tapname: function (e) {
       //console.log(e)

      var that = this
      let ind = e.currentTarget.dataset.index;
      this.data.menus.forEach(function (element, index) {
        element.active = false
        if (ind == index) {
          element.active = true
        }
      })
      this.setData({
        itemsid: e.target.id,
        menus: this.data.menus
      })      
    },
    addcart: function (e) {
      console.log(e)
      for (var i in this.data.goodslist) {
        // 列表中某一项item的id == 点击事件传递过来的id。则是被点击的项
        if (this.data.goodslist[i].id == e.target.id) {
          // 点击显示隐藏按钮（减，购物车）
          this.data.goodslist[i].isdisable=false;
          this.data.goodslist[i].num = parseInt(this.data.goodslist[i].num) + 1
          this.setData({
            disabled: false,
            goodslist:this.data.goodslist
          })
          // 给goodsList数组的当前项添加count元素，值为1，用于记录添加到购物车的数量
          this.data.goodslist[i].count = 1;
         
          // 获取购物车的缓存数组（没有数据，则赋予一个空数组）
          var arr = wx.getStorageSync('cart') || [];
          console.log(arr)
          // 如果购物车有数据
          if (arr.length > 0) {
            // 遍历购物车数组
            for (var j in arr) {
              // 判断购物车内的item的id，和事件传递过来的id，是否相等
              if (arr[j].id == e.target.id) {
                // 相等的话，给count+1（即再次添加入购物车，数量+1）
                arr[j].count = parseInt(arr[j].count) + 1;
                // 最后，把购物车数据，存放入缓存（此处不用再给购物车数组push元素进去，因为这个是购物车有的，直接更新当前数组即可）
                console.log(arr[j].count)
                try {
                  wx.setStorageSync('cart', arr)
                } catch (e) {
                  console.log(e)
                }
                // 返回（在if内使用return，跳出循环节约运算，节约性能）
                return;
              }
            }
            // 遍历完购物车后，没有对应的item项，把goodslist的当前项放入购物车数组
            arr.push(this.data.goodslist[i]);
          }
          // 购物车没有数据，把item项push放入当前数据（第一次存放时）
          else {
            arr.push(this.data.goodslist[i]);
          }
          // 最后，把购物车数据，存放入缓存
          try {
            wx.setStorageSync('cart', arr)
            // 返回（在if内使用return，跳出循环节约运算，节约性能）
            return;
          } catch (e) {
            console.log(e)
          }
        }
      }

    },
    redcart:function(e){
      //console.log(e)
      for (var i in this.data.goodslist) {
        // 列表中某一项item的id == 点击事件传递过来的id。则是被点击的项
        if (this.data.goodslist[i].id == e.target.id) {
          // 点击显示隐藏按钮（减，购物车）
          this.data.goodslist[i].num = parseInt(this.data.goodslist[i].num) - 1
          if (this.data.goodslist[i].num<1){
              this.data.goodslist[i].isdisable = true;
              this.setData({
                disabled: true,
                goodslist: this.data.goodslist
              })
            }
          }else{
            this.setData({
              goodslist: this.data.goodslist
            })
          } 
        }
      },
    gwcbck:function(){//点击蒙层
      this.setData({
        iscart: true
      })
    },
    preventTouchMove: function (e) { //蒙层后面禁止滑动

    },
    
    /* 购物车减数 */
    delCount: function (e) {
      console.log(e)
      // 获取购物车该商品的数量
      // [获取设置在该btn的id,即list的index值]
      if (this.data.cart[e.target.id.substring(3)].count <= 1) {
        return;
      }
      // 商品总数量-1
      this.data.goodsCount -= 1;
      // 总价钱 减去 对应项的价钱单价
      this.data.total -= Number(this.data.cart[e.target.id.substring(3)].price);
      // 购物车主体数据对应的项的数量-1  并赋给主体数据对应的项内
      this.data.cart[e.target.id.substring(3)].count = --this.data.cart[e.target.id.substring(3)].count;
      // 更新data数据对象
      this.setData({
        cart: this.data.cart,
        total: this.data.total,
        goodsCount: this.data.goodsCount
      })
      // 主体数据重新赋入缓存内
      try {
        wx.setStorageSync('cart', this.data.cart)
      } catch (e) {
        console.log(e)
      }
    },
    /* 加数 */
    addCount: function (e) {
      // 商品总数量+1
      this.data.goodsCount += 1;
      // 总价钱 加上 对应项的价钱单价
      this.data.total += Number(this.data.cart[e.target.id.substring(3)].price);
      // 购物车主体数据对应的项的数量+1  并赋给主体数据对应的项内
      this.data.cart[e.target.id.substring(3)].count = ++this.data.cart[e.target.id.substring(3)].count;
      // 更新data数据对象
      this.setData({
        cart: this.data.cart,
        total: this.data.total,
        goodsCount: this.data.goodsCount
      })
      // 主体数据重新赋入缓存内
      try {
        wx.setStorageSync('cart', this.data.cart)
      } catch (e) {
        console.log(e)
      }
    }
  },
  
    upper: function (e) {
      console.log(e)
    },
    lower: function (e) {
      console.log(e)
    },
    scroll: function (e) {
      console.log(e)
    },
    scrollToTop: function (e) {
      this.setAction({
        scrollTop: 0
      })
    },
    tap: function (e) {
      for (var i = 0; i < order.length; ++i) {
        if (order[i] === this.data.toView) {
          this.setData({
            toView: order[i + 1],
            scrollTop: (i + 1) * 200
          })
          break
        }
      }
    },
    tapMove: function (e) {
      this.setData({
        scrollTop: this.data.scrollTop + 10
      })
    }
  
})