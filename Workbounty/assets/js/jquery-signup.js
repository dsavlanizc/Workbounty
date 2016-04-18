﻿$(function () {
    $("#btnSubmit").click(function (e) {
        e.preventDefault();
      
         var userSignupData = {
            "FirstName": $("#FirstName").val(),
            "LastName": $("#LastName").val(),
            "DateofBirth": $("#DateSelect").val().toLocaleString().substring(0, 10),
            "Email": $("#Email").val(),
            "PhoneNumber": $("#PhoneNumber").val(),
            "Password": $("#Password").val(),
            "InterestedKeywords": $("#InterestedKeywords").val(),
            "isActive": true
        };

        
     
        $.ajax({
            url: "/Home/Signup/",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(userSignupData),
            dataType: "json",
            success: function (getResponseOfSignupData) {
            if (getResponseOfSignupData == "Success") {
                    var url = "/home/dashboard/"
                    document.location.href = url;
                }
                else {
                    alert("Signup Fail");
                }

            },
                error: function (x, e) {
                alert("Error");
            }
        });
         
    });
});


