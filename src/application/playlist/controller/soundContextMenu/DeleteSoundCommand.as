/**
 * DeleteSoundCommand
 * User: Alex
 * Date: 08.08.16
 * Time: 18:13
 */
package application.playlist.controller.soundContextMenu {
	import application.playlist.model.ActionData;
	import application.playlist.model.ActionType;
	import application.playlist.model.PlaylistData;

	import core.command.BaseCommand;

	import application.playlist.message.PlaylistActionMessage;
	import application.playlist.model.SoundData;
	import application.playlist.service.IPlaylistsService;

	import server.service.IServerRemoteService;

	public class DeleteSoundCommand extends BaseCommand {
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
		public function DeleteSoundCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:PlaylistActionMessage):void {
			var sound:SoundData = _playlistsService.deleteSoundFromPlaylist(message.soundId, _playlistsService.openedPlaylist.id);
			if(_playlistsService.openedPlaylist.id == Settings.DEFAULT_PLAYLIST_ID) {
				lockApplication('delete sound from vk');
				_serverRemoteService.deleteSoundFromVKPlaylist(sound.id, sound.ownerId, _callback);
			} else {
				var action:ActionData = new ActionData();
				action.type = ActionType.DELETE_SOUND;
				action.soundId = sound.id;
				_playlistsService.openedPlaylist.actionsList.push(action);
				_callback(true);
			}
		}

		public function result(data:Object = null):void {
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
