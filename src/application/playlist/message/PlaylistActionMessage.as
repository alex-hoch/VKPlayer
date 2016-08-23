/**
 * PlaylistActionMessage.
 * Date: 01.04.14
 * Time: 13:58
 * Alex Hoch
 */

package application.playlist.message {
	import flash.events.Event;

	public class PlaylistActionMessage extends Event {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		static public const SELECT_SOUND:String = 'selectSound';
		static public const CHOOSE_SOUND:String = 'chooseSound';
		static public const CHOOSE_PLAYLIST:String = 'choosePlaylist';
		static public const UPDATE_SCROLL_POSITION:String = 'updateScrollPosition';
		public static const COPY_SOUND_TO:String = 'copySoundTo';
		public static const LOAD_USER_PLAYLIST:String = 'loadUserPlaylist';
		public static const SAVE_USER_PLAYLIST:String = 'saveUserPlaylist';
		public static const OPEN_OWNER_PAGE:String = 'openOwnerPage';
		public static const SHOW_LYRICS:String = 'showLyrics'
		public static const DELETE_SOUND:String = 'deleteSound'
		public static const SORT_PLAYLIST:String = 'sortPlaylist'
		public static const CLEAR_PLAYLIST:String = 'clearPlaylist'
		public static const DELETE_PLAYLIST:String = 'deletePlaylist'
		public static const REFRESH_PLAYLIST:String = 'refreshPlaylist';
		public static const ADD_SOUND_TO_QUEUE:String = 'addSoundToQueue';
		public static const REMOVE_SOUND_FROM_QUEUE:String = 'removeSoundFromQueue';

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		public var id:Number;
		public var userId:Number;
		public var soundId:Number;
		public var playlistId:Number;
		public var removeFromPreviousPlaylist:Boolean;

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
		public function PlaylistActionMessage(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------

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
