/**
 * ConfigForParsley.
 * Date: 19.02.14
 * Time: 10:22
 * Alex Hoch - flasher_ua@ukr.net
 */

package {

	public class ConfigForParsley {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var configList:Array = [];

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
		public function ConfigForParsley() {
			configList[configList.length] = "coreComponentsConfig.xml";
			configList[configList.length] = "loginConfig.xml";
			configList[configList.length] = "settingsConfig.xml";
			configList[configList.length] = "searcherConfig.xml";
			configList[configList.length] = "playerConfig.xml";
			configList[configList.length] = "playlistConfig.xml";
			configList[configList.length] = "serverConfig.xml";
			configList[configList.length] = "downloaderConfig.xml";
			configList[configList.length] = "friendsConfig.xml";
			configList[configList.length] = "hintConfig.xml";
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function getConfigList():Array {
			return configList;
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
