/**
 * PlaylistItemView
 * User: Alex
 * Date: 04.08.16
 * Time: 14:20
 */
package application.playlist.view.components {
	import ah.utils.TextUtils;

	import core.view.BaseView;

	import flash.display.GradientType;
	import flash.display.SpreadMethod;

	import flash.display.Sprite;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	import application.playlist.view.data.PlaylistViewData;

	import application.playlist.view.event.PlaylistEvent;

	public class PlaylistItemView extends BaseView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var data:PlaylistViewData;

		private var selectedState:Sprite;
		private var activeState:Sprite;
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
		public function PlaylistItemView() {
			draw();
			startListen();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(data:PlaylistViewData):void {
			this.data = data;
			selectedState.visible = data.selected;
			activeState.visible = !selectedState.visible;

			title.text = data.title;
			var width:Number = Math.max(40, title.textWidth + 20);
			updateState(selectedState, [0xf3f3f3, 0xe9e9e9], [1, 1], width);
			updateState(activeState, [0xd7d7d7, 0xc8c8c8], [1, 1], width);

			title.x = Math.round((selectedState.width - title.width) / 2) - 1;
		}

		override public function destroy():void {
			if (destroyed) return;
			stopListen();
			super.destroy();
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {
			selectedState = new Sprite();
			this.addChild(selectedState);

			activeState = new Sprite();
			activeState.buttonMode = true;
			this.addChild(activeState);

			selectedState.visible = activeState.visible = false;

			title = TextUtils.getNewTextField({
				size:       14,
				color:      0x333333,
				selectable: false,
				autoSize:   TextFieldAutoSize.LEFT});
			title.y = 1;
			title.mouseEnabled = false;
			this.addChild(title);
		}

		private function updateState(state:Sprite, colors:Array, alphas:Array, width:int):void {
			state.graphics.clear();
			var mtrx:Matrix = new Matrix();
			mtrx.createGradientBox(width * 0.6, 22 * 0.6, 0.5 * Math.PI);
			state.graphics.lineStyle(2, 0x555555, 0.8);
			state.graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, [0x00, 0xff], mtrx, SpreadMethod.PAD);
			state.graphics.drawRoundRect(0, 0, width, 22, 10, 10);
			state.graphics.endFill();
		}

		private function startListen():void {
			activeState.addEventListener(MouseEvent.CLICK, clickHandler);
			activeState.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, clickHandler);
		}

		private function stopListen():void {
			activeState.removeEventListener(MouseEvent.CLICK, clickHandler);
			activeState.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, clickHandler);
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		private function clickHandler(event:MouseEvent):void {
			var customEvent:PlaylistEvent = new PlaylistEvent(PlaylistEvent.CHOOSE_PLAYLIST, true);
			customEvent.itemId = data.id;
			dispatchEvent(customEvent);
		}

	}
}
