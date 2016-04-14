
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Registration</title>
    </head>
    <style>
        div.a {
            margin-left: auto;
            margin-right: auto;
            width: 500px;
        }
    </style>

    <script type="text/javascript">
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
                document.reg.pw.focus();
                document.reg.pw.select();
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
            if (document.reg.gender.selectedIndex === 0){
                alert("You must select a gender!");
                return false;
            }
            return true;
        }
        
        function validEmail() {
            var email = document.reg.email.value;
            var cemail = document.reg.cemail.value;
            if(email !== cemail) {
                alert("Emails don't match!");
                return false;
            }
            return true;
        }
        
        function validPassword() {
            var pw = document.reg.pw.value;
            var username = document.reg.username.value;
            if(username === pw) {
                alert("Username and password can't be the same!");
                return false;
            }
            var email = document.reg.email.value;
            if (email === pw) {
                alert("Email and password can't be the same!");
                return false;
            }
            var cpw = document.reg.cpw.value;
            if (pw !== cpw) {
                alert("Passwords don't match!");
                return false;
            }
            return true;
        }
    </script>
    <body>
        <h1 align="center">Enter your details below</h1>
        <br>
        <div class="a">
            <form autocomplete="off" name="reg" action=" " method="get" onsubmit="return checkForm()">
                <div class="form-group">
                    <input align="center" type="text" class="form-control" id="username" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <select class="form-control" id="gender">
                        <option>Select Gender</option>
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" id="email" placeholder="Email" required>
                </div>
                <div class="form-group">
                    <input type="cemail" class="form-control" id="cemail" placeholder="Confirm Email" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="pw" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="cpw" placeholder="Confirm password" required>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
                <button type="reset" class="btn btn-default">Reset</button>
            </form>
        </div>
    </body>
</html>
