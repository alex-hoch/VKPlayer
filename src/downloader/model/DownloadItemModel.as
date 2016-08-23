/**
 * DownloadItemModel
 * User: Alex
 * Date: 11.08.16
 * Time: 11:04
 */
package downloader.model {
	import flash.net.URLLoader;

	public class DownloadItemModel {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _id:int;
		private var _path:String;
		private var _fileName:String;
		private var _fileExtension:String;
		private var _url:String;
		private var _loader:URLLoader;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get id():int { return _id; }

		public function set id(value:int):void { _id = value; }

		public function get path():String { return _path; }

		public function set path(value:String):void { _path = value; }

		public function get fileName():String { return _fileName; }

		public function set fileName(value:String):void { _fileName = value; }

		public function get url():String { return _url; }

		public function set url(value:String):void { _url = value; }

		public function get fileExtension():String { return _fileExtension; }

		public function set fileExtension(value:String):void { _fileExtension = value; }

		public function get loader():URLLoader { return _loader; }

		public function set loader(value:URLLoader):void { _loader = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function DownloadItemModel() {

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
