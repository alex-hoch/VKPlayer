/**
 * ViewRegistrationManager.
 * Date: 19.02.14
 * Time: 11:40
 * Alex Hoch - flasher_ua@ukr.net
 */

package core.view {
	import flash.utils.Dictionary;

	import org.spicefactory.parsley.core.context.Context;
	import org.spicefactory.parsley.core.context.DynamicObject;

	public class ViewRegistrationManager {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var _context:Context;

		private var viewDict:Dictionary;
		private var viewDynamicObjectDict:Dictionary;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function set context(value:Context):void { _context = value; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------
		public function ViewRegistrationManager() {
			viewDict = new Dictionary(true);
			viewDynamicObjectDict = new Dictionary(true);
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function createView(type:Class):IView {
			var dynamicObject:DynamicObject = _context.createDynamicObjectByType(type);

			var view:IView = dynamicObject.instance as IView;

			if (isViewRegistered(view.id)) {
				throw new Error("Unable to instantiate view. Instance with such id already registered..");
			}

			viewDict[view.id] = view;
			viewDynamicObjectDict[view] = dynamicObject;

			return view;
		}

		public function registerView(value:IView):void {
			if (isViewRegistered(value.id)) {
				throw new Error("Unable to register view. Instance with such id already registered..");
			}
			var dynamicObject:DynamicObject = _context.addDynamicObject(value);

			viewDict[value.id] = value;
			viewDynamicObjectDict[value] = dynamicObject;
		}

		public function unregisterView(value:IView):void {
			var dynamicObject:DynamicObject = viewDynamicObjectDict[value];

			if (!dynamicObject) {
				return;
			}
			viewDict[value.id] = null;
			delete  viewDict[value.id];

			viewDynamicObjectDict[value] = null;
			delete  viewDynamicObjectDict[value];

			dynamicObject.remove();

		}

		public function getViewByID(value:String):IView {
			var result:IView = viewDict[value];
			return result;
		}

		public function isViewRegistered(viewID:String):Boolean {
			var view:IView = getViewByID(viewID);
			var result:Boolean = (view != null);
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
