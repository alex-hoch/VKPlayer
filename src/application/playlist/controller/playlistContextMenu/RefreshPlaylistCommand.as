/**
 * RefreshPlaylistCommand
 * User: Alex
 * Date: 23.08.16
 * Time: 15:19
 */
package application.playlist.controller.playlistContextMenu {
	import application.playlist.message.PlaylistActionMessage;
	import application.playlist.model.ActionData;
	import application.playlist.model.ActionType;
	import application.playlist.model.PlaylistData;
	import application.playlist.model.PlaylistData;
	import application.playlist.service.IPlaylistsService;
	import application.searcher.message.SearcherActionMessage;

	import core.command.BaseCommand;

	import server.service.IServerRemoteService;
	import server.service.impl.ServerDataConverter;

	public class RefreshPlaylistCommand extends BaseCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _callback:Function;
		private var _dispatcher:Function;
		private var _playlistsService:IPlaylistsService;
		private var _serverDataConverter:ServerDataConverter;
		private var _serverRemoteService:IServerRemoteService;

		private var playlistId:Number;
		private var actionsList:Array;
		private var actionIndex:int;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set callback(value:Function):void { _callback = value; }

		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

		public function set serverDataConverter(value:ServerDataConverter):void { _serverDataConverter = value; }

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
		public function RefreshPlaylistCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			lockApplication('Refreshing');
			var playlistData:PlaylistData = _playlistsService.openedPlaylist;
			playlistData.sounds = [];
			playlistId = playlistData.id;
			actionsList = playlistData.actionsList;
			checkAction();
		}

		private function checkAction():void {
			if (actionIndex < actionsList.length) {
				var action:ActionData = actionsList[actionIndex];
				switch (action.type) {
					case ActionType.SEARCH_PHRASE:
						var searchMessage:SearcherActionMessage = new SearcherActionMessage(SearcherActionMessage.SEARCH);
						searchMessage.text = action.text;
						searchMessage.playlistId = playlistId;
						_dispatcher(searchMessage);
						break;
					case ActionType.LOAD_USER_PLAYLIST:
						var loadMessage:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.LOAD_USER_PLAYLIST);
						loadMessage.userId = action.userId;
						loadMessage.playlistId = playlistId;
						_dispatcher(loadMessage);
						break;
					case ActionType.ADD_SOUND:
						_serverRemoteService.loadAudioInfo(action.userId, action.soundId, finishLoadingSoundInfo);
						break;
					case ActionType.DELETE_SOUND:
						_playlistsService.deleteSoundFromPlaylist(action.soundId, playlistId);
						goToNextAction();
						break;
					case ActionType.SORT:
						_playlistsService.sortPlaylistByType(action.sortingId);
						goToNextAction();
						break;
				}
			} else {
				unlockApplication();
				_callback(true);
			}
		}

		public function finishSearching():void {
			if (actionsList[actionIndex].type == ActionType.SEARCH_PHRASE) {
				goToNextAction();
			}
		}

		public function finishLoadingUserSounds():void {
			if (actionsList[actionIndex].type == ActionType.LOAD_USER_PLAYLIST) {
				goToNextAction();
			}
		}

		public function finishLoadingSoundInfo(data:Object = null):void {
			if (data.response) {
				var soundData = _serverDataConverter.convertSoundData(data.response[0]);
				_playlistsService.addSoundToPlaylist(soundData, playlistId);
			}
			goToNextAction();
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function goToNextAction():void {
			actionIndex++;
			checkAction();
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
	}
}
