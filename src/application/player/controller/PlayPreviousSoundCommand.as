/**
 * PlayPreviousSoundCommand.
 * Date: 07.04.14
 * Time: 15:36
 * Alex Hoch
 */

package application.player.controller {
	import application.player.message.PlayerActionMessage;
	import application.playlist.model.PlaylistSoundData;
	import application.playlist.model.SoundData;
	import application.playlist.service.IPlaylistsService;

	public class PlayPreviousSoundCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _playlistsService:IPlaylistsService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

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
		public function PlayPreviousSoundCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:PlayerActionMessage):void {
			var playlistSoundData:PlaylistSoundData = _playlistsService.previousPlayingSound;
			_playlistsService.chooseSound(playlistSoundData.sound.id, playlistSoundData.playlistId);
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
