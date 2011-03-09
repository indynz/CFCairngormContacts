/* $Id: DeleteContactDelegate.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.business{
	
	import mx.rpc.IResponder;
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.nagpals.contact.model.ContactModelLocator;
	import com.nagpals.contact.vo.ContactVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	import mx.utils.ObjectUtil;
	
	public class DeleteContactDelegate implements IResponder{
		
		private var responder : IResponder;
		private var service : RemoteObject;
		private var model : ContactModelLocator = ContactModelLocator.getInstance();
				
		public function DeleteContactDelegate(responder : IResponder) {
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getRemoteObject("contactService");
		}
		
		public function deleteContact() : void {
			var token : AsyncToken = service.remove(model.contactVO.id);
			token.addResponder(this);
		}
		
		public function result(info:Object) : void {
			var result:ResultEvent = info as ResultEvent;
			responder.result(result);
		}
		
		public function fault(data:Object) : void {
			responder.fault(data);
		}
		
	}
}

