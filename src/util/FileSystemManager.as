/**
 * FileSystemManager
 * User: Alex
 * Date: 09.08.16
 * Time: 15:55
 */
package util {
	import com.adobe.serialization.JSON1;

	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	import application.playlist.model.PlaylistData;

	public class FileSystemManager {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var appPath:String;
		private var playlistsPath:String;

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
		public function FileSystemManager() {

		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function init(userId:Number):void {
			appPath = File.documentsDirectory.nativePath + '\\VKPlayer2\\' + userId + '\\';
			playlistsPath = appPath + 'playlists\\';
		}

		public function savePlaylist(playlist:PlaylistData):void {
			var path:String = playlistsPath + playlist.id + '.txt';
			deletePlaylist(playlist);
			saveFile(path, JSON1.encode(playlist));
		}

		public function deletePlaylist(playlist:PlaylistData):void {
			var path:String = playlistsPath + playlist.id + '.txt';
			var playlistFile:File = File.documentsDirectory.resolvePath(path);
			if(playlistFile.exists) {
				deleteFile(playlistFile.nativePath);
			}
		}

		public function loadPlaylists():Vector.<Object> {
			var result:Vector.<Object> = new Vector.<Object>();
			var playlistsDirectory:File = File.documentsDirectory.resolvePath(playlistsPath);
			if(playlistsDirectory.exists) {
				var list:Array = playlistsDirectory.getDirectoryListing();
				for (var i:uint = 0; i < list.length; i++) {
					result.push(JSON1.decode(loadFile(list[i].nativePath)));
				}
			}
			return result;
		}

		public function saveApplicationSettings(data:String):void {
			saveFile(appPath + 'settings.txt', data);
		}

		public function loadApplicationSettings():Object {
			var data:String = loadFile(appPath + 'settings.txt');
			return data ? JSON1.decode(data) : null;
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function saveFile(filePath:String, data:String):void {
			var file:File = File.documentsDirectory.resolvePath(filePath);
			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeMultiByte(data, "Windows-1251");
			fileStream.close();
		}

		private function loadFile(filePath:String):String {
			var file:File = File.documentsDirectory.resolvePath(filePath);
			if(file.exists) {
				var fileStream:FileStream = new FileStream();
				fileStream.open(file, FileMode.READ);
				return fileStream.readMultiByte(file.size, File.systemCharset);
			}
			return null;
		}

		private function deleteFile(filePath:String):void {
			var file:File = File.documentsDirectory.resolvePath(filePath);
			file.deleteFile();
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------

	}
}
