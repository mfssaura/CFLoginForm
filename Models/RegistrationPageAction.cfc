<cfcomponent>
	<cffunction name = "validateRegistrationForm" returntype = "boolean" output = "true">
		<cfargument name = "firstName" type = "string" required = "true">
		<cfargument name = "middleName" type = "string" required = "false">
		<cfargument name = "lastName" type = "string" required = "true">
		<cfargument name = "gender" type = "string" required = "true">
		<cfargument name = "dateOfBirth" type = "date" required = "true">
		<cfargument name = "address" type = "string" required = "true">
		<cfargument name = "phoneNumber" type = "string" required = "true">
		<cfargument name = "email" type = "string" required = "true">
		<cfargument name = "password" type = "string" required = "true">
		<cfargument name = "confirmPassword" type = "string" required = "true">
		<cfdump var = "I am here" abort = "true">
		<cfset flag = true>
		<cfif not isValid("regex", arguments.firstName, 2, 20, "^[a-zA-Z ]*$")>
			<cfset flag = false>
			<cfoutput>
				Name contains only alphabetic characters
			</cfoutput>
		<cfelseif not (arguments.middleName == "")>
			<cfif isValid("regex", arguments.middleName, 1, 20, "^[a-zA-Z ]*$")>
				<cfset flag = false>
				<cfoutput>Name contains only alphabetic characters</cfoutput>
			</cfif>
		<cfelseif not isValid("regex", arguments.lastName, 2, 20, "^[a-zA-Z ]*$")>
			<cfset flag = false>
			<cfoutput>
				Name contains only alphabetic characters
			</cfoutput>
		<cfelseif not (arguments.gender == "male" or arguments.gender == "female")>
			<cfset flag = false>
			<cfoutput>
				Gender can only be male or female
			</cfoutput>
		<cfelseif not isValid("date", arguments.dateOfBirth)>
			<cfset flag = false>
			<cfoutput>Invalid dateOfbirth<cfoutput>
		<cfelseif not isValid("regex", arguments.address, 20, 100, "^[a-zA-Z0-9/-.]*$")>
			<cfset flag = false>
			<cfoutput>
				Enter an address of min 20 chars.
			</cfoutput>
		<cfelseif not(len(arguments.phoneNumber) EQ 10)>
			<cfset flag = false>
			<cfoutput>
				Enter a valid phone number
			</cfoutput>
		<cfelseif not isValid("email", arguments.email)>
			<cfset flag = false>
			<cfoutput>Invalid Email format</cfoutput>
		<cfelseif not(len(arguments.password) GTE 6 AND len(arguments.password) LTE 20)>
			<cfset flag = false>
			<cfoutput>Invalid Password length</cfoutput>
		<cfelseif not(len(arguments.password) GTE 6 AND len(arguments.password) LTE 20)>
			<cfset flag = false>
			<cfoutput>Invalid Password length</cfoutput>
		</cfif>
		<cfreturn flag>
	</cffunction>

	<cffunction name = "insertDataRegistrationForm" returntype = "void" output = "true">
		<cfargument name = "firstName" type = "string" required = "true">
		<cfargument name = "middleName" type = "string" required = "false">
		<cfargument name = "lastName" type = "string" required = "true">
		<cfargument name = "gender" type = "string" required = "true">
		<cfargument name = "dateOfBirth" type = "date" required = "true">
		<cfargument name = "address" type = "string" required = "true">
		<cfargument name = "phoneNumber" type = "string" required = "true">
		<cfargument name = "email" type = "string" required = "true">
		<cfargument name = "password" type = "string" required = "true">
		<cfargument name = "confirmPassword" type = "string" required = "true">

		<cfset variables.salt = Hash(GenerateSecretKey("AES"), "SHA-512") />
		<cfset variables.hashedPassword = Hash(form.Password & variables.salt, "SHA-512") />
		<!--- insert both variables.salt and variables.hashedPassword into table --->

		<cfquery name = "insertData" datasource = "cfartgallery">
			INSERT INTO Users(FIRSTNAME, MIDDLENAME, LASTNAME, GENDER, DATEOFBIRTH, ADDRESS, PHONENUMBER, EMAILID, PASSWORD, CONFIRMPASSWORD, SALT)
			VALUES ('#Form.FirstName#','#Form.MiddleName#', '#Form.LastName#', '#Form.UserGender#', '#Form.BirthDate#', '#Form.Address#', '#Form.PhoneNumber#',
			'#Form.EmailId#','#variables.hashedPassword#', '#variables.hashedPassword#', '#variables.salt#')
		</cfquery>

		<cfoutput><h2>Registered Successfully</h2></cfoutput>
	<!--- Redirect to home page --->
	<!--- <cflocation url = "/HomePage.cfm"> --->
	<cffunction>
</cfcomponent>