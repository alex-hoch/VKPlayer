/**
 * HintPM
 * User: Alex
 * Date: 23.08.16
 * Time: 14:12
 */
package hint.view.pm {
	import hint.message.HintViewMessage;

	public class HintPM {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var currentHintType:int;
		private var _hintData:Object;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function get hintType():int { return currentHintType; }

		public function get hintData():Object {return _hintData;}

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function HintPM() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(hintType:int, hintData:Object):void {
			_hintData = hintData;
			var messageType:String;
			if (hintType == currentHintType) {
				messageType = HintViewMessage.UPDATE_HINT;
			} else {
				messageType = HintViewMessage.SHOW_HINT;
			}
			currentHintType = hintType;
			_dispatcher(new HintViewMessage(messageType));
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
	}
}
