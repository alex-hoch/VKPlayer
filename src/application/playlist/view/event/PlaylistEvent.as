/**
 * PlaylistEvent.
 * Date: 07.04.14
 * Time: 13:50
 * Alex Hoch
 */

package application.playlist.view.event {
	import flash.events.Event;

	public class PlaylistEvent extends Event {
		static public const SELECT_SOUND:String = 'selectSound';
		static public const CHOOSE_SOUND:String = 'chooseSound';
		static public const SHOW_SOUND_GENRE_CONTEXT_MENU:String = 'showSoundGenreContextMenu';
		static public const CHOOSE_PLAYLIST:String = 'choosePlaylist';

		static public const COPY_SOUND_TO:String = 'copySoundTo';
		static public const MOVE_SOUND_TO:String = 'moveSoundTo';
		static public const SHOW_OTHER_ARTISTS_SOUNDS:String = 'showOtherArtistsSounds';
		static public const SHOW_OTHER_OWNER_SOUNDS:String = 'showOtherOwnerSounds';
		static public const OPEN_OWNER_PAGE:String = 'openOwnerPage';
		static public const SHOW_TEXT:String = 'showText';
		static public const SAVE_SOUND:String = 'saveSound';
		static public const DELETE_SOUND:String = 'deleteSound';

		static public const SORT_PLAYLIST:String = 'sortPlaylist';
		public static const SAVE_PLAYLIST:String = 'savePlaylist';
		static public const CLEAR_PLAYLIST:String = 'clearPlaylist';
		static public const DELETE_PLAYLIST:String = 'deletePlaylist';

		public var itemId:Number;
		public var genreId:Number;

		public function PlaylistEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}

		public override function clone():Event {
			var customEvent:PlaylistEvent = new PlaylistEvent(type, bubbles, cancelable);
			customEvent.itemId = itemId;
			customEvent.genreId = genreId;
			return customEvent;
		}

		public override function toString():String {
			return formatToString("PlaylistEvent", "type", "bubbles", "cancelable", "eventPhase");
		}

	}
}
