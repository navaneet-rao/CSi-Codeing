const { log } = require("console");
const mysql = require("mysql2");

var con = mysql.createConnection({
  host: "localhost",
  database: "csitest",
  user: "root",
  password: "N@v@neet2003007",
});

con.commit(function (error) {
  if (error) {
    throw error;
  } else {
    log("db connected successfully");
  }
});

module.exports = con;