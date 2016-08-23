/**
 * ApplicationService.
 * Date: 19.02.14
 * Time: 11:26
 * Alex Hoch - flasher_ua@ukr.net
 */

package login.service.impl {
	import login.model.ApplicationModel;
	import login.service.IApplicationService;
	import login.vo.LoginResultVO;

	public class ApplicationService implements IApplicationService {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var applicationModel:ApplicationModel;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get appId():int { return applicationModel.appId; }

		public function get userId():Number { return Number(applicationModel.uid); }

		public function get settings():int { return applicationModel.settings; }

		public function get display():String { return applicationModel.display; }

		public function get redirectUrl():String { return applicationModel.redirectUrl; }

		public function get authorizationLink():String { return 'http://api.vkontakte.ru/oauth/authorize?client_id=' + appId + '&scope=' + settings + '&redirect_uri=' + redirectUrl + '&display=' + display + '&response_type=token'; }

		public function get accessToken():String { return applicationModel.accessToken; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function ApplicationService() {
			applicationModel = new ApplicationModel();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function parseLoginData(data:LoginResultVO):void {
			applicationModel.accessToken = data.accessToken;
			applicationModel.expiresIn = data.expiresIn;
			applicationModel.uid = data.uid;
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
