/**
 * LoginView.
 * Date: 19.02.14
 * Time: 10:54
 * Alex Hoch - flasher_ua@ukr.net
 */

package login.view {
	import core.view.BaseView;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.html.HTMLLoader;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	import login.view.pm.LoginPM;

	public class LoginView extends BaseView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _loginPM:LoginPM;
		private var _browser:HTMLLoader;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get loginPM():LoginPM { return _loginPM; }

		public function set loginPM(value:LoginPM):void { _loginPM = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function LoginView() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function init():void {
			_browser = new HTMLLoader();
			_browser.width = _loginPM.browserWidth;
			_browser.height = _loginPM.browserHeight;
			_browser.addEventListener(Event.LOCATION_CHANGE, locationChangeHandler);

			_browser.load(new URLRequest(_loginPM.authorizationLink));
			this.addChild(_browser);
		}

		override public function destroy():void {
			if (destroyed) return;
			stopListen();
			super.destroy();
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function stopListen():void {
			_browser.removeEventListener(Event.LOCATION_CHANGE, locationChangeHandler);
		}

		//--------------------------------------------------------------------------
		//  Handlers 
		//--------------------------------------------------------------------------
		private function locationChangeHandler(event:Event):void {
			var location:String = event.currentTarget.location;
			if (location.search('blank.html#') != -1) {
				_loginPM.loginCompleted(location);
			}
		}
	}
}
