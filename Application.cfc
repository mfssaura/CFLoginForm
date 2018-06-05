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
	<cffunction name="onSessionStart"> 
		<cfscript> 
		Session.started = now(); 
		Session.shoppingCart = StructNew(); 
		Session.shoppingCart.items = 0; 
		</cfscript> 
		<cflock timeout="5" throwontimeout="No" type="EXCLUSIVE" scope="SESSION"> 
			<cfset Application.sessions = Application.sessions + 1> 
		</cflock>  
	</cffunction> 


</cfcomponent>