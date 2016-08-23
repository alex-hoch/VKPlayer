/**
 * IPlayerSoundData.
 * Date: 07.04.14
 * Time: 15:08
 * Alex Hoch
 */

package application.player.view.data {
	public interface IPlayerSoundData {
		function get artist():String;
		function get title():String;
		function get url():String;
		function get duration():int;

		function get id():Number;
	}
}
