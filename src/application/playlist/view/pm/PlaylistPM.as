/**
 * PlaylistPM.
 * Date: 01.04.14
 * Time: 14:59
 * Alex Hoch
 */

package application.playlist.view.pm {
	import application.playlist.message.PlaylistActionMessage;
	import application.playlist.message.PlaylistViewMessage;
	import application.playlist.model.SoundData;
	import application.playlist.view.data.PlaylistViewData;
	import application.playlist.view.data.SoundViewData;
	import application.playlist.vo.PlaylistsVO;

	import application.searcher.message.SearcherActionMessage;

	import downloader.message.DownloaderActionMessage;

	public class PlaylistPM {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _allPlaylists:Vector.<PlaylistViewData>;
		private var allSounds:Array;
		private var _scrollPosition:int;
		private var rowCount:int;
		private var _selectedSound:SoundViewData;
		private var _openedPlaylist:PlaylistViewData;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function get sounds():Array { return allSounds; }

		public function get allPlaylists():Vector.<PlaylistViewData> { return _allPlaylists; }

		public function get scrollPosition():int { return _scrollPosition; }

		public function get selectedSound():SoundViewData { return _selectedSound; }

		public function get openedPlaylist():PlaylistViewData {return _openedPlaylist;}

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlaylistPM() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function updatePlaylists(playlistsVO:PlaylistsVO):void {
			_allPlaylists = playlistsVO.playlists;
			allSounds = playlistsVO.sounds;
			for (var i:int = 0; i < allSounds.length; i++) {
				if (SoundViewData(allSounds[i]).selected) {
					_selectedSound = SoundViewData(allSounds[i]);
					break;
				}
			}
			for (i = 0; i < _allPlaylists.length; i++) {
				if (_allPlaylists[i].selected) {
					_openedPlaylist = _allPlaylists[i];
					break;
				}
			}
			_scrollPosition = playlistsVO.scrollPosition;
			_dispatcher(new PlaylistViewMessage(PlaylistViewMessage.UPDATE_PLAYLIST_VIEW));
		}

		public function playSound(soundData:SoundData):void {
			updatePlayingSound(soundData.id);
		}

		public function stopPlaying():void {
			updatePlayingSound(-1);
		}

		public function selectSound(soundId:Number):void {
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.SELECT_SOUND);
			message.soundId = soundId;
			_dispatcher(message);
		}

		public function chooseSound(soundId:Number):void {
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.CHOOSE_SOUND);
			message.soundId = soundId;
			_dispatcher(message);
		}

		public function selectNeighborSound(step:int):void {
			var length:int = allSounds.length;
			if (length <= step) return;
			var sound:SoundViewData;
			for (var i:int = 0; i < length; i++) {
				sound = allSounds[i];
				if (sound.selected) break;
			}
			var newSelectedSoundIndex:int = i + step;
			if (newSelectedSoundIndex >= length) {
				newSelectedSoundIndex -= length;
			} else if (newSelectedSoundIndex < 0) {
				newSelectedSoundIndex += length;
			}
			while (allSounds[newSelectedSoundIndex].isGenreTitle) {
				if (step > 0) {
					newSelectedSoundIndex++;
				} else {
					newSelectedSoundIndex--;
				}

				if (newSelectedSoundIndex >= length) {
					newSelectedSoundIndex -= length;
				} else if (newSelectedSoundIndex < 0) {
					newSelectedSoundIndex += length;
				}
			}
			if (newSelectedSoundIndex < _scrollPosition) {
				updateScrollPosition(newSelectedSoundIndex);
			}
			if (newSelectedSoundIndex > _scrollPosition + rowCount - 1) {
				updateScrollPosition(newSelectedSoundIndex - (rowCount - 1));
			}
			selectSound(allSounds[newSelectedSoundIndex].id);
		}

		public function updateScrollPosition(scrollPosition:int):void {
			_scrollPosition = scrollPosition;
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.UPDATE_SCROLL_POSITION);
			message.playlistId = _scrollPosition;
			_dispatcher(message);
		}

		public function changeRowCount(rowCount:int):void {
			this.rowCount = rowCount;
		}

		public function copySoundTo(playlistId:Number):void {
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.COPY_SOUND_TO);
			message.soundId = _selectedSound.id;
			message.playlistId = playlistId;
			_dispatcher(message);
		}

		public function moveSoundTo(playlistId:Number):void {
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.COPY_SOUND_TO);
			message.soundId = _selectedSound.id;
			message.playlistId = playlistId;
			message.removeFromPreviousPlaylist = true;
			_dispatcher(message);
		}

		public function searchArtistAnotherSound():void {
			var message:SearcherActionMessage = new SearcherActionMessage(SearcherActionMessage.SEARCH);
			message.text = _selectedSound.artist;
			_dispatcher(message);
		}

		public function searchOtherOwnerSounds():void {
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.LOAD_USER_PLAYLIST);
			message.userId = _selectedSound.ownerId;
			_dispatcher(message);
		}

		public function openOwnerPage():void {
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.OPEN_OWNER_PAGE);
			message.userId = _selectedSound.ownerId;
			_dispatcher(message);
		}

		public function showLyrics():void {
			_dispatcher(new PlaylistActionMessage(PlaylistActionMessage.SHOW_LYRICS));
		}

		public function saveSound():void {
			var message:DownloaderActionMessage = new DownloaderActionMessage(DownloaderActionMessage.ADD_SOUND_TO_DOWNLOADER);
			message.soundId = _selectedSound.id;
			message.playlistId = _openedPlaylist.id;
			_dispatcher(message);
		}

		public function deleteSound():void {
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.DELETE_SOUND);
			message.soundId = _selectedSound.id;
			_dispatcher(message);
		}

		public function choosePlaylist(playlistId:Number):void {
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.CHOOSE_PLAYLIST);
			message.playlistId = playlistId;
			_dispatcher(message);
		}

		public function sortPlaylist(sortingType:int):void {
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.SORT_PLAYLIST);
			message.id = sortingType;
			_dispatcher(message);
		}

		public function savePlaylist():void {
			var message:DownloaderActionMessage = new DownloaderActionMessage(DownloaderActionMessage.ADD_PLAYLIST_TO_DOWNLOADER);
			message.playlistId = openedPlaylist.id;
			_dispatcher(message);
		}

		public function clearPlaylist():void {
			_dispatcher(new PlaylistActionMessage(PlaylistActionMessage.CLEAR_PLAYLIST));
		}

		public function deletePlaylist():void {
			_dispatcher(new PlaylistActionMessage(PlaylistActionMessage.DELETE_PLAYLIST));
		}

		public function addToQueue():void {
			_dispatcher(new PlaylistActionMessage(PlaylistActionMessage.ADD_SOUND_TO_QUEUE));
		}

		public function removeFromQueue():void {
			_dispatcher(new PlaylistActionMessage(PlaylistActionMessage.REMOVE_SOUND_FROM_QUEUE));
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function updatePlayingSound(playingSoundId:Number):void {
			return;
			var length:int = allSounds.length;
			var sound:SoundViewData;
			for (var i:int = 0; i < length; i++) {
				sound = allSounds[i];
				sound.playing = (sound.id == playingSoundId);
			}
			_dispatcher(new PlaylistViewMessage(PlaylistViewMessage.UPDATE_PLAYLIST_VIEW));
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
	}
}
