var radioValue;
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

    $(document).ready(function(){
        $('#Summary').bind("contextmenu",function(e){ e.preventDefault(); });
        $('#Summary').bind("cut copy paste",function(e) {
            e.preventDefault();
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
            url: '/api/AddWorkitem/',
            data: JSON.stringify(item),
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

 function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode != 46 && charCode > 31
          && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
