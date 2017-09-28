var express = require('express')
var router = express.Router()
var mysql = require('mysql')
var bodyParser = require('body-parser')
var pool  = mysql.createPool({
	host: 'localhost',
	user: 'root',
	password: 'admin',
	port: '3306',
	database: 'mymall'
})
router.use(bodyParser.json())
router.use(bodyParser.urlencoded({ extended: false }))

// 获取bannerlist
router.get('/bannerlists', (req, res) => {
	var sql = 'select * from banner'
	pool.getConnection((err, connection) => {
		connection.query(sql, (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})

// 获取全部商品信息
router.get('/productList', (req, res) => {
	var sql = 'select * from productList'
	pool.getConnection((err, connection) => {
		connection.query(sql, (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})

// 根据ID获取单个商品详细信息
router.get('/getdetails', (req, res) => {
	var sql = 'select * from productList where id=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.id], (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				// console.log(data)
				// res.send(data)
				data[0].img = []
				data[0].assess = []
				var imgsql = 'select src from img where d_id=?'
				connection.query(imgsql, [req.query.id], (error, result, fields) => {
					if (error) {
						console.log(error)
						res.status(500).send(error)
					} else {
						for (var k = 0; k < result.length; k ++) {
							data[0].img.push(result[k].src)
						}
						var assesssql = 'select * from assess where d_id=?'
						connection.query(assesssql, [req.query.id], (errcode, response, fields) => {
							if (errcode) {
								console.log(errcode)
								res.status(500).send(errcode)
							} else {
								for (var i = 0; i < response.length; i ++) {
									data[0].assess.push(response[i])
								}
								res.send(data[0])
							}
							connection.release();
						})
					}
				})
			}
		})
	})
})

module.exports = router