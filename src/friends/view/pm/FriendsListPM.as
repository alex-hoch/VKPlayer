/**
 * FriendsListPM
 * User: Alex
 * Date: 11.08.16
 * Time: 16:20
 */
package friends.view.pm {
	import application.playlist.message.PlaylistActionMessage;

	import friends.view.vo.FriendsListVO;

	public class FriendsListPM {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var friendsListVO:FriendsListVO;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function get friendsList():Array { return friendsListVO.friendsList; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function FriendsListPM() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function updateData(friendsListVO:FriendsListVO):void {
			this.friendsListVO = friendsListVO;
		}

		public function selectFriend(id:Number):void {
			var message:PlaylistActionMessage = new PlaylistActionMessage(PlaylistActionMessage.LOAD_USER_PLAYLIST);
			message.userId = id;
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
