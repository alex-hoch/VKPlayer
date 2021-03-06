/**
 * AddSoundToQueueCommand
 * User: Alex
 * Date: 10.08.16
 * Time: 15:09
 */
package application.playlist.controller {
	import application.playlist.model.PlaylistData;
	import application.playlist.service.IPlaylistsService;

	public class AddSoundToQueueCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _playlistsService:IPlaylistsService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function AddSoundToQueueCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			var openedPlaylist:PlaylistData = _playlistsService.openedPlaylist;
			if (openedPlaylist.selectedSoundId != -1) {
				_playlistsService.addSoundToQueue(openedPlaylist.selectedSoundId, openedPlaylist.id);
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
