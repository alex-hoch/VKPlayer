/**
 * AddPlaylistToDownloaderCommand
 * User: Alex
 * Date: 11.08.16
 * Time: 12:34
 */
package downloader.controller {
	import application.playlist.model.PlaylistData;
	import application.playlist.model.SoundData;
	import application.playlist.service.IPlaylistsService;

	import downloader.message.DownloaderActionMessage;
	import downloader.service.DownloaderDataHelper;
	import downloader.service.DownloaderService;

	import flash.events.Event;

	import flash.filesystem.File;

	public class AddPlaylistToDownloaderCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _callback:Function;
		private var _dispatcher:Function;
		private var _playlistsService:IPlaylistsService;
		private var _downloaderService:DownloaderService;
		private var _downloaderDataHelper:DownloaderDataHelper;

		private var file:File;
		private var path:String;
		private var playlistData:PlaylistData;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set callback(value:Function):void { _callback = value; }

		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

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
		public function AddPlaylistToDownloaderCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:DownloaderActionMessage):void {
			playlistData = _playlistsService.getPlaylistById(message.playlistId);

			if (_downloaderService.path) {
				file = new File(_downloaderService.path);
			} else {
				file = File.desktopDirectory;//.resolvePath(sound.artist + ' - ' + sound.title);
			}
			file.browseForDirectory('Select directory');

			file.addEventListener(Event.SELECT, fileHandler, false, 0, true);
			file.addEventListener(Event.CANCEL, fileHandler, false, 0, true);
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
		private function fileHandler(event:Event):void {
			var file:File = event.currentTarget as File;
			file.removeEventListener(Event.SELECT, fileHandler);
			file.removeEventListener(Event.CANCEL, fileHandler);

			if (event.type == Event.SELECT) {
				_downloaderService.savePath(file.nativePath + '/' + playlistData.title);
				var sound:SoundData;
				for (var i:int = 0; i < playlistData.sounds.length; i++) {
					sound = playlistData.sounds[i];
					_downloaderService.addItem(sound.artist + ' - ' + sound.title, sound.url);
				}

				var message:DownloaderActionMessage = new DownloaderActionMessage(DownloaderActionMessage.UPDATE_DOWNLOADER);
				message.downloaderVO = _downloaderDataHelper.createDownloaderVO();
				_dispatcher(message);
			}
			_callback(true);
		}
	}
}
