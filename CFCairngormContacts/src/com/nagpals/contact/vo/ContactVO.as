/* $Id: ContactVO.as 3 2007-02-15 21:39:58Z  $ */
package com.nagpals.contact.vo{
	import com.adobe.cairngorm.vo.IValueObject ;
		
   [Bindable]
	public class ContactVO implements IValueObject{
		public var id : String;
		public var firstName : String;
		public var lastName : String;
		public var email : String;
	}
	
}
