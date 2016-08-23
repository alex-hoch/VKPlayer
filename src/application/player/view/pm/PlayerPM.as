/**
 * PlayerPM.
 * Date: 19.02.14
 * Time: 15:22
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.player.view.pm {
	import application.player.message.PlayerActionMessage;
	import application.player.message.PlayerViewMessage;
	import application.player.view.data.IPlayerSoundData;
	import application.player.vo.PlayerInitVO;
	import application.player.vo.PlayerStateVO;

	import downloader.message.DownloaderActionMessage;

	public class PlayerPM {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var initVO:PlayerInitVO;
		private var stateVO:PlayerStateVO;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function get soundData():IPlayerSoundData { return stateVO.activeSound; }

		public function get volumeValue():Number { return initVO.volumeValue; }

		public function get currentState():int { return stateVO.currentState; }

		public function get previousState():int { return stateVO.previousState; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlayerPM() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function updateData(initVO:PlayerInitVO):void {
			this.initVO = initVO;
			_dispatcher(new PlayerViewMessage(PlayerViewMessage.UPDATE_PLAYER));
		}

		public function updatePlayerState(stateVO:PlayerStateVO):void {
			this.stateVO = stateVO;
			_dispatcher(new PlayerViewMessage(PlayerViewMessage.UPDATE_PLAYER_STATE));
		}

		public function togglePlay():void {
			_dispatcher(new PlayerActionMessage(PlayerActionMessage.TOGGLE_PLAY));
		}

		public function stopPlaying():void {
			_dispatcher(new PlayerActionMessage(PlayerActionMessage.STOP_PLAYING));
		}

		public function playPreviousSound():void {
			_dispatcher(new PlayerActionMessage(PlayerActionMessage.PLAY_PREVIOUS_SOUND));
		}

		public function playNextSound():void {
			_dispatcher(new PlayerActionMessage(PlayerActionMessage.PLAY_NEXT_SOUND));
		}

		public function saveSound():void {
			var message:DownloaderActionMessage = new DownloaderActionMessage(DownloaderActionMessage.ADD_SOUND_TO_DOWNLOADER);
			message.soundId = stateVO.activeSound.id;
			message.playlistId = stateVO.playingPlaylistId;
			_dispatcher(message);
		}

		public function changeVolumeValue(volumeValue:Number):void {
			var message:PlayerActionMessage = new PlayerActionMessage(PlayerActionMessage.CHANGE_VOLUME_VALUE);
			message.volumeValue = volumeValue;
			_dispatcher(message);
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
