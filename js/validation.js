
function checkForm() {

    if (!validUsername()) {
        document.reg.username.focus();
        document.reg.username.select();
        return false;
    }

    if (!validGender()) {
        return false;
    }

    if (!validEmail()) {
        document.reg.email.focus();
        document.reg.email.select();
        return false;
    }

    if (!validPassword()) {
        document.reg.password.focus();
        document.reg.password.select();
        return false;
    }
    return true;
}

function validUsername() {
    var username = document.reg.username.value;
    if (username.length < 4) {
        alert("Username must be at least 4 characters long!");

        return false;
    }
    if (/[^a-zA-Z0-9]/.test(username)) {
        alert("Username must be alphanumeric");
        return false;
    }
    return true;
}

function validGender() {
    if (document.reg.gender.selectedIndex === 0) {
        alert("You must select a gender!");
        return false;
    }
    return true;
}

function validEmail() {
    var email = document.reg.email.value;
    var cemail = document.reg.cemail.value;
    if (email !== cemail) {
        alert("Emails don't match!");
        return false;
    }
    return true;
}

function validPassword() {
    var pw = document.reg.password.value;
    var username = document.reg.username.value;
    if (username == pw) {
        alert("Username and password can't be the same!");
        return false;
    }
    var email = document.reg.email.value;
    if (email == pw) {
        alert("Email and password can't be the same!");
        return false;
    }
    var cpw = document.reg.cpassword.value;
    if (pw != cpw) {
        alert("Passwords don't match!");
        return false;
    }
    return true;
}