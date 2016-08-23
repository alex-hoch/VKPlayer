/**
 * LoginPM.
 * Date: 19.02.14
 * Time: 11:06
 * Alex Hoch - flasher_ua@ukr.net
 */

package login.view.pm {
	import login.message.LoginActionMessage;
	import login.vo.LoginResultVO;

	public class LoginPM {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;

		private var _authorizationLink:String;
		private var _width:int;
		private var _height:int;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function get browserWidth():int { return _width; }

		public function get browserHeight():int { return _height; }

		public function get authorizationLink():String { return _authorizationLink; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function LoginPM() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function initData(authorizationLink:String, width:int, height:int):void {
			_authorizationLink = authorizationLink;
			_width = width;
			_height = height;
		}

		public function loginCompleted(location:String):void {
			var params:Array = location.split('blank.html#')[1].split('&');
			var data:LoginResultVO = new LoginResultVO();
			for (var i:int = 0; i < params.length; i++) {
				var values:Array = params[i].split('=');
				switch (values[0]) {
					case 'access_token':
						data.accessToken = values[1];
						break;
					case 'expires_in':
						data.expiresIn = values[1];
						break;
					case 'user_id':
						data.uid = values[1];
						break;
				}
			}
			var message:LoginActionMessage = new LoginActionMessage(LoginActionMessage.LOGIN_COMPLETED);
			message.data = data;
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
