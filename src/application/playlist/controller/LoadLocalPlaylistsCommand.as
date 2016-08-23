/**
 * LoadLocalPlaylistsCommand
 * User: Alex
 * Date: 09.08.16
 * Time: 16:11
 */
package application.playlist.controller {
	import application.playlist.model.ActionData;

	import util.FileSystemManager;

	import application.playlist.model.PlaylistData;
	import application.playlist.model.SoundData;

	import application.playlist.service.IPlaylistsService;

	import settings.service.ISettingsService;

	public class LoadLocalPlaylistsCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _settingsService:ISettingsService;
		private var _playlistsService:IPlaylistsService;
		private var _fileSystemManager:FileSystemManager;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set settingsService(value:ISettingsService):void { _settingsService = value; }

		public function set playlistsService(value:IPlaylistsService):void { _playlistsService = value; }

		public function set fileSystemManager(value:FileSystemManager):void { _fileSystemManager = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function LoadLocalPlaylistsCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			var list:Vector.<Object> = _fileSystemManager.loadPlaylists();
			var playlistData:PlaylistData;
			var sounds:Array;
			var actionsList:Array;
			var soundData:SoundData;
			for (var i:int = 0; i < list.length; i++) {
				playlistData = new PlaylistData();
				playlistData.id = list[i].id;
				playlistData.title = list[i].title;
				playlistData.playingSoundId = -1;//list[i].playingSoundId;
				playlistData.selectedSoundId = list[i].selectedSoundId;
				playlistData.sortingType = list[i].sortingType;
				playlistData.scrollPosition = list[i].scrollPosition;
				sounds = [];
				for (var j:int = 0; j < list[i].sounds.length; j++) {
					soundData = new SoundData();
					soundData.id = list[i].sounds[j].id;
					soundData.artist = list[i].sounds[j].artist;
					soundData.title = list[i].sounds[j].title;
					soundData.duration = list[i].sounds[j].duration;
					soundData.genre = list[i].sounds[j].genre;
					soundData.lyricsId = list[i].sounds[j].lyricsId;
					soundData.ownerId = list[i].sounds[j].ownerId;
					soundData.url = list[i].sounds[j].url;
					sounds[sounds.length] = soundData;
				}
				playlistData.sounds = sounds;
				actionsList = [];
				var action:ActionData;
				if (list[i].actionsList) {
					for (j = 0; j < list[i].actionsList.length; j++) {
						action = new ActionData();
						action.type = list[i].actionsList[j].type;
						action.userId = list[i].actionsList[j].userId;
						action.soundId = list[i].actionsList[j].soundId;
						action.playlistId = list[i].actionsList[j].playlistId;
						action.sortingId = list[i].actionsList[j].sortingId;
						action.text = list[i].actionsList[j].text;
						actionsList[actionsList.length] = action;
					}
				}
				playlistData.actionsList = actionsList;
				_playlistsService.addPlaylist(playlistData);
			}
			_playlistsService.choosePlaylist(_settingsService.openedPlaylistId);
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
