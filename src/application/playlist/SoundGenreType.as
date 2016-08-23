/**
 * SoundGenreType
 * User: Alex
 * Date: 09.08.16
 * Time: 12:04
 */
package application.playlist {
	import flash.utils.Dictionary;

	public class SoundGenreType {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		static public const NO_GENRE:int = 0;
		static public const ROCK:int = 1;
		static public const POP:int = 2;
		static public const RAP_AND_HIP_HOP:int = 3;
		static public const EASY_LISTENING:int = 4;
		static public const DANCE_AND_HOUSE:int = 5;
		static public const INSTRUMENTAL:int = 6;
		static public const METAL:int = 7;
		static public const ALTERNATIVE:int = 21;
		static public const DUBSTEP:int = 8;
		static public const JAZZ_AND_BLUES:int = 1001;
		static public const DRUM_AND_BASS:int = 10;
		static public const TRANCE:int = 11;
		static public const CHANSON:int = 12;
		static public const ETHNIC:int = 13;
		static public const ACOUSTIC_AND_VOCAL:int = 14;
		static public const REGGAE:int = 15;
		static public const CLASSICAL:int = 16;
		static public const INDIE_POP:int = 17;
		static public const SPEECH:int = 19;
		static public const ELECTROPOP_AND_DISCO:int = 22;
		static public const OTHER:int = 18;

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		static private var dict:Dictionary;

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
		public function SoundGenreType() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		static public function getNameById(id:int):String {
			if (!dict) init();
			var result:String = dict[id];
			if (!result) result = 'Unknown genre: ' + id;
			return result;
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private static function init():void {
			dict = new Dictionary();
			dict[NO_GENRE] = 'No genre';
			dict[ROCK] = 'Rock';
			dict[POP] = 'Pop';
			dict[RAP_AND_HIP_HOP] = 'Rap & Hip-Hop';
			dict[EASY_LISTENING] = 'Easy Listening';
			dict[DANCE_AND_HOUSE] = 'Dance & House';
			dict[INSTRUMENTAL] = 'Instrumental';
			dict[METAL] = 'Metal';
			dict[ALTERNATIVE] = 'Alternative';
			dict[DUBSTEP] = 'Dubstep';
			dict[JAZZ_AND_BLUES] = 'Jazz & Blues';
			dict[DRUM_AND_BASS] = 'Drum & Bass';
			dict[TRANCE] = 'Trance';
			dict[CHANSON] = 'Chanson';
			dict[ETHNIC] = 'Ethnic';
			dict[ACOUSTIC_AND_VOCAL] = 'Acoustic & Vocal';
			dict[REGGAE] = 'Reggae';
			dict[CLASSICAL] = 'Classical';
			dict[INDIE_POP] = 'Indie Pop';
			dict[SPEECH] = 'Speech';
			dict[ELECTROPOP_AND_DISCO] = 'Electropop & Disco';
			dict[OTHER] = 'Other';
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------

	}
}
