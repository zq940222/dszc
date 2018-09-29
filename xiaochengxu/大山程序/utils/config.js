/**
 * 自定义request请求基类
 */
function request(Type, url, params, successData, errorData, completeData) {
  //设置默认数据传数格式
  var methonType = "application/json";
  //访问的主域名
  var https = "https://ds.sharexwd.top"
  //判断请求方式
  if (Type === 'PUT') {
    var p = Object.keys(params).map(function (key) {
      return encodeURIComponent(key) + "=" + encodeURIComponent(params[key]);
    }).join("&");
    url += '?' + p;
    params = {}
  }
  if (Type == "POST") {
    methonType = "application/x-www-form-urlencoded"
  }
  //开始正式请求
  wx.request({
    url: https + url,
    method: Type,
    header: {
      'content-type': methonType,
      'token': wx.getStorageSync('token')
    },
    data: params,
    //成功回调
    success: (res) => {
      successData(res)
    },
    //错误回调
    error(res) {
      //检测是否传参errorData，如果有则执行回调errorData(res)
      if (errorData) {
        errorData(res)
      }
    },
    //检测是否传参completeData，如果有则执行回调completeData(res)
    complete(res) {
      if (completeData) {
        completeData(res)
      }
    }
  })
};
//导出模块
module.exports = {
  request: request
}