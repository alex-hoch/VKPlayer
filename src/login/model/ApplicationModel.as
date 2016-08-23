/**
 * ApplicationModel.
 * Date: 19.02.14
 * Time: 11:27
 * Alex Hoch - flasher_ua@ukr.net
 */

package login.model {

	public class ApplicationModel {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		public const redirectUrl:String = 'http://api.vkontakte.ru/blank.html';
		public const appId:int = 1;
		public const display:String = 'popup';
		public const settings:int = 8;
		private var _accessToken:String;
		private var _expiresIn:String;
		private var _uid:String;

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get accessToken():String { return _accessToken; }

		public function set accessToken(value:String):void { _accessToken = value; }

		public function get expiresIn():String { return _expiresIn; }

		public function set expiresIn(value:String):void { _expiresIn = value; }

		public function get uid():String { return _uid; }

		public function set uid(value:String):void { _uid = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function ApplicationModel() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------

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
