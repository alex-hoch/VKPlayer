/**
 * PlaylistBuilder.
 * Date: 01.04.14
 * Time: 14:59
 * Alex Hoch
 */

package application.playlist.view.builder {
	import core.view.builder.BaseBuilder;

	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.display.Stage;

	import application.player.view.PlayerView;

	import application.playlist.view.PlaylistView;

	public class PlaylistBuilder extends BaseBuilder {
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
		public function PlaylistBuilder() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function createPlaylist():void {
			var view:PlaylistView = _viewRegisterManager.createView(PlaylistView) as PlaylistView;
			var stage:Stage = NativeApplication.nativeApplication.activeWindow.stage;
			stage.addChild(view);
			view.y = getPositionY();
			view.init();
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function getPositionY():Number {
			var result:Number = 0;
			var stage:Stage = NativeApplication.nativeApplication.activeWindow.stage;
			var length:int = stage.numChildren;
			var child:DisplayObject;
			for(var i:int = 0; i<length; i++) {
				child = stage.getChildAt(i);
				if(child is PlayerView) {
					result = child.y + child.height + 12;
					break;
				}
			}
			return result;
		}

		//--------------------------------------------------------------------------
		//  Handlers 
		//--------------------------------------------------------------------------
	}
}
