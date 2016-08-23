/**
 * PlayerInitVO.
 * Date: 19.02.14
 * Time: 16:13
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.player.vo {

	public class PlayerInitVO {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _volumeValue:Number;
		private var _isSoundCycled:Boolean;
		private var _isListCycled:Boolean;
		private var _isRandomPlaying:Boolean;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get volumeValue():Number { return _volumeValue; }

		public function set volumeValue(value:Number):void { _volumeValue = value; }

		public function get isSoundCycled():Boolean { return _isSoundCycled; }

		public function set isSoundCycled(value:Boolean):void { _isSoundCycled = value; }

		public function get isListCycled():Boolean { return _isListCycled; }

		public function set isListCycled(value:Boolean):void { _isListCycled = value; }

		public function get isRandomPlaying():Boolean { return _isRandomPlaying; }

		public function set isRandomPlaying(value:Boolean):void { _isRandomPlaying = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlayerInitVO() {

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
