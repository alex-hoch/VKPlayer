/**
 * DownloadItemData
 * User: Alex
 * Date: 11.08.16
 * Time: 11:01
 */
package downloader.view.data {
	import flash.net.URLLoader;

	public class DownloadItemData {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _id:int;
		private var _position:int;
		private var _name:String;
		private var _loader:URLLoader;
		private var _url:String;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get id():int { return _id; }

		public function set id(value:int):void { _id = value; }

		public function get position():int { return _position; }

		public function set position(value:int):void { _position = value; }

		public function get name():String { return _name; }

		public function set name(value:String):void { _name = value; }

		public function get loader():URLLoader { return _loader; }

		public function set loader(value:URLLoader):void { _loader = value; }

		public function get url():String { return _url; }

		public function set url(value:String):void { _url = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function DownloadItemData() {

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
