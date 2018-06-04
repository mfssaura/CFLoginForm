<head>
	<script src = "../Js/validateRegistrationForm.js"></script>
	<link rel="stylesheet" href = "../Css/form_style.css">
</head>
<cfform onsubmit = "return validateForm()" method = "post">
	<table>
		<tr>
			<div class = "field">
				<td>First Name:</td>
				<td><cfinput type = "text" name = "FirstName" id = "firstName" placeholder = "Enter first Name"></td>
				<td><div class = "field" id = "firstNameError"></div></td>
			</div>
		</tr>
		<tr>
			<div class = "field">
				<td>Middle Name: </td>
				<td><cfinput type = "text" name = "MiddleName" id = "middleName" placeholder = "Enter middle Name"></td>
				<td><div class = "field" id = "middleNameError"></div></td>
			</div>
		</tr>
		<tr>
			<div class = "field">
				<td>Last Name: </td>
				<td><cfinput type = "text" name = "LastName" id = "lastName" placeholder = "Enter last name"></td>
				<td><div class = "field" id = "lastNameError"></div></td>
			</div>
		</tr>
		<tr>
			<div class = "field">
			<td>Gender:</td>
			<td>
				<cfselect name = "UserGender" id = "UserGender" multiple = "no">
					<option value = "male" id = "male" selected>Male</option>
					<option value = "female" id = "female">Female</option>
				</cfselect>
			</td>
			<td><div class = "field" id = "genderError"></div></td>
			</div>
		</tr>
		<tr>
			<div class = "field">
			<td>Date of birth:</td>
			<td><cfinput type = "date" name = "BirthDate" id = "birthDate"></td>
			<td><div class = "field" id = "dateOfBirthError"></div></td>
			</div>
		</tr>
		<tr>
			<div class = "field">
				<td>Address</td>
				<td><cfinput type = "text" name = "Address" id = "address"></td>
				<td><div class = "field" id = "addressError"></div></td>
			</div>
		</tr>
		<tr>
			<div class = "field">
				<td>Phone Number:</td>
				<td><cfinput type = "text" name = "PhoneNumber" id = "phoneNumber"></td>
				<td><div class = "field" id = "phoneNumberError"></div></td>
			</div>
		</tr>
		<tr>
			<div class = "field">
				<td>Email Id:</td>
				<td><cfinput type = "text" name = "EmailId" id = "emailId"></td>
				<td><div class = "field" id = "emailIdError"></div></td>
			</div>
		</tr>
		<tr>
 			<div id = "field">
 				<td>Password:</td>
 				<td><cfinput type = "password" name = "Password" id = "password"></td>
				<td><div class = "field" id = "passwordError"></div></td>
 			</div>
 		</tr>
 		<tr>
 			<div class = "field">
 				<td>Confirm Password:</td>
 				<td><cfinput type = "password" name = "ConfirmPassword" id = "confirmPassword"></td>
 				<td><div class = "field" id = "confirmPasswordError"></div></td>
 			</div>
 		</tr>
		<tr>
			<td><cfinput type="submit" name = "SaveChanges" value = "Submit"></td>
		</tr>
	</table>
</cfform>

<cfif isDefined("form.submit") >
	<cfset formData = CreateObject("Component", "Models.RegistrationPageAction") >
	<cfdump var = "I am here" abort = "true">
	<cfset isValid = formData.validateRegistrationForm(firstname = "#form.FirstName#", middlename = "#form.MiddleName#", lastname = "#form.LastName#",
					 gender = "#form.UserGender#", dateofbirth = "#form.BirthDate#", address = "#form.Address#", phonenumber = "#form.PhoneNumber#", email = "#form.EmailId#",
					 password = "#form.Password#", confirmpassword = "#form.ConfirmPassword#")>
	<cfif isValid EQ true>
		<cfset formDataInserted = formData.insertDataRegistrationForm(firstname = "#form.FirstName#", middlename = "#form.MiddleName#", lastname = "#form.LastName#",
					 gender = "#form.UserGender#", dateofbirth = "#form.BirthDate#", address = "#form.Address#", phonenumber = "#form.PhoneNumber#", email = "#form.EmailId#",
					 password = "#form.Password#", confirmpassword = "#form.ConfirmPassword#")>
		<cfif userDataInserted EQ true>
			<cflocation url = "LoginPage.cfm" addtoken = "false">
		<cfelse>
			<h5>Opps! Please check all the fields</h5>
		</cfif>
	<cfelse>
		<h5>Validation Failure</h5>
	</cfif>
</cfif>