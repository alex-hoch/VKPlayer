/**
 * DownloaderActionMessage
 * User: Alex
 * Date: 10.08.16
 * Time: 16:32
 */
package downloader.message {
	import downloader.view.vo.DownloaderVO;
import flash.events.Event;

	public class DownloaderActionMessage extends Event {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		public static const SHOW_DOWNLOADER:String = 'showDownloader';
		static public const SAVE_SOUND:String = 'saveSound';
		static public const ADD_SOUND_TO_DOWNLOADER:String = 'addSoundToDownLoader';
		static public const ADD_PLAYLIST_TO_DOWNLOADER:String = 'addPlaylistToDownLoader';
		public static const UPDATE_DOWNLOADER:String = 'updateDownloader';

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		public var soundId:Number;
		public var playlistId:Number;
		public var downloaderVO:DownloaderVO;

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
		public function DownloaderActionMessage(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
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
