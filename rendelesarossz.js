function rendelesarossz() {
    var sqlText =
        "SELECT format(SUM(orders.cigardb * cigars.price + orders.winedb * wines.price + orders.cheesedb * cheeses.price) , 0) as összesen\
    FROM orders LEFT JOIN cigars ON orders.cigarid = cigars.id \
    left join wines on orders.wineid = wines.id \
    LEFT JOIN cheeses on orders.cheeseid = cheeses.id \
    WHERE orders.cigardb IS NOT NULL AND orders.winedb IS NOT NULL AND orders.cheesedb IS NOT NULL"; //Ide írd az SQL lekérdezést
    sql(sqlText, function (data) {
        convertDate(data, "orderdate");
        displayData(data, dataTable);
    });
}