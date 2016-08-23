/**
 * InitPlaylistCommand.
 * Date: 01.04.14
 * Time: 14:19
 * Alex Hoch
 */

package application.playlist.controller {
	import login.service.IApplicationService;
	import settings.service.ISettingsService;

	import application.playlist.message.PlaylistActionMessage;
	import application.playlist.message.PlaylistMessage;

	public class InitPlaylistCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _settingsService:ISettingsService;
		private var _applicationService:IApplicationService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set settingsService(value:ISettingsService):void { _settingsService = value; }

		public function set applicationService(value:IApplicationService):void { _applicationService = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function InitPlaylistCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():PlaylistActionMessage {
			/*			var initVO:PlayerInitVO = new PlayerInitVO();
			 initVO.volumeValue = _settingsService.volumeValue;
			 initVO.isSoundCycled = _settingsService.isSoundCycled;
			 initVO.isListCycled = _settingsService.isListCycled;
			 initVO.isRandomPlaying = _settingsService.isRandomPlaying;
			 */
			_dispatcher(new PlaylistMessage(PlaylistMessage.INIT_PLAYLIST));

			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.LOAD_USER_PLAYLIST);
			message.userId = _applicationService.userId;
			return message;
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
