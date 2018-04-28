var mysql = require('mysql')
var pool  = mysql.createPool({
	host: 'localhost',
	user: 'root',
	password: '',
	port: '3306',
	database: 'mymall'
})
module.exports = pool