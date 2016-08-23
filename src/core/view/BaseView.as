/**
 * BaseView.
 * Date: 19.02.14
 * Time: 11:13
 * Alex Hoch - flasher_ua@ukr.net
 */

package core.view {
	import flash.display.Sprite;

	public class BaseView extends Sprite implements IView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _id:String;
		private static var defaultId:int = 1;
		private var _destroyed:Boolean;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get id():String { return _id; }

		public function get destroyed():Boolean { return _destroyed; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function BaseView(id:String = null) {
			_id = (id && id.length) ? id : 'flashView' + defaultId++;
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function destroy():void {
			_destroyed = true;
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