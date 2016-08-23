/**
 * PlayerStateVO
 * User: Alex
 * Date: 10.08.16
 * Time: 11:45
 */
package application.player.vo {
	import application.player.view.data.IPlayerSoundData;

	public class PlayerStateVO {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _activeSound:IPlayerSoundData;
		private var _currentState:int;
		private var _previousState:int;
		private var _playingPlaylistId:Number;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get activeSound():IPlayerSoundData { return _activeSound; }

		public function set activeSound(value:IPlayerSoundData):void { _activeSound = value; }

		public function get currentState():int { return _currentState; }

		public function set currentState(value:int):void { _currentState = value; }

		public function get previousState():int { return _previousState; }

		public function set previousState(value:int):void { _previousState = value; }

		public function get playingPlaylistId():Number { return _playingPlaylistId; }

		public function set playingPlaylistId(value:Number):void { _playingPlaylistId = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function PlayerStateVO() {

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
