/**
 * PlayActiveSoundCommand.
 * Date: 07.04.14
 * Time: 16:42
 * Alex Hoch
 */

package application.player.controller {
	import application.player.PlayerState;
	import application.player.message.PlayerActionMessage;
	import application.player.service.PlayerDataHelper;
	import application.player.service.PlayerService;

	import application.playlist.service.IPlaylistsService;

	import hint.HintType;

	import hint.message.HintActionMessage;

	public class PlayActiveSoundCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _playerService:PlayerService;
		private var _playerDataHelper:PlayerDataHelper;
		private var _playlistsService:IPlaylistsService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playerService(value:PlayerService):void { _playerService = value; }

		public function set playerDataHelper(value:PlayerDataHelper):void { _playerDataHelper = value; }

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
		public function PlayActiveSoundCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			_playerService.updatePlayerState(PlayerState.PLAYING);

			var playerMessage:PlayerActionMessage = new PlayerActionMessage(PlayerActionMessage.UPDATE_PLAYER_STATE);
			playerMessage.playerStateVO = _playerDataHelper.generatePlayerStateVO();
			_dispatcher(playerMessage);

			var hintMessage:HintActionMessage = new HintActionMessage(HintActionMessage.SHOW_HINT);
			hintMessage.hintType = HintType.START_PLAYING;
			hintMessage.data = _playlistsService.playingSound;
			_dispatcher(hintMessage);

			/*
			 var soundId:Number = _playlistsService.playingPlaylist.playingSoundId;
			 if (soundId == -1) {
			 soundId = _playlistsService.playingPlaylist.selectedSoundId;
			 if (soundId == -1) {
			 if (_playlistsService.playingPlaylist.sounds.length) {
			 soundId = _playlistsService.playingPlaylist.sounds[0].id;
			 } else {
			 return;
			 }
			 }
			 _playlistsService.chooseSound(soundId); // TODO rewrite when appear more than 1 application.playlist

			 var playerMessage:PlayerMessage = new PlayerMessage(PlayerMessage.PLAY_SOUND);
			 playerMessage.soundData = _playlistsService.playingSound;
			 _dispatcher(playerMessage);
			 */
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