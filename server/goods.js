var router = require('./router.js')
var pool = require('./pool.js')

// 商品一级菜单(左边菜单栏)
router.get('/appkey/list', (req, res) => {
	let sql = 'select * from appkey'
	pool.getConnection((err, connection) => {
		connection.query(sql, (err, data) => {
			if (err) {
				res.send(err)
			} else {
				console.log(data)
				res.status(200).send(data)
			}
		})
	})
})

// 根据商品一级菜单ID查询商品二级菜单
router.get('/goodstype/list', (req, res) => {
	let sql = 'select * from goodstype where parent_id=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.id], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				console.log(data)
				res.status(200).send(data)
			}
		})
	})
})

// 根据商品二级菜单查询商品列表
router.get('/goods/list', (req, res) => {
	let sql = 'select * from goods where gt_id=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.id], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				console.log(data)
				res.status(200).send(data)
			}
		})
	})
})

// 根据商品ID查询商品详情
router.get('/goods/detail', (req, res) => {
	let sql = 'select * from goods where id=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.id], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				console.log(data)
				res.status(200).send(data[0])
			}
		})
	})
})
module.exports = router