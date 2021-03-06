/**
 * ServerRequest.
 * Date: 01.04.14
 * Time: 12:38
 * Alex Hoch
 */

package server.model {

	public class ServerRequest {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _commandName:String;
		private var _params:String;
		private var _callback:Function;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get commandName():String { return _commandName; }

		public function set commandName(value:String):void { _commandName = value; }

		public function get params():String { return _params; }

		public function set params(value:String):void { _params = value; }

		public function get callback():Function { return _callback; }

		public function set callback(value:Function):void { _callback = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function ServerRequest() {
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
