/**
 * SaveSettingsCommand
 * User: Alex
 * Date: 10.08.16
 * Time: 10:44
 */
package settings.controller {
	import application.player.service.PlayerService;
	import application.playlist.service.IPlaylistsService;

	import util.FileSystemManager;

	import flash.display.NativeWindow;

	import settings.message.SettingsActionMessage;
	import settings.service.ISettingsService;

	public class SaveSettingsCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _settingsService:ISettingsService;
		private var _playerService:PlayerService;
		private var _playlistsService:IPlaylistsService;
		private var _fileSystemManager:FileSystemManager;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set playerService(value:PlayerService):void { _playerService = value; }

		public function set settingsService(value:ISettingsService):void { _settingsService = value; }

		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

		public function set fileSystemManager(value:FileSystemManager):void { _fileSystemManager = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function SaveSettingsCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:SettingsActionMessage):void {
			var applicationWindow:NativeWindow = message.window;
			_settingsService.updateWindowSettings(applicationWindow.x, applicationWindow.y,  applicationWindow.width, applicationWindow.height);
			_settingsService.updatePlayerSettings(_playerService.volumeValue, _playlistsService.openedPlaylist.id);
			_fileSystemManager.saveApplicationSettings(_settingsService.getSettingsData());
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
