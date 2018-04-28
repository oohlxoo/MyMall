var router = require('./router.js')
var pool = require('./pool.js')

// 注册
// /user/add
router.post('/user/add', (req, res) => {
	var sql = 'insert into user values(null, ?, ?, null, null, null, ?)'
	pool.getConnection((err, connection) => {
		connection.query('select * from user where phone=?', [req.body.phone], (err, result) => {
			if (result.length > 0) {
				res.status(500).send('手机号已存在')
			} else {
				connection.query(sql, [req.body.phone, req.body.password, req.body.role], (err, data) => {
					if (err) {
						res.send(err)
					} else {
						res.send(data)
					}
					connection.release()
				})
			}
		})
	}) 
})

// 登录(根据用户手机号和密码查找用户信息)
router.get('/user/login', (req, res) => {
	let sql = 'select * from user where phone=? and password=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.query.phone, req.query.password], (err, data) => {
			if (err) {
				res.send(err)
			} else {
				console.log(data)
				if (data.length > 0) {
					res.status(200).send(data[0])
				} else {
					res.status(500).send({code: 500, message: '手机号或密码不正确'})
				}
			}
		})
	})
})
// 修改用户信息
router.put('/user/edit', (req, res) => {
	let sql = 'update user set password=?, nickname=?, avatar=?, sign=?, role=? where id=?'
	pool.getConnection((error, connection) => {
		connection.query(sql, [req.body.password, req.body.nickname, req.body.avatar, req.body.sign, req.body.role, req.body.id], (err, data) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data)
				console.log(data)
			}
			connection.release();
		})
	})
})

module.exports = router