/**
 * IServerRemoteService.
 * Date: 01.04.14
 * Time: 12:33
 * Alex Hoch
 */

package server.service {
	public interface IServerRemoteService {
		function searchSounds(keyWord:String, searchSimilar:Boolean, offsetIndex:int, callback:Function):void;

		function loadUserPlaylist(userId:Number, callback:Function):void;

		function addSoundInVKPlaylist(soundId:Number, ownerId:Number, callback:Function):void;

		function deleteSoundFromVKPlaylist(soundId:Number, ownerId:Number, callback:Function):void;

		function loadSoundLyrics(lyricsId:Number, callback:Function):void;

		function loadFriends(userId:Number, callback:Function):void;
	}
}
