$(document).ready(function () {
    $("form").submit(function (event) {

        $('.response-message').hide();
        if ($('#uname').val() == "" && $('#pword').val() == "") {
            $('.response-content').fadeIn();
            $('.response-content').addClass('alert-danger');
            $('.response-content').html(" <strong>Sorry!</strong>  we couldn't find and account because username and password are blank.");
            $('.response-content').fadeIn(1500).delay(1500).fadeOut(400);
            $("#loginshake").effect("shake");
            event.preventDefault();
            return false;
        }
        if ($('#uname').val() == "") {
            $('.response-content').fadeIn();
            $('.response-content').addClass('alert-success');
            $('.response-content').html("  Successfully inserted User details of Chamil.");
            $('.response-content').fadeIn(1500).delay(1500).fadeOut(400);
            $("#loginshake").effect("shake");
            event.preventDefault();
            return false;

        }
        if ($('#pword').val() == "") {
            $('.response-content').fadeIn();
            $('.response-content').addClass('alert-danger');
            $('.response-content').html(" <strong>Sorry!</strong>  The field 'password' cannot be left blank.");
            $('.response-content').fadeIn(1500).delay(1500).fadeOut(400);
            $("#loginshake").effect("shake");
            event.preventDefault();
            return false;
        }

    });


});