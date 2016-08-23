/**
 * SearcherBuilder.
 * Date: 19.02.14
 * Time: 15:32
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.searcher.view.builder {
	import core.view.builder.BaseBuilder;

	import flash.desktop.NativeApplication;

	import flash.display.Stage;

	import application.searcher.view.SearcherView;

	public class SearcherBuilder extends BaseBuilder {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------

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
		public function SearcherBuilder() {
			super();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function createSearcher():void {
			var view:SearcherView = _viewRegisterManager.createView(SearcherView) as SearcherView;
			var stage:Stage = NativeApplication.nativeApplication.activeWindow.stage;
			view.y = 10;
			stage.addChild(view);
			view.init();
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