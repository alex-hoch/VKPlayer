/**
 * SoundProgressView.
 * Date: 10.04.14
 * Time: 15:41
 * Alex Hoch
 */

package application.player.view.items {
	import ah.utils.media.IMediaPlayer;
	import ah.utils.media.event.MediaEvent;

	import flash.display.Graphics;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Rectangle;

	public class SoundProgressView extends Sprite {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var audioPlayer:IMediaPlayer;
		private var position:Sprite;
		private var played:Sprite;
		private var loaded:Sprite;
		private var background:Sprite;
		private var isDraging:Boolean;

		private var defaultWidth:Number;

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
		public function SoundProgressView(_width:Number, audioPlayer:IMediaPlayer) {
			this.audioPlayer = audioPlayer;
			defaultWidth = _width;

			draw();
			startListen();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function clear():void {
			this.buttonMode = false;
			loaded.graphics.clear();
			played.graphics.clear();
			position.x = 0;
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
			background = new Sprite();
			var gr:Graphics = background.graphics;
			gr.lineStyle(2, 0x555555, 0.8, true);
			gr.beginFill(0xeeeeee);
			gr.drawRoundRect(0, 0, defaultWidth, 10, 10);
			gr.endFill();

			loaded = new Sprite();
			played = new Sprite();

			position = new Sprite();
			gr = position.graphics;
			gr.lineStyle(2, 0x555555, 0.8, true);
			gr.beginFill(0xaaaaaa);
			gr.drawRoundRect(-3, -10, 6, 20, 10);
			gr.endFill();
			position.x = 3;
			position.y = 5;

			loaded.mouseEnabled = played.mouseEnabled = position.mouseEnabled = false;

			this.addChild(background);
			this.addChild(loaded);
			this.addChild(played);
			//this.addChild(position);
		}

		private function startListen():void {
			background.addEventListener(MouseEvent.MOUSE_DOWN, changePosition);
			audioPlayer.addEventListener(ProgressEvent.PROGRESS, loadingProgressHandler);
			audioPlayer.addEventListener(MediaEvent.PLAYING_PROGRESS, playingProgressHandler);
			audioPlayer.addEventListener(MediaEvent.STOP, stopPlayingHandler);
		}

		private function stopListen():void {
			background.removeEventListener(MouseEvent.MOUSE_DOWN, changePosition);
			audioPlayer.removeEventListener(ProgressEvent.PROGRESS, loadingProgressHandler);
			audioPlayer.removeEventListener(MediaEvent.PLAYING_PROGRESS, playingProgressHandler);
			audioPlayer.removeEventListener(MediaEvent.STOP, stopPlayingHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, changePosition);
			position.removeEventListener(MouseEvent.MOUSE_MOVE, changePosition);
		}

		//--------------------------------------------------------------------------
		//  Handlers 
		//--------------------------------------------------------------------------
		private function playingProgressHandler(event:MediaEvent):void {
			this.buttonMode = true;
			var percent:Number = audioPlayer.playingProgress / audioPlayer.duration;
			if (!isNaN(percent) && !isDraging) {
				var gr:Graphics = played.graphics;
				gr.clear();
				gr.beginFill(0xcc9988);
				gr.drawRoundRect(1, 1, percent * (defaultWidth - 2), 8, 10);
				gr.endFill();

				position.x = percent * defaultWidth - 1;
			}
		}

		private function loadingProgressHandler(event:ProgressEvent):void {
			this.buttonMode = true;
			var percent:Number = event.bytesLoaded / event.bytesTotal || 0;
			var gr:Graphics = loaded.graphics;
			gr.clear();
			gr.beginFill(0xaabbcc);
			gr.drawRoundRect(1, 1, percent * (defaultWidth - 2), 8, 10);
			gr.endFill();
		}

		private function changePosition(event:MouseEvent):void {
			var rect:Rectangle;
			switch (event.type) {
				case MouseEvent.MOUSE_DOWN:
					isDraging = true;
					stage.addEventListener(MouseEvent.MOUSE_UP, changePosition);
					position.addEventListener(MouseEvent.MOUSE_MOVE, changePosition);
					position.x = background.mouseX;
					position.y = background.mouseY;
					rect = new Rectangle(0, 5, loaded.width, 0);
					position.startDrag(false, rect);
					break;
				case MouseEvent.MOUSE_UP:
					isDraging = false;
					position.stopDrag();
					stage.removeEventListener(MouseEvent.MOUSE_UP, changePosition);
					position.removeEventListener(MouseEvent.MOUSE_MOVE, changePosition);
					audioPlayer.seek(position.x / background.width * audioPlayer.duration);
					break;
				case MouseEvent.MOUSE_MOVE:
					position.stopDrag();
					rect = new Rectangle(0, 5, loaded.width, 0);
					position.startDrag(false, rect);
					break;
			}
		}

		private function stopPlayingHandler(event:MediaEvent):void {
			clear();
		}

	}
}
