/**
 * HintView
 * User: Alex
 * Date: 23.08.16
 * Time: 13:59
 */
package hint.view {
	import core.view.BaseView;
	import flash.display.DisplayObject;
	import hint.HintType;
	import hint.view.component.IHintView;
	import hint.view.component.PlayHint;
	import hint.view.component.VolumeHint;

	import hint.view.pm.HintPM;

	public class HintView extends BaseView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _hintPM:HintPM;
		private var activeHint:IHintView;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get hintPM():HintPM { return _hintPM; }

		public function set hintPM(value:HintPM):void { _hintPM = value; }

		public function get hintWidth():Number { return activeHint.hintWidth; }

		public function get hintHeight():Number { return activeHint.hintHeight; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function HintView(id:String = null) {
			super(id);
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function showHint():void {
			if (activeHint) {
				this.removeChild(activeHint as DisplayObject);
				activeHint.destroy();
				activeHint = null;
			}
			switch (_hintPM.hintType) {
				case HintType.START_PLAYING:
					activeHint = new PlayHint();
					break;
				case HintType.CHANGE_VOLUME:
					activeHint = new VolumeHint();
					break;
			}
			this.addChild(activeHint as DisplayObject);
		}

		public function updateHint():void {
			activeHint.update(_hintPM.hintData);
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
