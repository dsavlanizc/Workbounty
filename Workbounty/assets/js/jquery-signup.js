$(function AddUserData() {
    $("#btnSubmit").click(function (e) {
        e.preventDefault();
        var dateofBirth = $("#DateSelect").val();
        var dateofBirthDateObject = new Date(dateofBirth);
        var userSignupData =
            {
                "FirstName": $("#FirstName").val(),
                "LastName": $("#LastName").val(),
                "DateofBirth": dateofBirthDateObject,
                "Email": $("#Email").val(),
                "PhoneNumber": $("#PhoneNumber").val(),
                "Password": $("#Password").val(),
                "InterestedKeywords": $("#InterestedKeywords").val(),
                "isActive": true
            }

        if ($("#FirstName").val() == "") {
            $("#FirstNameError").text("First Name is Required");

            if ($("#LastName").val() == "") {
                $("#LastNameError").text("Last Name is Required");

                //if ($("#DateofBirth").val() == "") {
                //    $("#DateofBirthError").text("Date Of birth is Required");

                    if ($("#Email").val() == "") {
                        $("#EmailError").text("Email is Required");

                        if ($("#PhoneNumber").val() == "") {
                            $("#PhoneNumberError").text("Phone Number is Required");

                            if ($("#Password").val() == "") {
                                $("#PasswordError").text("Password is Required");

                                if ($("#InterestedKeywords").val() == "") {
                                    $("#InterestedKeywordsError").text("Interested Keyword is Required");
                                }
                            }
                        }
                    }
                }
            }
        

        else {

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

        }

    });
    })
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31
      && (charCode < 48 || charCode > 57))
        return false;

    return true;
}

function isTextKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 31 && charCode < 65
      && (charCode < 97 || charCode > 122))
        return false;

    return true;
}

function noDataKey(evt) {
    var charcode = (evt.which) ? evt.which : event.keyCode;
    if (charcode > 0 && charcode < 127)
        return false;

    return true;
}
