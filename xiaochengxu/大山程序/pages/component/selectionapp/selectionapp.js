// pages/component/commenttj/commenttj.js
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
    nickname:"",
    address: "",
    mobile: "",
    company_name: "",
    goods_name: "",
    goods_intro: "",
    evalList: [{ tempFilePaths: [], imgList: [] }]
  },

  /**
   * 组件的方法列表
   */
  methods: {
    nickname: function (e) {
      console.log(e.detail.value)
      this.data.nickname = e.detail.value;
    },
    address: function (e) {
      console.log(e.detail.value)
      this.data.address = e.detail.value;
    },
    mobile: function (e) {
      console.log(e.detail.value)
      this.data.mobile = e.detail.value;
    },
    company_name: function (e) {
      console.log(e.detail.value)
      this.data.company_name = e.detail.value;
    },
    goods_name: function (e) {
      console.log(e.detail.value)
      this.data.goods_name = e.detail.value;
    },
    goods_intro: function (e) {
      console.log(e.detail.value)
      this.data.goods_intro = e.detail.value;
    },
    //添加图片
    joinPicture: function (e) {
      var index = e.currentTarget.dataset.index;
      var evalList = this.data.evalList;
      var that = this;
      var imgNumber = evalList[index].tempFilePaths;
      if (imgNumber.length >= 9) {
        wx.showModal({
          title: '',
          content: '最多上传三张图片',
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
              that.chooseWxImage("album", imgNumber);
            } else if (res.tapIndex == 1) {
              that.chooseWxImage("camera", imgNumber);
            }
          }
        }
      })
    },
    chooseWxImage: function (type, list) {
      var img = list;
      var len = img.length;
      var that = this;
      var evalList = this.data.evalList;
      wx.chooseImage({
        count: 9,
        sizeType: ["original", "compressed"],
        sourceType: [type],
        success: function (res) {
          var addImg = res.tempFilePaths;
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
          that.upLoadImg(img);
        },
      })
    },
    upLoadImg: function (list) {
      var that = this;
      this.upload(that, list);
    },
    //多张图片上传
    upload: function (page, path) {
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
          header: {
            'content-type': 'application/json',
            'token': wx.getStorageSync('token')
            },
            formData: {
              douploadpic: '1'
            },
            dataType:"json",
            success: function (res) {
              console.log("tupian:",res)
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
      var index = e.currentTarget.dataset.index;
      var evalList = this.data.evalList;
      var img = evalList[0].tempFilePaths;
      img.splice(index, 1);
      this.setData({
        evalList: evalList
      })
      this.upLoadImg(img);
    },
    //提交发布
    submitClick: function (e) {
      var evalList = this.data.evalList;
      var imgList = evalList[0].imgList;
      var imgPort = [];//图片地址，多张以逗号分割
      if (imgList.length != 0) {
        for (var j = 0; j < imgList.length; j++) {
          console.log(imgList[j])
          imgPort.push(imgList[j].src);
        }
      } else {
        imgPort = [];
      }
      console.log(imgPort)



      wx.request({
        url: appUrl + '/api/v1/handpick',
        method: 'POST',
        header: {
          //请求头和ajax写法一样
          'content-type': 'application/json',
          'token': wx.getStorageSync('token')
        },
        data: {
          nickname: this.data.nickname,
          mobile: this.data.mobile,
          address: this.data.address,
          company_name: this.data.company_name,
          goods_name: this.data.goods_name,
          goods_intro: this.data.goods_intro,
          goods_images: imgPort
        },
        success: function (res) {
          console.log(res)
          if (res.data.code == 201) {
            wx.navigateTo({
              url: '../selectionsuc/selectionsuc',
            })
          }

        }
      });

    }

  }
})
