/**
 * ISettingsService.
 * Date: 19.02.14
 * Time: 14:17
 * Alex Hoch - flasher_ua@ukr.net
 */

package settings.service {
	public interface ISettingsService {
		function parseSettings(settings:Object):void;

		function updateWindowSettings(posX:Number, posY:Number, width:Number, height:Number):void;

		function getSettingsData():String;

		function get applicationPosX():Number;

		function get applicationPosY():Number;

		function get applicationWidth():Number;

		function get applicationHeight():Number;

		function updatePlayerSettings(volumeValue:Number, openedPlaylistId:Number):void;

		function get volumeValue():Number;

		function get isSoundCycled():Boolean;

		function get isListCycled():Boolean;

		function get isRandomPlaying():Boolean;

		function get openedPlaylistId():Number;
	}
}
