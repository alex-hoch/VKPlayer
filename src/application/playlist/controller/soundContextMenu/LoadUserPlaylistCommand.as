/**
 * LoadUserPlaylistCommand.
 * Date: 01.04.14
 * Time: 15:58
 * Alex Hoch
 */

package application.playlist.controller.soundContextMenu {
	import application.playlist.service.IPlaylistsService;

	import core.command.BaseCommand;

	import friends.model.UserModel;

	import login.service.IApplicationService;

	import application.playlist.message.PlaylistActionMessage;
	import application.playlist.message.PlaylistMessage;
	import application.playlist.model.ActionData;
	import application.playlist.model.ActionType;

	import server.service.IServerDataConverter;
	import server.service.IServerRemoteService;

	public class LoadUserPlaylistCommand extends BaseCommand {
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
		private var _serverDataConverter:IServerDataConverter;

		private var userId:Number;
		private var playlistId:Number;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set callback(value:Function):void { _callback = value; }

		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

		public function set applicationService(value:IApplicationService):void { _applicationService = value; }

		public function set serverRemoteService(value:IServerRemoteService):void { _serverRemoteService = value; }

		public function set serverDataConverter(value:IServerDataConverter):void { _serverDataConverter = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function LoadUserPlaylistCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:PlaylistActionMessage):void {
			lockApplication('loading');

			userId = message.userId;
			playlistId = message.playlistId;
			_serverRemoteService.loadUserPlaylist(userId, _callback);
		}

		public function result(data:Object = null):void {
			var response:Array = data.response;
			var userInfo:UserModel = _serverDataConverter.convertSimpleUserModel(response.shift());
			var sounds:Array = [];
			var length:int = response.length;
			for (var i:int = 0; i < length; i++) {
				sounds[sounds.length] = _serverDataConverter.convertSoundData(response[i]);
			}

			if (playlistId) {
				_playlistsService.fillPlaylist(playlistId, sounds);
			} else {
				var message:PlaylistMessage = new PlaylistMessage(PlaylistMessage.CREATE_PLAYLIST);
				if (userId == _applicationService.userId) {
					message.id = Settings.DEFAULT_PLAYLIST_ID;
					message.title = Settings.DEFAULT_PLAYLIST_NAME;
				} else {
					message.title = userInfo.name;
				}
				message.sounds = sounds;
				var action:ActionData = new ActionData();
				action.type = ActionType.LOAD_USER_PLAYLIST;
				action.userId = userId;
				message.action = action;
				_dispatcher(message);

				unlockApplication();
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
