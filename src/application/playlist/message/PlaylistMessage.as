/**
 * PlaylistMessage.
 * Date: 07.04.14
 * Time: 11:48
 * Alex Hoch
 */

package application.playlist.message {
	import flash.events.Event;

	import application.playlist.model.ActionData;

	import application.playlist.vo.PlaylistsVO;

	public class PlaylistMessage extends Event {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		static public const INIT_PLAYLIST:String = 'initPlaylist';
		static public const CREATE_PLAYLIST:String = 'createPlaylist';
		static public const UPDATE_PLAYLISTS:String = 'updatePlaylists';

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		public var id:int;
		public var title:String;
		public var sounds:Array;

		public var playlistsVO:PlaylistsVO;
		public var action:ActionData;

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
		public function PlaylistMessage(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
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
