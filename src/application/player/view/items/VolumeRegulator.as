/**
 * VolumeRegulator.
 * Date: 09.04.14
 * Time: 17:05
 * Alex Hoch
 */

package application.player.view.items {
	import ah.utils.media.IMediaPlayer;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	import application.player.view.event.PlayerEvent;

	public class VolumeRegulator extends Sprite {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var player:IMediaPlayer;
		private var defaultHeight:Number;

		private var background:Sprite;
		private var volumeValue:Sprite;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------
		private function set volume(value:Number):void {
			value = value < 0 ? 0 : value > 1 ? 1 : value;
			volumeValue.graphics.clear();
			volumeValue.graphics.beginFill(0xaaaaaa);
			volumeValue.graphics.drawRoundRect(0, defaultHeight, 6, -defaultHeight * value, 2, 2);
			volumeValue.graphics.endFill();
			player.volume = value;
		}

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function VolumeRegulator(player:IMediaPlayer, height:Number) {
			this.player = player;
			defaultHeight = height;

			drawValue();
			drawBG();
			startListen();
			update();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update():void {
			volume = player.volume;
		}

		public function destroy():void {
			stopListen();
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function drawBG():void {
			background = new Sprite();
			background.graphics.lineStyle(2, 0x555555, 1, true);
			background.graphics.beginFill(0xffffff, 0.1);
			background.graphics.drawRoundRect(0, 0, 6, defaultHeight, 6, 6);
			background.buttonMode = true;
			this.addChild(background);
		}

		private function drawValue():void {
			volumeValue = new Sprite();
			volumeValue.graphics.beginFill(0xff0000);
			volumeValue.graphics.drawRoundRect(0, defaultHeight, 6, 0, 2, 2);
			volumeValue.graphics.endFill();
			this.addChild(volumeValue);
			volumeValue.mouseEnabled = false;
		}

		private function startListen():void {
			background.addEventListener(MouseEvent.MOUSE_DOWN, mouseHandler);
		}

		private function stopListen():void {
			background.removeEventListener(MouseEvent.MOUSE_DOWN, mouseHandler);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseHandler);
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		private function mouseHandler(event:MouseEvent):void {
			var newVolumeValue:Number = 1 - this.mouseY / defaultHeight;
			switch (event.type) {
				case MouseEvent.MOUSE_DOWN:
					stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseHandler);
					stage.addEventListener(MouseEvent.MOUSE_UP, mouseHandler);
					break;
				case MouseEvent.MOUSE_UP:
					stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseHandler);
					stage.removeEventListener(MouseEvent.MOUSE_UP, mouseHandler);
					var playerEvent:PlayerEvent = new PlayerEvent(PlayerEvent.CHANGE_VOLUME, true);
					playerEvent.volumeValue = newVolumeValue;
					dispatchEvent(playerEvent);
					break;
			}
			volume = newVolumeValue;
		}
	}
}
