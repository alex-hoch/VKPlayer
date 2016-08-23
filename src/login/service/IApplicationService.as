/**
 * IApplicationService.
 * Date: 19.02.14
 * Time: 11:25
 * Alex Hoch - flasher_ua@ukr.net
 */

package login.service {
	import login.vo.LoginResultVO;

	public interface IApplicationService {
		function get appId():int;

		function get userId():Number;

		function get settings():int;

		function get display():String;

		function get redirectUrl():String;

		function get authorizationLink():String;

		function parseLoginData(data:LoginResultVO):void;

		function get accessToken():String;
	}
}
