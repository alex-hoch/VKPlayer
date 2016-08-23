/**
 * PlaylistsVO.
 * Date: 07.04.14
 * Time: 11:19
 * Alex Hoch
 */

package application.playlist.vo {
	import application.playlist.view.data.PlaylistViewData;

	public class PlaylistsVO {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _playlists:Vector.<PlaylistViewData>;
		private var _sounds:Array;
		private var _scrollPosition:int;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get playlists():Vector.<PlaylistViewData> { return _playlists; }

		public function set playlists(value:Vector.<PlaylistViewData>):void { _playlists = value; }

		public function get sounds():Array { return _sounds; }

		public function set sounds(value:Array):void { _sounds = value; }

		public function get scrollPosition():int { return _scrollPosition; }

		public function set scrollPosition(value:int):void { _scrollPosition = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlaylistsVO() {

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
