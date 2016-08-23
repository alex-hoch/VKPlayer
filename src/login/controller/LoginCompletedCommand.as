/**
 * LoginCompletedCommand.
 * Date: 19.02.14
 * Time: 13:58
 * Alex Hoch - flasher_ua@ukr.net
 */

package login.controller {
	import util.FileSystemManager;

	import login.message.LoginActionMessage;
	import login.service.IApplicationService;

	public class LoginCompletedCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _fileSystemManager:FileSystemManager;
		private var _applicationService:IApplicationService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set fileSystemManager(value:FileSystemManager):void { _fileSystemManager = value; }

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
		public function LoginCompletedCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:LoginActionMessage):void {
			_applicationService.parseLoginData(message.data);

			_fileSystemManager.init(_applicationService.userId);
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
