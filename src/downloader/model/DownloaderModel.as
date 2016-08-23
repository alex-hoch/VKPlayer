/**
 * DownloaderModel
 * User: Alex
 * Date: 10.08.16
 * Time: 16:41
 */
package downloader.model {
	import flash.net.URLLoader;

	public class DownloaderModel {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _defaultPath:String;
		private var _itemsList:Vector.<DownloadItemModel>;
		private var _loadersList:Vector.<URLLoader>;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get defaultPath():String { return _defaultPath; }

		public function set defaultPath(value:String):void { _defaultPath = value; }

		public function get itemsList():Vector.<DownloadItemModel> { return _itemsList; }

		public function set itemsList(value:Vector.<DownloadItemModel>):void { _itemsList = value; }

		public function get loadersList():Vector.<URLLoader> { return _loadersList; }

		public function set loadersList(value:Vector.<URLLoader>):void { _loadersList = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function DownloaderModel() {
			_itemsList = new Vector.<DownloadItemModel>();
			_loadersList = new Vector.<URLLoader>();
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
