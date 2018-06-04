<!DOCTYPE html>
<head>
	<script src = "../Js/validateLoginPage.js"></script>
	<link rel = "stylesheet" href = "../Css/login_page_style.css"/>
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
</head>
<body>
	<div class = "formcontainer">
	<!--- Login form --->
		<h5><u>Login</u></h5>
		<cfform onsubmit = "return validateFormData()" method = "post">
			<table>
				<tr>
					<div class = "field">
						<td>Email Id:</td>
						<td><cfinput type = "text" name = "emailId" class = "input-field" id = "emailId"></td>
						<td><div class = "errorfield" id = "emailIdError"></div></td>
					</div>
				</tr>
				<tr>
					<div class = "field">
						<td>Password:</td>
						<td><cfinput type = "password" name = "password" class = "input-field" id = "password"></td>
						<td><div class = "errorfield" id = "passwordError"></div></td>
					</div>
				</tr>
				<tr>
					<td><cfinput type = "submit" name = "submit" class = "form-submit-button" id = "submit" value = "Login"></td>
				</tr>
			</table>
		</cfform>
	</div>

	<cfif isDefined("form.submit")>
		<cfset formData = CreateObject("Component", "Models.LoginPageAction") />
		<cfset validationStatus = formData.validateLoginForm(email = "#form.emailId#", password = "#form.password#") />
			<cfif validationStatus EQ true>
				<cfset userFormData = formData.checkFormData(email = "#form.emailId#", password = "#form.password#") />

				<cfif userFormData EQ true>
					<cflocation url = "HomePage.cfm" addtoken = "false">
				<cfelse>
					<h5>Opps! Email or Password is incorrect, Please provide the correct details</h5>
					<h6>New User?</h6>
					<a href = "RegistrationPageAction.cfm">Click here to go to the registation page</a>
					<h6>Click here to Login</h6>
					<a href = "LoginPage.cfm">Click here to login</a>
				</cfif>
			<cfelse>
				<cfoutput>Validation Failure</cfoutput>
			</cfif>
	</cfif>

	<!---  Link to Signup page --->
	<h4>New User?</h4>
	<a href = "RegistrationPage.cfm">Register Here</a>
</body>
</html>