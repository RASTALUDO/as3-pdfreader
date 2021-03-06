package org.pdfbox.operator{

	import org.pdfbox.cos.COSNumber;
	import org.pdfbox.utils.PDFOperator;


	/**
	 * <p>Structal modification of the PDFEngine class :
	 * the long sequence of conditions in processOperator is remplaced by
	 * this strategy pattern.</p>
	 * 
	 * @author <a href="mailto:ben@benlitchfield.com">Ben Litchfield</a>
	 * @version $Revision: 1.5 $
	 */

	public class SetTextRenderingMode extends OperatorProcessor 
	{
		/**
		 * Tr Set text rendering mode.
		 * @param operator The operator that is being executed.
		 * @param arguments List
		 * @throws IOException If an error occurs while processing the font.
		 */
		override public function process( operator:PDFOperator, arguments:Array):void
		{
			var mode:COSNumber = arguments.get( 0 ) as COSNumber;
			context.getGraphicsState().getTextState().setRenderingMode( mode.intValue() );
		}
	}
}
