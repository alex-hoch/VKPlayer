/**
 * IPlaylistService.
 * Date: 01.04.14
 * Time: 14:02
 * Alex Hoch
 */

package application.playlist.service {
	import application.playlist.model.ActionData;
	import application.playlist.model.PlaylistData;
	import application.playlist.model.PlaylistSoundData;
	import application.playlist.model.SoundData;

	public interface IPlaylistsService {
		function createPlaylist(id:Number, title:String, sounds:Array, action:ActionData):PlaylistData;

		function getAllPlaylists():Array;

		function selectSound(soundId:Number):void;

		function get openedPlaylist():PlaylistData;

		function get playingPlaylist():PlaylistData;

		function get playingSound():SoundData;

		function get nextPlayingSound():PlaylistSoundData;

		function get previousPlayingSound():PlaylistSoundData;

		function chooseSound(soundId:Number, playlistId:Number):void;

		function choosePlaylist(playlistId:Number):void;

		function updateScrollPosition(scrollIndex:Number):void;

		function addSoundToPlaylist(sound:SoundData, playlistId:Number):void;

		function deleteSoundFromPlaylist(soundId:Number, playlistId:Number):SoundData;

		function getSoundFromPlaylist(soundId:Number, playlistId:Number):SoundData;

		function sortPlaylistByType(sortingType:int):void;

		function deletePlaylist(playlistId:Number):PlaylistData;

		function clearPlaylist(playlistId:Number):void;

		function addPlaylist(playlistData:PlaylistData):void;

		function addSoundToQueue(soundId:Number, playlistId:Number):void;

		function removeSoundFromQueue(soundId:Number, playlistId:Number, removeAllInstance:Boolean = false):void;

		function getSoundInQueuePosition(soundId:Number, playlistId:Number):int;

		function getPlaylistById(playlistId:Number):PlaylistData;
	}
}
