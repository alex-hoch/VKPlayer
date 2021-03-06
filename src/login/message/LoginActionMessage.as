/**
 * LoginActionMessage.
 * Date: 19.02.14
 * Time: 11:19
 * Alex Hoch - flasher_ua@ukr.net
 */

package login.message {
	import core.message.CoreMessage;

	import flash.events.Event;

	import login.vo.LoginResultVO;

	public class LoginActionMessage extends Event {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		static public const LOGIN:String = 'login';
		static public const LOGIN_COMPLETED:String = 'loginCompleted';

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		public var data:LoginResultVO;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function LoginActionMessage(type:String) {
			super(type);
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
