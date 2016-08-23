/**
 * FriendsListView
 * User: Alex
 * Date: 11.08.16
 * Time: 16:19
 */
package friends.view {
	import ah.gui.core.display.list.BaseList;
	import ah.gui.silver.scroller.SilverScroller;

	import core.view.BaseView;

	import flash.events.Event;

	import friends.view.component.FriendView;
	import friends.view.pm.FriendsListPM;

	public class FriendsListView extends BaseView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _friendsListPM:FriendsListPM;

		private var list:BaseList;
		//		private var _filter:SearchField;
		private var scroller:SilverScroller;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get friendsListPM():FriendsListPM { return _friendsListPM; }

		public function set friendsListPM(value:FriendsListPM):void { _friendsListPM = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function FriendsListView(id:String = null) {
			super(id);
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function init():void {
			draw();
			startListen();
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {
			list = new BaseList();
			list.rowCount = 3;
			list.indentBetweenRows = 7;
			list.columnCount = 5;
			list.indentBetweenColumns = 7;
			list.listItemDisplayClass = FriendView;
			list.dataProvider = _friendsListPM.friendsList;
			list.draw();
			list.x = 18;
			list.y = 45;
			this.addChild(list);

			scroller = new SilverScroller(list, list.rowCount * list.columnCount);
			this.addChild(scroller);
		}

		private function startListen():void {
			list.addEventListener(Event.SELECT, selectHandler);
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		private function selectHandler(event:Event):void {
			_friendsListPM.selectFriend(FriendView(event.target).friendId);
		}
	}
}
