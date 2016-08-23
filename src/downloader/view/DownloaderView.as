/**
 * DownloaderView
 * User: Alex
 * Date: 11.08.16
 * Time: 10:59
 */
package downloader.view {
	import ah.gui.core.display.list.BaseList;

	import core.view.BaseView;

	import downloader.view.component.DownloadQueueItemView;

	import downloader.view.component.DownloadingItemView;
	import downloader.view.event.DownloaderEvent;

	import downloader.view.pm.DownloaderPM;

	import util.MouseWheelScroller;

	public class DownloaderView extends BaseView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _downloaderPM:DownloaderPM;

		private var activeList:BaseList;
		private var queueList:BaseList;
		private var mouseScroller:MouseWheelScroller;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get downloaderPM():DownloaderPM { return _downloaderPM; }

		public function set downloaderPM(value:DownloaderPM):void { _downloaderPM = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function DownloaderView() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function init():void {
			draw();
			startListen();
		}

		public function update():void {
			activeList.dataProvider = _downloaderPM.activeList;

			//			var scrollPosition:int = queueList.scrollPosition;
			queueList.dataProvider = _downloaderPM.queueList;
			//			queueList.scrollPosition = scrollPosition;
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
		private function draw():void {
			activeList = new BaseList()
			activeList.columnCount = 1;
			activeList.rowCount = Settings.DOWNLOADING_ITEMS_AT_ONE_TIME;
			activeList.listItemDisplayClass = DownloadingItemView;
			activeList.indentBetweenRows = -1;
			activeList.dataProvider = [];
			activeList.draw();
			this.addChild(activeList);

			var rowAmount:int = (stage.stageHeight - activeList.height - 3 * 5) / DownloadQueueItemView.HEIGHT;

			queueList = new BaseList()
			queueList.columnCount = 1;
			queueList.rowCount = rowAmount;
			queueList.listItemDisplayClass = DownloadQueueItemView;
			queueList.dataProvider = [];
			queueList.draw();
			this.addChild(queueList);

			mouseScroller = new MouseWheelScroller(queueList);

			var indent:Number = (stage.stageHeight - activeList.height - queueList.height) / 3;
			for (activeList.firstItem; !activeList.isDone; activeList.nextItem()) {
				activeList.currentItem.width = stage.stageWidth - 2 * indent;
			}
			for (queueList.firstItem; !queueList.isDone; queueList.nextItem()) {
				queueList.currentItem.width = stage.stageWidth - 2 * indent;
			}

			activeList.x = indent;
			activeList.y = indent;
			queueList.x = activeList.x;
			queueList.y = activeList.y + activeList.height + indent;
		}

		private function startListen():void {
			this.addEventListener(DownloaderEvent.LOADED, loadedHandler);
		}

		private function stopListen():void {
			this.removeEventListener(DownloaderEvent.LOADED, loadedHandler);
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		private function loadedHandler(event:DownloaderEvent):void {
			_downloaderPM.finishLoading(event.id);
		}
	}
}
