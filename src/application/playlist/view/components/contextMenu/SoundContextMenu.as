/**
 * SoundContextMenu
 * User: Alex
 * Date: 08.08.16
 * Time: 13:59
 */
package application.playlist.view.components.contextMenu {
	import flash.display.NativeMenuItem;
	import flash.events.Event;

	import application.playlist.PlaylistPhrase;

	import application.playlist.view.data.PlaylistViewData;
	import application.playlist.view.data.SoundViewData;
	import application.playlist.view.event.PlaylistEvent;

	public class SoundContextMenu extends SoundBaseContextMenu {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var showTextItem:NativeMenuItem;

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
		public function SoundContextMenu() {
			super();

			this.addItemAt(new NativeMenuItem(PlaylistPhrase.OTHER_ARTISTS_SOUNDS), 2);
			this.addItemAt(new NativeMenuItem(PlaylistPhrase.OTHER_OWNER_SOUNDS), 3);
			this.addItemAt(new NativeMenuItem(PlaylistPhrase.OWNER_PAGE), 4);
			showTextItem = new NativeMenuItem(PlaylistPhrase.SHOW_TEXT);
			this.addItemAt(showTextItem, 5);
			this.addItemAt(new NativeMenuItem(PlaylistPhrase.OWNER_PAGE), 6);
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(selectedSound:SoundViewData, allPlaylists:Vector.<PlaylistViewData>, openedPlaylist:PlaylistViewData):void {
			updateBase(allPlaylists, openedPlaylist);

			showTextItem.enabled = selectedSound.hasLyrics;
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
					case PlaylistPhrase.OTHER_ARTISTS_SOUNDS:
						eventType = PlaylistEvent.SHOW_OTHER_ARTISTS_SOUNDS;
						break;
					case PlaylistPhrase.OTHER_OWNER_SOUNDS:
						eventType = PlaylistEvent.SHOW_OTHER_OWNER_SOUNDS;
						break;
					case PlaylistPhrase.OWNER_PAGE:
						eventType = PlaylistEvent.OPEN_OWNER_PAGE;
						break;
					case PlaylistPhrase.SHOW_TEXT:
						eventType = PlaylistEvent.SHOW_TEXT;
						break;
					case PlaylistPhrase.SAVE:
						eventType = PlaylistEvent.SAVE_SOUND;
						break;
					case PlaylistPhrase.DELETE:
						eventType = PlaylistEvent.DELETE_SOUND;
						break;
				}
				customEvent = new PlaylistEvent(eventType, true);
			}
			dispatchEvent(customEvent);
		}
	}
}
