/**
 * BaseCommand
 * User: Alex
 * Date: 08.08.16
 * Time: 16:30
 */
package core.command {
	import core.view.LockView;

	import flash.desktop.NativeApplication;
	import flash.display.NativeWindow;

	public class BaseCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------

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
		public function BaseCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------
		protected function lockApplication(message:String):void {
			var openedWindows:Array = NativeApplication.nativeApplication.openedWindows;
			var window:NativeWindow;
			var lockView:LockView;
			var index:int;
			for (var i:int = 0; i < openedWindows.length; i++) {
				window = openedWindows[i];
				index = window.stage.numChildren - 1;
				if (window.stage.getChildAt(index) is LockView) {
					lockView = LockView(window.stage.getChildAt(index));
				} else {
					lockView = new LockView();
					window.stage.addChild(lockView);
				}
				lockView.updateMessage(message);
			}
		}

		protected function unlockApplication():void {
			var openedWindows:Array = NativeApplication.nativeApplication.openedWindows;
			var window:NativeWindow;
			var index:int;
			for (var i:int = 0; i < openedWindows.length; i++) {
				window = openedWindows[i];
				index = window.stage.numChildren - 1;
				if (window.stage.getChildAt(index) is LockView) {
					window.stage.removeChildAt(index);
				}
			}
		}

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------

	}
}
