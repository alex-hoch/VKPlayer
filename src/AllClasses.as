/**
 * AllClasses.
 * Date: 19.02.14
 * Time: 12:06
 * Alex Hoch - flasher_ua@ukr.net
 */

package {
	import application.player.controller.TogglePlayCommand;
	import application.player.controller.StopPlayingCommand;
	import application.playlist.controller.AddSoundToQueueCommand;
	import application.playlist.controller.RemoveSoundFromQueueCommand;
	import application.playlist.controller.SaveLocalPlaylistsCommand;
	import application.playlist.controller.playlistContextMenu.RefreshPlaylistCommand;

	import core.view.ViewRegistrationManager;

	import downloader.controller.AddPlaylistToDownloaderCommand;

	import downloader.controller.AddSoundToDownloaderCommand;

	import downloader.controller.SaveSoundCommand;
	import downloader.controller.ShowDownloaderCommand;
	import downloader.message.DownloaderActionMessage;
	import downloader.message.DownloaderViewMessage;
	import downloader.service.DownloaderDataHelper;
	import downloader.service.DownloaderService;
	import downloader.view.DownloaderView;
	import downloader.view.builder.DownloaderBuilder;
	import downloader.view.pm.DownloaderPM;

	import friends.controller.OpenFriendsListCommand;
	import friends.message.FriendsActionMessage;
	import friends.service.FriendsService;
	import friends.view.FriendsListView;
	import friends.view.builder.FriendsListViewBuilder;
	import friends.view.pm.FriendsListPM;

	import hint.message.HintActionMessage;
	import hint.message.HintViewMessage;
	import hint.view.HintView;

	import hint.view.builder.HintBuilder;
	import hint.view.pm.HintPM;

	import login.controller.LoginCommand;
	import login.controller.LoginCompletedCommand;
	import login.message.LoginActionMessage;
	import login.service.impl.ApplicationService;
	import settings.controller.LoadSettingsCommand;
	import settings.controller.SaveSettingsCommand;
	import settings.service.impl.SettingsService;
	import login.view.LoginView;
	import login.view.builder.LoginBuilder;
	import login.view.pm.LoginPM;

	import application.player.controller.ChangeVolumeValueCommand;
	import application.player.controller.InitPlayerCommand;
	import application.player.controller.PlayActiveSoundCommand;
	import application.player.controller.PlayNextSoundCommand;
	import application.player.controller.PlayPreviousSoundCommand;
	import application.player.message.PlayerActionMessage;
	import application.player.message.PlayerMessage;
	import application.player.message.PlayerViewMessage;
	import application.player.service.PlayerDataHelper;
	import application.player.view.PlayerView;
	import application.player.view.builder.PlayerBuilder;
	import application.player.view.pm.PlayerPM;

	import application.playlist.controller.ChoosePlaylistCommand;

	import application.playlist.controller.ChooseSoundCommand;
	import application.playlist.controller.LoadLocalPlaylistsCommand;
	import application.playlist.controller.playlistContextMenu.ClearPlaylistCommand;
	import application.playlist.controller.playlistContextMenu.DeletePlaylistCommand;
	import application.playlist.controller.playlistContextMenu.SortPlaylistCommand;
	import application.playlist.controller.soundContextMenu.CopySoundToAnotherPlaylistCommand;

	import application.playlist.controller.CreatePlaylistCommand;
	import application.playlist.controller.InitPlaylistCommand;
	import application.playlist.controller.soundContextMenu.DeleteSoundCommand;
	import application.playlist.controller.soundContextMenu.LoadUserPlaylistCommand;
	import application.playlist.controller.SelectSoundCommand;
	import application.playlist.controller.UpdatePlaylistScrollIndexCommand;
	import application.playlist.controller.UpdatePlaylistsCommand;
	import application.playlist.controller.soundContextMenu.OpenOwnerPageCommand;
	import application.playlist.controller.soundContextMenu.ShowLyricsCommand;
	import application.playlist.message.PlaylistActionMessage;
	import application.playlist.message.PlaylistMessage;
	import application.playlist.message.PlaylistViewMessage;
	import application.playlist.service.impl.PlaylistsDataHelper;
	import application.playlist.service.impl.PlaylistsService;

	import application.playlist.view.PlaylistView;

	import application.playlist.view.builder.PlaylistBuilder;
	import application.playlist.view.pm.PlaylistPM;

	import application.searcher.controller.InitSearcherCommand;

	import application.searcher.controller.SearchSoundsCommand;
	import application.searcher.message.SearcherActionMessage;
	import application.searcher.view.SearcherView;
	import application.searcher.view.builder.SearcherBuilder;
	import application.searcher.view.pm.SearcherPM;

	import server.controller.SendRequestToServerCommand;

	import server.message.ServerActionMessage;
	import server.service.impl.ServerDataConverter;
	import server.service.impl.ServerRemoteService;

	import util.GlobalHotkeyManager;

	public class AllClasses {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var allClasses:Array = [];

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
		public function AllClasses() {
			allClasses[allClasses.length] = ViewRegistrationManager;
			allClasses[allClasses.length] = LoginCommand;
			allClasses[allClasses.length] = LoginActionMessage;
			allClasses[allClasses.length] = LoginBuilder;
			allClasses[allClasses.length] = LoginPM;
			allClasses[allClasses.length] = LoginView;
			allClasses[allClasses.length] = ApplicationService;
			allClasses[allClasses.length] = LoginCompletedCommand;
			allClasses[allClasses.length] = LoadSettingsCommand;
			allClasses[allClasses.length] = SettingsService;
			allClasses[allClasses.length] = SaveSettingsCommand;

			allClasses[allClasses.length] = InitPlayerCommand;
			allClasses[allClasses.length] = PlayActiveSoundCommand;
			allClasses[allClasses.length] = TogglePlayCommand;
			allClasses[allClasses.length] = PlayPreviousSoundCommand;
			allClasses[allClasses.length] = PlayNextSoundCommand;
			allClasses[allClasses.length] = StopPlayingCommand;
			allClasses[allClasses.length] = ChangeVolumeValueCommand;
			allClasses[allClasses.length] = PlayerDataHelper;
			allClasses[allClasses.length] = PlayerActionMessage;
			allClasses[allClasses.length] = PlayerViewMessage;
			allClasses[allClasses.length] = PlayerMessage;
			allClasses[allClasses.length] = PlayerBuilder;
			allClasses[allClasses.length] = PlayerPM;
			allClasses[allClasses.length] = PlayerView;

			allClasses[allClasses.length] = InitSearcherCommand;
			allClasses[allClasses.length] = SearcherActionMessage;
			allClasses[allClasses.length] = SearcherBuilder;
			allClasses[allClasses.length] = SearcherPM;
			allClasses[allClasses.length] = SearcherView;
			allClasses[allClasses.length] = SearchSoundsCommand;

			allClasses[allClasses.length] = InitPlaylistCommand;
			allClasses[allClasses.length] = CreatePlaylistCommand;
			allClasses[allClasses.length] = LoadUserPlaylistCommand;
			allClasses[allClasses.length] = SelectSoundCommand;
			allClasses[allClasses.length] = ChooseSoundCommand;
			allClasses[allClasses.length] = ChoosePlaylistCommand;
			allClasses[allClasses.length] = UpdatePlaylistScrollIndexCommand;
			allClasses[allClasses.length] = UpdatePlaylistsCommand;
			allClasses[allClasses.length] = RefreshPlaylistCommand;
			allClasses[allClasses.length] = CopySoundToAnotherPlaylistCommand;
			allClasses[allClasses.length] = DeleteSoundCommand;
			allClasses[allClasses.length] = ShowLyricsCommand;
			allClasses[allClasses.length] = OpenOwnerPageCommand;
			allClasses[allClasses.length] = SortPlaylistCommand;
			allClasses[allClasses.length] = ClearPlaylistCommand;
			allClasses[allClasses.length] = DeletePlaylistCommand;
			allClasses[allClasses.length] = LoadLocalPlaylistsCommand;
			allClasses[allClasses.length] = SaveLocalPlaylistsCommand;
			allClasses[allClasses.length] = AddSoundToQueueCommand;
			allClasses[allClasses.length] = RemoveSoundFromQueueCommand;
			allClasses[allClasses.length] = PlaylistMessage;
			allClasses[allClasses.length] = PlaylistActionMessage;
			allClasses[allClasses.length] = PlaylistViewMessage;
			allClasses[allClasses.length] = PlaylistsService;
			allClasses[allClasses.length] = PlaylistsDataHelper;
			allClasses[allClasses.length] = PlaylistBuilder;
			allClasses[allClasses.length] = PlaylistPM;
			allClasses[allClasses.length] = PlaylistView;

			allClasses[allClasses.length] = SendRequestToServerCommand;
			allClasses[allClasses.length] = ServerActionMessage;
			allClasses[allClasses.length] = ServerRemoteService;
			allClasses[allClasses.length] = ServerDataConverter;

			allClasses[allClasses.length] = ShowDownloaderCommand;
			allClasses[allClasses.length] = SaveSoundCommand;
			allClasses[allClasses.length] = AddSoundToDownloaderCommand;
			allClasses[allClasses.length] = AddPlaylistToDownloaderCommand;
			allClasses[allClasses.length] = DownloaderService;
			allClasses[allClasses.length] = DownloaderActionMessage;
			allClasses[allClasses.length] = DownloaderViewMessage;
			allClasses[allClasses.length] = DownloaderDataHelper;
			allClasses[allClasses.length] = DownloaderBuilder;
			allClasses[allClasses.length] = DownloaderPM;
			allClasses[allClasses.length] = DownloaderView;

			allClasses[allClasses.length] = OpenFriendsListCommand;
			allClasses[allClasses.length] = FriendsActionMessage;
			allClasses[allClasses.length] = FriendsService;
			allClasses[allClasses.length] = FriendsListViewBuilder;
			allClasses[allClasses.length] = FriendsListPM;
			allClasses[allClasses.length] = FriendsListView;

			allClasses[allClasses.length] = GlobalHotkeyManager;

			allClasses[allClasses.length] = HintBuilder;
			allClasses[allClasses.length] = HintActionMessage;
			allClasses[allClasses.length] = HintViewMessage;
			allClasses[allClasses.length] = HintPM;
			allClasses[allClasses.length] = HintView;
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------

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
