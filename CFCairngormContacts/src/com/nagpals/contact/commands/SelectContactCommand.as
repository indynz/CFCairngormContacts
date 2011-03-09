/* $Id: SelectContactCommand.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.commands{
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.nagpals.contact.events.SelectContactEvent;
	import com.nagpals.contact.model.ContactModelLocator;
	import com.nagpals.contact.vo.ContactVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	public class SelectContactCommand implements ICommand{
		
		private var model : ContactModelLocator = ContactModelLocator.getInstance();
		
		public function SelectContactCommand():void{
		}
	   
		public function execute( event : CairngormEvent ) : void{
			var newContactVO : ContactVO = new ContactVO;
			var contact : SelectContactEvent 	= SelectContactEvent( event );
			
			newContactVO.email 					= contact.selectedContact.email;
			newContactVO.firstName 				= contact.selectedContact.firstName;
			newContactVO.lastName 				= contact.selectedContact.lastName;
			newContactVO.id 					= contact.selectedContact.id;
			
			model.contactVO 					= newContactVO;
		}
		   
	}
}