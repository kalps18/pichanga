const mylsq = require('mysql');
const {promisify} = require('util');

const database = {
  host: "localhost",
  user: "userdesarrollo",
  password: "Desarrollo2023*",
  database: "bdpichanga",
  port: "3306",
};

const pool = mylsq.createPool(database)

pool.getConnection((err, connection)=>{
    if(err){
        throw err;
    }
    if(connection){
        connection.release();
        console.log('DB conected, ok')
    }
});

pool.query = promisify(pool.query);

module.exports = {pool,database};


