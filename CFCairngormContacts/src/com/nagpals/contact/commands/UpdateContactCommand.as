/* $Id: UpdateContactCommand.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.commands{
	
	import mx.rpc.IResponder;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.nagpals.contact.business.UpdateContactDelegate;
	import com.nagpals.contact.events.GetContactsEvent;
	import com.nagpals.contact.events.UpdateContactEvent;
	import com.nagpals.contact.model.ContactModelLocator;
	import com.nagpals.contact.vo.ContactVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	public class UpdateContactCommand implements ICommand, IResponder{
		
		private var delegate : UpdateContactDelegate;
		private var model : ContactModelLocator = ContactModelLocator.getInstance();
	   
		public function UpdateContactCommand(){
			delegate = new UpdateContactDelegate(this);
		}
	   
		public function execute( event : CairngormEvent ) : void{
			var contactEvent : UpdateContactEvent = UpdateContactEvent( event );  
			delegate.updateContact();	      
		}
		   
		public function result( event : Object ) : void{
			var getContactsEvent : GetContactsEvent = new GetContactsEvent;
			CairngormEventDispatcher.getInstance().dispatchEvent(getContactsEvent);
		}
				
		public function fault( event : Object ) : void{
			trace("ContactCommand: got fault");
		}
	}
}