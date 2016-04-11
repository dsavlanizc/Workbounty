﻿var radioValue;
var amount;
var filepath;

$(document).ready(function () {

    $("#btn").click(function () {

        var radioValue = $("input[name='formfieldradio']:checked").val();
        var amount = $("#amount").val();
        sessionStorage.setItem('key1', radioValue);
        sessionStorage.setItem('key2', amount);
        $("#myModal").fadeOut();
    });
});

function AddWorkitem() {

    var d = new Date();
    var item = {
        "Title": $("#Title").val(),
        "Summary": $("#Summary").val(),
        "StartDate": $("#StartDate").val(),
        "DueDate": $("#DueDate").val(),
        "PublishedTo": $("#TeamName1").val(),
        "DocumentFilePath": document.getElementById("myFile").value,
        "ProposedReward": sessionStorage.getItem('key1'),
        "Amount": sessionStorage.getItem('key2'),
        "CreatedBy": document.getElementById("Userid").value,
        "CreatedDateTime": d.toDateString(),
        "ModifyBy": document.getElementById("Userid").value,
        "ModifyDateTime": d.toDateString(),
        "Status": true,
        "Remarks": "Good",
        "IsOpenForGroup": true
    };

    $.ajax({
        type: "POST",
        url: '/home/AddWorkitem/',
        data: JSON.stringify(item),
        contentType: "application/json;charset=utf-8",
        processData: true,
        success: function (data, status, xhr) {
            alert("The result is : " + status);
        },
        error: function (xhr) {
            alert(xhr.responseText);
        }
    });
}
