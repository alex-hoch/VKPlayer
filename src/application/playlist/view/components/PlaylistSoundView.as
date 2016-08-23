/**
 * PlaylistSoundView.
 * Date: 02.04.14
 * Time: 17:44
 * Alex Hoch
 */

package application.playlist.view.components {
	import ah.gui.core.display.list.IBaseListItem;
	import ah.utils.TextUtils;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	import application.playlist.view.data.SoundViewData;
	import application.playlist.view.event.PlaylistEvent;

	public class PlaylistSoundView extends Sprite implements IBaseListItem {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var soundData:SoundViewData;
		private var title:TextField;
		private var duration:TextField;
		private var _width:Number = 450;
		private var _height:int = 20;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		override public function set width(value:Number):void {
			_width = value;
			duration.x = _width - duration.width;
			title.width = duration.x;
			updateBackground();
			super.width = value;
		}

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlaylistSoundView() {
			this.doubleClickEnabled = true;
			draw();
			startListen();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(value:Object):void {
			soundData = value as SoundViewData;
			duration.visible = false;
			if (soundData) {
				if (soundData.isGenreTitle) {
					title.text = soundData.name;
					title.x = 20;
				} else {
					if (soundData.queuePosition > 0) {
						title.text = soundData.position + '. (' + soundData.queuePosition + ') ' + soundData.name;
					} else {
						title.text = soundData.position + '. ' + soundData.name;
					}
					title.x = 0;

					var min:int = soundData.duration / 60;
					var sec:int = soundData.duration % 60;
					duration.text = updateTime(min) + ':' + updateTime(sec);
					duration.visible = true;
				}
			} else {
				title.text = '';
			}
			duration.width = duration.textWidth + 5;
			duration.x = _width - duration.width;
			title.width = duration.x;
			updateBackground();
			this.buttonMode = Boolean(soundData);
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
		private function draw():void {
			this.graphics.beginFill(0x000000, 0);
			this.graphics.lineStyle(1, 0x000000);
			this.graphics.drawRect(0, 0, _width, _height);
			this.graphics.endFill();

			title = TextUtils.getNewTextField({
				size:       12,
				color:      0x111111,
				selectable: true,
				bold:       false,
				italic:     false,
				wordWrap:   false,
				multiline:  false,
				autoSize:   TextFieldAutoSize.NONE
				//								type		:		TextFieldType.DYNAMIC,
				//								align		:		TextFormatAlign.LEFT
			});
			title.width = 270;
			title.height = _height;
			title.mouseEnabled = title.mouseWheelEnabled = false;
			this.addChild(title);

			duration = TextUtils.getNewTextField({
				size:       12,
				color:      0x111111,
				selectable: false,
				bold:       false,
				italic:     false,
				wordWrap:   false,
				multiline:  false,
				autoSize:   TextFieldAutoSize.NONE
				//								type		:		TextFieldType.DYNAMIC,
				//								align		:		TextFormatAlign.LEFT
			});
			duration.selectable = false;
			duration.width = 40;
			duration.height = _height;
			duration.border = true;
			duration.x = title.x + title.width;
			this.addChild(duration);
		}

		private function updateBackground():void {
			this.graphics.clear();
			var color:uint = 0x000000;
			var alpha:Number = 0;
			if (soundData) {
				if (soundData.isGenreTitle) {
					color = 0xBBBBBB;
					alpha = 0.85;
				} else {
					if (soundData.selected) {
						color = 0xAABBCC;
						alpha = 0.85;
					}
					if (soundData.playing) {
						color = 0xCC9988;
						alpha = 0.85;
					}
				}
			}
			this.graphics.beginFill(color, alpha);
			this.graphics.lineStyle(1, 0x000000);
			this.graphics.drawRect(0, 0, _width, _height);
			this.graphics.endFill();

		}

		private function startListen():void {
			this.addEventListener(MouseEvent.CLICK, selectHandler);
			this.addEventListener(MouseEvent.DOUBLE_CLICK, chooseHandler);
			this.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, contextMenuHandler);
		}

		private function stopListen():void {
			this.removeEventListener(MouseEvent.CLICK, selectHandler);
			this.removeEventListener(MouseEvent.DOUBLE_CLICK, chooseHandler);
			this.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, contextMenuHandler);
		}

		private function updateTime(value:int):String {
			var result:String;
			if (value < 10) {
				result = '0' + value;
			} else {
				result = String(value);
			}
			return result;
		}

		//--------------------------------------------------------------------------
		//  Handlers 
		//--------------------------------------------------------------------------
		private function selectHandler(event:MouseEvent):void {
			if (!soundData || soundData.isGenreTitle) return;
			var customEvent:PlaylistEvent = new PlaylistEvent(PlaylistEvent.SELECT_SOUND, true);
			customEvent.itemId = soundData.id;
			dispatchEvent(customEvent);
		}

		private function chooseHandler(event:MouseEvent):void {
			if (!soundData || soundData.isGenreTitle) return;
			var customEvent:PlaylistEvent = new PlaylistEvent(PlaylistEvent.CHOOSE_SOUND, true);
			customEvent.itemId = soundData.id;
			dispatchEvent(customEvent);
		}

		private function contextMenuHandler(event:MouseEvent):void {
			if (!soundData) return;
			if (soundData.isGenreTitle) {
				var customEvent:PlaylistEvent = new PlaylistEvent(PlaylistEvent.SHOW_SOUND_GENRE_CONTEXT_MENU, true);
				customEvent.itemId = soundData.id;
				dispatchEvent(customEvent);
			} else {
				selectHandler(event);
			}
		}
	}
}
