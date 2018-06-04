<!DOCTYPE html>
<head>
	<script src = "../Js/validateRegistrationForm.js"></script>
	<link rel="stylesheet" href = "../Css/form_style.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
</head>
<body>
	<div class = "formcontainer">
		<cfform onsubmit = "return validateForm()" method = "post">
			<table>
				<tr>
					<div class = "field">
						<td>First Name:</td>
						<td><cfinput type = "text" name = "FirstName" class = "input-field" id = "firstName" placeholder = "Enter first Name"></td>
						<td><div class = "errorfield" id = "firstNameError"></div></td>
					</div>
				</tr>
				<tr>
					<div class = "field">
						<td>Middle Name: </td>
						<td><cfinput type = "text" name = "MiddleName" class = "input-field" id = "middleName" placeholder = "Enter middle Name"></td>
						<td><div class = "errorfield" id = "middleNameError"></div></td>
					</div>
				</tr>
				<tr>
					<div class = "field">
						<td>Last Name: </td>
						<td><cfinput type = "text" name = "LastName" class = "input-field" id = "lastName" placeholder = "Enter last name"></td>
						<td><div class = "errorfield" id = "lastNameError"></div></td>
					</div>
				</tr>
				<tr>
					<div class = "field">
					<td>Gender:</td>
					<td>
						<cfselect name = "UserGender" class = "input-field" id = "UserGender" multiple = "no">
							<option value = "male" id = "male" selected>Male</option>
							<option value = "female" id = "female">Female</option>
						</cfselect>
					</td>
					<td><div class = "errorfield" id = "genderError"></div></td>
					</div>
				</tr>
				<tr>
					<div class = "field">
					<td>Date of birth:</td>
						<td><cfinput type = "date" name = "BirthDate" class = "input-field" id = "birthDate"></td>
					<td><div class = "errorfield" id = "dateOfBirthError"></div></td>
					</div>
				</tr>
				<tr>
					<div class = "field">
						<td>Address</td>
						<td><cfinput type = "text" name = "Address" class = "input-field" id = "address"></td>
						<td><div class = "errorfield" id = "addressError"></div></td>
					</div>
				</tr>
				<tr>
					<div class = "field">
						<td>Phone Number:</td>
						<td><cfinput type = "text" name = "PhoneNumber" class = "input-field" id = "phoneNumber"></td>
						<td><div class = "errorfield" id = "phoneNumberError"></div></td>
					</div>
				</tr>
				<tr>
					<div class = "field">
						<td>Email Id:</td>
						<td><cfinput type = "text" name = "EmailId" class = "input-field" id = "emailId"></td>
						<td><div class = "errorfield" id = "emailIdError"></div></td>
					</div>
				</tr>
				<tr>
		 			<div id = "field">
		 				<td>Password:</td>
		 				<td><cfinput type = "password" name = "Password" class = "input-field" id = "password"></td>
						<td><div class = "errorfield" id = "passwordError"></div></td>
		 			</div>
		 		</tr>
		 		<tr>
		 			<div class = "field">
		 				<td>Confirm Password:</td>
		 				<td><cfinput type = "password" name = "ConfirmPassword" class = "input-field" id = "confirmPassword"></td>
		 				<td><div class = "errorfield" id = "confirmPasswordError"></div></td>
		 			</div>
		 		</tr>
				<tr>
					<td><cfinput type = "submit" name = "SaveChanges" class = "form-submit-button" value = "Submit"></td>
				</tr>
			</table>
		</cfform>
	</div>

		<cfif isDefined("form.SaveChanges") >

			<cfset formData = CreateObject("Component", "Models.RegistrationPageAction") >
			<cfset isValid = formData.validateRegistrationForm()>
			<cfif isValid EQ "true">
				<cfset formDataInserted = formData.insertDataRegistrationForm(argumentCollection="form")>
				<cfif formDataInserted EQ true>
					<cflocation url = "LoginPage.cfm" addtoken = "false">
				<cfelse>
					<h5>Opps! Please check all the fields</h5>
			</cfif>
		<cfelse>
			<cfoutput>#isValid#</cfoutput>
		</cfif>
	</cfif>
</body>