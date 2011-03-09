<!---
	Name         : Contact
	Author       : Indiver Nagpal 
	Created      : August 15, 2006
	Last Updated : September 1, 2006
	History      : Reset history for version 5.0
	Purpose		 : 	This component contains CRUD functions for working with a contacts database.
					In real life you would persist the information in a database rather than session, 
					as this component does.
--->

<cfcomponent displayname="Contact" hint="Contact component created for CFCairngormContacts Flex project">

	<cfproperty name="id" 			type="string" hint="The id for a contact. Defaults to the unique UUID." required="yes">
	<cfproperty name="firstName" 	type="string" hint="The firstName of a contact." 													required="yes">
	<cfproperty name="lastName" 	type="string" hint="The lastName of a contact." 													required="yes">
	<cfproperty name="email" 		type="string" hint="The email of a contact." 														required="yes">


	<cffunction name="init" access="public" returntype="any" hint="Initializes the Contacts component and returns an instance of it. The init method must be called before using the component.">
		<cfif not structKeyExists(session,"initialized")>
			<cfset session.initialized 	= true>
			<cfset session.qContacts 	= queryNew("id,firstName,lastName,email")>

			<!--- On initialization we add the following contacts to a query in the session scope --->
			<cfset add(firstName="Luke",		lastName="Skywalker",	email="luke@starwars.com")>
			<cfset add(firstName="Obiwan",		lastName="Kenobi",		email="oldben@starwars.com")>
			<cfset add(firstName="Jean Luc",	lastName="Piccard",		email="jlp@startrek.com")>
			<cfset add(firstName="James",		lastName="Kirk",		email="jk@startrek.com")>
		</cfif>
		
		<cfreturn this>
	</cffunction>
	
	<cffunction name="add" access="public" returntype="query" hint="Adds a contact.">
		<cfargument name="id" 			type="string" required="no"		default="#createUUID()#">
		<cfargument name="firstName" 	type="string" required="yes">
		<cfargument name="lastName" 	type="string" required="yes">
		<cfargument name="email" 		type="string" required="yes">
		
		<!--- Add a contact directly into a query in the session scope --->
		<cfset queryAddRow(session.qContacts,1)>
		<cfset querySetCell(session.qContacts,"id",			arguments.id, 			session.qContacts.recordCount)>
		<cfset querySetCell(session.qContacts,"firstName", 	arguments.firstName, 	session.qContacts.recordCount)>
		<cfset querySetCell(session.qContacts,"lastName", 	arguments.lastName, 	session.qContacts.recordCount)>
		<cfset querySetCell(session.qContacts,"email", 		arguments.email, 		session.qContacts.recordCount)>

		<cfreturn get(id=arguments.id)>
	
	</cffunction>
	
	<cffunction name="get" access="public" returntype="query" hint="Gets a contact. If no arguments are specified, all contacts are return. If one or more arguments are specified, the query returned contains only those records that match the arguments.">
		<cfargument name="id" 			type="string" required="no"		default="">
		<cfargument name="firstName" 	type="string" required="no" 	default="">
		<cfargument name="lastName" 	type="string" required="no"		default="">
		<cfargument name="email" 		type="string" required="no"		default="">
		
		<cfset var qReturn 		= queryNew("id,firstName,lastName,email")>
		<cfset var qMaster		= session.qContacts>
		
		<!--- Get all the contacts from the query in session --->
		<cfquery name="qReturn" dbtype="query">
			SELECT 		*
			FROM 		qMaster
			WHERE 		1 = 1
			<cfif len(trim(arguments.id))>
				AND		qMaster.id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_VARCHAR" maxlength="35">
			</cfif>
			<cfif len(trim(arguments.firstName))>
				AND		qMaster.firstName = <cfqueryparam value="#arguments.firstName#" cfsqltype="CF_SQL_VARCHAR" maxlength="50">
			</cfif>
			<cfif len(trim(arguments.lastName))>
				AND		qMaster.lastName = <cfqueryparam value="#arguments.lastName#" cfsqltype="CF_SQL_VARCHAR" maxlength="50">
			</cfif>
			<cfif len(trim(arguments.email))>
				AND		qMaster.email = <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">
			</cfif>
			Order by firstName, lastName
		</cfquery>

		<cfreturn qReturn>
	</cffunction>
	
	<cffunction name="update" access="public" returntype="boolean" hint="Updates a contact.">
		<cfargument name="firstName" 	type="string" required="yes">
		<cfargument name="lastName" 	type="string" required="yes">
		<cfargument name="email" 		type="string" required="yes">
		<cfargument name="id" 			type="string" required="no" default="#createUUID()#">

		<cfset var qReturn 		= queryNew("id,firstName,lastName,email")>
		<cfset var qMaster		= get(id=arguments.id)>

		<cfif qMaster.recordCount>		
			<cfset remove(id=arguments.id)>
			<cfset add(argumentCollection=arguments)>
		<cfelse>
			<cfset add(argumentCollection=arguments)>
		</cfif>
		
		<!--- <cfset dump(variableToDump = arguments)> --->
		
		<cfreturn true>
	</cffunction>

	<!--- Intially this method was called 'delete'. The Flex <remoteobject> call was failing on that for some reason. --->
	<cffunction name="remove" access="public" returntype="query" hint="Removes a contact.">
		<cfargument name="id" 			type="string" required="yes">

		<cfset var qReturn = get()>

		<cfif qReturn.recordCount>		
			<cfquery name="qReturn" dbtype="query">
				SELECT		*
				FROM		qReturn
				WHERE		id <> '#arguments.id#'
			</cfquery>
			<cfset session.qContacts = qReturn>
		</cfif>
		
		<cfreturn qReturn>
	</cffunction>

	<!--- Dumps variables passed to this function into a file. Used for debugging remote calls --->
	<cffunction access="public" name="dump" output="false" returntype="boolean" description="Dumps arguments passed into a file. Used for debugging remote calls">
		<cfargument name="variableToDump" type="struct" required="yes" hint="Variable to dump.">
		<cfargument name="fileToDumpTo" type="string" required="no" default="#expandPath('/com/nagpals/examples/contact/dump.html')#" hint="Absolute path of the file to which to dump variables.">

		<cfset var sArgs = "">
		<cfsavecontent variable="sArgs">
			<cfdump var="#arguments.variableToDump#">
		</cfsavecontent>
		
		<cffile action="write" addnewline="yes" file="#arguments.fileToDumpTo#" output="#sArgs#" fixnewline="no">

		<cfreturn true>
		
	</cffunction>

</cfcomponent>