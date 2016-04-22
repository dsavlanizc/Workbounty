$(document).ready(function () {
    var dateToday = new Date();
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
    });

    $("#StartDate").datepicker({
        startDate: new Date(),
        format: 'yyyy-mm-dd',
       
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        startDate = new Date(e.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(e.date.valueOf())));
        $("#DueDate").datepicker('setStartDate', startDate);
    });

    $("#DueDate").datepicker({
        format: 'yyyy-mm-dd',

    }).on('changeDate', function (e) {

        $(this).datepicker('hide');
    });



});