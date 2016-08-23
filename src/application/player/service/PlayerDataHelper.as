/**
 * PlayerDataHelper.
 * Date: 10.04.14
 * Time: 14:57
 * Alex Hoch
 */

package application.player.service {
	import application.player.vo.PlayerInitVO;
	import application.player.vo.PlayerStateVO;
	import application.playlist.service.IPlaylistsService;

	public class PlayerDataHelper {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _playerService:PlayerService;
		private var _playlistsService:IPlaylistsService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set playerService(value:PlayerService):void { _playerService = value; }

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
		public function PlayerDataHelper() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function generatePlayerVO():PlayerInitVO {
			var result:PlayerInitVO = new PlayerInitVO();
			result.volumeValue = _playerService.volumeValue;
			result.isSoundCycled = _playerService.isSoundCycled;
			result.isListCycled = _playerService.isListCycled;
			result.isRandomPlaying = _playerService.isRandomPlaying;
			return result;
		}

		public function generatePlayerStateVO():PlayerStateVO {
			var result:PlayerStateVO = new PlayerStateVO();
			result.playingPlaylistId = _playlistsService.playingPlaylist ? _playlistsService.playingPlaylist.id : -1;
			result.activeSound = _playlistsService.playingSound;
			result.currentState = _playerService.playerState;
			result.previousState = _playerService.playerPreviousState;
			return result;
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
