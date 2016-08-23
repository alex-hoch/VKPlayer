/**
 * GlobalHotkeyManager
 * User: Alex
 * Date: 10.08.16
 * Time: 11:37
 */
package util {
	import application.player.message.PlayerActionMessage;
	import application.player.service.PlayerService;

	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.NativeProcessExitEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;

	public class GlobalHotkeyManager {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _playerService:PlayerService;
		private var nativeProcess:NativeProcess;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playerService(value:PlayerService):void { _playerService = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function GlobalHotkeyManager() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function init():void {
			var nativeProcessStartupInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo();

			var file:File = File.applicationDirectory.resolvePath("hotkeys.exe");
			nativeProcessStartupInfo.executable = file;

			nativeProcess = new NativeProcess();
			nativeProcess.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, outputDataHandler);
			nativeProcess.addEventListener(NativeProcessExitEvent.EXIT, exitHandler);
			nativeProcess.start(nativeProcessStartupInfo);
		}

		public function destroy():void {
			nativeProcess.removeEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, outputDataHandler);
			nativeProcess.removeEventListener(NativeProcessExitEvent.EXIT, exitHandler);
			nativeProcess.exit(true);
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
		private function outputDataHandler(event:ProgressEvent):void {
			var command:String = nativeProcess.standardOutput.readUTFBytes(nativeProcess.standardOutput.bytesAvailable);
			var action:String;
			var volumeValue:Number;
			switch (command) {
				case 'play_pause':
					action = PlayerActionMessage.TOGGLE_PLAY;
					break;
				case 'stop':
					action = PlayerActionMessage.STOP_PLAYING;
					break;
				case 'play_prev':
					action = PlayerActionMessage.PLAY_PREVIOUS_SOUND;
					break;
				case 'play_next':
					action = PlayerActionMessage.PLAY_NEXT_SOUND;
					break;
				case 'hide_show':

					break;
				case 'volume_up':
					action = PlayerActionMessage.CHANGE_VOLUME_VALUE;
					volumeValue = _playerService.volumeValue + 0.03;
					break;
				case 'volume_down':
					action = PlayerActionMessage.CHANGE_VOLUME_VALUE;
					volumeValue = _playerService.volumeValue - 0.03;
					break;
				case 'seek_back':

					break;
				case 'seek_forward':

					break;
			}
			if (action) {
				var message:PlayerActionMessage = new PlayerActionMessage(action);
				message.volumeValue = volumeValue;
				_dispatcher(message);
			}
		}

		private function exitHandler(event:NativeProcessExitEvent):void {
			nativeProcess.exit();
		}
	}
}
