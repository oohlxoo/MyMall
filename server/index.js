var express = require('express');
var cors = require('cors');
var app = express();
app.use(cors())

// 首页商品查询
var product = require('./product')
app.use(product)
 
var server = app.listen(3000, function () {
 
  var host = server.address().address
  var port = server.address().port
 
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
 
})