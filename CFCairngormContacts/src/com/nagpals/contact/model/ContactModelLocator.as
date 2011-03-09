
package com.nagpals.contact.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	import com.adobe.cairngorm.CairngormError;
    import com.adobe.cairngorm.CairngormMessageCodes;
    
 	import com.nagpals.contact.vo.ContactVO;
 	import mx.collections.ArrayCollection;

    [Bindable]
	public class ContactModelLocator implements IModelLocator{
 
 		private static var instance:ContactModelLocator;

		public var contactVOList : ArrayCollection;
		public var contactVO : ContactVO;

		public function ContactModelLocator(access:Private){
			
			if (access != null){
				
				if (instance == null){
					
					instance = this;
					
				}
				
			}
			
			else{
				
				throw new CairngormError( CairngormMessageCodes.SINGLETON_EXCEPTION, "CFCairngormContactsModelLocator" );
				
			}
		}
		 
		public static function getInstance() : ContactModelLocator{
			
			if (instance == null){
				
				instance = new ContactModelLocator( new Private );
				
			}
			
			return instance;
			
		}
		
	}
}

/**
 * Inner class which restricts contructor access to Private
 */
class Private {}

