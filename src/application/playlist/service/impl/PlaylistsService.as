/**
 * PlaylistService.
 * Date: 01.04.14
 * Time: 14:03
 * Alex Hoch
 */

package application.playlist.service.impl {
	import application.playlist.model.PlaylistSoundData;
	import application.playlist.PlaylistSortingType;
	import application.playlist.model.ActionData;
	import application.playlist.model.PlaylistData;
	import application.playlist.model.PlaylistsModel;
	import application.playlist.model.SoundData;
	import application.playlist.service.IPlaylistsService;

	public class PlaylistsService implements IPlaylistsService {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var playlistsModel:PlaylistsModel;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get openedPlaylist():PlaylistData { return playlistsModel.openedPlaylist; }

		public function get playingPlaylist():PlaylistData { return playlistsModel.playingPlaylist; }

		public function get playingSound():SoundData {
			var result:SoundData;
			var playingPlaylist:PlaylistData = playlistsModel.playingPlaylist;
			if (playingPlaylist) {
				var sounds:Array = playingPlaylist.sounds;
				var length:int = sounds.length;
				for (var i:int = 0; i < length; i++) {
					if (sounds[i].id == playingPlaylist.playingSoundId) {
						result = sounds[i];
						break;
					}
				}
			}
			return result;
		}

		public function get nextPlayingSound():PlaylistSoundData {
			var result:PlaylistSoundData;
			if (playlistsModel.queue.length) {
				result = playlistsModel.queue.shift();
				return result;
			}
			var playingPlaylist:PlaylistData = playlistsModel.playingPlaylist;
			var sounds:Array = playingPlaylist.sounds;
			var length:int = sounds.length;
			var nextSoundIndex:int = -1;
			if (playingPlaylist.playingSoundId == -1) {
				if (length) {
					nextSoundIndex = 0;
				}
			} else {
				for (var i:int = 0; i < length; i++) {
					if (sounds[i].id == playingPlaylist.playingSoundId) {
						nextSoundIndex = i == length - 1 ? 0 : i + 1;
						break;
					}
				}
			}
			if (nextSoundIndex != -1) {
				result = new PlaylistSoundData();
				result.playlistId = playingPlaylist.id;
				result.sound = sounds[nextSoundIndex];
			}
			return result;
		}

		public function get previousPlayingSound():PlaylistSoundData {
			var result:PlaylistSoundData;
			var playingPlaylist:PlaylistData = playlistsModel.playingPlaylist;
			var sounds:Array = playingPlaylist.sounds;
			var length:int = sounds.length;
			var previousSoundIndex:int = -1;
			if (playingPlaylist.playingSoundId == -1) {
				if (length) {
					previousSoundIndex = 0;
				}
			} else {
				for (var i:int = 0; i < length; i++) {
					if (sounds[i].id == playingPlaylist.playingSoundId) {
						previousSoundIndex = i == 0 ? length - 1 : i - 1;
						break;
					}
				}
			}
			if (previousSoundIndex != -1) {
				result = new PlaylistSoundData();
				result.playlistId = playingPlaylist.id;
				result.sound = sounds[previousSoundIndex];
			}
			return result;
		}

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlaylistsService() {
			playlistsModel = new PlaylistsModel();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function createPlaylist(id:Number, title:String, sounds:Array, action:ActionData):PlaylistData {
			var playlistData:PlaylistData = new PlaylistData();
			playlistData.id = id;
			playlistData.title = title || generateDefaultTitle();
			playlistData.sounds = sounds || [];
			playlistData.actionsList = new Vector.<ActionData>();
			if (action) {
				playlistData.actionsList[playlistData.actionsList.length] = action;
			}
			playlistsModel.allPlaylists[playlistsModel.allPlaylists.length] = playlistData;
			if (playlistsModel.allPlaylists.length == 1) {
				playlistsModel.openedPlaylist = playlistData;
				playlistsModel.playingPlaylist = playlistData;
			}
			return playlistData;
		}

		public function addPlaylist(playlistData:PlaylistData):void {
			playlistsModel.allPlaylists[playlistsModel.allPlaylists.length] = playlistData;
		}

		public function getAllPlaylists():Array {
			return playlistsModel.allPlaylists;
		}

		public function selectSound(soundId:Number):void {
			playlistsModel.openedPlaylist.selectedSoundId = soundId;
		}

		public function chooseSound(soundId:Number, playlistId:Number):void {
			if (playlistsModel.playingPlaylist) playlistsModel.playingPlaylist.playingSoundId = -1;
			if (soundId == -1) {
				playlistsModel.playingPlaylist = null;
			} else {
				playlistsModel.playingPlaylist = getPlaylistById(playlistId);
				playlistsModel.playingPlaylist.playingSoundId = soundId;
			}
		}

		public function choosePlaylist(playlistId:Number):void {
			for (var i:int = 0; i < playlistsModel.allPlaylists.length; i++) {
				if (playlistsModel.allPlaylists[i].id == playlistId) {
					playlistsModel.openedPlaylist = playlistsModel.allPlaylists[i];
					break;
				}
			}
		}

		public function updateScrollPosition(scrollIndex:Number):void {
			playlistsModel.openedPlaylist.scrollPosition = scrollIndex;
		}

		public function addSoundToPlaylist(sound:SoundData, playlistId:Number):void {
			var playlistData:PlaylistData = getPlaylistById(playlistId);
			if (playlistId == Settings.DEFAULT_PLAYLIST_ID) {
				playlistData.sounds.unshift(sound);
			} else {
				playlistData.sounds[playlistData.sounds.length] = sound;
			}
		}

		public function deleteSoundFromPlaylist(soundId:Number, playlistId:Number):SoundData {
			var playlistData:PlaylistData = getPlaylistById(playlistId);
			var sound:SoundData;
			for (var i:int = 0; i < playlistData.sounds.length; i++) {
				if (playlistData.sounds[i].id == soundId) {
					sound = playlistData.sounds[i];
					playlistData.sounds.splice(i, 1);
					break;
				}
			}
			removeSoundFromQueue(soundId, playlistId, true);
			return sound;
		}

		public function getSoundFromPlaylist(soundId:Number, playlistId:Number):SoundData {
			var playlistData:PlaylistData = getPlaylistById(playlistId);
			var sound:SoundData;
			for (var i:int = 0; i < playlistData.sounds.length; i++) {
				if (playlistData.sounds[i].id == soundId) {
					sound = playlistData.sounds[i];
					break;
				}
			}
			return sound;
		}

		public function sortPlaylistByType(sortingType:int):void {
			var openedPlaylist:PlaylistData = openedPlaylist;
			switch (sortingType) {
				case PlaylistSortingType.BY_ARTIST:
					openedPlaylist.sounds.sortOn(['artist']);
					break;
				case PlaylistSortingType.BY_SOUND:
					openedPlaylist.sounds.sortOn(['title']);
					break;
				case PlaylistSortingType.BY_GENRE:
					openedPlaylist.sounds.sortOn(['genre'], Array.NUMERIC);
					break;
				case PlaylistSortingType.BY_DURATION:
					openedPlaylist.sounds.sortOn(['duration'], Array.NUMERIC);
					break;
			}
			openedPlaylist.sortingType = sortingType;
		}

		public function deletePlaylist(playlistId:Number):PlaylistData {
			var result:PlaylistData;
			for (var i:int = 0; i < playlistsModel.allPlaylists.length; i++) {
				if (playlistsModel.allPlaylists[i].id == playlistId) {
					result = playlistsModel.allPlaylists[i];
					playlistsModel.allPlaylists.splice(i, 1);
					playlistsModel.openedPlaylist = playlistsModel.allPlaylists[i - 1];
					break;
				}
			}
			for (i = 0; i < playlistsModel.queue.length; i++) {
				if (playlistsModel.queue[i].playlistId == playlistId) {
					playlistsModel.queue.splice(i, 1);
					i--;
				}
			}
			return result;
		}

		public function clearPlaylist(playlistId:Number):void {
			getPlaylistById(playlistId).sounds = [];
		}

		public function addSoundToQueue(soundId:Number, playlistId:Number):void {
			var playlistSoundData:PlaylistSoundData = new PlaylistSoundData();
			playlistSoundData.playlistId = playlistId;
			playlistSoundData.sound = getSoundFromPlaylist(soundId, playlistId);
			playlistsModel.queue[playlistsModel.queue.length] = playlistSoundData;
		}

		public function removeSoundFromQueue(soundId:Number, playlistId:Number, removeAllInstance:Boolean = false):void {
			var playlistSoundData:PlaylistSoundData;
			for (var i:int = playlistsModel.queue.length - 1; i >= 0; i--) {
				playlistSoundData = playlistsModel.queue[i];
				trace(soundId, playlistSoundData.sound.id)
				if (playlistSoundData.playlistId == playlistId && playlistSoundData.sound.id == soundId) {
					playlistsModel.queue.splice(i, 1);
					if (!removeAllInstance) break;
				}
			}
		}

		public function getSoundInQueuePosition(soundId:Number, playlistId:Number):int {
			var result:int;
			for (var i:int = 0; i < playlistsModel.queue.length; i++) {
				if (playlistsModel.queue[i].sound.id == soundId && playlistsModel.queue[i].playlistId == playlistId) {
					result = i + 1;
					break;
				}
			}
			return result;
		}

		public function getPlaylistById(playlistId:Number):PlaylistData {
			var result:PlaylistData;
			for (var i:int = 0; i < playlistsModel.allPlaylists.length; i++) {
				if (playlistsModel.allPlaylists[i].id == playlistId) {
					result = playlistsModel.allPlaylists[i];
					break;
				}
			}
			return result;
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function generateDefaultTitle():String {
			var counter:int = 1;
			var length:int = playlistsModel.allPlaylists.length;
			var playlistData:PlaylistData;
			var isFree:Boolean;
			while (!isFree) {
				isFree = true;
				for (var i:int = 0; i < length; i++) {
					playlistData = playlistsModel.allPlaylists[i];
					if (playlistData.title == 'application.playlist ' + counter) {
						isFree = false;
						counter++;
						break;
					}
				}
			}
			return 'application.playlist ' + counter;
		}

		//--------------------------------------------------------------------------
		//  Handlers 
		//--------------------------------------------------------------------------

	}
}
