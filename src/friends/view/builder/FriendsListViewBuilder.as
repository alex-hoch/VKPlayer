/**
 * FriendsListViewBuilder
 * User: Alex
 * Date: 11.08.16
 * Time: 16:16
 */
package friends.view.builder {
	import core.view.builder.BaseBuilder;

	import flash.display.NativeWindow;

	import flash.display.NativeWindowInitOptions;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	import friends.view.FriendsListView;
	import friends.view.vo.FriendsListVO;

	public class FriendsListViewBuilder extends BaseBuilder {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var window:NativeWindow;
		private var view:FriendsListView;

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
		public function FriendsListViewBuilder() {
			super();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function openFriendsList(friendsListVO:FriendsListVO):void {
			if(!window) {
				var options:NativeWindowInitOptions = new NativeWindowInitOptions();
				options.maximizable = options.minimizable = options.resizable = false;
				window = new NativeWindow(options);
				window.title = 'Friends list';
				window.width = 600;
				window.height = 400;
				window.stage.scaleMode = StageScaleMode.NO_SCALE;
				window.stage.align = StageAlign.TOP_LEFT;
				window.stage.color = 0xEEEEEE;
//				var bounds:Rectangle = Screen.mainScreen.visibleBounds;
//				window.x = Math.round((bounds.width - window.width) / 2);
//				window.y = Math.round((bounds.height - window.height) / 2);
//				window.stage.addChild(_view);
				window.activate();
				window.addEventListener(Event.CLOSING, closingHandler);

				if (!view) {
					view = _viewRegisterManager.createView(FriendsListView) as FriendsListView;
					view.friendsListPM.updateData(friendsListVO);
					view.init();
				}
				window.stage.addChild(view);
			}
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
		private function closingHandler(event:Event):void {
			window.removeEventListener(Event.CLOSING, closingHandler);
			window = null;
		}

	}
}
