/**
 * LockView
 * User: Alex
 * Date: 08.08.16
 * Time: 16:21
 */
package core.view {
	import ah.utils.TextUtils;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.filters.BlurFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	public class LockView extends BaseView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var background:Bitmap;
		private var title:TextField;

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
		public function LockView() {
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function updateMessage(message:String):void {
			title.text = message;
			updateTitlePosition();
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function drawBackground():void {
			if (background) {
				background.bitmapData.dispose();
				this.removeChild(background);
				background = null;
			}
			var bmd:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight);
			bmd.draw(stage);

			background = new Bitmap(bmd);
			background.filters = [new BlurFilter(6, 6, 3)];
			this.addChildAt(background, 0);
		}

		private function drawMessage():void {
			title = TextUtils.getNewTextField({
				size:       30,
				color:      0x666666,
				bold:       true,
				italic:     true,
				selectable: false,
				autoSize:   TextFieldAutoSize.LEFT});
			title.mouseEnabled = false;
			this.addChild(title);
		}

		private function updateTitlePosition():void {
			title.x = (background.width - title.width) / 2;
			title.y = (background.height - title.height) / 2;
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		private function addedToStageHandler(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removeFromStageHandler);
			stage.addEventListener(Event.RESIZE, resizeHandler, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler, true);

			drawBackground();
			drawMessage();
		}

		private function removeFromStageHandler(event:Event):void {
			this.removeEventListener(Event.REMOVED_FROM_STAGE, removeFromStageHandler);
			stage.removeEventListener(Event.RESIZE, resizeHandler);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler, true);
		}

		private function resizeHandler(event:Event):void {
			drawBackground();
			updateTitlePosition();
		}

		private function keyboardHandler(event:KeyboardEvent):void {
			event.stopImmediatePropagation();
		}
	}
}
