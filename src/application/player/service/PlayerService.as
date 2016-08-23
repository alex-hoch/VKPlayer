/**
 * PlayerService.
 * Date: 10.04.14
 * Time: 14:33
 * Alex Hoch
 */

package application.player.service {
	import application.player.model.PlayerModel;

	public class PlayerService {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var playerModel:PlayerModel;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get volumeValue():Number { return playerModel.volumeValue; }

		public function set volumeValue(value:Number):void {
			if(value < 0) {
				value = 0;
			} else if(value > 1) {
				value = 1;
			}
			playerModel.volumeValue = value;
		}

		public function get isSoundCycled():Boolean { return playerModel.isSoundCycled; }

		public function get isListCycled():Boolean { return playerModel.isListCycled; }

		public function get isRandomPlaying():Boolean { return playerModel.isRandomPlaying; }

		public function get playerState():int { return playerModel.playerState; }

		public function get playerPreviousState():int { return playerModel.playerPreviousState; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlayerService() {
			playerModel = new PlayerModel();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function parseData(data:Object):void{
			playerModel.volumeValue = data.volumeValue;
			playerModel.isRandomPlaying = data.playRandom;
			playerModel.isSoundCycled = data.isSoundCycled;
			playerModel.isListCycled = data.isListCycled;
		}

		public function updatePlayerState(state:int):void {
			playerModel.playerPreviousState = playerModel.playerState;
			playerModel.playerState = state;
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
