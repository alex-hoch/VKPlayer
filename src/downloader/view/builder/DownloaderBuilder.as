/**
 * DownloaderBuilder
 * User: Alex
 * Date: 11.08.16
 * Time: 10:57
 */
package downloader.view.builder {
	import core.view.builder.BaseBuilder;

	import downloader.view.DownloaderView;
	import downloader.view.vo.DownloaderVO;

	import flash.display.NativeWindow;

	import flash.display.NativeWindowInitOptions;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class DownloaderBuilder extends BaseBuilder {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var window:NativeWindow;
		private var view:DownloaderView;

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
		public function DownloaderBuilder() {
			super();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function showDownloaderWindow(downloaderVO:DownloaderVO):void {
			if (!window) {
				var options:NativeWindowInitOptions = new NativeWindowInitOptions();
				options.maximizable = options.minimizable = options.resizable = false;
				window = new NativeWindow(options);
				window.title = 'Downloader';
				//			window.x = _settingsService.applicationPosX;
				//			window.y = _settingsService.applicationPosY;
				window.width = 397;
				window.height = 500;
				window.stage.scaleMode = StageScaleMode.NO_SCALE;
				window.stage.align = StageAlign.TOP_LEFT;
				window.stage.color = 0xEEEEEE;
				window.activate();
				window.addEventListener(Event.CLOSING, closingHandler);

				if (!view) {
					var view:DownloaderView = _viewRegisterManager.createView(DownloaderView) as DownloaderView;
					window.stage.addChild(view);
					view.init();
					view.downloaderPM.updateData(downloaderVO);
				}
			}

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
			window.removeEventListener(Event.CLOSING, closingHandler);
			window = null;
		}
	}
}
