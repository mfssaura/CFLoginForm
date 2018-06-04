<!DOCTYPE html>
<head>
	<srcipt src = "">
</head>
<body>
	<h1>Login</h1>
	<!--- Login form --->
	<cfform>
		<table>
			<tr>
				<div class = "field">
					<td>Email Id:</td>
					<td><cfinput type = "text" name = "emailId" id = "emailId"></td>
				</div>
			</tr>
			<tr>
	 			<div class = "field">
	 				<td>Password:</td>
	 				<td><cfinput type = "password" name = "password" id = "password"></td>
	 			</div>
	 		</tr>
			<tr>
				<td><cfinput type = "submit" name = "submit" id = "submit" value = "Login"></td>
			</tr>
		</table>
	</cfform>

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