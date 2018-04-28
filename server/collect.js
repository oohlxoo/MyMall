var router = require('./router.js')
var pool = require('./pool.js')


// /collect/list
router.get('/collect/list', (req, res) => {
	let sql = 'select c.id, c.date, g.name, g.price, g.describe, g.coverImg from collect c inner join goods g on c.good_id=g.id where c.u_id=? order by date DESC'
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


// /collect/add
router.post('/collect/add', (req, res) => {
	var sql = 'insert into collect values(null,?,?,?)'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.body.good_id, req.body.u_id, req.body.date], (err, data, fields) => {
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

// collect/delete
router.delete('/collect/remove', (req, res) => {
	var sql = 'delete from collect where id=?'
	pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.id], (err, data) => {
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