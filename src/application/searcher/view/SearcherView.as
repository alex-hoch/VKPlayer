/**
 * SearcherView.
 * Date: 19.02.14
 * Time: 15:31
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.searcher.view {
	import core.view.BaseView;

	import flash.events.Event;
	import flash.events.FocusEvent;

	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;

	import flash.text.TextField;
	import flash.text.TextFieldType;

	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;

	import application.searcher.view.pm.SearcherPM;

	public class SearcherView extends BaseView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		private const DEFAULT_TEXT:String = 'пошук';

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _searcherPM:SearcherPM;
		private var inputField:TextField;
		private var previousEventType:String;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get searcherPM():SearcherPM { return _searcherPM; }

		public function set searcherPM(value:SearcherPM):void { _searcherPM = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function SearcherView() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function init():void {
			draw();
			startListen();
			resizeHandler(null);
		}

		override public function destroy():void {
			if (destroyed) return;
			stopListen();
			super.destroy();
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {
			this.graphics.lineStyle(2, 0x555555, 0.8);
			this.graphics.beginFill(0xeeeeee);
			this.graphics.drawRoundRect(0, 0, 200, 24, 20, 20);
			this.graphics.endFill();

			var fmt:TextFormat = new TextFormat();
			fmt.align = TextFormatAlign.CENTER;
			fmt.size = 16;
			fmt.color = 0x555555;

			inputField = new TextField();
			inputField.type = TextFieldType.INPUT;
			inputField.defaultTextFormat = fmt;
			inputField.width = 200;
			inputField.height = 24;
			inputField.text = DEFAULT_TEXT;
			this.addChild(inputField);
		}

		private function startListen():void {
			inputField.addEventListener(FocusEvent.FOCUS_IN, focusHandler);
			inputField.addEventListener(FocusEvent.FOCUS_OUT, focusHandler);
			inputField.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
			inputField.addEventListener(MouseEvent.CLICK, clickHandler);
			stage.addEventListener(Event.RESIZE, resizeHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyHandler);
		}

		private function stopListen():void {
			inputField.removeEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
			stage.removeEventListener(Event.RESIZE, resizeHandler);
		}

		//--------------------------------------------------------------------------
		//  Handlers 
		//--------------------------------------------------------------------------
		private function keyHandler(event:KeyboardEvent):void {
			if (event.currentTarget == stage) {
				if (event.ctrlKey) {
					if (event.keyCode == Keyboard.F) {
						stage.focus = inputField;
						inputField.setSelection(0, int.MAX_VALUE);
					}
				}
			} else {
				if (event.keyCode == Keyboard.ENTER) {
					_searcherPM.search(inputField.text);
				} else if (event.ctrlKey) {
					if (event.keyCode != Keyboard.C && event.keyCode != Keyboard.V && event.keyCode != Keyboard.A) {
						event.preventDefault();
						event.stopImmediatePropagation();
					}
				}
			}
		}

		private function resizeHandler(event:Event):void {
			this.x = int((stage.stageWidth - this.width) / 2);
		}

		private function focusHandler(event:FocusEvent):void {
			previousEventType = event.type;
			if (event.type == FocusEvent.FOCUS_IN) {
				if (inputField.text == DEFAULT_TEXT) {
					inputField.text = '';
				}
			} else if (inputField.text == '') {
				inputField.text = DEFAULT_TEXT;
			}
		}

		private function clickHandler(event:MouseEvent):void {
			if (previousEventType == FocusEvent.FOCUS_IN) {
				inputField.setSelection(0, int.MAX_VALUE);
			}
			previousEventType = event.type;
		}
	}
}
