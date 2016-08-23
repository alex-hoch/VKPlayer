/**
 * FriendView
 * User: Alex
 * Date: 11.08.16
 * Time: 16:41
 */
package friends.view.component {
	import ah.gui.core.display.list.IBaseListItem;
	import ah.utils.TextUtils;
	import core.view.BaseView;
	import flash.display.Bitmap;

	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormatAlign;

	import friends.view.data.FriendViewData;

	public class FriendView extends BaseView implements IBaseListItem {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var loader:Loader;
		private var avatar:Sprite;
		private var nameTF:TextField;
		private var avatarMask:Sprite;
		private var border:Sprite;

		private var friendViewData:FriendViewData;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get friendId():Number { return friendViewData ? friendViewData.id : 0; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function FriendView() {
			draw();
			startListen();
		}


		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(value:Object):void {
			friendViewData = value as FriendViewData;
			hideUser();
			if (friendViewData) {
				if (friendViewData.avatar) {
					showUser();
				} else {
					loader.load(new URLRequest(friendViewData.avatarUrl));
				}
			}
			nameTF.visible = Boolean(friendViewData);
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, avatarLoadedHandler);

			avatar = new Sprite();
			this.addChild(avatar);

			avatarMask = new Sprite();
			avatarMask.graphics.lineStyle(2, 0x555555, 0.8);
			avatarMask.graphics.beginFill(0xff0000);
			avatarMask.graphics.drawRoundRect(0, 0, 100, 100, 20, 20);
			avatarMask.graphics.endFill();
			this.addChild(avatarMask);

			avatar.mask = avatarMask;

			border = new Sprite();
			border.graphics.lineStyle(2, 0x555555, 0.8);
			border.graphics.drawRoundRect(0, 0, 100, 100, 20, 20);
			border.graphics.endFill();
			this.addChild(border);

			nameTF = TextUtils.getNewTextField( {
				size		:		14,
				color		:		0xffffff,
				selectable	:		false,
				bold		:		true,
				wordWrap	:		true,
				multiline	:		true,
				autoSize	:		TextFieldAutoSize.LEFT,
				align		:		TextFormatAlign.CENTER } );
			nameTF.filters = [new GlowFilter(0x000000, 1, 2, 2, 20, 3)];
			this.addChild(nameTF);
		}

		private function startListen():void {
			this.addEventListener(MouseEvent.CLICK, clickHandler);
		}

		private function hideUser():void {
			hideComplete();
		}

		private function hideComplete():void {
			while (avatar.numChildren) {
				avatar.removeChildAt(0);
			}
		}

		private function showUser():void {
			if(friendViewData) {
				nameTF.text = friendViewData.name;
				nameTF.x = int((100 - nameTF.width) * 0.5);
				nameTF.y = 100 - nameTF.height;

				var bitmap:Bitmap = new Bitmap(friendViewData.avatar, 'auto', true);
				bitmap.scaleX = bitmap.scaleY = Math.min(100 / bitmap.width, 100 / bitmap.height)
				avatar.addChild(bitmap);
				avatar.x = int((100 - avatar.width) * 0.5);
				avatar.y = int((100 - avatar.height) * 0.5);
			}
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------
		private function clickHandler(event:MouseEvent):void {
			dispatchEvent(new Event(Event.SELECT, true));
		}

		private function avatarLoadedHandler(event:Event):void {
			if(friendViewData && friendViewData.avatarUrl == loader.contentLoaderInfo.url) {
				friendViewData.avatar = (loader.content as Bitmap).bitmapData.clone();
				(loader.content as Bitmap).bitmapData.dispose();
				showUser();
			}
		}
	}
}
