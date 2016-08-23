/**
 * ChangeVolumeValueCommand.
 * Date: 10.04.14
 * Time: 14:31
 * Alex Hoch
 */

package application.player.controller {
	import application.player.message.PlayerActionMessage;
	import application.player.service.PlayerDataHelper;
	import application.player.service.PlayerService;
	import application.player.vo.PlayerInitVO;

	import hint.HintType;
	import hint.message.HintActionMessage;

	public class ChangeVolumeValueCommand {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _dispatcher:Function;
		private var _playerService:PlayerService;
		private var _playerDataHelper:PlayerDataHelper;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set dispatcher(value:Function):void { _dispatcher = value; }

		public function set playerService(value:PlayerService):void { _playerService = value; }

		public function set playerDataHelper(value:PlayerDataHelper):void { _playerDataHelper = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function ChangeVolumeValueCommand() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function execute(message:PlayerActionMessage):PlayerInitVO {
			_playerService.volumeValue = message.volumeValue;

			var hintMessage:HintActionMessage = new HintActionMessage(HintActionMessage.SHOW_HINT);
			hintMessage.hintType = HintType.CHANGE_VOLUME;
			hintMessage.data = _playerService.volumeValue;
			_dispatcher(hintMessage);

			return _playerDataHelper.generatePlayerVO();
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
