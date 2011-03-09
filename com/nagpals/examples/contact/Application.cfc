<cfcomponent>

	<cfset this.name 				= "contact">
	<cfset this.sessionmanagement 	= "true">
	
	<cffunction access="public" name="onSessionStart" output="false" description="Do all this when a session starts up.">
		<cfset createObject("component","com.nagpals.examples.contact.Contact").init()>
		<cfset session.initialized = true>
	</cffunction>
	
	<cffunction access="public" name="onRequestStart" output="false" description="Do all this when a request starts up.">
	
		<cfif structKeyExists(url,"reinit")>
			<cfset structDelete(session,"initialized")>
			<cfset structDelete(session,"qContacts")>
			<cfset onSessionStart()>
		</cfif>

	</cffunction>

</cfcomponent>


<!--- Old Application.cfm code. Ignore this.
<cfapplication name="contact" sessionmanagement="yes">

<cfif structKeyExists(url,"reinit")>
	<cfset structDelete(session,"initialized")>
	<cfset structDelete(session,"qContacts")>
</cfif>

<cfif not structKeyExists(session,"initialized")>
	<cfset createObject("component","contact.Contact").init()>
</cfif>
 --->
