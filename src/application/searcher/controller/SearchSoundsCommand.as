/**
 * SearchCommand.
 * Date: 19.02.14
 * Time: 15:41
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.searcher.controller {
	import application.playlist.service.IPlaylistsService;

	import core.command.BaseCommand;

	import application.playlist.message.PlaylistMessage;
	import application.playlist.model.ActionData;
	import application.playlist.model.ActionType;

	import application.searcher.message.SearcherActionMessage;

	import server.service.IServerDataConverter;
	import server.service.IServerRemoteService;

	public class SearchSoundsCommand extends BaseCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _callback:Function;
		private var _dispatcher:Function;
		private var _playlistsService:IPlaylistsService;
		private var _serverRemoteService:IServerRemoteService;
		private var _serverDataConverter:IServerDataConverter;

		private var keyWord:String;
		private var offset:int;

		private var sounds:Array;
		private var playlistId:Number;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set callback(value:Function):void { _callback = value; }

		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

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
		public function SearchSoundsCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:SearcherActionMessage):void {
			playlistId = message.playlistId;
			lockApplication('searching');

			sounds = [];
			keyWord = message.text;
			sendRequest();
		}

		public function result(data:Object = null):void {
			if (playlistId) {
				_playlistsService.fillPlaylist(playlistId, sounds);
			} else {
				var message:PlaylistMessage = new PlaylistMessage(PlaylistMessage.CREATE_PLAYLIST);
				message.title = keyWord;
				message.sounds = sounds;
				var action:ActionData = new ActionData();
				action.type = ActionType.SEARCH_PHRASE;
				action.text = keyWord;
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
		private function sendRequest():void {
			_serverRemoteService.searchSounds(keyWord, true, offset, searchResultHandler);
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		private function searchResultHandler(data:Object):void {
			var response:Array = data.response;
			if (!response) {
				// TODO parse error
			}
			var length:int = response ? response.length : 0;
			for (var i:int = 0; i < length; i++) {
				if (!isNaN(response[i])) continue;
				sounds[sounds.length] = _serverDataConverter.convertSoundData(response[i]);
			}

			offset += 1;
			if (offset < 5) {
				sendRequest();
			} else {
				_callback(true);
			}
		}

	}
}
