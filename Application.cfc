<cfcomponent>
	<cfset This.name = "MyApplication">
	<cfset This.Sessionmanagement = true>
	<cfset This.Sessiontimeout = "#createtimespan(0, 0, 10, 0)#">
	<cfset This.applicationtimeout = "#createtimespan(5, 0, 0, 0)#">

	<cffunction name = "onApplicationStart">

	</cffunction>
	<cffunction name = "onApplicationEnd">
		<cfargument name = "ApplicationScope" required = "true" />
	</cffunction>
	<cffunction name = "onRequestStart">
	</cffunction>
</cfcomponent>