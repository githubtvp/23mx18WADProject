var mysql = require('mysql');
var database = "charity"
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "rootmysql",
    database: "charity"
});

function pr(msg)
{
    process.stdout.write(msg + '\n');
}

pr(`Connected to ${database} database!`);

con.connect(function (err) {
    if (err) throw err;
});

function selectQry(sql)
{
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log(result);
    });
}

function endCon()
{
    con.end((error) => {
    if (error) {
        console.error('Error closing MySQL connection:', error);
        return;
    }
    pr('Connection closed.');
});
}


let sql = "SELECT * FROM user";
selectQry(sql);
endCon();



