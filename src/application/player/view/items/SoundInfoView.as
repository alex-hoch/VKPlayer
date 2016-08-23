/**
 * SoundInfoView.
 * Date: 10.04.14
 * Time: 15:27
 * Alex Hoch
 */

package application.player.view.items {
	import ah.utils.TextUtils;

	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormatAlign;

	public class SoundInfoView extends Sprite {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var soundName:TextField;
		private var soundDuration:TextField;

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
		public function SoundInfoView() {
			draw();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function init(name:String, duration:int):void {
			soundName.text = name;
			soundName.width = Math.min(246, soundName.textWidth + 3);
			soundName.x = 2 + Math.max(0, Math.round((246 - soundName.width) / 2));
			updateDuration(duration);
		}

		public function updateDuration(duration:int):void {
			soundDuration.text = duration ? TextUtils.getParsedTime(duration) : '';
		}

		public function destroy():void {
			while (this.numChildren) {
				this.removeChildAt(0);
			}
			soundName = null;
			soundDuration = null;
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {
			var bg1:Sprite = new Sprite();
			bg1.graphics.lineStyle(2, 0x777777, 1);
			bg1.graphics.beginFill(0xaaaaaa);
			bg1.graphics.drawRoundRect(0, 0, 287, 22, 20, 20);
			bg1.graphics.endFill();
			this.addChild(bg1);

			var bg2:Sprite = new Sprite();
			bg2.graphics.lineStyle(2, 0x777777, 1);
			bg2.graphics.beginFill(0xdddddd);
			bg2.graphics.drawRoundRect(0, 0, 247, 22, 20, 20);
			bg2.graphics.endFill();
			this.addChild(bg2);

			soundName = TextUtils.getNewTextField({
				size:       12,
				color:      0x555555,
				selectable: true,
				bold:       true,
				italic:     false,
				wordWrap:   false,
				multiline:  false
			});
			//soundName.border = true;
			soundName.width = 260;
			soundName.height = 20;
			//name.x = _buttonsContainer.x;
			soundName.y = 1;
			this.addChild(soundName);

			soundDuration = TextUtils.getNewTextField({
				size:       12,
				color:      0xFFFFFF,
				selectable: true,
				bold:       true,
				italic:     false,
				wordWrap:   false,
				multiline:  false,
				align:      TextFormatAlign.CENTER
			});
			soundDuration.mouseEnabled = false;
			soundDuration.width = 39;
			soundDuration.height = 20;
			soundDuration.x = 247;
			soundDuration.y = soundName.y;
			this.addChild(soundDuration);
		}

		//--------------------------------------------------------------------------
		//  Handlers 
		//--------------------------------------------------------------------------
	}
}
