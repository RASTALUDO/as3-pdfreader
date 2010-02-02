package org.pdfbox.operator{

	import org.pdfbox.utils.PDFOperator;
	/**
	 *
	 * <p>Titre : PDFEngine Modification.</p>
	 * <p>Description : Structal modification of the PDFEngine class : the
	* long sequence of conditions in processOperator is remplaced by
	* this strategy pattern</p>
	 * <p>Copyright : Copyright (c) 2004</p>
	 * <p>Soci�t?: DBGS</p>
	 * @author Huault : huault@free.fr
	 * @version $Revision: 1.4 $
	 */
	public class EndText extends OperatorProcessor
	{

		/**
		 * process : ET : End text object.
		 * @param operator The operator that is being executed.
		 * @param arguments List
		 */
		override public function process( operator:PDFOperator, arguments:Array):void 
		{
			context.setTextMatrix( null);
			context.setTextLineMatrix( null);
		}


	}
}
