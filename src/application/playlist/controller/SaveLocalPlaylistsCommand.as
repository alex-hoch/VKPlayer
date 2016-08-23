/**
 * SaveLocalPlaylistsCommand
 * User: Alex
 * Date: 10.08.16
 * Time: 11:23
 */
package application.playlist.controller {
	import application.playlist.model.PlaylistData;
	import application.playlist.service.IPlaylistsService;

	import util.FileSystemManager;

	public class SaveLocalPlaylistsCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _playlistsService:IPlaylistsService;
		private var _fileSystemManager:FileSystemManager;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function SaveLocalPlaylistsCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			var allPlaylists:Array = _playlistsService.getAllPlaylists();
			var playlistData:PlaylistData;
			for (var i:int = 0; i < allPlaylists.length; i++) {
				playlistData = allPlaylists[i];
				if (playlistData.id != Settings.DEFAULT_PLAYLIST_ID) {
					_fileSystemManager.savePlaylist(playlistData);
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

		public function set playlistsService(value:IPlaylistsService):void {
			_playlistsService = value;
		}

		public function set fileSystemManager(value:FileSystemManager):void {
			_fileSystemManager = value;
		}
	}
}
