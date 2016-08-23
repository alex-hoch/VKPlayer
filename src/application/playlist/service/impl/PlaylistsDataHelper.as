/**
 * PlaylistsDataHelper.
 * Date: 07.04.14
 * Time: 11:23
 * Alex Hoch
 */

package application.playlist.service.impl {
	import application.playlist.PlaylistSortingType;
	import application.playlist.SoundGenreType;
	import application.playlist.model.PlaylistData;
	import application.playlist.model.SoundData;
	import application.playlist.service.IPlaylistsDataHelper;
	import application.playlist.service.IPlaylistsService;
	import application.playlist.view.data.PlaylistViewData;
	import application.playlist.view.data.SoundViewData;
	import application.playlist.vo.PlaylistsVO;

	public class PlaylistsDataHelper implements IPlaylistsDataHelper {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _playlistsService:IPlaylistsService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
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
		public function PlaylistsDataHelper() {
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function getPlaylistsVO():PlaylistsVO {
			var result:PlaylistsVO = new PlaylistsVO();
			var playlists:Vector.<PlaylistViewData> = new Vector.<PlaylistViewData>();
			var allPlaylist:Array = _playlistsService.getAllPlaylists();
			var length:int = allPlaylist.length;
			for (var i:int = 0; i < length; i++) {
				playlists[playlists.length] = convertPlaylistViewData(allPlaylist[i]);
			}
			result.playlists = playlists;

			var allSounds:Array = _playlistsService.openedPlaylist.sounds;
			length = allSounds.length;
			var sounds:Array = [];
			var soundData:SoundData;
			var soundViewData:SoundViewData;
			var addGenre:Boolean = (_playlistsService.openedPlaylist.sortingType == PlaylistSortingType.BY_GENRE);
			var prevGenre:int = -1;
			for (i = 0; i < length; i++) {
				soundData = allSounds[i];
				if(addGenre && soundData.genre != prevGenre) {
					sounds[sounds.length] = createGenreViewData(soundData.genre);
					prevGenre = soundData.genre;
				}
				soundViewData = convertSoundViewData(soundData);
				soundViewData.position = i + 1;
				soundViewData.queuePosition = _playlistsService.getSoundInQueuePosition(soundData.id, _playlistsService.openedPlaylist.id);
				sounds[sounds.length] = soundViewData;
			}
			result.sounds = sounds
			result.scrollPosition = _playlistsService.openedPlaylist.scrollPosition;
			return result;
		}

		private function createGenreViewData(genreId:int):SoundViewData {
			var result:SoundViewData = new SoundViewData();
			result.id = genreId;
			result.name = SoundGenreType.getNameById(genreId);
			result.isGenreTitle = true;
			return result;
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function convertPlaylistViewData(playlistData:PlaylistData):PlaylistViewData {
			var result:PlaylistViewData = new PlaylistViewData();
			result.id = playlistData.id;
			result.title = playlistData.title;
			result.selected = (result.id == _playlistsService.openedPlaylist.id);
			return result;
		}

		private function convertSoundViewData(sound:SoundData):SoundViewData {
			var result:SoundViewData = new SoundViewData();
			result.id = sound.id;
			result.name = sound.artist + ' - ' + sound.title;
			result.artist = sound.artist;
			result.duration = sound.duration;
			result.selected = (result.id == _playlistsService.openedPlaylist.selectedSoundId);
			result.playing = (_playlistsService.playingPlaylist && result.id == _playlistsService.playingPlaylist.playingSoundId);
			result.hasLyrics = sound.lyricsId > 0;
			result.ownerId = sound.ownerId;
			return result;
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
	}
}
