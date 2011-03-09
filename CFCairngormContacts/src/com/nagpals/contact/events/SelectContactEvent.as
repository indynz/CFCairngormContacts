/* $Id: SelectContactEvent.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.events{
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.nagpals.contact.vo.ContactVO;
	import com.nagpals.contact.control.ContactController;
	
	import mx.collections.ArrayCollection;
	
	public class SelectContactEvent extends CairngormEvent {

		// we are passing the whole event with the data about the contact to be selected
		public var selectedContact : Object;

		public function SelectContactEvent(selectedContact:Object){
			super(ContactController.SELECT_CONTACT);
			this.selectedContact = selectedContact;
		}

	}	
}