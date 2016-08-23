/**
 * PlayerEvent.
 * Date: 10.04.14
 * Time: 14:26
 * Alex Hoch
 */

package application.player.view.event {
	import flash.events.Event;

	public class PlayerEvent extends Event {
		static public const CHANGE_VOLUME:String = 'changeVolume';

		public var volumeValue:Number;

		public function PlayerEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}

		public override function clone():Event {
			return new PlayerEvent(type, bubbles, cancelable);
		}

		public override function toString():String {
			return formatToString("PlayerEvent", "type", "bubbles", "cancelable", "eventPhase");
		}

	}
}
