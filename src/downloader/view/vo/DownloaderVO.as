/**
 * DownloaderVO
 * User: Alex
 * Date: 11.08.16
 * Time: 11:18
 */
package downloader.view.vo {
	public class DownloaderVO {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _activeItemsList:Array;
		private var _queueItemsList:Array;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get activeItemsList():Array { return _activeItemsList; }

		public function set activeItemsList(value:Array):void { _activeItemsList = value; }

		public function get queueItemsList():Array { return _queueItemsList; }

		public function set queueItemsList(value:Array):void { _queueItemsList = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function DownloaderVO() {

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
