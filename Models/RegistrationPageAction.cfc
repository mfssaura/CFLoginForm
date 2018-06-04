<cfcomponent>
	<cffunction name = "validateRegistrationForm" returntype = "string" output = "true">
		<!--- <cfdump var="#FORM#" abort="yes"> --->
		<cfif not isValid("regex", form.FirstName, "^[a-zA-Z]*$")>
			<cfreturn "Invalid First Name">
		<cfelseif form.MiddleName NEQ "" and not isValid("regex", form.MiddleName, "^[a-zA-Z]*$")>
			<cfreturn "Invalid Middle Name">
		<cfelseif not isValid("regex", form.LastName, "^[a-zA-Z]*$")>
			<cfreturn "Invalid Last Name">
		<cfelseif not (form.UserGender EQ "male" or form.UserGender EQ "female")>
			<cfreturn "Invalid Gender">
		<cfelseif not isValid("date", form.BirthDate)>
			<cfreturn "Invalid DateOfBirth">
		<cfelseif not(len(form.Address) GTE 10 AND len(form.Address) LTE 100)>
			<cfreturn "Invalid Address">
		<cfelseif not(len(form.PhoneNumber) EQ 10)>
			<cfreturn "Invalid Phone Number">
		<cfelseif not isValid("email", form.EmailId)>
			<cfreturn "Invalid Email">
		<cfelseif not(len(form.Password) GTE 6 AND len(form.Password) LTE 20)>
			<cfreturn "Invalid Password">
		<cfelseif not(len(form.ConfirmPassword) GTE 6 AND len(form.ConfirmPassword) LTE 20)>
			<cfreturn "Invalid Confirm password">
		</cfif>
		<cfreturn "true">
	</cffunction>

	<cffunction name = "insertDataRegistrationForm" returntype = "boolean" output = "true">
		<!--- <cfargument name = "firstName" type = "string" required = "true"> --->
<!--- 		<cfargument name = "middleName" type = "string" required = "false"> --->
<!--- 		<cfargument name = "lastName" type = "string" required = "true"> --->
<!--- 		<cfargument name = "gender" type = "string" required = "true"> --->
<!--- 		<cfargument name = "dateOfBirth" type = "date" required = "true"> --->
<!--- 		<cfargument name = "address" type = "string" required = "true"> --->
<!--- 		<cfargument name = "phoneNumber" type = "string" required = "true"> --->
<!--- 		<cfargument name = "email" type = "string" required = "true"> --->
<!--- 		<cfargument name = "password" type = "string" required = "true"> --->
<!--- 		<cfargument name = "confirmPassword" type = "string" required = "true"> --->

		<cfset variables.salt = Hash(GenerateSecretKey("AES"), "SHA-512") />
		<cfset variables.hashedPassword = Hash(form.Password & variables.salt, "SHA-512") />
		<!--- insert both variables.salt and variables.hashedPassword into table --->

		<cfquery name = "insertData" datasource = "cfartgallery">
			INSERT INTO Users(FIRSTNAME, MIDDLENAME, LASTNAME, GENDER, DATEOFBIRTH, ADDRESS, PHONENUMBER, EMAILID, PASSWORD, CONFIRMPASSWORD, SALT)
			VALUES ('#Form.FirstName#','#Form.MiddleName#', '#Form.LastName#', '#Form.UserGender#', '#Form.BirthDate#', '#Form.Address#', '#Form.PhoneNumber#',
			'#Form.EmailId#','#variables.hashedPassword#', '#variables.hashedPassword#', '#variables.salt#')
		</cfquery>

		<cfreturn true>
	</cffunction>
</cfcomponent>