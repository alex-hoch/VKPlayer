/**
 * LoadSettingsCommand.
 * Date: 19.02.14
 * Time: 14:18
 * Alex Hoch - flasher_ua@ukr.net
 */

package settings.controller {
	import application.Application;
	import util.FileSystemManager;
	import settings.service.ISettingsService;
	import application.player.service.PlayerService;

	public class LoadSettingsCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _application:Application;
		private var _playerService:PlayerService;
		private var _settingsService:ISettingsService;
		private var _fileSystemManager:FileSystemManager;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set application(value:Application):void { _application = value; }

		public function set playerService(value:PlayerService):void { _playerService = value; }

		public function set settingsService(value:ISettingsService):void { _settingsService = value; }

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
		public function LoadSettingsCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			var applicationSettings:Object = _fileSystemManager.loadApplicationSettings();
			_settingsService.parseSettings(applicationSettings);

			_application.createApplicationWindow();
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
