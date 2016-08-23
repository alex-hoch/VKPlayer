/**
 * StopPlayingCommand
 * User: Alex
 * Date: 10.08.16
 * Time: 12:06
 */
package application.player.controller {
	import application.player.PlayerState;
	import application.player.message.PlayerActionMessage;
	import application.player.service.PlayerDataHelper;
	import application.player.service.PlayerService;
	import application.playlist.service.IPlaylistsService;

	public class StopPlayingCommand {
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
		public function StopPlayingCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			_playerService.updatePlayerState(PlayerState.STOP);
			_playlistsService.chooseSound(-1, -1);

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
