package feathers.utils {

	import flash.system.LoaderContext;
	import flash.ui.Mouse;

	public class Substitute {

		public static const KEYBOARD_BACK:int = 16777238;

		private static const ON_DEMAND:String = "onDemand";
		private static const ON_LOAD:String = "onLoad";

		public static function setImageDecodingPolicyOnDemand():void {
			if ("imageDecodingPolicy" in LoaderContext) {
				LoaderContext["imageDecodingPolicy"] = ON_DEMAND;
			}
		}

		public static function setImageDecodingPolicyOnLoad():void {
			if ("imageDecodingPolicy" in LoaderContext) {
				LoaderContext["imageDecodingPolicy"] = ON_LOAD;
			}
		}

		public static function get supportsNativeCursor():Boolean {
			if ("supportsNativeCursor" in Mouse) {
				return Mouse["supportsNativeCursor"];
			}
			return true;
		}

	}
}
