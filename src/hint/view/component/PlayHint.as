/**
 * PlayHint
 * User: Alex
 * Date: 23.08.16
 * Time: 14:07
 */
package hint.view.component {
	import ah.utils.TextUtils;

	import application.playlist.model.SoundData;

	import core.view.BaseView;

	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	public class PlayHint extends BaseView implements IHintView {
		//--------------------------------------------------------------------------
		//  Constants
		//--------------------------------------------------------------------------
		private static const WIDTH:int = 300;
		private static const HEIGHT:int = 80;

		//--------------------------------------------------------------------------
		//  Variables
		//--------------------------------------------------------------------------
		private var icon:Bitmap;
		private var loader:Loader;
		private var artistTF:TextField;
		private var soundTF:TextField;
		private var durationTF:TextField;

		//--------------------------------------------------------------------------
		//  Public properties
		//--------------------------------------------------------------------------
		public function get hintWidth():Number { return WIDTH; }

		public function get hintHeight():Number { return HEIGHT; }

		//--------------------------------------------------------------------------
		//  Protected properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private properties
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Constructor
		//--------------------------------------------------------------------------	
		public function PlayHint(id:String = null) {
			draw();

			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadedHandler);
			loader.load(new URLRequest('icons/MyPlayer48.png'));
		}

		//--------------------------------------------------------------------------
		//  Public methods
		//--------------------------------------------------------------------------
		public function update(data:Object = null):void {
			var sound:SoundData = data.sound as SoundData;
			var artist:String = sound.artist.length > 20 ? sound.artist.substr(0, 17) + '...' : sound.artist;
			artistTF.text = artist;

			var symbols:Array = sound.title.split('');
			soundTF.text = '';
			var title:String = '';
			var allTitle:String = '...';
			while (symbols.length) {
				title += symbols.shift();

				soundTF.text = title + '...';
				if (soundTF.numLines < 3) {
					allTitle = title + '...';
				}
				soundTF.text = title;
				if (soundTF.numLines > 2) {
					soundTF.text = allTitle;
					break;
				}
			}
			soundTF.height = soundTF.textHeight + 5;
			durationTF.text = TextUtils.getParsedTime(sound.duration);

			artistTF.y = (HEIGHT - (artistTF.height + 5 + soundTF.height)) / 2;
			soundTF.y = artistTF.y + artistTF.height + 5;
			durationTF.x = WIDTH - durationTF.width - 10;
		}

		//--------------------------------------------------------------------------
		//  Protected methods
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//  Private methods
		//--------------------------------------------------------------------------
		private function draw():void {
			this.graphics.lineStyle(2, 0xeeeeee, 0.8);
			this.graphics.beginFill(0x000000, 0.6);
			this.graphics.drawRoundRect(2, 2, WIDTH, HEIGHT, 20, 20);
			this.graphics.endFill();

			artistTF = TextUtils.getNewTextField( {
				size		:		16,
				color		:		0xFFFFFF,
				selectable	:		false,
				bold		:		true,
				italic		:		false,
				wordWrap	:		false,
				multiline	:		false,
				autoSize	:		TextFieldAutoSize.LEFT
			} );
			artistTF.text = 'artistTF';
			this.addChild(artistTF);

			soundTF = TextUtils.getNewTextField( {
				size		:		14,
				color		:		0xFFFFFF,
				selectable	:		false,
				italic		:		false,
				wordWrap	:		true,
				multiline	:		true,
				width		:		180
			} );
			soundTF.text = 'soundTF';
			this.addChild(soundTF);

			durationTF = TextUtils.getNewTextField( {
				size		:		16,
				color		:		0xFFFFFF,
				selectable	:		false,
				italic		:		false,
				wordWrap	:		false,
				multiline	:		false,
				autoSize	:		TextFieldAutoSize.LEFT
			} );
			durationTF.text = '0';
			this.addChild(durationTF);
		}

		private function loadedHandler(event:Event):void {
			icon = (loader.content as Bitmap);
			icon.x = 10;
			icon.y = (HEIGHT - icon.height) / 2 + 2;
			this.addChild(icon);

			artistTF.x = soundTF.x = icon.x + icon.width + 10;

			durationTF.y = int((HEIGHT - durationTF.height) / 2) + 2;
		}

		//--------------------------------------------------------------------------
		//  Handlers
		//--------------------------------------------------------------------------

	}
}
