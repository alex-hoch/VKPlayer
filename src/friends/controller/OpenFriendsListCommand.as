/**
 * OpenFriendsListCommand
 * User: Alex
 * Date: 11.08.16
 * Time: 15:44
 */
package friends.controller {

	import core.command.BaseCommand;

	import friends.model.UserModel;

	import friends.service.FriendsService;
	import friends.view.data.FriendViewData;
	import friends.view.vo.FriendsListVO;

	import login.service.IApplicationService;

	import server.service.IServerRemoteService;
	import server.service.impl.ServerDataConverter;

	public class OpenFriendsListCommand extends BaseCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _callback:Function;
		private var _friendsService:FriendsService;
		private var _applicationService:IApplicationService;
		private var _serverDataConverter:ServerDataConverter;
		private var _serverRemoteService:IServerRemoteService;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set callback(value:Function):void { _callback = value; }

		public function set friendsService(value:FriendsService):void { _friendsService = value; }

		public function set applicationService(value:IApplicationService):void { _applicationService = value; }

		public function set serverDataConverter(value:ServerDataConverter):void { _serverDataConverter = value; }

		public function set serverRemoteService(value:IServerRemoteService):void { _serverRemoteService = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function OpenFriendsListCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute():void {
			if (!_friendsService.isReady) {
				lockApplication('loading');
				_serverRemoteService.loadFriends(_applicationService.userId, serverResponseCallback);
			} else {
				_callback(true);
			}
		}

		public function result(data:Object = null):FriendsListVO {
			unlockApplication();
			var friendsListVO:FriendsListVO = new FriendsListVO();
			var allFriends:Vector.<UserModel> = _friendsService.allFriends;
			var list:Array = [];
			var friend:FriendViewData;
			for(var i:int = 0; i<allFriends.length; i++) {
				friend = new FriendViewData();
				friend.id = allFriends[i].id;
				friend.name = allFriends[i].name + ' ' + allFriends[i].surname;
				friend.avatarUrl = allFriends[i].photo;
				list[list.length] = friend;
			}
			friendsListVO.friendsList = list;
			return friendsListVO;
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function compareFunction(user1:UserModel, user2:UserModel):int {
			var result:int;
			if (user1.surname.toLowerCase() < user2.surname.toLowerCase()) {
				result = -1;
			} else if (user1.surname.toLowerCase() > user2.surname.toLowerCase()) {
				result = 1;
			} else if (user1.name.toLowerCase() < user2.name.toLowerCase()) {
				result = -1;
			} else if (user1.name.toLowerCase() > user2.name.toLowerCase()) {
				result = 1;
			}
			return result;
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		private function serverResponseCallback(data:Object):void {
			var responseList:Array = data.response;
			if (responseList) {
				var friendsList:Vector.<UserModel> = new Vector.<UserModel>();
				for (var i:int = 0; i < responseList.length; i++) {
					friendsList[friendsList.length] = _serverDataConverter.convertCcmplexUserModel(responseList[i]);
				}
				friendsList.sort(compareFunction);
				_friendsService.initFriends(friendsList);
			}
			_callback(true);
		}

	}
}
