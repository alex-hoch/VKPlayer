/**
 * DownloaderPM
 * User: Alex
 * Date: 11.08.16
 * Time: 11:30
 */
package downloader.view.pm {
	import downloader.message.DownloaderActionMessage;
	import downloader.message.DownloaderViewMessage;
	import downloader.view.vo.DownloaderVO;

	public class DownloaderPM {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var downloaderVO:DownloaderVO;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function get activeList():Array { return downloaderVO.activeItemsList; }

		public function get queueList():Array { return downloaderVO.queueItemsList; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function DownloaderPM() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function updateData(downloaderVO:DownloaderVO):void {
			this.downloaderVO = downloaderVO;
			_dispatcher(new DownloaderViewMessage(DownloaderViewMessage.UPDATE_DOWNLOADER));
		}

		public function finishLoading(id:int):void {
			var message:DownloaderActionMessage = new DownloaderActionMessage(DownloaderActionMessage.SAVE_SOUND);
			message.soundId = id;
			_dispatcher(message);
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
