function sajtossz() {
    var sqlText = "SELECT format(SUM(cheeses.price*cheeses.db), 0) AS 'Sajtok ára összesen' FROM cheeses";
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });

}

function szivarossz() {
    var sqlText = "SELECT format(SUM(cigars.price*cigars.db), 0) AS 'Szivarok ára összesen' FROM cigars";
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });
}

function borossz() {
    var sqlText = "SELECT format(SUM(wines.price*wines.db) ,0) AS 'Borok ára összesen' FROM wines";
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });
}