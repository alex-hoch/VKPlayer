/**
 * IServerDataConverter.
 * Date: 01.04.14
 * Time: 16:09
 * Alex Hoch
 */

package server.service {
	import application.playlist.model.SoundData;

	import friends.model.UserModel;

	public interface IServerDataConverter {
		function convertSimpleUserModel(data:Object):UserModel;

		function convertSoundData(data:Object):SoundData;
	}
}
