function sql(sqlText, callBackFunction) {
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log(xhttp.responseText);
            // refreshDocument(JSON.parse(xhttp.responseText));
            callBackFunction(JSON.parse(xhttp.responseText));
        }
    };

    xhttp.open("POST", "http://127.0.0.1:3000/sql", true);
    xhttp.withCredentials = true;
    xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhttp.send(JSON.stringify({
        sql: sqlText
    }));
}

//Ebben a függvényben dolgozd fel a kapott objektumot: jelenítsd meg az adatokat az oldalon
function refreshDocument(jsonObject) {
    document.getElementById('content').innerText = JSON.stringify(jsonObject);
}

//Ide készíthetsz saját függvényket
function convertDate(data, dateKey) {

    for (let i = 0; i < data.length; i++) {
        var aktualis = data[i];
        for (const key in aktualis) {
            if (dateKey === key) {
                var d = new Date(aktualis[key]);
                var year = d.getFullYear();
                var month = (d.getMonth() + 1);
                var day = d.getDate();
                data[i][key] =
                    year + "." +
                    (month < 10 ? "0" + month : month) + "." +
                    (day < 10 ? "0" + day : day);

            }
        }

    }
}


function loadWines() {
    var sqlText = "SELECT * FROM wines"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });
}


function loadCheeses() {
    var sqlText = "SELECT * FROM cheeses"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });
}

function loadCigars() {
    var sqlText = "SELECT * FROM cigars"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });
}

function loadUsers() {
    var sqlText = "SELECT * FROM users"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        convertDate(data, "dob");
        displayData(data, dataTable)
    });
}

function loadOrders() {
    var sqlText = "SELECT * FROM orders"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        convertDate(data, "orderdate");
        displayData(data, dataTable)
    });
}

function fanni() {
    var sqlText = "SELECT orders.orderdate, users.name, orders.wineid, \
    orders.cheeseid, orders.cigarid\
     FROM orders LEFT JOIN users ON orders.userid = users.id\
      WHERE orders.cheeseid IS NULL AND orders.cigarid IS NULL \
      ORDER BY users.name ASC"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        convertDate(data, "orderdate");
        displayData(data, dataTable)
    });
}

function kozos() {
    var sqlText = "SELECT YEAR(orders.orderdate) as év, MONTH(orders.orderdate) as hónap, \
    SUM(orders.cheesedb * cheeses.price) as sajt, SUM(orders.winedb * wines.price) as bor, SUM(orders.cigardb * cigars.price) as szivar \
    FROM orders LEFT JOIN cheeses ON orders.cheeseid = cheeses.id\
     LEFT JOIN wines ON orders.wineid = wines.id LEFT JOIN cigars ON orders.cigarid = cigars.id \
     GROUP BY MONTH(orders.orderdate), YEAR(orders.orderdate) \
     ORDER BY év, hónap"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        convertDate(data, "orderdate");
        displayData(data, dataTable)
    });
}

function gyongyi() {
    var sqlText = "SELECT cheeses.name, SUM(cheeses.price*orders.cheesedb) as totalselling \
    FROM orders JOIN cheeses ON orders.cheeseid=cheeses.id \
    GROUP BY cheeses.name ORDER BY totalselling DESC"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });
}

function dennis() {
    var sqlText =
        "SELECT orders.orderdate,  users.name as Felhasználó_neve  ,\
     format(cheeses.price+wines.price+cigars.price, 0) as Összesen  from orders \
    join cheeses on cheeses.id = orders.cheeseid \
    JOIN wines on wines.id = orders.wineid \
    JOIN cigars on cigars.id = orders.cigarid \
    join users on users.id = orders.userid \
    where cheeses.price > 0 AND wines.price > 0 AND cigars.price > 0"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        convertDate(data, "orderdate");
        displayData(data, dataTable);
    });
}

function benji() {
    var sqlText = "SELECT users.name AS 'Születésnapos', wines.name AS 'Születésnapi bora' \
    FROM users JOIN orders ON users.id = orders.userid JOIN wines ON orders.wineid = wines.id \
    WHERE Year(users.dob) = wines.wineyear"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });
}




var dataTable = document.getElementById("dataTable");

function displayData(data, dataTable) {
    if (!data || !data.length) {
        alert("Nincs megjeleníthető adat.");
    }

    dataTable.innerHTML = "";
    var elsoSor = data[0];
    var thead = document.createElement("thead");
    for (var key in elsoSor) {
        var th = document.createElement("th");
        th.innerHTML = key;
        thead.appendChild(th);
    }
    dataTable.appendChild(thead);



    for (let i = 0; i < data.length; i++) {
        var aktualis = data[i];
        var tr = document.createElement("tr");
        for (var key in aktualis) {
            var td = document.createElement("td");
            td.innerHTML = aktualis[key];
            tr.appendChild(td);

        }
        dataTable.appendChild(tr);

    }
}