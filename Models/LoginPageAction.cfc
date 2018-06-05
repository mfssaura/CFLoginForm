<cfcomponent>
	<cffunction name = "ValidateLoginForm" returntype = "boolean" output = "false">
		<cfargument name = "Email" type = "string" required = "true">
		<cfargument name = "Password" type = "string" required = "true">
		<cfset variables.flag = true>
		<cfset variables.myArray = ArrayNew(1)>
		<cfif not isValid("email", arguments.Email)>
			<cfset variables.flag = false>
		</cfif>
		<cfif len(arguments.password) GTE 6
					AND len(arguments.password) LTE 20 >
		<cfelse>
			<cfset variables.flag = false>
		</cfif>
		<cfreturn variables.flag>
	</cffunction>

	<cffunction name = "CheckFormData" returntype = "boolean" hint = "check the form data" output="true">
		<cfargument name = "Email" type = "string" required = "true" />
		<cfargument name = "Password" type = "string" required = "true" />
		<cftry>
			<cfquery name = "request.getPwdAndSalt" datasource = "cfartgallery">
				SELECT PASSWORD, SALT
				FROM Users
				WHERE EMAILID = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#arguments.email#">
			</cfquery>
			<!--- <cfdump var = "#request.getPwdAndSalt.RecordCount#" abort = "true"> --->
			<!--- If the record exist in database --->
			<cfif request.getPwdAndSalt.RecordCount EQ 1>
				<cfif request.getPwdAndSalt.PASSWORD EQ Hash(arguments.password & request.getPwdAndSalt.SALT, "SHA-512")>
					<cfreturn true>
				<cfelse>
					<cfreturn false>
				</cfif>
			</cfif>
			<cfcatch type="any">
				<cfoutput>Database exception occured</cfoutput>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>
