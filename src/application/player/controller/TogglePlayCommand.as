/**
 * TogglePlayCommand
 * User: Alex
 * Date: 10.08.16
 * Time: 11:51
 */
package application.player.controller {
	import application.player.PlayerState;
	import application.player.message.PlayerActionMessage;
	import application.player.service.PlayerDataHelper;
	import application.player.service.PlayerService;
	import application.playlist.service.IPlaylistsService;

	public class TogglePlayCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _playerService:PlayerService;
		private var _playerDataHelper:PlayerDataHelper;
		private var _playlistsService:IPlaylistsService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playerService(value:PlayerService):void { _playerService = value; }

		public function set playerDataHelper(value:PlayerDataHelper):void { _playerDataHelper = value; }

		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function TogglePlayCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			var newState:int;
			switch(_playerService.playerState) {
				case PlayerState.PLAYING:
					newState = PlayerState.PAUSE;
					break;
				case PlayerState.PAUSE:
					newState = PlayerState.PLAYING;
					break;
				case PlayerState.STOP:
					_playlistsService.chooseSound(_playlistsService.openedPlaylist.selectedSoundId, _playlistsService.openedPlaylist.id);
					newState = PlayerState.PLAYING;
					break;
			}
			_playerService.updatePlayerState(newState);

			var message:PlayerActionMessage = new PlayerActionMessage(PlayerActionMessage.UPDATE_PLAYER_STATE);
			message.playerStateVO = _playerDataHelper.generatePlayerStateVO();
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
