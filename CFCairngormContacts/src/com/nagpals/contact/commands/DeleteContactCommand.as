/* $Id: DeleteContactCommand.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.commands{
	
	import mx.rpc.IResponder;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.nagpals.contact.business.DeleteContactDelegate;
	import com.nagpals.contact.events.DeleteContactEvent;
	import com.nagpals.contact.events.GetContactsEvent;
	import com.nagpals.contact.events.NewContactEvent;
	import com.nagpals.contact.model.ContactModelLocator;
	import com.nagpals.contact.vo.ContactVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	import mx.controls.Alert;
	
	public class DeleteContactCommand implements ICommand, IResponder{
		
		private var delegate : DeleteContactDelegate;
		private var model : ContactModelLocator = ContactModelLocator.getInstance();
	   
	   public function deleteContactCommand():void{
	   		delegate = new DeleteContactDelegate(this);
	   }
	   
		public function execute( event : CairngormEvent ) : void{
			var contactEvent : DeleteContactEvent = DeleteContactEvent( event );  
			delegate.deleteContact();	      
		}
		   
		public function result(  event : Object ) : void{
			CairngormEventDispatcher.getInstance().dispatchEvent(new GetContactsEvent);
			CairngormEventDispatcher.getInstance().dispatchEvent(new NewContactEvent);
		}
				
		public function fault( event : Object ) : void{
			mx.controls.Alert.show("Error in deleting contact.");
		}
	}
}