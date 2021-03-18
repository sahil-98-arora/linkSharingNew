<!DOCTYPE html>
<html>
<title>Simple Sign up from</title>
<head>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <style>
    html, body {
        display: flex;
        justify-content: center;
        font-family: Roboto, Arial, sans-serif;
        font-size: 15px;
    }
    form {
        border: 5px solid #f1f1f1;
    }
    input[type=text], input[type=password], input[type=number] {
        width: 100%;
        padding: 16px 8px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    .icon {
        font-size: 110px;
        display: flex;
        justify-content: center;
        color: #4286f4;
    }
    .button {
        background-color: #4286f4;
        color: white;
        padding: 14px 0;
        margin: 10px 0;
        border: none;
        cursor: grab;
        width: 100%;
    }
    h1 {
        text-align:center;
        fone-size:18;
    }
    .button:hover {
        opacity: 0.8;
    }
    .formcontainer {
        text-align: center;
        margin: 24px 50px 12px;
    }
    .container {
        padding: 16px 0;
        text-align:left;
    }
    span.psw {
        float: right;
        padding-top: 0;
        padding-right: 15px;
    }
    .postImage{
        width: 100px;
        height: 100px;
        border: 1px solid black;
        float: left;
    }

    .pImage{
        max-width:100%;
        max-height:100%;
        display: block;
    }
    /* Change styles for span on extra small screens */
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
    </style>
</head>
<body>
%{--<form action="/action_page.php">--}%
<g:form  controller="user" action="otpVerify">
    <h1>${user.email}</h1>
    <div class="icon">
        <div class="postImage" style="width: 150px; height: 150px; margin-right: 10px; margin-top: 10px;">
            <g:img dir="images/profilePic" class="pImage" file='${user.photo}' alt="Missing Image" />
        </div>
    </div>
    <div class="formcontainer">
        <div class="container">

            <label for="otp"><strong>OTP</strong></label>
            <input type="number" placeholder="Enter OTP" name="otp" id="otp"  min="1000" max="9999" autocomplete="off" required><br>
            <label for="password"><strong>E-mail</strong></label>
            <input type="password" placeholder="Enter password" name="password" id="password" autocomplete="off"  required>
            <label for="confirmPassword"><strong>Confirm Password</strong></label>
            <input type="password" placeholder="Confirm Password" name="confirmPassword" id="confirmPassword" autocomplete="off" required>
            <g:hiddenField name="email" value="${user.email}"></g:hiddenField>
        </div>
        <strong><g:actionSubmit value="Reset Password" action="otpVerify" class="button"/></strong>
</g:form>

</body>
</html>