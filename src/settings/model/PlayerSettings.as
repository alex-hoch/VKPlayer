/**
 * PlayerSettings.
 * Date: 19.02.14
 * Time: 14:33
 * Alex Hoch - flasher_ua@ukr.net
 */

package settings.model {

	public class PlayerSettings {
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
		private var _openedPlaylistId:Number;

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

		public function get openedPlaylistId():Number { return _openedPlaylistId; }

		public function set openedPlaylistId(value:Number):void { _openedPlaylistId = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlayerSettings() {

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
