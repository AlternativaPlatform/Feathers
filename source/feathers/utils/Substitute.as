package feathers.utils {

	import flash.display.BitmapData;
	import flash.display3D.textures.Texture;
	import flash.system.LoaderContext;
	import flash.ui.Mouse;

	import starling.textures.Texture;

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

		public static function updateTextureBitmapData(texture:starling.textures.Texture, data:BitmapData):void {
			var actual:flash.display3D.textures.Texture = texture.base as flash.display3D.textures.Texture;
			if (actual != null && "uploadFromBitmapData" in actual) {
				actual["uploadFromBitmapData"](data);
			} else if ("updateBitmapData" in texture) {
				texture["updateBitmapData"](data);
			}
		}

	}
}
