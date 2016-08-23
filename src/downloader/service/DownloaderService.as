/**
 * DownloaderService
 * User: Alex
 * Date: 10.08.16
 * Time: 16:41
 */
package downloader.service {
	import downloader.model.DownloadItemModel;
	import downloader.model.DownloaderModel;

	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;

	public class DownloaderService {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var downloaderModel:DownloaderModel;
		private var itemId:int;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get path():String { return downloaderModel.defaultPath; }

		public function get downloadingItems():Vector.<DownloadItemModel> { return downloaderModel.itemsList; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function DownloaderService() {
			downloaderModel = new DownloaderModel();
			var loader:URLLoader;
			for (var i:int = 0; i < Settings.DOWNLOADING_ITEMS_AT_ONE_TIME; i++) {
				loader = new URLLoader();
				loader.dataFormat = URLLoaderDataFormat.BINARY;
				downloaderModel.loadersList[downloaderModel.loadersList.length] = loader;
			}
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function savePath(path:String):void {
			downloaderModel.defaultPath = path;
		}

		public function addItem(fileName:String, url:String):void {
			var item:DownloadItemModel = new DownloadItemModel();
			item.id = ++itemId;
			item.fileName = fileName;
			item.fileExtension = '.mp3';
			item.url = url;
			item.path = downloaderModel.defaultPath;
			if (downloaderModel.loadersList.length) {
				item.loader = downloaderModel.loadersList.shift();
				item.loader.load(new URLRequest(item.url));
			}
			downloaderModel.itemsList[downloaderModel.itemsList.length] = item;
		}

		public function getItemById(id:int):DownloadItemModel {
			var result:DownloadItemModel;
			for (var i:int = 0; i < downloaderModel.itemsList.length; i++) {
				if (downloaderModel.itemsList[i].id == id) {
					result = downloaderModel.itemsList[i];
					break;
				}
			}
			return result;
		}

		public function removeItem(id:int):void {
			for (var i:int = 0; i < downloaderModel.itemsList.length; i++) {
				if (downloaderModel.itemsList[i].id == id) {
					var found:Boolean;
					for (var j:int = 0; j < downloaderModel.itemsList.length; j++) {
						if (!downloaderModel.itemsList[j].loader) {
							downloaderModel.itemsList[j].loader = downloaderModel.itemsList[i].loader;
							downloaderModel.itemsList[j].loader.load(new URLRequest(downloaderModel.itemsList[j].url));
							found = true;
							break;
						}
					}
					if (!found) {
						downloaderModel.loadersList.push(downloaderModel.itemsList[i].loader);
					}
					downloaderModel.itemsList.splice(i, 1);
					break;
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

	}
}
