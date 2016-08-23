/**
 * ActionData
 * User: Alex
 * Date: 08.08.16
 * Time: 15:58
 */
package application.playlist.model {
	public class ActionData {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _type:int;
		private var _text:String;
		private var _userId:Number;
		private var _soundId:Number;
		private var _playlistId:Number;
		private var _sortingId:Number;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get type():int { return _type; }

		public function set type(value:int):void { _type = value; }

		public function get text():String { return _text; }

		public function set text(value:String):void { _text = value; }

		public function get userId():Number { return _userId; }

		public function set userId(value:Number):void { _userId = value; }

		public function get soundId():Number { return _soundId; }

		public function set soundId(value:Number):void { _soundId = value; }

		public function get playlistId():Number { return _playlistId; }

		public function set playlistId(value:Number):void { _playlistId = value; }

		public function get sortingId():Number { return _sortingId; }

		public function set sortingId(value:Number):void { _sortingId = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function ActionData() {

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
