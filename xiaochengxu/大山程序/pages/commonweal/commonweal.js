// pages/diary/diary.js
var heights=[];
var _index1 =0;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    _index: 0,
    sidemenu: [{
      text: 'A',
      flag: 1
    }, {
      text: 'B',
      flag: 0
    }, {
      text: 'C',
      flag: 0
    }, {
      text: 'D',
      flag: 0
    }, {
      text: 'E',
      flag: 0
    }, {
      text: 'F',
      flag: 0
    }, ],
    content:[{
      text:'aaaaaaaaaaaaaaaaaaa'
    },{
      text:'bbbbbbbbbbbbbbbbbbb',
    },{
      text:'cccccccccccccccccc'
    },{
      text:'ddddddddddddddddddddd'
    }, {
      text: 'eeeeeeeeeeeeeeeeeeeeeee'
    }, {
      text: 'ffffffffffffffffffffff'
    }],
    heights:[]
  },
  goscroll(e) {
    var that = this;
    // this.scroll=null
    let _index = e.currentTarget.dataset.index;
    this.data.sidemenu.forEach(function(element,index){
      element.flag=0
      if(_index == index){
        that.data.sidemenu[index].flag=1
        _index1 = _index
      }
    })
    this.setData({
      _index: _index,
      sidemenu: that.data.sidemenu
    })
  },
  scroll(e){
    var that =this
    // 实时获取距离顶部的距离
    let offsettop = e.detail.scrollTop;
    let timeStamp = e.timeStamp
    let timebefore = wx.getStorageSync('timebefore');
    if (timebefore.timeStamp && timeStamp != timebefore.timeStamp){
      //console.log(_index1)
      
      if (offsettop>timebefore.offsetTop){
        console.log('下滑')   
        that.data.sidemenu.forEach(function (element, index) {
          element.flag = 0;
          if (offsettop <= that.data.heights[_index1 + 1] && offsettop >= that.data.heights[_index1]) {
            that.data.sidemenu[_index1].flag = 1;
          } else {
            if (_index1 > that.data.sidemenu.length) {
              _index1 = that.data.sidemenu.length - 1
            } else {
              _index1++
            }
          }
        })
        console.log(_index1)
        
        that.setData({
          sidemenu: that.data.sidemenu
        })     
        wx.setStorageSync('timebefore', { 'timeStamp': timeStamp, 'offsetTop': offsettop })
      }else{
        console.log('上滑')
        console.log(_index1)
        that.data.sidemenu.forEach(function (element, index) {
          element.flag = 0;
          if (offsettop <= that.data.heights[_index1] && offsettop >= that.data.heights[_index1-1]) {
            that.data.sidemenu[_index1-1].flag = 1;
          } else {
            if (_index1 <=0) {
              _index1 = 0
            } else {
              _index1--
            }
          }
        })
        
        that.setData({
          sidemenu: that.data.sidemenu
        })  
        wx.setStorageSync('timebefore', { 'timeStamp': timeStamp, 'offsetTop': offsettop })
      }
    }else{
      wx.setStorageSync('timebefore', { 'timeStamp': timeStamp,'offsetTop':offsettop})
    }
    // console.log(offsettop,e)
    // 判断上滑还是下滑
   
    
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {
    var that =this;
    var query = wx.createSelectorQuery().in(this)//创建节点查询器 query
    // [id^=scroll-item]
    for (let i=0; i<this.data.content.length;i++){
    //这段代码的意思是选择Id=scroll-item_的节点，获取节点位置信息的查询请求
      query.selectAll("#scroll-item_"+i).boundingClientRect((react) => {
        // console.log(react)
        react.forEach((res) => {
          // 把所有项距离顶部的高度存到一个数组中
          heights.push(res.top)
        })
        that.setData({
          heights: Array.from(new Set(heights)) //数组去重
        })
      }).exec()
    }
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  }
})