/* $Id: NewContactCommand.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.commands{
	
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.nagpals.contact.events.SelectContactEvent;
	import com.nagpals.contact.model.ContactModelLocator;
	import com.nagpals.contact.vo.ContactVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	public class NewContactCommand implements Command{
		
		private var model : ContactModelLocator = ContactModelLocator.getInstance();
	   
		public function execute( event : CairngormEvent ) : void{
			
			model.contactVO = new ContactVO;
		
		}
		   
	}
}