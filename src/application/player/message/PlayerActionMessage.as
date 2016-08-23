/**
 * PlayerActionMessage.
 * Date: 16.02.14
 * Time: 16:20
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.player.message {
	import application.player.vo.PlayerStateVO;

	import flash.events.Event;

	import application.player.vo.PlayerInitVO;

	public class PlayerActionMessage extends Event {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		public static const INIT_PLAYER:String = 'initPlayer';
		public static const UPDATE_PLAYER_STATE:String = 'updatePlayerState';

		public static const PLAY_SOUND:String = 'playSound';
		public static const TOGGLE_PLAY:String = 'togglePlay';
		public static const PLAY_NEXT_SOUND:String = 'playNextSound';
		public static const PLAY_PREVIOUS_SOUND:String = 'playPreviousSound';
		public static const STOP_PLAYING:String = 'stopPlaying';

		public static const CHANGE_VOLUME_VALUE:String = 'changeVolumeValue';


		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		public var initVO:PlayerInitVO;
		public var volumeValue:Number;
		public var playerStateVO:PlayerStateVO;

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
		public function PlayerActionMessage(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
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
