$(document).ready(function () {
    var dateToday = new Date();
    $('.datepicker').datepicker({
        format: 'mm-dd-yyyy',
        endDate: new Date(),
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
    });

    $("#StartDate").datepicker({
        startDate: new Date(),
        format: 'mm-dd-yyyy',
       
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        startDate = new Date(e.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(e.date.valueOf())));
        $("#DueDate").datepicker('setStartDate', startDate);
    });

    $("#DueDate").datepicker({
        format: 'mm-dd-yyyy',

    }).on('changeDate', function (e) {

        $(this).datepicker('hide');
    });



});