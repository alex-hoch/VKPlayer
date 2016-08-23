/**
 * ChooseSoundCommand.
 * Date: 07.04.14
 * Time: 14:55
 * Alex Hoch
 */

package application.playlist.controller {
	import application.player.message.PlayerActionMessage;

	import application.playlist.message.PlaylistActionMessage;
	import application.playlist.service.IPlaylistsService;

	public class ChooseSoundCommand {
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
		public function ChooseSoundCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:PlaylistActionMessage):void {
			var soundId:Number = message.soundId;
			if (soundId == -1) {
				soundId = _playlistsService.openedPlaylist.selectedSoundId;
				if (soundId == -1) return;
			}
			var playlistId:Number = _playlistsService.openedPlaylist.id;
			_playlistsService.chooseSound(soundId, playlistId);

			_dispatcher(new PlayerActionMessage(PlayerActionMessage.PLAY_SOUND));
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
