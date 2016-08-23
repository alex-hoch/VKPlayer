/**
 * PlayerModel.
 * Date: 10.04.14
 * Time: 14:33
 * Alex Hoch
 */

package application.player.model {

	public class PlayerModel {
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
		private var _playerState:int;
		private var _playerPreviousState:int;

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

		public function get playerState():int { return _playerState; }

		public function set playerState(value:int):void { _playerState = value; }

		public function get playerPreviousState():int { return _playerPreviousState; }

		public function set playerPreviousState(value:int):void { _playerPreviousState = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlayerModel() {

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
