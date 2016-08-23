/**
 * WinndowSetting.
 * Date: 19.02.14
 * Time: 14:31
 * Alex Hoch - flasher_ua@ukr.net
 */

package settings.model {

	public class WindowSettings {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _posX:int;
		private var _posY:int;
		private var _width:int;
		private var _height:int;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get posX():int { return _posX; }

		public function set posX(value:int):void { _posX = value; }

		public function get posY():int { return _posY; }

		public function set posY(value:int):void { _posY = value; }

		public function get width():int { return _width; }

		public function set width(value:int):void { _width = value; }

		public function get height():int { return _height; }

		public function set height(value:int):void { _height = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function WindowSettings() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------

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
