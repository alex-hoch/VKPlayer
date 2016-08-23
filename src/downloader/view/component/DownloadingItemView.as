/**
 * DownloadingItemView
 * User: Alex
 * Date: 11.08.16
 * Time: 11:01
 */
package downloader.view.component {
	import ah.gui.core.display.list.IBaseListItem;
	import ah.utils.TextUtils;

	import core.view.BaseView;

	import downloader.view.data.DownloadItemData;
	import downloader.view.event.DownloaderEvent;

	import flash.display.Sprite;

	import flash.events.Event;
	import flash.events.ProgressEvent;

	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;

	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	public class DownloadingItemView extends BaseView implements IBaseListItem {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var downloadItemData:DownloadItemData;
		private var _width:Number = 380;
		private var _height:int = 30;

		private var background:Sprite;
		private var title:TextField;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		override public function set width(value:Number):void {
			_width = value;
			updateBorder();
			updateTitleSize();
			super.width = value;
		}

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function DownloadingItemView(id:String = null) {
			draw();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(value:Object):void {
			if (downloadItemData) {
				downloadItemData.loader.removeEventListener(Event.COMPLETE, fileLoadedHandler);
				downloadItemData.loader.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
			}
			downloadItemData = value as DownloadItemData;
			if (downloadItemData) {
				downloadItemData.loader.addEventListener(Event.COMPLETE, fileLoadedHandler);
				downloadItemData.loader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
				title.text = downloadItemData.name;
			} else {
				title.text = '';
				updateBackground(0);
			}
			updateTitleSize();
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {
			updateBorder();

			background = new Sprite();
			this.addChild(background);

			title = title = TextUtils.getNewTextField({
				size:       20,
				color:      0x444444,
				selectable: true,
				bold:       false,
				italic:     false,
				wordWrap:   false,
				multiline:  false,
				autoSize:   TextFieldAutoSize.NONE
				//								type		:		TextFieldType.DYNAMIC,
				//								align		:		TextFormatAlign.LEFT
			});
			//			title.border = true;
			title.width = _width;
			title.height = 26;
			title.y = 2;
			title.mouseEnabled = title.mouseWheelEnabled = false;
			this.addChild(title);
		}

		private function updateBorder():void {
			this.graphics.clear();
			this.graphics.beginFill(0x000000, 0);
			this.graphics.lineStyle(1, 0x000000);
			this.graphics.drawRect(0, 0, _width, _height);
			this.graphics.endFill();
		}

		private function updateTitleSize():void {
			title.width = Math.min(_width, title.textWidth + 5);
			title.x = Math.round((_width - title.width) / 2);
		}

		private function updateBackground(percent:Number):void {
			background.graphics.clear();
			background.graphics.beginFill(0xAABBCC, 0.85);
			background.graphics.drawRect(1, 1, _width * percent - 1, _height - 1);
			background.graphics.endFill();
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		private function fileLoadedHandler(event:Event):void {
			var loader:URLLoader = URLLoader(event.currentTarget);
			loader.removeEventListener(Event.COMPLETE, fileLoadedHandler);
			loader.removeEventListener(ProgressEvent.PROGRESS, progressHandler);

			var customEvent:DownloaderEvent = new DownloaderEvent(DownloaderEvent.LOADED, true);
			customEvent.id = downloadItemData.id;
			dispatchEvent(customEvent)

			/*		var bytes:ByteArray = loader.data as ByteArray;
			 var file:File = new File().resolvePath(path)
			 var fileStream:FileStream = new FileStream();
			 fileStream.open(file, FileMode.WRITE);
			 fileStream.writeBytes(bytes);
			 fileStream.close();

			 _callback(true);
			 */
		}

		private function progressHandler(event:ProgressEvent):void {
			updateBackground(event.bytesLoaded / event.bytesTotal);
		}
	}
}
