// pages/component/commenttj/commenttj.js
const app = getApp();
var appUrl = app.globalData.url;
var pics=[]
var pic = []
Page({

  /**
   * 页面的初始数据
   */
  data: {
    evalList: [{ tempFilePaths: [], imgList: [] }],
    pics:[],
    pic: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that= this
    var img = options.img
    var name = options.name
    var id = options.id
    this.setData({
      img:img,
      name:name,
      id:id
    })
    var id = this.data.id
    wx.request({
      url: appUrl + '/api/v1/handpick_order/'+id,
      method: 'get',
      header: {
        //请求头和ajax写法一样
        'content-type': 'application/json',
        'token': wx.getStorageSync('token')
      },
      data: {},
      success: function (res) {
        console.log(res)
        var comment_arr = res.data.item
        that.setData({
          comment_arr: comment_arr
        }) 
        console.log(that.data.comment_arr)
        that.data.comment_arr.forEach(function(e,i){
           e.pics=[],
           e.pic = [],
           e.tetx=''
        })
      }
    });
    
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
    
  },

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
  goods_intro: function (e) {
    //console.log(e.currentTarget.dataset.id)
    let content = e.detail.value;
    var array = this.data.comment_arr
    //console.log(array)
    //把评论内容分开放倒每个对应的数组里
    array.forEach(function(el,index){
      if (el.goods_id == e.currentTarget.dataset.id){
 
        el.text = content
      }
    })
    this.setData({
      comment_arr: array
    })
   // console.log(this.data.comment_arr)
  },
  //添加图片
  joinPicture: function (e) {
    console.log(e)
    var _id = e.currentTarget.dataset.id;
    var index = e.currentTarget.dataset.index;
    var evalList = this.data.evalList;
    var that = this;
    var imgNumber = evalList[index].tempFilePaths;
    console.log(imgNumber)
    if (imgNumber.length >= 9) {
      wx.showModal({
        title: '',
        content: '最多上9传张图片',
        showCancel: false,
      })
      return;
    }
    wx.showActionSheet({
      itemList: ["从相册中选择", "拍照"],
      itemColor: "#f7982a",
      success: function (res) {
        if (!res.cancel) {
          if (res.tapIndex == 0) {
            that.chooseWxImage("album", imgNumber,_id);
          } else if (res.tapIndex == 1) {
            that.chooseWxImage("camera", imgNumber,_id);
          }
        }
      }
    })
  },
  chooseWxImage: function (type, list,_id) {
    var img = [];
    var len = img.length;
    var that = this;
    var evalList = this.data.evalList;
    wx.chooseImage({
      count: 9,
      sizeType: ["original", "compressed"],
      sourceType: [type],
      success: function (res) {
        console.log(res.tempFilePaths)
        var imgs = res.tempFilePaths
        //把图片分开放倒每个对应的数组里
        that.data.comment_arr.forEach(function (element, index) {
          if (_id == element.goods_id) {
            element.pics = element.pics.concat(imgs)
          }
        })
        that.setData({
          comment_arr: that.data.comment_arr
        })
        //console.log(that.data.comment_arr)
        var addImg = res.tempFilePaths;
        console.log(addImg)
        var addLen = addImg.length;
        if ((len + addLen) > 9) {
          for (var i = 0; i < (addLen - len); i++) {
            var str = {};
            str.pic = addImg[i];
            img.push(str);
          }
        } else {
          for (var j = 0; j < addLen; j++) {
            var str = {};
            str.pic = addImg[j];
            img.push(str);
          }
        }
        that.setData({
          evalList: evalList
        })
        console.log(img)
        that.upLoadImg(img,_id);
      },
    })
  },
  upLoadImg: function (imgss,_id) {
    var that = this;
    this.upload(that, imgss,_id);
  },
  //多张图片上传
  upload: function (page, path,_id) {
    console.log(path)
    var that = this;
    var curImgList = [];

    for (var i = 0; i < path.length; i++) {
      wx.showToast({
        icon: "loading",
        title: "正在上传"
      }),
        wx.uploadFile({
          url: appUrl + '/api/v1/upload',//接口处理
          filePath: path[i].pic,
          name: 'file',
          type:"POST",
          header: {
            'content-type': 'application/json',
            'token': wx.getStorageSync('token')
          },
          formData: {
            douploadpic: '1'
          },
          dataType: "json",
          success: function (res) {
            console.log(res.data)
            var imagess = JSON.parse(res.data)
            console.log(imagess)
            //把图片分开放倒每个对应的数组里
            that.data.comment_arr.forEach(function (element, index) {
              console.log(_id,element.goods_id)
              if (_id == element.goods_id) {
                that.data.comment_arr[index].pic.push(imagess.src)
              }
            })
            var imagess = []
            that.setData({
              comment_arr: that.data.comment_arr
            })
            console.log(that.data.comment_arr)
            curImgList.push(JSON.parse(res.data));
            var evalList = that.data.evalList;
            evalList[0].imgList = curImgList;
            that.setData({
              evalList: evalList
            })
            if (res.statusCode != 200) {
              wx.showModal({
                title: '提示',
                content: '上传失败',
                showCancel: false
              })
              return;
            }
            var data = res.data
            page.setData({  //上传成功修改显示头像
              src: path[0]
            })
          },
          fail: function (e) {
            wx.showModal({
              title: '提示',
              content: '上传失败',
              showCancel: false
            })
          },
          complete: function () {
            wx.hideToast();  //隐藏Toast
          }
        })
    }
  },
  //删除图片
  clearImg: function (e) {
    var that = this
    var id = e.currentTarget.dataset.id
    var index = e.currentTarget.dataset.index;
    var comment_arr = this.data.comment_arr;
    console.log(comment_arr, index)
    comment_arr.forEach(function(el,idx){
      console.log(id, el.goods_id)
      if (id == el.goods_id){
         var img = el.pics;
         console.log("0",img)
          img.splice(index, 1);
        var img2 = el.pic;
        img2.splice(index, 1);
        that.upLoadImg(img);
        console.log("1",img)
      }
    })
    this.setData({
      comment_arr: comment_arr
    })
    
  },
  //提交发布
  submitClick: function (e) {
    var evalList = this.data.evalList;
    var imgList = evalList[0].imgList;
    //console.log(evalList, imgList)
    var imgPort = [];//图片地址，多张以逗号分割
    if (imgList.length != 0) {
      for (var j = 0; j < imgList.length; j++) {
        //console.log(imgList[j])
        imgPort.push(imgList[j].src);
      }
    } else {
      imgPort = [];
    }
    console.log(this.data.comment_arr)
    var order_id = this.data.id
    var arr = []
    this.data.comment_arr.forEach(function(el,idx){
     arr.push({
       goods_id: el.goods_id,
       content: el.text,
       images: el.pic
     })
    })
    wx.request({
      url: appUrl + '/api/v1/comment',
      method: 'POST',
      header: {
        //请求头和ajax写法一样
        'content-type': 'application/json',
        'token': wx.getStorageSync('token')
      },
      data: {
        order_id: order_id,
        comments:arr  
      },
      success: function (res) {
        console.log(res)
      },
      complete:function(res){
        wx.navigateBack({
          delta: 2
        })
      }
    });

  }
})

