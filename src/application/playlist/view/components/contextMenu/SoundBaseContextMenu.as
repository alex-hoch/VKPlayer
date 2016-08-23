/**
 * SoundBaseContextMenu
 * User: Alex
 * Date: 09.08.16
 * Time: 12:48
 */
package application.playlist.view.components.contextMenu {
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.events.Event;

	import application.playlist.PlaylistPhrase;
	import application.playlist.view.data.PlaylistViewData;

	public class SoundBaseContextMenu extends NativeMenu {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		protected var copyMenu:NativeMenu;
		protected var moveMenu:NativeMenu;

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
		public function SoundBaseContextMenu() {
			super();
			copyMenu = new NativeMenu();
			this.addSubmenu(copyMenu, PlaylistPhrase.COPY_TO);
			moveMenu = new NativeMenu();
			this.addSubmenu(moveMenu, PlaylistPhrase.MOVE_TO);

			this.addItem(new NativeMenuItem(PlaylistPhrase.SAVE));
			this.addItem(new NativeMenuItem(PlaylistPhrase.DELETE));

			this.addEventListener(Event.SELECT, selectHandler);
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------
		protected function updateBase(allPlaylists:Vector.<PlaylistViewData>, openedPlaylist:PlaylistViewData):void {
			fillMenu(copyMenu, allPlaylists, openedPlaylist);
			fillMenu(moveMenu, allPlaylists, openedPlaylist);
		}

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function fillMenu(menu:NativeMenu, allPlaylists:Vector.<PlaylistViewData>, openedPlaylist:PlaylistViewData):void {
			menu.removeAllItems();
			var item:NativeMenuItem;
			for (var i:int = 0; i < allPlaylists.length; i++) {
				item = new NativeMenuItem(allPlaylists[i].title);
				item.enabled = allPlaylists[i].id != openedPlaylist.id;
				item.data = allPlaylists[i].id;
				menu.addItem(item);
			}
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		protected function selectHandler(event:Event):void {
			throw new Error('Must be overrided');
		}
	}
}
