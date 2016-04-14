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
    var dueDate = $("#DueDate").val();
    var startDate = $("#StartDate").val();
    var startDateObject = new Date(startDate);
    var dueDateObject = new Date(dueDate);
   
    var newitem = {};
        newitem.Title = $("#Title").val();
        newitem.Summary= $("#Summary").val();
        newitem.StartDate = startDateObject;
        newitem.DueDate = dueDateObject;
        newitem.PublishedTo = $("#TeamList").val();
        newitem.DocumentFilePath = $("#myFile").val();
        newitem.ProposedReward = sessionStorage.getItem('key1');
        newitem.Amount = sessionStorage.getItem('key2');
        newitem.CreatedBy = $("#Userid").val();
        newitem.CreatedDateTime = d.toDateString();
        newitem.ModifyBy = $("#Userid").val();
        newitem.ModifyDateTime = d.toDateString();
        newitem.Status = true;
        newitem.Remarks = "Good";
        newitem.IsOpenForGroup = true;
   
   
    if ($("#Title").val() == "") {
        $("#TitleError").text("Title is Required");

        if ($("#Summary").val() == "") {
            $("#SummaryError").text("Summary is Required");

            if ($("#StartDate").val() == "") {
                $("#StartdateError").text("Start Date is Required");

                if ($("#DueDate").val() == "") {
                    $("#DuedateError").text("Due Date is Required");

                    if ($("#amount").val() == "") {
                        $("#AmountError").text("Amount is Required");
                    }
                }
            }
        }
    }
    else {
        $.ajax({
            type: "POST",
            url: '/home/AddWorkitem/',
            data: JSON.stringify({ addWorkitemData: newitem }),
            contentType: "application/json;charset=utf-8",
            processData: true,
        success: function (response) {
            console.log(response);
            if (response.IsSuccess)
            {
                
                alert(response.successAddWorkitemMessage);
                location.href = response.redirectURL;
            }
            else
            {
                alert(response.successAddWorkitemMessage);
            }
            },
            error: function (xhr) {
                alert(xhr.responseText);
            }
        });
    }
    
}

function isTextKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 31 && charCode < 65
      && (charCode < 97 || charCode > 122))
        return false;

    return true;
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31
      && (charCode < 48 || charCode > 57))
        return false;

    return true;
}
function noDataKey(evt) {
    var charcode = (evt.which) ? evt.which : event.keyCode;
    if (charcode > 0 && charcode < 127)
        return false;

    return true;
}
