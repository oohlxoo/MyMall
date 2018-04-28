var router = require('./router.js')
var pool = require('./pool.js')

// 查询用户的购物车列表
router.get('/shop/list', (req, res) => {
	let sql = 'select s.id, s.good_id, s.num, s.isChoose, g.name, g.price, g.describe, g.coverImg from shop s inner join goods g on s.good_id=g.id where s.u_id=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.u_id], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				console.log(data)
				res.status(200).send(data)
			}
		})
	})
})

// 加入购物车或者购物车加一减一
router.put('/shop/edit', (req, res) => {
	var searchsql = 'select 1 from shop where good_id=? and u_id=? limit 1'
	pool.getConnection((err, connection) => {
		connection.query(searchsql, [req.body.good_id, req.body.u_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data[0])
				let num
				for (let k in data[0]) {
					num = data[0][k]
				}
				console.log(num)
				if (num === 1) {
					console.log('更新数据')
					let sql
					req.body.action == 'add' ? sql = 'update shop set num=num+1 where good_id=? and u_id=?' : sql = 'update shop set num=num-1 where good_id=? and u_id=?'
					connection.query(sql, [req.body.good_id, req.body.u_id], (error, result) => {
						if (error) {
							res.status(500).send(error)
						} else {
							res.status(200).send({code: 'ok'})
						}
						connection.release();
					})
				} else {
					console.log('新增')
					let sql = 'insert into shop values(null, ?, ?, 1, "true")'
					connection.query(sql, [req.body.u_id, req.body.good_id], (error, result) => {
						if (error) {
							res.status(500).send(error)
						} else {
							res.status(200).send({code: 'ok'})
						}
						connection.release();
					})
				}
			} 
		})
	})
})
// shop/delete(删除购物车-单个或多个)
router.delete('/shop/remove', (req, res) => {
	var sql = 'delete from shop where id in(' + req.query.ids + ')'
	pool.getConnection((err, connection) => {
		connection.query(sql, (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.status(200).send({code: 'ok'})
			} 
		})
	})
})

// 购物车全选和反选
router.put('/shop/multiple', (req, res) => {
	var sql = 'update shop set isChoose=? where u_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.isChoose, req.body.u_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})

// 购物车选中单行或取消选中单行
router.put('/shop/changeone', (req, res) => {
	var sql = 'update shop set isChoose=? where u_id=? and good_id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.isChoose, req.body.u_id, req.body.good_id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
module.exports = router

