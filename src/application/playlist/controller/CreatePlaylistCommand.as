/**
 * CreatePlaylistCommand.
 * Date: 01.04.14
 * Time: 13:58
 * Alex Hoch
 */

package application.playlist.controller {
	import util.FileSystemManager;

	import application.playlist.message.PlaylistMessage;
	import application.playlist.model.PlaylistData;
	import application.playlist.service.IPlaylistsService;

	public class CreatePlaylistCommand {
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
		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

		public function set fileSystemManager(value:FileSystemManager):void { _fileSystemManager = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function CreatePlaylistCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:PlaylistMessage):void {
			var playlistId:Number = message.id || new Date().time;
			var playlistData:PlaylistData = _playlistsService.createPlaylist(playlistId, message.title, message.sounds, message.action);
			if (playlistData.sounds.length) {
				playlistData.selectedSoundId = playlistData.sounds[0].id;
			}
			_playlistsService.choosePlaylist(playlistId);

			if (playlistData.id != Settings.DEFAULT_PLAYLIST_ID) {
				_fileSystemManager.savePlaylist(playlistData);
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
