<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Use Contact Component</title>
</head>

<body>

<cfdump var="#session#">
<cfset oContact = createObject("component","com.nagpals.examples.contact.Contact")>
<cfset qContacts = oContact.get()>

<cfdump var="#qContacts#">

<h2>Successfully retrieved contact list.</h2>
</body>
</html>
