/**
 * DownloadQueueItemView
 * User: Alex
 * Date: 11.08.16
 * Time: 11:45
 */
package downloader.view.component {
	import ah.gui.core.display.list.IBaseListItem;
	import ah.utils.TextUtils;

	import core.view.BaseView;

	import downloader.view.data.DownloadItemData;

	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	public class DownloadQueueItemView extends BaseView implements IBaseListItem {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		static public const HEIGHT:int = 20;
		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _width:Number = 380;
		private var title:TextField;
		private var downloadItemData:DownloadItemData;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		override public function set width(value:Number):void {
			_width = value;
			updateBorder();
			title.width = _width;
			super.width = value;
		}

		override public function get height():Number { return HEIGHT; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function DownloadQueueItemView(id:String = null) {
			draw();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(value:Object):void {
			downloadItemData = value as DownloadItemData;
			if (downloadItemData) {
				title.text = downloadItemData.position + '. ' + downloadItemData.name;
			} else {
				title.text = '';
			}
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {
			updateBorder();

			title = title = TextUtils.getNewTextField({
				size:       14,
				color:      0x444444,
				selectable: true,
				bold:       false,
				italic:     false,
				wordWrap:   false,
				multiline:  false,
				autoSize:   TextFieldAutoSize.NONE
				//								type		:		TextFieldType.DYNAMIC,
				//								align		:		TextFormatAlign.LEFT
			});
//			title.border = true;
			title.width = _width;
			title.height = HEIGHT;
			title.mouseEnabled = title.mouseWheelEnabled = false;
			this.addChild(title);
		}

		private function updateBorder():void {
			this.graphics.clear();
			this.graphics.beginFill(0x000000, 0);
			this.graphics.lineStyle(1, 0x000000);
			this.graphics.drawRect(0, 0, _width, HEIGHT);
			this.graphics.endFill();
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
	}
}
