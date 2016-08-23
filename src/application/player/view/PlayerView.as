/**
 * PlayerView.
 * Date: 16.02.14
 * Time: 16:18
 * Alex Hoch - flasher_ua@ukr.net
 */

package application.player.view {
	import ah.gui.core.display.button.BaseButton;
	import ah.utils.media.event.MediaEvent;
	import ah.utils.media.impl.AudioPlayer;

	import application.player.PlayerState;

	import core.view.BaseView;

	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import application.player.view.event.PlayerEvent;

	import application.player.view.items.NextButton;
	import application.player.view.items.PauseButton;
	import application.player.view.items.PlayButton;
	import application.player.view.items.SaveButton;
	import application.player.view.items.SoundInfoView;
	import application.player.view.items.SoundProgressView;
	import application.player.view.items.StopButton;
	import application.player.view.items.VolumeRegulator;
	import application.player.view.pm.PlayerPM;

	public class PlayerView extends BaseView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _playerPM:PlayerPM;

		private var btnPrevious:BaseButton;
		private var btnPlay:BaseButton;
		private var btnPause:BaseButton;
		private var btnSave:BaseButton;
		private var btnStop:BaseButton;
		private var btnNext:BaseButton;
		private var volumeRegulator:VolumeRegulator;

		private var soundInfo:SoundInfoView;
		private var soundProgress:SoundProgressView;

		private var player:AudioPlayer;

		private var timer:Timer;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get playerPM():PlayerPM { return _playerPM; }

		public function set playerPM(value:PlayerPM):void { _playerPM = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function PlayerView() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function init():void {
			player = new AudioPlayer(_playerPM.volumeValue);
			draw();
			timer = new Timer(1000);
			startListen();
		}

		public function updateState():void {
			btnPlay.visible = true;
			btnStop.enable = true;
			btnSave.enable = true;
			switch (_playerPM.currentState) {
				case PlayerState.PLAYING:
					btnPlay.visible = false;
					if (_playerPM.previousState == PlayerState.PAUSE) {
						player.resume();
					} else {
						if (_playerPM.previousState == PlayerState.PLAYING) {
							player.stopPlay();
						}
						soundInfo.init(_playerPM.soundData.artist + ' - ' + _playerPM.soundData.title, _playerPM.soundData.duration);
						player.load(_playerPM.soundData.url, true);
					}
					timer.start();
					break;
				case PlayerState.PAUSE:
					player.pause();
					timer.stop();
					break;
				case PlayerState.STOP:
					soundInfo.init('', 0);
					player.stopPlay();
					btnStop.enable = false;
					btnSave.enable = false;
					timer.stop();
					break;
			}
			btnPause.visible = !btnPlay.visible;
		}

		public function updatePlayer():void {
			if (player) {
				player.volume = _playerPM.volumeValue;
				volumeRegulator.update();
			}
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
			btnPrevious = new NextButton();
			btnPrevious.scaleX = -1;
			btnPrevious.x = btnPrevious.width;
			this.addChild(btnPrevious);

			btnPlay = new PlayButton();
			btnPlay.x = this.width + 5;
			this.addChild(btnPlay);

			btnPause = new PauseButton();
			btnPause.x = btnPlay.x;
			btnPause.visible = false;
			this.addChild(btnPause);

			btnSave = new SaveButton();
			btnSave.enable = false;
			btnSave.x = this.width + 5;
			this.addChild(btnSave);

			btnStop = new StopButton();
			btnStop.x = this.width + 5;
			btnStop.enable = false;
			this.addChild(btnStop);

			btnNext = new NextButton();
			btnNext.x = this.width + 5;
			this.addChild(btnNext);

			volumeRegulator = new VolumeRegulator(player, 50);
			volumeRegulator.x = this.width + 5;
			this.addChild(volumeRegulator);

			soundInfo = new SoundInfoView();
			soundInfo.y = btnPlay.height + 6;
			this.addChild(soundInfo);

			soundProgress = new SoundProgressView(287, player);
			soundProgress.y = int(soundInfo.y + soundInfo.height + 10);
			this.addChild(soundProgress);
		}

		private function startListen():void {
			btnPrevious.addEventListener(MouseEvent.CLICK, previousHandler);
			btnPlay.addEventListener(MouseEvent.CLICK, playHandler);
			btnPause.addEventListener(MouseEvent.CLICK, pauseHandler);
			btnSave.addEventListener(MouseEvent.CLICK, saveHandler);
			btnStop.addEventListener(MouseEvent.CLICK, stopHandler);
			btnNext.addEventListener(MouseEvent.CLICK, nextHandler);
			stage.addEventListener(Event.RESIZE, resizeHandler);
			player.addEventListener(MediaEvent.FINISH_PLAYING, finishPlayingHandler);
			volumeRegulator.addEventListener(PlayerEvent.CHANGE_VOLUME, changeVolumeHandler);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
		}

		private function stopListen():void {
			btnPrevious.removeEventListener(MouseEvent.CLICK, previousHandler);
			btnPlay.removeEventListener(MouseEvent.CLICK, playHandler);
			btnPause.removeEventListener(MouseEvent.CLICK, pauseHandler);
			btnSave.removeEventListener(MouseEvent.CLICK, saveHandler);
			btnStop.removeEventListener(MouseEvent.CLICK, stopHandler);
			btnNext.removeEventListener(MouseEvent.CLICK, nextHandler);
			stage.removeEventListener(Event.RESIZE, resizeHandler);
			player.removeEventListener(MediaEvent.FINISH_PLAYING, finishPlayingHandler);
			volumeRegulator.removeEventListener(PlayerEvent.CHANGE_VOLUME, changeVolumeHandler);
			timer.removeEventListener(TimerEvent.TIMER, timerHandler);
		}

		//--------------------------------------------------------------------------
		//  Handlers 
		//--------------------------------------------------------------------------
		private function previousHandler(event:MouseEvent):void {
			//			player.stopPlay();
			_playerPM.playPreviousSound();
		}

		private function playHandler(event:MouseEvent):void {
			_playerPM.togglePlay();
			/*if (_playerPM.soundData) {
			 btnPlay.visible = false;
			 btnPause.visible = !btnPlay.visible;
			 btnStop.enable = true;
			 btnSave.enable = true;
			 player.resume();
			 } else {
			 _playerPM.playActiveSound();
			 }*/
		}

		private function pauseHandler(event:MouseEvent):void {
			_playerPM.togglePlay();
			//			btnPlay.visible = true;
			//			btnPause.visible = !btnPlay.visible;
		}

		private function saveHandler(event:MouseEvent):void {
			_playerPM.saveSound();
		}

		private function stopHandler(event:MouseEvent):void {
			/*			player.stopPlay();
			 btnPlay.visible = true;
			 btnStop.enable = false;
			 btnSave.enable = false;
			 btnPause.visible = !btnPlay.visible;
			 soundInfo.init('', 0);
			 */
			_playerPM.stopPlaying();
			//			timer.stop();
		}

		private function nextHandler(event:MouseEvent):void {
			//			player.stopPlay();
			_playerPM.playNextSound();
		}

		private function resizeHandler(event:Event):void {
			this.x = int((stage.stageWidth - this.width) / 2);
		}

		private function finishPlayingHandler(event:MediaEvent):void {
			/*btnPlay.visible = true;
			 btnStop.enable = false;
			 btnSave.enable = false;
			 btnPause.visible = !btnPlay.visible;*/
			_playerPM.playNextSound();
		}

		private function changeVolumeHandler(event:PlayerEvent):void {
			_playerPM.changeVolumeValue(event.volumeValue);
		}

		private function timerHandler(event:TimerEvent):void {
			soundInfo.updateDuration(_playerPM.soundData.duration - Math.round(player.playingProgress));
		}
	}
}
