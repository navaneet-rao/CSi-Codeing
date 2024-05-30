const { log } = require("console");

const express = require("express");
const bodyParser = require("body-parser");
const ejs = require("ejs");
const con = require("./connection");

const app = express();
app.set("view engine", "ejs");
app.use(express.static("public"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.render("index");
});

app.post("/", (req, res) => {
  const { reg_no } = req.body;
  console.log(reg_no);
  if (reg_no) {
    const sql =
      "SELECT results.*, course.* FROM results CROSS JOIN course WHERE  results.reg_no = ?;";
    con.query(sql, reg_no, (err, result) => {
      if (err) {
        console.log(err);
      } else {
        console.log(result);
        res.render("result", { result });
      }
    });
  }
});


app.listen(3000, function () {
  log("Server started on port 3000");
});
