/**
 * DownloaderDataHelper
 * User: Alex
 * Date: 11.08.16
 * Time: 11:20
 */
package downloader.service {
	import downloader.model.DownloadItemModel;
	import downloader.view.data.DownloadItemData;
	import downloader.view.vo.DownloaderVO;

	public class DownloaderDataHelper {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _downloaderService:DownloaderService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set downloaderService(value:DownloaderService):void { _downloaderService = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function DownloaderDataHelper() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function createDownloaderVO():DownloaderVO {
			var result:DownloaderVO = new DownloaderVO();
			var activeItemsList:Array = [];
			var queueItemsList:Array = [];
			var downloadItem:DownloadItemData;
			var downloadingItems:Vector.<DownloadItemModel> = _downloaderService.downloadingItems;
			for (var i:int = 0; i < downloadingItems.length; i++) {
				downloadItem = new DownloadItemData();
				downloadItem.id = downloadingItems[i].id;
				downloadItem.name = downloadingItems[i].fileName;
				downloadItem.url = downloadingItems[i].url;
				downloadItem.loader = downloadingItems[i].loader;
				if (i < Settings.DOWNLOADING_ITEMS_AT_ONE_TIME) {
					downloadItem.position = i + 1;
					activeItemsList[activeItemsList.length] = downloadItem;
				} else {
					downloadItem.position = (i - Settings.DOWNLOADING_ITEMS_AT_ONE_TIME) + 1;
					queueItemsList[queueItemsList.length] = downloadItem;
				}
			}
			result.activeItemsList = activeItemsList;
			result.queueItemsList = queueItemsList;
			return result;
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
	}
}
