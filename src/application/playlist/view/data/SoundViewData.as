/**
 * PlaylistSoundData.
 * Date: 02.04.14
 * Time: 17:49
 * Alex Hoch
 */

package application.playlist.view.data {

	public class SoundViewData {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _id:Number;
		private var _position:Number;
		private var _queuePosition:int;
		private var _name:String;
		private var _duration:int;
		private var _selected:Boolean;
		private var _playing:Boolean;
		private var _hasLyrics:Boolean;
		private var _artist:String;
		private var _ownerId:Number;
		private var _isGenreTitle:Boolean;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get id():Number { return _id; }

		public function set id(value:Number):void { _id = value; }

		public function get position():Number { return _position; }

		public function set position(value:Number):void { _position = value; }

		public function get name():String { return _name; }

		public function set name(value:String):void { _name = value; }

		public function get duration():int { return _duration; }

		public function set duration(value:int):void { _duration = value; }

		public function get selected():Boolean { return _selected; }

		public function set selected(value:Boolean):void { _selected = value; }

		public function get playing():Boolean { return _playing; }

		public function set playing(value:Boolean):void { _playing = value; }

		public function get hasLyrics():Boolean { return _hasLyrics; }

		public function set hasLyrics(value:Boolean):void { _hasLyrics = value; }

		public function get artist():String { return _artist; }

		public function set artist(value:String):void { _artist = value; }

		public function get ownerId():Number { return _ownerId; }

		public function set ownerId(value:Number):void { _ownerId = value; }

		public function get isGenreTitle():Boolean { return _isGenreTitle; }

		public function set isGenreTitle(value:Boolean):void { _isGenreTitle = value; }

		public function get queuePosition():int { return _queuePosition; }

		public function set queuePosition(value:int):void { _queuePosition = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function SoundViewData() {

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
