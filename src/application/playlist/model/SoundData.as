/**
 * SoundData.
 * Date: 01.04.14
 * Time: 16:10
 * Alex Hoch
 */

package application.playlist.model {
	import application.player.view.data.IPlayerSoundData;

	public class SoundData implements IPlayerSoundData {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _id:Number;
		private var _ownerId:Number;
		private var _artist:String;
		private var _title:String;
		private var _url:String;
		private var _duration:int;
		private var _lyricsId:Number;
		private var _genre:int;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get id():Number { return _id; }

		public function set id(value:Number):void { _id = value; }

		public function get ownerId():Number { return _ownerId; }

		public function set ownerId(value:Number):void { _ownerId = value; }

		public function get artist():String { return _artist; }

		public function set artist(value:String):void { _artist = value; }

		public function get title():String { return _title; }

		public function set title(value:String):void { _title = value; }

		public function get url():String { return _url; }

		public function set url(value:String):void { _url = value; }

		public function get duration():int { return _duration; }

		public function set duration(value:int):void { _duration = value; }

		public function get lyricsId():Number { return _lyricsId; }

		public function set lyricsId(value:Number):void { _lyricsId = value; }

		public function get genre():int { return _genre; }

		public function set genre(value:int):void { _genre = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function SoundData() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function clone():SoundData {
			var result:SoundData = new SoundData();
			result.id = id;
			result.ownerId = ownerId;
			result.artist = artist;
			result.title = title;
			result.url = url;
			result.duration = duration;
			result.lyricsId = lyricsId;
			result.genre = genre;
			return result;
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

	}
}
