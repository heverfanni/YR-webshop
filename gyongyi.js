function sajtossz() {
    var sqlText = "SELECT SUM(cheeses.price*cheeses.db) FROM cheeses";
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });

}

function szivarossz() {
    var sqlText = "SELECT SUM(cigars.price*cigars.db) FROM cigars";
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });
}

function borossz() {
    var sqlText = "SELECT SUM(wines.price*wines.db) FROM wines";
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });
}