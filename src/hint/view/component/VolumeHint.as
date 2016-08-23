/**
 * VolumeHint
 * User: Alex
 * Date: 23.08.16
 * Time: 14:23
 */
package hint.view.component {
	import ah.utils.TextUtils;

	import core.view.BaseView;

	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	public class VolumeHint extends BaseView implements IHintView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		private static const WIDTH:Number = 140;
		private static const HEIGHT:Number = 60;

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var background:Sprite;
		private var backgroundMask:Sprite;
		private var valueTF:TextField;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get hintWidth():Number { return WIDTH + 3; }

		public function get hintHeight():Number { return HEIGHT + 3; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function VolumeHint() {
			draw();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(data:Object = null):void {
			var value:Number = Number(data);

			var percent:int = 100 * value;

			backgroundMask.width = 12 * int(percent / 10) + 8 * (percent % 10) / 10;//_bg.width * value;
			valueTF.text = Math.round(value * 100) + '%';
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {
			this.graphics.lineStyle(2, 0xeeeeee, 0.8);
			this.graphics.beginFill(0x000000, 0.6);
			this.graphics.drawRoundRect(2, 2, WIDTH, HEIGHT, 20, 20);
			this.graphics.endFill();

			background = new Sprite();
			background.graphics.beginFill(0xeeeeee);
			this.addChild(background);

			this.graphics.lineStyle(2, 0xdddddd, 0.8);
			var w:int = 8;
			for (var i:int = 0; i < 10; i++) {
				this.graphics.drawRect(15 + i * (w + 4), 57, w, -5 - i * 5);
				background.graphics.drawRect(15 + i * (w + 4), 57, w, -5 - i * 5);
			}

			backgroundMask = new Sprite()
			backgroundMask.graphics.beginFill(0xff0000);
			backgroundMask.graphics.drawRect(0, 0, i * w + (i - 1) * 4, HEIGHT);
			backgroundMask.graphics.endFill();
			backgroundMask.x = 15;
			this.addChild(backgroundMask);

			background.mask = backgroundMask;

			valueTF = TextUtils.getNewTextField( {
				size		:		16,
				color		:		0xFFFFFF,
				selectable	:		false,
				bold		:		true,
				autoSize	:		TextFieldAutoSize.LEFT
			} );
			valueTF.text = '0%';
			valueTF.x = 10;
			valueTF.y = 7;
			this.addChild(valueTF);
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
	}
}
