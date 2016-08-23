/**
 * UpdatePlaylistsCommand
 * User: Alex
 * Date: 05.08.16
 * Time: 18:47
 */
package application.playlist.controller {
	import application.playlist.message.PlaylistMessage;
	import application.playlist.service.IPlaylistsDataHelper;

	public class UpdatePlaylistsCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _playlistsDataHelper:IPlaylistsDataHelper;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playlistsDataHelper(value:IPlaylistsDataHelper):void { _playlistsDataHelper = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function UpdatePlaylistsCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			var playlistsMessage:PlaylistMessage = new PlaylistMessage(PlaylistMessage.UPDATE_PLAYLISTS);
			playlistsMessage.playlistsVO = _playlistsDataHelper.getPlaylistsVO();
			_dispatcher(playlistsMessage);
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
