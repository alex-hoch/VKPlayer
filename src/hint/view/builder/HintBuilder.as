/**
 * HintBuilder
 * User: Alex
 * Date: 23.08.16
 * Time: 13:59
 */
package hint.view.builder {
	import core.view.builder.BaseBuilder;

	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.NativeWindowSystemChrome;
	import flash.display.NativeWindowType;
	import flash.display.Screen;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;

	import hint.message.HintActionMessage;
	import hint.view.HintView;

	public class HintBuilder extends BaseBuilder {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var currentHintView:HintView;
		private var hintWindow:NativeWindow;

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
		public function HintBuilder() {
			super();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function showHint(message:HintActionMessage):void {
			if (!hintWindow) {
				var options:NativeWindowInitOptions = new NativeWindowInitOptions();
				options.maximizable = options.minimizable = options.resizable = false;
				options.transparent = true;
				options.systemChrome = NativeWindowSystemChrome.NONE;
				options.type = NativeWindowType.UTILITY;

				hintWindow = new NativeWindow(options);
				hintWindow.stage.scaleMode = StageScaleMode.NO_SCALE;
				hintWindow.stage.align = StageAlign.TOP_LEFT;
				hintWindow.stage.color = 0xEEEEEE;
				hintWindow.addEventListener(Event.CLOSING, closingHandler);
			}
			if (!currentHintView) {
				currentHintView = _viewRegisterManager.createView(HintView) as HintView;
				hintWindow.stage.addChild(currentHintView);
			}
			currentHintView.hintPM.update(message.hintType, message.data);
			hintWindow.width = currentHintView.hintWidth;
			hintWindow.height = currentHintView.hintHeight;
			var bounds:Rectangle = Screen.mainScreen.visibleBounds;
			hintWindow.x = bounds.width - hintWindow.width - 5;
			hintWindow.y = bounds.height - hintWindow.height - 5;
			hintWindow.activate();
			/*


			 var options:NativeWindowInitOptions = new NativeWindowInitOptions();

			 //options.owner = NativeApplication.nativeApplication.openedWindows[0];
			 var window:NativeWindow = popupManager.getNewNativeWindow(options);
			 window.alwaysInFront = true;
			 window.width = hintView.hintWidth;
			 window.height = hintView.hintHeight;
			 window.stage.addChild(hintView as DisplayObject);
			 */
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
		private function closingHandler(event:Event):void {
			hintWindow.removeEventListener(Event.CLOSING, closingHandler);
			hintWindow = null;
		}

	}
}
