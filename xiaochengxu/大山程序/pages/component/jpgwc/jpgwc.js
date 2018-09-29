// pages/component/jpgwc/jpgwc.js
var app = getApp();
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
    adminShow: false, //管理 
    shopcarData: [], //购物车数据 
    total: 0, //总金额 
    allsel: false, //全选 
    selarr: [], //选择的货物 
    hintText: '', //提示的内容
    hintShow: false //是否显示提示 
  },
 
  methods: {
    onLoad:function(){
      var catrarray = wx.getStorageSync("catrarray")
       this.setData({
         catrarray: catrarray
       })
      console.log(this.data.catrarray)
    },
    //点击全选 
    allcheckTap: function () {
      let shopcar = this.data.shopcarData,
        allsel = !this.data.allsel,
        //点击全选后allsel变化
        total = 0;
      for (let i = 0, len = shopcar.length; i < len; i++) {
        shopcar[i].check = allsel;
        //所有商品的选中状态和allsel值一样 
        if (allsel) { //如果为选中状态则计算商品的价格
          total += shopcar[i].bhprice * shopcar[i].num;
    
        }
      }
      this.data.selarr = allsel ? shopcar : [];
      //如果选中状态为true那么所有商品为选中状态，将物品加入选中变量，否则为空 
      total = Number(total).toFixed(2) 
      this.setData({
        allsel: allsel,
        shopcarData: shopcar,
        total: total,
        selarr: this.data.selarr
      });
    },
    //点击单个选择按钮
    checkTap: function (e) {
      let Index = e.currentTarget.dataset.index,
        shopcar = this.data.shopcarData,
        total = Number(this.data.total),

        selarr = this.data.selarr;
      shopcar[Index].check = !shopcar[Index].check || false ;
      if (shopcar[Index].check) {

        total += shopcar[Index].num * shopcar[Index].bhprice;
      // console.log(total)
        selarr.push(shopcar[Index]);
      } else {
       // console.log(total, shopcar[Index].num * shopcar[Index].bhprice)
        total -= shopcar[Index].num * shopcar[Index].bhprice;
      
        for (let i = 0, len = selarr.length; i < len; i++) {
          if (shopcar[Index].id == selarr[i].id) {
            selarr.splice(i, 1);
            break;
          }
        }
      }
      this.setData({
        shopcarData: shopcar,
        total:total.toFixed(2),
        selarr: selarr
      });
      this.judgmentAll();
      //每次按钮点击后都判断是否满足全选的条件 
    },
    //点击管理按钮，是否显示管理的选项 
    adminTap: function () {
      this.setData({
        adminShow: !this.data.adminShow
      });
     
    },
    //点击移除商品 
    deleteshopTap: function () {
      var allsel = this.data.allsel,
        shopcar = this.data.shopcarData,
        selarr = this.data.selarr;
     
      if (allsel) {
        shopcar = [];
        this.setData({
          allsel: false
        });
      } else {        
        for (var i = 0, len = selarr.length; i < len; i++) {
          //将选中的商品从购物车移除 
          //console.log(selarr[i].id);
          for (var lens = shopcar.length - 1, j = lens; j >= 0; j--) {
            //console.log(shopcar[j].id);
          if (selarr[i].id == shopcar[j].id && selarr[i].key == shopcar[j].key) {
              shopcar.splice(j, 1);
            }
          }
        }
      }
     
      this.setData({
        selarr: selarr,
        shopcarData: shopcar,
        total: 0
      });
      //console.log(this.data.shopcarData)
      wx.setStorageSync("catrarray", this.data.shopcarData)
    },
    //点击加减按钮 
    numchangeTap: function (e) {
      //console.log(e)
      let Index = e.currentTarget.dataset.index,
        //点击的商品下标值
        shopcar = this.data.shopcarData,
        types = e.currentTarget.dataset.types,
        //是加号还是减号 
        total = this.data.total;
      total = Number(this.data.total)
      //总计 
      switch (types) {
        case 'add':
          shopcar[Index].num++;
          //对应商品的数量+1 
          shopcar[Index].check && (total += parseInt(shopcar[Index].bhprice));
          //如果商品为选中的，则合计价格+商品单价 
          break;
        case 'minus':
          //console.log(shopcar[Index].num)
          shopcar[Index].num--;
          //对应商品的数量-1 
          shopcar[Index].check && (total -= parseInt(shopcar[Index].bhprice));
          //如果商品为选中的，则合计价格-商品单价 
          break;
      }
      this.setData({
        shopcarData: shopcar,
        total: total.toFixed(2)
      });
    },
    //判断是否为全选 
    judgmentAll: function () {
      let shopcar = this.data.shopcarData,
        shoplen = shopcar.length,
        lenIndex = 0;
      //选中的物品的个数 
      for (let i = 0; i < shoplen; i++) {
        //计算购物车选中的商品的个数 
        shopcar[i].check && lenIndex++;
      }
      this.setData({
        allsel: lenIndex == shoplen
        //如果购物车选中的个数和购物车里货物的总数相同，则为全选，反之为未全选 
      });
    },
    onReady: function () { },
    /** * 生命周期函数--监听页面显示 */
    onShow: function () {
      var shopcarData = this.data.catrarray,
        //购物车的数据
        total = 0,
        selarr = this.data.selarr;
      //console.log("1", shopcarData)
      for (let i = 0, len = shopcarData.length; i < len; i++) { //这里是对选中的商品的价格进行总结 
        if (shopcarData[i].check) {
          total += shopcarData[i].num * shopcarData[i].bhprice;
          selarr.push(shopcarData[i]);
        }
      }
      total = Number(total).toFixed(2) 
      this.setData({
        shopcarData: shopcarData,
        total: total,
        selarr: selarr
      });
      this.judgmentAll();
      //判断是否全选 
    },
    jporder:function(){
      var selarr=this.data.selarr     
      wx.setStorageSync("jparray", selarr)
      var selarr = []
      this.setData({
        selarr: selarr
      })
      var jptotal = this.data.total
      wx.setStorageSync("jptotal", jptotal)
      wx.navigateTo({
        url: '../jporder/jporder'
      })
    }
  }
})
