/**
 * ServerRemoteService.
 * Date: 01.04.14
 * Time: 12:36
 * Alex Hoch
 */

package server.service.impl {
	import server.ServerRequestCommandName;
	import server.message.ServerActionMessage;
	import server.model.ServerRequest;
	import server.service.IServerRemoteService;

	public class ServerRemoteService implements IServerRemoteService {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;

		private var isBusy:Boolean;
		private var requests:Array;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function ServerRemoteService() {
			requests = [];
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function serverResponse(data:Object):void {
			var request:ServerRequest = requests.shift();
			if (request.callback != null) request.callback(data);
			isBusy = false;
			checkRequests();
		}

		public function loadUserPlaylist(userId:Number, callback:Function):void {
			var request:ServerRequest = new ServerRequest();
			request.commandName = ServerRequestCommandName.GET_USER_AUDIO;
			request.params = (userId > 0 ? 'uid=' : 'gid=') + userId + '&need_user=1';
			request.callback = callback;
			addRequest(request);
		}

		public function addSoundInVKPlaylist(soundId:Number, ownerId:Number, callback:Function):void {
			var request:ServerRequest = new ServerRequest();
			request.commandName = ServerRequestCommandName.ADD_AUDIO;
			request.params = 'aid=' + soundId + '&oid=' + ownerId;
			request.callback = callback;
			addRequest(request);
		}

		public function deleteSoundFromVKPlaylist(soundId:Number, ownerId:Number, callback:Function):void {
			var request:ServerRequest = new ServerRequest();
			request.commandName = ServerRequestCommandName.DELETE_AUDIO;
			request.params = 'aid=' + soundId + '&oid=' + ownerId;
			request.callback = callback;
			addRequest(request);
		}

		public function searchSounds(keyWord:String, searchSimilar:Boolean, offsetIndex:int, callback:Function):void {
			var request:ServerRequest = new ServerRequest();
			request.commandName = ServerRequestCommandName.SEARCH_SOUND;
			var soundCount:int = 200;
			request.params = 'q=' + keyWord + '&auto_complete=' + int(searchSimilar) + '&count=' + soundCount + '&offset=' + offsetIndex * soundCount;// + '&sort=0';
			request.callback = callback;
			addRequest(request);
		}

		public function loadSoundLyrics(lyricsId:Number, callback:Function):void {
			var request:ServerRequest = new ServerRequest();
			request.commandName = ServerRequestCommandName.GET_SOUND_TEXT;
			request.params = 'lyrics_id=' + lyricsId;
			request.callback = callback;
			addRequest(request);
		}

		public function loadFriends(userId:Number, callback:Function):void {
			var request:ServerRequest = new ServerRequest();
			request.commandName = ServerRequestCommandName.GET_USER_FRIENDS;
			request.params = 'uid=' + userId + '&fields=uid,first_name,last_name,photo_medium';
			request.callback = callback;
			addRequest(request);
		}

		public function loadAudioInfo(userId:Number, soundId:Number, callback:Function):void {
			var request:ServerRequest = new ServerRequest();
			request.commandName = ServerRequestCommandName.GET_AUDIO_INFO;
			request.params = 'audios=' + userId + '_' + soundId;
			request.callback = callback;
			addRequest(request);
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function addRequest(request:ServerRequest):void {
			requests[requests.length] = request;
			checkRequests();
		}

		private function checkRequests():void {
			if (!isBusy && requests.length) {
				isBusy = true;
				var message:ServerActionMessage = new ServerActionMessage(ServerActionMessage.SEND_REQUEST);
				message.request = requests[0];
				_dispatcher(message);
			}
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
	}
}
