/**
 * IHintView
 * User: Alex
 * Date: 23.08.16
 * Time: 14:07
 */
package hint.view.component {
	public interface IHintView {
		function get hintWidth():Number;
		function get hintHeight():Number;
		function update(data:Object = null):void;
		function destroy():void;
	}
}
