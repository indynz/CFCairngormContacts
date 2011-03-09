/* $Id: GetContactsEvent.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.events{
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.nagpals.contact.vo.ContactVO;
	import com.nagpals.contact.control.ContactController;
	
	import mx.collections.ArrayCollection;
	
	public class GetContactsEvent extends CairngormEvent {
		
		public function GetContactsEvent(){
			super(ContactController.GET_CONTACTS);
		}

	}	
}