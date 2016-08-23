/**
 * PlaylistData.
 * Date: 01.04.14
 * Time: 14:00
 * Alex Hoch
 */

package application.playlist.model {

	public class PlaylistData {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _id:Number;
		private var _title:String;
		private var _sounds:Array;
		private var _selectedSoundId:Number;
		private var _playingSoundId:Number;
		private var _scrollPosition:Number;
		private var _actionsList:Array;
		private var _sortingType:int;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get id():Number { return _id; }

		public function set id(value:Number):void { _id = value; }

		public function get title():String { return _title; }

		public function set title(value:String):void { _title = value; }

		public function get sounds():Array { return _sounds; }

		public function set sounds(value:Array):void { _sounds = value; }

		public function get selectedSoundId():Number { return _selectedSoundId; }

		public function set selectedSoundId(value:Number):void { _selectedSoundId = value; }

		public function get playingSoundId():Number { return _playingSoundId; }

		public function set playingSoundId(value:Number):void { _playingSoundId = value; }

		public function get scrollPosition():Number { return _scrollPosition; }

		public function set scrollPosition(value:Number):void { _scrollPosition = value; }

		public function get actionsList():Array { return _actionsList; }

		public function set actionsList(value:Array):void { _actionsList = value; }

		public function get sortingType():int { return _sortingType; }

		public function set sortingType(value:int):void { _sortingType = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlaylistData() {
			_selectedSoundId = -1;
			_playingSoundId = -1;
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
