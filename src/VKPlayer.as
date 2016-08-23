package {

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	import login.message.LoginActionMessage;
	import org.spicefactory.lib.logging.Appender;
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.LogLevel;
	import org.spicefactory.lib.logging.impl.DefaultLogFactory;
	import org.spicefactory.lib.logging.impl.TraceAppender;
	import org.spicefactory.parsley.context.ContextBuilder;
	import org.spicefactory.parsley.context.ContextBuilderSetup;
	import org.spicefactory.parsley.core.context.Context;
	import org.spicefactory.parsley.core.events.ContextEvent;
	import org.spicefactory.parsley.xml.XmlConfig;

	public class VKPlayer extends Sprite {

		private var _context:Context;

		public function VKPlayer() {
			new AllClasses();

			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			initializeLogger();
			initContext();

			this.addEventListener(Event.CLOSING, closeHandler);
			this.addEventListener(Event.CLOSE, closeHandler);
		}

		private function initializeLogger():void {
					//			FlashResourceXmlSupport.initialize();
//					FlashResourceXMLSupportExtended.initialize();
			var appender:Appender = new TraceAppender();
						appender.threshold = LogLevel.TRACE;

						var logFactory:DefaultLogFactory = new DefaultLogFactory()
						logFactory.addAppender(appender);
						logFactory.addLogLevel('', LogLevel.ERROR);
						LogContext.factory = logFactory;

//					var sosMaxAppender:SOSAppender = new SOSAppender();
//					sosMaxAppender.init();
//					sosMaxAppender.useShortNames = true;

//					var logFactory:DefaultLogFactory = new DefaultLogFactory();
//					logFactory.addAppender(sosMaxAppender);
//
//					CONFIG::debug{
//						if (Capabilities.isDebugger) {
//							var devAppender:DJGamesAppender = new DJGamesAppender();
//							logFactory.addAppender(devAppender);
//						}
//					}
//
//					logFactory.addLogLevel(SPICEFACTORY_PACKAGE, LogLevel.WARN);
//					logFactory.addLogLevel(RU_MAIL, LogLevel.DEBUG);
//					logFactory.addLogLevel(RU_MAIL, LogLevel.INFO);

					LogContext.factory = null;
				}

		private function initContext():void {
			var contextBuilderSetup:ContextBuilderSetup = ContextBuilder.newSetup();
			var contextBuilder:ContextBuilder = contextBuilderSetup.newBuilder();

			var config:ConfigForParsley = new ConfigForParsley();
			var configList:Array = config.getConfigList();

			var len:int = configList.length;
			for (var i:int = 0; i < len; i++) {
				contextBuilder.config(XmlConfig.forFile(configList[i].toString()));
			}

			_context = contextBuilder.build();
			_context.addEventListener(ContextEvent.INITIALIZED, onContextInitialized);
		}

		private function onContextInitialized(event:ContextEvent):void {
			var message:LoginActionMessage = new LoginActionMessage(LoginActionMessage.LOGIN);
			_context.addDynamicObject(this);
			_context.scopeManager.dispatchMessage(message);

//			super.tabChildren = false;
//			super.tabEnabled = false;
//			super.focusRect = false;
//			super.stage.stageFocusRect = false;
//			stage.tabChildren = false;
		}

		private function closeHandler(event:Event):void {

		}
	}
}

