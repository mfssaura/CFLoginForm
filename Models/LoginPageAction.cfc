<cfcomponent>

	<cffunction name = "validateLoginForm" returntype = "boolean" output = "false">
		<cfargument name = "email" type = "string" required = "true">
		<cfargument name = "password" type = "string" required = "true">
		<cfset flag = true>
		<cfset myArray = ArrayNew(1)>
		<cfif not isValid("email", arguments.email)>
			<cfset flag = false>
		</cfif>
		<cfif len(arguments.password) GTE 6
					AND len(arguments.password) LTE 20 >
		<cfelse>
			<cfset flag = false>
		</cfif>
		<cfreturn flag>
	</cffunction>

	<cffunction name = "checkFormData" returntype = "boolean" output="true">
		<cfargument name = "email" type = "string" required = "true" />
		<cfargument name = "password" type = "string" required = "true" />
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
