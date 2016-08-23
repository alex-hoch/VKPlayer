/**
 * SendRequestToServerCommand.
 * Date: 01.04.14
 * Time: 12:40
 * Alex Hoch
 */

package server.controller {
	import core.view.LockView;

	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.NativeWindow;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	import login.service.IApplicationService;

	import server.message.ServerActionMessage;

	public class SendRequestToServerCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _callback:Function;
		private var _applicationService:IApplicationService;

		private var loader:URLLoader;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set callback(value:Function):void { _callback = value; }

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
		public function SendRequestToServerCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:ServerActionMessage):void {
			var request:URLRequest = new URLRequest('https://api.vkontakte.ru/method/' + message.request.commandName + '?' + message.request.params + '&access_token=' + _applicationService.accessToken);
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loaderHandler);
			loader.load(request);
		}



		public function result(data:String):Object {
			return JSON.parse(data);
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
		private function loaderHandler(event:Event):void {
			loader.removeEventListener(Event.COMPLETE, loaderHandler);
			_callback(loader.data);
		}
	}
}
