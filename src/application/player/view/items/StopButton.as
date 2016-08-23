/**
 * StopButton.
 * Date: 16.02.14
 * Time: 16:40
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.player.view.items {
	import ah.gui.core.data.ButtonStates;
	import ah.gui.core.display.button.BaseButton;

	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;

	public class StopButton extends BaseButton {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------

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
		public function StopButton() {
			super('', new Point(50, 50));
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------
		override protected function get states():ButtonStates {
			var result:ButtonStates = new ButtonStates();
			result.up = drawState(2, 0x555555, 0xdddddd, 0xffffff);
			result.over = drawState(2, 0x555555, 0xaaaaaa, 0xffffff);
			result.down = drawState(2, 0x555555, 0x777777, 0xffffff);
			result.disable = drawState(2, 0x555555, 0xdddddd, 0xaaaaaa);
			return result;
		}

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function drawState(lineThickness:int, lineColor:uint, bgColor:uint, iconColor:uint):Sprite {
			var result:Sprite = new Sprite();
			var gr:Graphics = result.graphics;
			gr.lineStyle(lineThickness, lineColor, 1, true);
			gr.beginFill(bgColor);
			gr.drawRoundRect(0, 0, _size.x, _size.y, 20);
			gr.endFill();

			var icon:Sprite = new Sprite();

			gr = icon.graphics;
			gr.lineStyle(lineThickness, lineColor, 1, true);
			gr.beginFill(iconColor);
			gr.drawRoundRect(-15, -15, 29, 29, 5);
			gr.endFill();

			icon.x = result.width / 2;
			icon.y = result.height / 2;
			result.addChild(icon);

			return result;
		}

		//--------------------------------------------------------------------------
		//  Handlers 
		//--------------------------------------------------------------------------
	}
}