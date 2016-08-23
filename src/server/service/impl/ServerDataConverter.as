/**
 * ServerDataConverter.
 * Date: 01.04.14
 * Time: 16:10
 * Alex Hoch
 */

package server.service.impl {
	import application.playlist.model.SoundData;
	import friends.model.UserModel;
	import server.service.IServerDataConverter;

	public class ServerDataConverter implements IServerDataConverter {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------

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
		public function ServerDataConverter() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function convertSimpleUserModel(data:Object):UserModel {
			var result:UserModel = new UserModel();
			result.id = data.id;
			result.name = data.name;
			result.photo = data.photo;
			return result;
		}

		public function convertCcmplexUserModel(data:Object):UserModel {
			var result:UserModel = new UserModel();
			result.id = data.uid;
			result.name = data.first_name;
			result.surname = data.last_name;
			result.photo = data.photo_medium;
			return result;
		}

		public function convertSoundData(data:Object):SoundData {
			var result:SoundData = new SoundData();
			result.id = data.aid;
			result.ownerId = data.owner_id;
			result.artist = data.artist;
			result.title = data.title;
			result.url = data.url;
			result.duration = data.duration;
			result.lyricsId = data.lyrics_id;
			result.genre = data.genre;
			return result;
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
