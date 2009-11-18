package org.pdfbox.cos
{

	/**
	 * This class represents a PDF object.
	 */
	public class COSObject extends COSBase
	{
		private var baseObject:COSBase;
		private var objectNumber:COSInteger;
		private var generationNumber:COSInteger;

		/**
		 * Constructor.
		 *
		 * @param object The object that this encapsulates.
		 *
		 * @throws IOException If there is an error with the object passed in.
		 */
		public function COSObject( object:COSBase = null )
		{
			setObject( object );
		}

		/**
		 * This will get the dictionary object in this object that has the name key and
		 * if it is a pdfobjref then it will dereference that and return it.
		 *
		 * @param key The key to the value that we are searching for.
		 *
		 * @return The pdf object that matches the key.
		 */
		public function getDictionaryObject( key:COSName ):COSBase
		{
			var retval:COSBase = null;
			if( baseObject is COSDictionary )
			{
				retval = COSDictionary(baseObject).getDictionaryObject( key );
			}
			return retval;
		}

		/**
		 * This will get the dictionary object in this object that has the name key.
		 *
		 * @param key The key to the value that we are searching for.
		 *
		 * @return The pdf object that matches the key.
		 */
		public function getItem( key:COSName ):COSBase
		{
			var retval:COSBase =null;
			if( baseObject is COSDictionary )
			{
				retval = COSDictionary(baseObject).getItem( key );
			}
			return retval;
		}

		/**
		 * This will get the object that this object encapsulates.
		 *
		 * @return The encapsulated object.
		 */
		public function getObject():COSBase
		{
			return baseObject;
		}

		/**
		 * This will set the object that this object encapsulates.
		 *
		 * @param object The new object to encapsulate.
		 *
		 * @throws IOException If there is an error setting the updated object.
		 */
		public function setObject( object:COSBase = null ):void
		{
			if ( object != null) {				
				baseObject = object;
			}
			/*if( baseObject == null )
			{
				baseObject = object;
			}
			else
			{
				//This is for when an object appears twice in the
				//pdf file we really want to replace it such that
				//object references still work correctly.
				//see owcp-as-received.pdf for an example
				if( baseObject instanceof COSDictionary )
				{
					COSDictionary dic = (COSDictionary)baseObject;
					COSDictionary dicObject = (COSDictionary)object;
					dic.clear();
					dic.addAll( dicObject );
				}
				else if( baseObject instanceof COSArray )
				{
					COSArray array = (COSArray)baseObject;
					COSArray arrObject = (COSArray)object;
					array.clear();
					for( int i=0; i<arrObject.size(); i++ )
					{
						array.add( arrObject.get( i ) );
					}
				}
				else if( baseObject instanceof COSStream )
				{
					COSStream oldStream = (COSStream)baseObject;
					System.out.println( "object:" +  object.getClass().getName() );
					COSStream newStream = (COSStream)object;
					oldStream.replaceWithStream( newStream );
				}
				else if( baseObject instanceof COSInteger )
				{
					COSInteger oldInt = (COSInteger)baseObject;
					COSInteger newInt = (COSInteger)object;
					oldInt.setValue( newInt.longValue() );
				}
				else if( baseObject == null )
				{
					baseObject = object;
				}
				else
				{
					throw new IOException( "Unknown object substitution type:" + baseObject );
				}
			}*/

		}

		/**
		 * {@inheritDoc}
		 */
		public function toString():String
		{
			return "COSObject{" +
				(objectNumber == null ? "unknown" : "" + objectNumber.intValue() ) + ", " +
				(generationNumber == null ? "unknown" : "" + generationNumber.intValue() ) +
				"}";
		}

		/** Getter for property objectNumber.
		 * @return Value of property objectNumber.
		 */
		public function getObjectNumber():COSInteger
		{
			return objectNumber;
		}

		/** Setter for property objectNumber.
		 * @param objectNum New value of property objectNumber.
		 */
		public function setObjectNumber( objectNum:COSInteger ):void
		{
			objectNumber = objectNum;
		}

		/** Getter for property generationNumber.
		 * @return Value of property generationNumber.
		 */
		public function getGenerationNumber():COSInteger
		{
			return generationNumber;
		}

		/** Setter for property generationNumber.
		 * @param generationNumberValue New value of property generationNumber.
		 */
		public function setGenerationNumber( generationNumberValue:COSInteger ):void
		{
			generationNumber = generationNumberValue;
		}

		/**
		 * visitor pattern double dispatch method.
		 *
		 * @param visitor The object to notify when visiting this object.
		 * @return any object, depending on the visitor implementation, or null
		 * @throws COSVisitorException If an error occurs while visiting this object.
		 */
		override public function accept( visitor:ICOSVisitor ) :Object
		{
			return getObject() != null ? getObject().accept( visitor ) : COSNull.NULL.accept( visitor );
		}
	}
}