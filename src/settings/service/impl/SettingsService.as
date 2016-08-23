/**
 * SettingsService.
 * Date: 19.02.14
 * Time: 14:18
 * Alex Hoch - flasher_ua@ukr.net
 */

package settings.service.impl {
	import settings.model.PlayerSettings;
	import settings.model.WindowSettings;
	import settings.service.ISettingsService;

	public class SettingsService implements ISettingsService {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var windowSettings:WindowSettings;
		private var playerSettings:PlayerSettings;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get applicationPosX():Number { return windowSettings.posX; }

		public function get applicationPosY():Number { return windowSettings.posY; }

		public function get applicationWidth():Number { return windowSettings.width; }

		public function get applicationHeight():Number { return windowSettings.height; }

		public function get volumeValue():Number { return playerSettings.volumeValue; }

		public function get isSoundCycled():Boolean { return playerSettings.isSoundCycled; }

		public function get isListCycled():Boolean { return playerSettings.isListCycled; }

		public function get isRandomPlaying():Boolean { return playerSettings.isRandomPlaying; }

		public function get openedPlaylistId():Number { return playerSettings.openedPlaylistId; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function SettingsService() {
			windowSettings = new WindowSettings();
			playerSettings = new PlayerSettings();
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function parseSettings(settings:Object):void {
			if(settings) {
				windowSettings.posX = settings.applicationPosX;
				windowSettings.posY = settings.applicationPosY;
				windowSettings.width = settings.applicationWidth;
				windowSettings.height = settings.applicationHeight;

				playerSettings.volumeValue = settings.volumeValue;
				playerSettings.isSoundCycled = settings.isSoundCycled;
				playerSettings.isListCycled = settings.isListCycled;
				playerSettings.isRandomPlaying = settings.isRandomPlaying;
				playerSettings.openedPlaylistId = settings.openedPlaylistId;
			} else {
				windowSettings.posX = 2700;
				windowSettings.posY = 170;
				windowSettings.width = 485;
				windowSettings.height = 543;

				playerSettings.volumeValue = 0.5;
				playerSettings.isSoundCycled = false;
				playerSettings.isListCycled = false;
				playerSettings.isRandomPlaying = false;
				playerSettings.openedPlaylistId = Settings.DEFAULT_PLAYLIST_ID;
			}
		}

		public function updateWindowSettings(posX:Number, posY:Number, width:Number, height:Number):void {
			windowSettings.posX = posX;
			windowSettings.posY = posY;
			windowSettings.width = width;
			windowSettings.height = height;
		}

		public function updatePlayerSettings(volumeValue:Number, openedPlaylistId:Number):void {
			playerSettings.volumeValue = volumeValue;
			playerSettings.openedPlaylistId = openedPlaylistId;
		}

		public function getSettingsData():String {
			return JSON.stringify(this);
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
