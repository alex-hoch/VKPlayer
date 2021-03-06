/**
 * SearcherPM.
 * Date: 19.02.14
 * Time: 15:32
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.searcher.view.pm {
	import application.searcher.message.SearcherActionMessage;

	public class SearcherPM {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function SearcherPM() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function search(text:String):void {
			var message:SearcherActionMessage = new SearcherActionMessage(SearcherActionMessage.SEARCH);
			message.text = text;
			_dispatcher(message);
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
