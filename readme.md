A Note
======

This project was setup in August 2007 on Google Code. I've just moved it to GitHub. The project has not been updated since then.

But have a peak at the code and it should still be useful.

What is CFCairngormContacts
===========================


Installation
============
For Version 1.0 (uses Cairngorm .99)

(Originally posted on my blog: http://nagpals.com/posts/a-simple-contact-manager-a-flex-cairngorm-application/)

1. Download and Unzip [CFCairngormContacts.zip](http://nagpals.com/wp-content/uploads/2010/12/CFCairngormContacts.zip) in the webroot of your ColdFusion server. This will create two folders:

    * CFCairngormContacts (containing the Flex code for the application and Cairngorm 2.0 SWC)
    * com (which contains ColdFusion code) 

2. Check ColdFusion backend by browsing to: http://yourserver/com/nagpals/examples/contact/index.cfm.

    If you see a couple of dumps and a message saying "Successfully retrieved contact list", ColdFusion is setup correctly. 

    If not, then you need to make sure this works first. 

3. Set up the app in Flex Builder.

   1. Create a new Flex project in Flex Builder. 

    2. Select "ColdFusion Flash Remoting Service" 

    3. Specify Root Folder as the the filesystem path to the ColdFusion server webroot. In my case: D:\JRun4\servers\cfusion\cfusion-ear\cfusion-war\ 

    4. Specify Root URL as the URL to the ColdFusion server. In my case: http://localhost:8300/ 

    5. Specify Project Name: CFCairngormContacts 

    6. For Project Contents, uncheck the "Use default location" and select the location as the filesystem path to the ColdFusion server webroot. In my case: D:\JRun4\servers\cfusion\cfusion-ear\cfusion-war\ 

    7. Add a SWC to the project by going to Project > Properties > Flex Build Path > Library Path (tab) > Add SWC. Select the Cairngorm.swc in /CFCairngormContacts/com/adobe/cairngorm directory. 

    8. Also make sure that the Flex Compiler arguments are setup to look at the correct services-config.xml. Project > Properties > Flex Compiler. The arguments are specified in the "Additional compiler arguments" field. In my case they read: -services "D:\JRun4\servers\cfusion\cfusion-ear\cfusion-war\WEB-INF\flex\services-config.xml" -locale en_US 

    9. Run the application and you should see the Contact Manager load up in a browser. 