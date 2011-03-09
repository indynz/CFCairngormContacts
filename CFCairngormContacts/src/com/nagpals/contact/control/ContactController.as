/* $Id: ContactController.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.control{
	
	import com.adobe.cairngorm.control.FrontController;
	import com.nagpals.contact.commands.*;
	
	public class ContactController extends FrontController{
		
		public function ContactController() {
			initialiseCommands();
		}
		
		public function initialiseCommands() : void {
			addCommand(ContactController.GET_CONTACTS, GetContactsCommand);
			addCommand(ContactController.SELECT_CONTACT, SelectContactCommand);
			addCommand(ContactController.NEW_CONTACT, NewContactCommand);
			addCommand(ContactController.UPDATE_CONTACT, UpdateContactCommand);
			addCommand(ContactController.DELETE_CONTACT, DeleteContactCommand);
		}

		/* ------------------------------------------------- */
		public static const GET_CONTACTS : String = "getContacts";
		public static const SELECT_CONTACT : String = "selectContact";
		public static const NEW_CONTACT : String = "newContact";
		public static const UPDATE_CONTACT : String = "updateContact";
		public static const DELETE_CONTACT : String = "deleteContact";
		
	}
}