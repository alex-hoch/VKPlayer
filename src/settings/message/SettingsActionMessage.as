/**
 * SettingsActionMessage
 * User: Alex
 * Date: 10.08.16
 * Time: 10:46
 */
package settings.message {
	import flash.display.NativeWindow;
	import flash.events.Event;

	public class SettingsActionMessage extends Event {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		static public const SAVE_SETTINGS:String = 'saveSettings';

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		public var window:NativeWindow;

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
		public function SettingsActionMessage(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
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
