/**
 * ShowLyricsCommand
 * User: Alex
 * Date: 08.08.16
 * Time: 18:12
 */
package application.playlist.controller.soundContextMenu {
	import core.command.BaseCommand;

	import application.playlist.message.PlaylistActionMessage;
	import application.playlist.model.PlaylistData;
	import application.playlist.model.SoundData;
	import application.playlist.service.IPlaylistsService;

	import server.service.IServerRemoteService;

	public class ShowLyricsCommand extends BaseCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _callback:Function;
		private var _playlistsService:IPlaylistsService;
		private var _serverRemoteService:IServerRemoteService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set callback(value:Function):void { _callback = value; }

		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

		public function set serverRemoteService(value:IServerRemoteService):void { _serverRemoteService = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function ShowLyricsCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:PlaylistActionMessage):void {
			lockApplication('load lyrics');

			var playlist:PlaylistData = _playlistsService.openedPlaylist;
			var sound:SoundData = _playlistsService.getSoundFromPlaylist(playlist.selectedSoundId, playlist.id);
			_serverRemoteService.loadSoundLyrics(sound.lyricsId, _callback);
		}

		public function result(data:Object = null):void {
			if(data.response) {
				trace(data.response.text);
			}
			unlockApplication();
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
