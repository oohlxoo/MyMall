var router = require('./router.js')
var pool = require('./pool.js')

// 根据商品ID查询评论
router.get('/comment/get', (req, res) => {
    var sql = 'select c.star, c.content, c.date, u.phone, u.nickname from comment c inner join user u on c.u_id=u.id where c.good_id=?'
    pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.id], (err, data, fields) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data)
				console.log(data)
			}
			connection.release()
		})
	})
})

// 根据用户ID查询自己的评价
router.get('/comment/mine', (req, res) => {
    var sql = 'select c.id as c_id, c.star, c.content, c.date, g.id, g.name, g.describe, g.price, g.coverImg from comment c inner join goods g on c.good_id=g.id join user u on c.u_id=u.id where u.id=?'
    pool.getConnection(function(err, connection) {
		connection.query(sql, [req.query.id], (err, data, fields) => {
			if (err) {
				res.status(500).send(err)
			} else {
				res.send(data)
				console.log(data)
			}
			connection.release()
		})
	})
})
function changedate(time, format) {
    var t = new Date(time);
    var tf = function(i){return (i < 10 ? '0' : '') + i};
    return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){
      switch(a){
        case 'yyyy':
            return tf(t.getFullYear());
            break;
        case 'MM':
            return tf(t.getMonth() + 1);
            break;
        case 'mm':
            return tf(t.getMinutes());
            break;
        case 'dd':
            return tf(t.getDate());
            break;
        case 'HH':
            return tf(t.getHours());
            break;
        case 'ss':
            return tf(t.getSeconds());
            break;
      }
    })
}
// 添加评论
router.post('/comment/add', (req, res) => {
    var date = changedate(new Date(), 'yyyy-MM-dd HH:mm:ss')
    var sql = 'insert into comment value(null, ?, ?, ?, ?, ?)'
    pool.getConnection((err, connection) => {
        connection.query(sql, [req.body.good_id, req.body.u_id, req.body.star, req.body.content, date], (err, data) => {
            if (err) {
                res.status(500).send(err)
            } else {
                res.send(data)
            }
            connection.release();
        })
    })
})

// 根据评论本身ID删除评论
router.delete('/comment/remove', (req, res) => {
    var sql = 'delete from comment where id=?'
    pool.getConnection(function(err, connection) {
        connection.query(sql, [req.query.id], (err, data) => {
            if (err) {
                res.status(500).send(err)
            } else {
                console.log(data)
                res.send(data)
            }
            connection.release()
        })
    })
})
