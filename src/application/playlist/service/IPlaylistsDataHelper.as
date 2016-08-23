/**
 * IPlaylistsDataHelper.
 * Date: 07.04.14
 * Time: 11:23
 * Alex Hoch
 */

package application.playlist.service {
	import application.playlist.vo.PlaylistsVO;

	public interface IPlaylistsDataHelper {
		function getPlaylistsVO():PlaylistsVO;
	}
}
