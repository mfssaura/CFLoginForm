<cfcomponent>
	<cfset This.name = "MyApplication">
	<cfset This.Sessionmanagement = true>
	<cfset This.Sessiontimeout = "#createtimespan(0, 0, 10, 0)#">
	<cfset This.applicationtimeout = "#createtimespan(5, 0, 0, 0)#">

	<cffunction name = "onApplicationStart">
	</cffunction>

	<cffunction name = "onApplicationEnd">
	</cffunction>

	<cffunction name = "onRequestStart">
	</cffunction>

	<cffunction name = "onSessionStart"> 
		<cfscript> 
			Session.started = now(); 
			Session.shoppingCart = StructNew(); 
			Session.shoppingCart.items = 0; 
		</cfscript>  
		<cflog file = "#This.Name#" type = "Information" text = "Session: #Session.sessionid# started"> 
	</cffunction> 

	<cffunction name = "onSessionEnd"> 
		<cfargument name = "SessionScope" required = true/> 
		<cflog file = "#This.Name#" type = "Information" text = "Session: #arguments.SessionScope.sessionid# ended"> 
	</cffunction> 


</cfcomponent>