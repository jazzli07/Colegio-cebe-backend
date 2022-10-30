const { Pool } = require("pg");
const { db } = require('./config');

const pool = new Pool({
    user: db.user,
    password: db.password,
    host: db.host,
    port: db.port,
    database: db.database,
    dialectOptions: {
        ssl: {
          require: true,
          rejectUnauthorized: false // <<<<<<< YOU NEED THIS
        }
    }
});
module.exports = pool;

//? será necesario agregarlo al pool object cuando se haga deploy a heroku :D
    /*ssl: {
        rejectUnauthorized: false
    }*/
