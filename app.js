var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var app = express();

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

const connection = mysql.createConnection({
   host     : 'localhost',
   user     : 'root',
   database : 'join_us'
});

app.get("/", function(req, res){
	var q = "SELECT COUNT(*) AS count FROM users";
	connection.query(q, function(err, results){
		if (err) throw err; 
		var count = (results[0].count);
		var msg = ("We have " + count + " users in our db");
		// res.send(msg);
		res.render("home", {count: count});
	});
	
});

app.post("/register", function(req, res){
	var person = {
		email: req.body.email
	};
connection.query('INSERT INTO users SET ?', person, function(err, result){
	if (err) throw err; 
	res.redirect("/");
    });
});

app.listen(3001, function(){
	console.log("Server running on 3001!");
});

