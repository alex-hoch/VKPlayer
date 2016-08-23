/**
 * RemoveSoundFromQueueCommand
 * User: Alex
 * Date: 10.08.16
 * Time: 15:12
 */
package application.playlist.controller {
	import application.playlist.model.PlaylistData;
	import application.playlist.service.IPlaylistsService;

	public class RemoveSoundFromQueueCommand {
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
		public function RemoveSoundFromQueueCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			var openedPlaylist:PlaylistData = _playlistsService.openedPlaylist;
			if (openedPlaylist.selectedSoundId != -1) {
				_playlistsService.removeSoundFromQueue(openedPlaylist.selectedSoundId, openedPlaylist.id);
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
