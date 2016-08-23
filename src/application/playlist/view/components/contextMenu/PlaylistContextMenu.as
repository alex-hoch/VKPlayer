/**
 * PlaylistContextMenu
 * User: Alex
 * Date: 09.08.16
 * Time: 11:19
 */
package application.playlist.view.components.contextMenu {
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.events.Event;

	import application.playlist.PlaylistPhrase;
	import application.playlist.PlaylistSortingType;
	import application.playlist.view.event.PlaylistEvent;

	public class PlaylistContextMenu extends NativeMenu {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var sortMenu:NativeMenu;
		private var clearItem:NativeMenuItem;
		private var deleteItem:NativeMenuItem;

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
		public function PlaylistContextMenu() {
			super();

			sortMenu = new NativeMenu();
			sortMenu.addItem(new NativeMenuItem(PlaylistPhrase.ARTIST_NAME));
			sortMenu.addItem(new NativeMenuItem(PlaylistPhrase.SOUND_NAME));
			sortMenu.addItem(new NativeMenuItem(PlaylistPhrase.GENRE));
			sortMenu.addItem(new NativeMenuItem(PlaylistPhrase.DURATION));
			this.addSubmenu(sortMenu, PlaylistPhrase.SORT_BY);
			this.addItem(new NativeMenuItem(PlaylistPhrase.SAVE));
			clearItem = new NativeMenuItem(PlaylistPhrase.CLEAR);
			this.addItem(clearItem);
			deleteItem = new NativeMenuItem(PlaylistPhrase.DELETE);
			this.addItem(deleteItem);

			this.addEventListener(Event.SELECT, selectHandler);
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(removingEnable:Boolean):void {
			clearItem.enabled = removingEnable;
			deleteItem.enabled = removingEnable;
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
		private function selectHandler(event:Event):void {
			var item:NativeMenuItem = NativeMenuItem(event.target);
			var customEvent:PlaylistEvent;
			var eventType:String;
			if (item.menu == sortMenu) {
				var itemId:int;
				eventType = PlaylistEvent.SORT_PLAYLIST;
				switch (item.label) {
					case PlaylistPhrase.ARTIST_NAME:
						itemId = PlaylistSortingType.BY_ARTIST;
						break;
					case PlaylistPhrase.SOUND_NAME:
						itemId = PlaylistSortingType.BY_SOUND;
						break;
					case PlaylistPhrase.GENRE:
						itemId = PlaylistSortingType.BY_GENRE;
						break;
					case PlaylistPhrase.DURATION:
						itemId = PlaylistSortingType.BY_DURATION;
						break;
				}
				customEvent = new PlaylistEvent(eventType, true);
				customEvent.itemId = itemId;
			} else {
				switch (item.label) {
					case PlaylistPhrase.CLEAR:
						eventType = PlaylistEvent.CLEAR_PLAYLIST;
						break;
					case PlaylistPhrase.DELETE:
						eventType = PlaylistEvent.DELETE_PLAYLIST;
						break;
					case PlaylistPhrase.SAVE:
						eventType = PlaylistEvent.SAVE_PLAYLIST;
						break;
				}
				customEvent = new PlaylistEvent(eventType, true);
			}
			dispatchEvent(customEvent);
		}

	}
}
