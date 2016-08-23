/**
 * ShowDownloaderCommand
 * User: Alex
 * Date: 11.08.16
 * Time: 15:36
 */
package downloader.controller {
	import downloader.service.DownloaderDataHelper;
	import downloader.view.vo.DownloaderVO;

	public class ShowDownloaderCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _downloaderDataHelper:DownloaderDataHelper;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set downloaderDataHelper(value:DownloaderDataHelper):void { _downloaderDataHelper = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function ShowDownloaderCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():DownloaderVO {
			return _downloaderDataHelper.createDownloaderVO();
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