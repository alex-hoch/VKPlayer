/**
 * AllPlaylistsContainer
 * User: Alex
 * Date: 04.08.16
 * Time: 13:52
 */
package application.playlist.view.components {
	import ah.gui.core.data.RadionButtonStates;
	import ah.gui.core.display.radiobutton.BaseRadioButton;

	import core.view.BaseView;

	import flash.display.DisplayObject;

	import application.playlist.view.data.PlaylistViewData;

	public class AllPlaylistsContainer extends BaseView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _width:Number;

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
		public function AllPlaylistsContainer(width:Number) {
			_width = width;
			draw();
			startListen();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(list:Vector.<PlaylistViewData>):void {
			var playlist:PlaylistItemView;
			while (this.numChildren) {
				playlist = this.removeChildAt(0) as PlaylistItemView;
				playlist.destroy();
			}
			for (var i:int = 0; i < list.length; i++) {
				playlist = new PlaylistItemView();
				playlist.update(list[i]);
				this.addChild(playlist);
			}
			resize(_width);
		}

		public function resize(newWidth:Number):void {
			_width = newWidth;
			var cx:int = 0;
			var cy:int = 0;
			var child:DisplayObject
			for (var i:int = 0; i < this.numChildren; i++) {
				child = this.getChildAt(i);
				if (i) {
					if (cx + child.width <= _width) {
						child.x = cx;
					} else {
						cx = 0;
						var prevChild:DisplayObject = this.getChildAt(i - 1);
						if (prevChild) {
							cy = prevChild.y + prevChild.height - 2;
						} else {
							cy = 0;
						}
						child.x = cx;
					}
					cx += child.width - 2;
					child.y = cy;
				} else {
					child.x = 0;
					child.y = 0;
					cx = child.width - 2;
					cy = 0;
				}
			}
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {

		}

		private function startListen():void {

		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------

	}
}
