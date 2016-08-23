/**
 * InitPlayerCommand.
 * Date: 19.02.14
 * Time: 14:25
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.player.controller {
	import application.player.PlayerState;
	import application.player.message.PlayerActionMessage;
	import application.player.service.PlayerDataHelper;
	import application.player.service.PlayerService;

	import settings.service.ISettingsService;

	public class InitPlayerCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _playerService:PlayerService;
		private var _settingsService:ISettingsService;
		private var _playerDataHelper:PlayerDataHelper;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playerService(value:PlayerService):void { _playerService = value; }

		public function set settingsService(value:ISettingsService):void { _settingsService = value; }

		public function set playerDataHelper(value:PlayerDataHelper):void { _playerDataHelper = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function InitPlayerCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			_playerService.volumeValue = _settingsService.volumeValue;
			_playerService.updatePlayerState(PlayerState.STOP);

			var message:PlayerActionMessage = new PlayerActionMessage(PlayerActionMessage.INIT_PLAYER);
			message.initVO = _playerDataHelper.generatePlayerVO();
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
