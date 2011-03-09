/* $Id: GetContactsCommand.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.commands{
	
	import mx.rpc.IResponder;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.nagpals.contact.business.GetContactsDelegate;
	import com.nagpals.contact.events.GetContactsEvent;
	import com.nagpals.contact.model.ContactModelLocator;
	import com.nagpals.contact.vo.ContactVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	import mx.controls.Alert;
	
	public class GetContactsCommand implements ICommand, IResponder{
		
		private var delegate : GetContactsDelegate;
		private var model : ContactModelLocator = ContactModelLocator.getInstance();
	   
	   public function GetContactsCommand(){
	   		delegate = new GetContactsDelegate(this);
	   }
	   
		public function execute( event : CairngormEvent ) : void{
			var contactEvent : GetContactsEvent = GetContactsEvent( event );  
			delegate.getContacts();	      
		}
		   
		public function result( event : Object) : void{
			model.contactVOList = event as ArrayCollection;
		}
				
		public function fault( event : Object ) : void{
			mx.controls.Alert.show("Error in getting contacts.");
		}
	}
}