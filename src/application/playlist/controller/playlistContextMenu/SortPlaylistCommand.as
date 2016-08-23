/**
 * SortPlaylistCommand
 * User: Alex
 * Date: 09.08.16
 * Time: 11:38
 */
package application.playlist.controller.playlistContextMenu {
	import application.playlist.message.PlaylistActionMessage;
	import application.playlist.model.ActionData;
	import application.playlist.model.ActionType;
	import application.playlist.service.IPlaylistsService;

	public class SortPlaylistCommand {
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
		public function SortPlaylistCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:PlaylistActionMessage):void {
			_playlistsService.sortPlaylistByType(message.id);
			var action:ActionData = new ActionData();
			action.type = ActionType.SORT;
			action.sortingId = message.id;
			_playlistsService.openedPlaylist.actionsList.push(action);
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
