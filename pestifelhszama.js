function pestifelhszama() {
    var sqlText = "SELECT Count(id) AS Pestiek FROM users WHERE users.city = 'Budapest'";
    sql(sqlText, function (data) {
        displayData(data, dataTable)
    });
}