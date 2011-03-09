/* $Id: GetContactsDelegate.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.business{
	
	import mx.rpc.IResponder;
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.nagpals.contact.vo.ContactVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	import mx.utils.ObjectUtil;
	
	public class GetContactsDelegate implements IResponder{
		
		private var responder : IResponder;
		private var service : RemoteObject;
		private var saveContacts : ArrayCollection
				
		public function GetContactsDelegate(responder : IResponder) {
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getRemoteObject("contactService");
		}
		
		public function getContacts() : void {
			var token : AsyncToken = service.get();
			token.addResponder(this);
		}
		
		public function result(info:Object) : void {
			var result:ArrayCollection = new ArrayCollection (info.message.body.source);
			responder.result(result);
		}
		
		public function fault(data:Object) : void {
			responder.fault(data);
		}
	}
}

