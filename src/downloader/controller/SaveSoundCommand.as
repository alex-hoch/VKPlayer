/**
 * SaveSoundCommand
 * User: Alex
 * Date: 10.08.16
 * Time: 16:31
 */
package downloader.controller {
	import downloader.message.DownloaderActionMessage;
	import downloader.model.DownloadItemModel;
	import downloader.service.DownloaderDataHelper;
	import downloader.service.DownloaderService;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	public class SaveSoundCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _downloaderService:DownloaderService;
		private var _downloaderDataHelper:DownloaderDataHelper;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set downloaderService(value:DownloaderService):void { _downloaderService = value; }

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
		public function SaveSoundCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:DownloaderActionMessage):void {
			var downloadItemModel:DownloadItemModel = _downloaderService.getItemById(message.soundId);
			var bytes:ByteArray = downloadItemModel.loader.data as ByteArray;
			var path:String = downloadItemModel.path + '/' + downloadItemModel.fileName + downloadItemModel.fileExtension;
			var file:File = new File().resolvePath(path)
			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeBytes(bytes);
			fileStream.close();

			_downloaderService.removeItem(message.soundId);

			var message:DownloaderActionMessage = new DownloaderActionMessage(DownloaderActionMessage.UPDATE_DOWNLOADER);
			message.downloaderVO = _downloaderDataHelper.createDownloaderVO();
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
