/**
 * CopySoundToAnotherPlaylistCommand
 * User: Alex
 * Date: 08.08.16
 * Time: 15:02
 */
package application.playlist.controller.soundContextMenu {
	import core.command.BaseCommand;

	import login.service.IApplicationService;

	import application.playlist.message.PlaylistActionMessage;
	import application.playlist.model.SoundData;
	import application.playlist.service.IPlaylistsService;

	import server.service.IServerRemoteService;

	public class CopySoundToAnotherPlaylistCommand extends BaseCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _callback:Function;
		private var _dispatcher:Function;
		private var _playlistsService:IPlaylistsService;
		private var _applicationService:IApplicationService;
		private var _serverRemoteService:IServerRemoteService;

		private var newSound:SoundData;
		private var newPlaylistId:Number;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set callback(value:Function):void { _callback = value; }

		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

		public function set applicationService(value:IApplicationService):void { _applicationService = value; }

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
		public function CopySoundToAnotherPlaylistCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:PlaylistActionMessage):void {
			var soundId:Number = _playlistsService.openedPlaylist.selectedSoundId;
			var playlistId:Number = _playlistsService.openedPlaylist.id;
			var sound:SoundData = _playlistsService.getSoundFromPlaylist(soundId, playlistId);
			if (message.removeFromPreviousPlaylist) {
				var deleteMessage:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.DELETE_SOUND);
				deleteMessage.soundId = soundId;
				deleteMessage.playlistId = playlistId;
				_dispatcher(deleteMessage);
			}
			newSound = sound.clone();
			newPlaylistId = message.playlistId;
			if (newPlaylistId == Settings.DEFAULT_PLAYLIST_ID) {
				_serverRemoteService.addSoundInVKPlaylist(sound.id, sound.ownerId, serverResponseCallback);
				lockApplication('add sound in vk');
			} else {
				_callback(true);
			}
		}

		public function result(data:Object = null):void {
			_playlistsService.addSoundToPlaylist(newSound, newPlaylistId);
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function serverResponseCallback(data:Object):void {
			newSound.id = data.response;
			newSound.ownerId = _applicationService.userId;
			unlockApplication();
			_callback(true);
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
	}
}
