/**
 * PlayerBuilder.
 * Date: 19.02.14
 * Time: 15:12
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.player.view.builder {
	import core.view.builder.BaseBuilder;

	import flash.desktop.NativeApplication;
	import flash.display.Stage;

	import application.player.view.PlayerView;
	import application.player.vo.PlayerInitVO;

	public class PlayerBuilder extends BaseBuilder {
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
		public function PlayerBuilder() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function createPlayer(initVO:PlayerInitVO):void {
			var view:PlayerView = _viewRegisterManager.createView(PlayerView) as PlayerView;
			var stage:Stage = NativeApplication.nativeApplication.activeWindow.stage;
			view.playerPM.updateData(initVO);
			stage.addChild(view);
			view.init();
			view.x = Math.round((stage.stageWidth - view.width) / 2);
			view.y = 47;
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Handlers 
		//--------------------------------------------------------------------------
	}
}
