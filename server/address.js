var router = require('./router.js')
var pool = require('./pool.js')

// /province/list
router.get('/province/list', (req, res) => {
	let sql = 'select * from province'
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

// /city/list
router.get('/city/list', (req, res) => {
	let sql = 'select * from city where province_id=?'
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

// /site/list
router.get('/site/list', (req, res) => {
	let sql = 'select * from site where city_id=?'
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

module.exports = router