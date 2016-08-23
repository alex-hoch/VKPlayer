/**
 * GenreContextMenu
 * User: Alex
 * Date: 09.08.16
 * Time: 12:47
 */
package application.playlist.view.components.contextMenu {
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.events.Event;

	import application.playlist.PlaylistPhrase;
	import application.playlist.view.data.PlaylistViewData;

	import application.playlist.view.event.PlaylistEvent;

	public class GenreContextMenu extends SoundBaseContextMenu {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var genreId:int;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function GenreContextMenu() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(genreId:int, allPlaylists:Vector.<PlaylistViewData>, openedPlaylist:PlaylistViewData):void {
			updateBase(allPlaylists, openedPlaylist);

			this.genreId = genreId;
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
		override protected function selectHandler(event:Event):void {
			var item:NativeMenuItem = NativeMenuItem(event.target);
			var customEvent:PlaylistEvent;
			if (item.menu == copyMenu) {
				customEvent = new PlaylistEvent(PlaylistEvent.COPY_SOUND_TO, true);
				customEvent.itemId = Number(item.data);
			} else if (item.menu == moveMenu) {
				customEvent = new PlaylistEvent(PlaylistEvent.MOVE_SOUND_TO, true);
				customEvent.itemId = Number(item.data);
			} else {
				var eventType:String;
				switch (item.label) {
					case PlaylistPhrase.SAVE:
						eventType = PlaylistEvent.SAVE_SOUND;
						break;
					case PlaylistPhrase.DELETE:
						eventType = PlaylistEvent.DELETE_SOUND;
						break;
				}
				customEvent = new PlaylistEvent(eventType, true);
			}
			customEvent.genreId = genreId;
			dispatchEvent(customEvent);
		}
	}
}
