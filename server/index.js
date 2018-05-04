var express = require('express');
var cors = require('cors');
var app = express();
app.use(cors())

// 用户
var user = require('./user')
app.use(user)
// 商品
var goods = require('./goods')
app.use(goods)
// 购物车
var shop = require('./shop')
app.use(shop)
// 收藏
var collect = require('./collect')
app.use(collect)
// 地址
var address = require('./address')
app.use(address)

// 首页商品查询
var product = require('./product')
app.use(product)
 
var server = app.listen(3000, function () {
 
  var host = server.address().address
  var port = server.address().port
 
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
 
})