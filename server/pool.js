var mysql = require('mysql')
var pool  = mysql.createPool({
	host: 'localhost',
	user: 'root',
	password: '',
	port: '3306',
	database: 'ordermeal'
})
module.exports = pool