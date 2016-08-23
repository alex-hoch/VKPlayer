/**
 * Application
 * User: Alex
 * Date: 09.08.16
 * Time: 16:43
 */
package application {
	import application.playlist.message.PlaylistActionMessage;

	import downloader.message.DownloaderActionMessage;

	import flash.desktop.NativeApplication;
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	import friends.message.FriendsActionMessage;

	import settings.message.SettingsActionMessage;
	import settings.service.ISettingsService;

	public class Application {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _settingsService:ISettingsService;

		private var applicationWindow:NativeWindow;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set settingsService(value:ISettingsService):void { _settingsService = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function Application() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function createApplicationWindow():void {
			var options:NativeWindowInitOptions = new NativeWindowInitOptions();
			applicationWindow = new NativeWindow(options);
			applicationWindow.title = 'VKPlayer';
			applicationWindow.x = _settingsService.applicationPosX;
			applicationWindow.y = _settingsService.applicationPosY;
			applicationWindow.width = _settingsService.applicationWidth;
			applicationWindow.height = _settingsService.applicationHeight;
			applicationWindow.stage.scaleMode = StageScaleMode.NO_SCALE;
			applicationWindow.stage.align = StageAlign.TOP_LEFT;
			applicationWindow.stage.color = 0xEEEEEE;
			applicationWindow.activate();

			var windows:Array = NativeApplication.nativeApplication.openedWindows;
			var window:NativeWindow;
			for (var i:int = 0; i < windows.length; i++) {
				window = windows[i];
				if (window != applicationWindow) {
					window.close();
					windows.splice(i, 1);
					i--;
				}
			}

			applicationWindow.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
			applicationWindow.addEventListener(Event.CLOSING, closingHandler);
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
		private function closingHandler(event:Event):void {
			applicationWindow.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
			applicationWindow.removeEventListener(Event.CLOSING, closingHandler);

			var message:SettingsActionMessage = new SettingsActionMessage(SettingsActionMessage.SAVE_SETTINGS);
			message.window = applicationWindow;
			_dispatcher(message);

			_dispatcher(new PlaylistActionMessage(PlaylistActionMessage.SAVE_USER_PLAYLIST));

			NativeApplication.nativeApplication.exit();
		}

		private function keyboardHandler(event:KeyboardEvent):void {
			if (event.ctrlKey) {
				switch (event.keyCode) {
					case Keyboard.D:
						_dispatcher(new DownloaderActionMessage(DownloaderActionMessage.SHOW_DOWNLOADER));
						break;
					case Keyboard.U:
						_dispatcher(new FriendsActionMessage(FriendsActionMessage.OPEN_FRIENDS_LIST));
						break;
				}
			}
		}
	}
}
