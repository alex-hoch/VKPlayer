/**
 * PlaylistView.
 * Date: 16.02.14
 * Time: 16:18
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.playlist.view {
	import ah.gui.core.display.list.BaseList;

	import util.MouseWheelScroller;

	import core.view.BaseView;

	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	import application.playlist.view.components.AllPlaylistsContainer;
	import application.playlist.view.components.contextMenu.PlaylistContextMenu;
	import application.playlist.view.components.PlaylistSoundView;
	import application.playlist.view.components.contextMenu.SoundContextMenu;
	import application.playlist.view.components.contextMenu.GenreContextMenu;
	import application.playlist.view.event.PlaylistEvent;
	import application.playlist.view.pm.PlaylistPM;

	public class PlaylistView extends BaseView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _playlistPM:PlaylistPM;

		private var allPlaylistsContainer:AllPlaylistsContainer;
		private var soundsList:BaseList;
		private var mouseScroller:MouseWheelScroller;

		private var soundContextMenu:SoundContextMenu;
		private var genreContextMenu:GenreContextMenu;
		private var playlistContextMenu:PlaylistContextMenu;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set playlistPM(value:PlaylistPM):void { _playlistPM = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlaylistView() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function init():void {
			draw();
			startListen();
			resizeHandler(null);
		}

		public function updatePlaylist():void {
			soundsList.dataProvider = _playlistPM.sounds;
			soundsList.scrollPosition = _playlistPM.scrollPosition;
			soundsList.update();

			allPlaylistsContainer.update(_playlistPM.allPlaylists);
			resizeHandler(null);

			if (_playlistPM.selectedSound) {
				soundContextMenu.update(_playlistPM.selectedSound, _playlistPM.allPlaylists, _playlistPM.openedPlaylist);
				soundsList.contextMenu = soundContextMenu;
			}
			playlistContextMenu.update(_playlistPM.openedPlaylist.id != Settings.DEFAULT_PLAYLIST_ID);
		}

		override public function destroy():void {
			if (destroyed) return;
			stopListen();
//						mouseScroller.destroy();
			super.destroy();
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {
			allPlaylistsContainer = new AllPlaylistsContainer(stage.stageWidth);
			this.addChild(allPlaylistsContainer);

			playlistContextMenu = new PlaylistContextMenu();
			allPlaylistsContainer.contextMenu = playlistContextMenu;

			soundsList = new BaseList();
			soundsList.columnCount = 1;
			soundsList.rowCount = 10;
			soundsList.listItemDisplayClass = PlaylistSoundView;
			soundsList.indentBetweenRows = -1;
			soundsList.dataProvider = [];
			soundsList.draw();
			soundsList.y = 50;
			this.addChild(soundsList);

			soundContextMenu = new SoundContextMenu();
			soundsList.contextMenu = soundContextMenu;

			genreContextMenu = new GenreContextMenu();

			mouseScroller = new MouseWheelScroller(soundsList);
		}

		private function startListen():void {
			this.addEventListener(PlaylistEvent.SELECT_SOUND, selectSoundHandler);
			this.addEventListener(PlaylistEvent.CHOOSE_SOUND, chooseSoundHandler);
			this.addEventListener(PlaylistEvent.CHOOSE_PLAYLIST, choosePlaylistHandler);
			this.addEventListener(PlaylistEvent.SHOW_SOUND_GENRE_CONTEXT_MENU, soundGenreContextMenuHandler);

			soundContextMenu.addEventListener(PlaylistEvent.COPY_SOUND_TO, copySoundToHandler);
			soundContextMenu.addEventListener(PlaylistEvent.MOVE_SOUND_TO, moveSoundToHandler);
			soundContextMenu.addEventListener(PlaylistEvent.SHOW_OTHER_ARTISTS_SOUNDS, searchArtistAnotherSoundHandler);
			soundContextMenu.addEventListener(PlaylistEvent.SHOW_OTHER_OWNER_SOUNDS, searchOtherOwnerSoundsHandler);
			soundContextMenu.addEventListener(PlaylistEvent.OPEN_OWNER_PAGE, openOwnerPageHandler);
			soundContextMenu.addEventListener(PlaylistEvent.SHOW_TEXT, showTextHandler);
			soundContextMenu.addEventListener(PlaylistEvent.SAVE_SOUND, saveSoundHandler);
			soundContextMenu.addEventListener(PlaylistEvent.DELETE_SOUND, deleteSoundHandler);

			playlistContextMenu.addEventListener(PlaylistEvent.SORT_PLAYLIST, sortPlaylistHandler);
			playlistContextMenu.addEventListener(PlaylistEvent.SAVE_PLAYLIST, savePlaylistHandler);
			playlistContextMenu.addEventListener(PlaylistEvent.CLEAR_PLAYLIST, clearPlaylistHandler);
			playlistContextMenu.addEventListener(PlaylistEvent.DELETE_PLAYLIST, deletePlaylistHandler);

			stage.addEventListener(Event.RESIZE, resizeHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
			mouseScroller.addEventListener(Event.CHANGE, changeScrollHandler);
		}

		private function stopListen():void {
			this.removeEventListener(PlaylistEvent.SELECT_SOUND, selectSoundHandler);
			this.removeEventListener(PlaylistEvent.CHOOSE_SOUND, chooseSoundHandler);
			this.removeEventListener(PlaylistEvent.CHOOSE_PLAYLIST, choosePlaylistHandler);
			stage.removeEventListener(Event.RESIZE, resizeHandler);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
			mouseScroller.removeEventListener(Event.CHANGE, changeScrollHandler);
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		private function selectSoundHandler(event:PlaylistEvent):void {
			_playlistPM.selectSound(event.itemId);
		}

		private function chooseSoundHandler(event:PlaylistEvent):void {
			_playlistPM.chooseSound(event.itemId);
		}

		private function choosePlaylistHandler(event:PlaylistEvent):void {
			_playlistPM.choosePlaylist(event.itemId);
		}

		private function resizeHandler(event:Event):void {
			var width:Number = stage.stageWidth;
			allPlaylistsContainer.resize(width);
			soundsList.y = allPlaylistsContainer.height - 2;
			var rowCount:int = (stage.stageHeight - this.y - soundsList.y) / 20;
			soundsList.rowCount = rowCount;
			_playlistPM.changeRowCount(rowCount);
			for (soundsList.firstItem; !soundsList.isDone; soundsList.nextItem()) {
				soundsList.currentItem.width = width;
			}
		}

		private function keyHandler(event:KeyboardEvent):void {
			if (stage.focus is PlaylistSoundView) {
				var step:int;
				switch (event.keyCode) {
					case Keyboard.UP:
						step = -1;
						break;
					case Keyboard.DOWN:
						step = 1;
						break;
					case Keyboard.PAGE_UP:
						step = -soundsList.rowCount;
						break;
					case Keyboard.PAGE_DOWN:
						step = soundsList.rowCount;
						break;
					case Keyboard.ENTER:
					case Keyboard.NUMPAD_ENTER:
						_playlistPM.chooseSound(-1);
						break;
					case Keyboard.Q:
						if (event.ctrlKey) {
							_playlistPM.removeFromQueue();
						} else {
							_playlistPM.addToQueue();
						}
						break;
					case Keyboard.T:
						if (event.ctrlKey) {
							if (_playlistPM.selectedSound && _playlistPM.selectedSound.hasLyrics) {
								_playlistPM.showLyrics();
							}
						}
						break;
				}
				if (step) _playlistPM.selectNeighborSound(step);
			}
		}

		private function changeScrollHandler(event:Event):void {
			_playlistPM.updateScrollPosition(soundsList.scrollPosition);
		}

		private function soundGenreContextMenuHandler(event:PlaylistEvent):void {
			genreContextMenu.update(event.itemId, _playlistPM.allPlaylists, _playlistPM.openedPlaylist);
			soundsList.contextMenu = genreContextMenu;
		}

		private function copySoundToHandler(event:PlaylistEvent):void {
			_playlistPM.copySoundTo(event.itemId);
		}

		private function moveSoundToHandler(event:PlaylistEvent):void {
			_playlistPM.moveSoundTo(event.itemId);
		}

		private function searchArtistAnotherSoundHandler(event:PlaylistEvent):void {
			_playlistPM.searchArtistAnotherSound();
		}

		private function searchOtherOwnerSoundsHandler(event:PlaylistEvent):void {
			_playlistPM.searchOtherOwnerSounds();
		}

		private function openOwnerPageHandler(event:PlaylistEvent):void {
			_playlistPM.openOwnerPage();
		}

		private function showTextHandler(event:PlaylistEvent):void {
			_playlistPM.showLyrics();
		}

		private function saveSoundHandler(event:PlaylistEvent):void {
			_playlistPM.saveSound();
		}

		private function deleteSoundHandler(event:PlaylistEvent):void {
			_playlistPM.deleteSound();
		}

		private function sortPlaylistHandler(event:PlaylistEvent):void {
			_playlistPM.sortPlaylist(event.itemId);
		}

		private function savePlaylistHandler(event:PlaylistEvent):void {
			_playlistPM.savePlaylist();
		}

		private function clearPlaylistHandler(event:PlaylistEvent):void {
			_playlistPM.clearPlaylist();
		}

		private function deletePlaylistHandler(event:PlaylistEvent):void {
			_playlistPM.deletePlaylist();
		}
	}
}
