/**
 * PlaylistsModel.
 * Date: 01.04.14
 * Time: 14:04
 * Alex Hoch
 */

package application.playlist.model {

	public class PlaylistsModel {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _openedPlaylist:PlaylistData;
		private var _playingPlaylist:PlaylistData;
		private var _allPlaylists:Array;
		private var _queue:Vector.<PlaylistSoundData>;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get openedPlaylist():PlaylistData { return _openedPlaylist; }

		public function set openedPlaylist(value:PlaylistData):void { _openedPlaylist = value; }

		public function get playingPlaylist():PlaylistData { return _playingPlaylist; }

		public function set playingPlaylist(value:PlaylistData):void { _playingPlaylist = value; }

		public function get allPlaylists():Array { return _allPlaylists; }

		public function set allPlaylists(value:Array):void { _allPlaylists = value; }

		public function get queue():Vector.<PlaylistSoundData> { return _queue; }

		public function set queue(value:Vector.<PlaylistSoundData>):void { _queue = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlaylistsModel() {
			_allPlaylists = [];
			_queue = new Vector.<PlaylistSoundData>();
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
