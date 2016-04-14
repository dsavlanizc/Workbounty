$(document).ready(function () {
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
    });
});