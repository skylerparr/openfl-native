package openfl.utils;


import flash.Lib;
import openfl.utils.JNI;


class SystemPath {
  
	
	public static var applicationDirectory (get, null):String;
	public static var applicationStorageDirectory (get, null):String;
	public static var desktopDirectory (get, null):String;
	public static var documentsDirectory (get, null):String;
	public static var userDirectory (get, null):String;
	
	private static inline var APP = 0;
	private static inline var STORAGE = 1;
	private static inline var DESKTOP = 2;
	private static inline var DOCS = 3;
	private static inline var USER = 4;
	
	
	
	
	// Getters & Setters
	
	
	
	
<<<<<<< HEAD
	private static function get_applicationDirectory ():String { return nme_filesystem_get_special_dir (APP); }
	private static function get_applicationStorageDirectory ():String { return nme_filesystem_get_special_dir (STORAGE); }
	private static function get_desktopDirectory ():String { return nme_filesystem_get_special_dir (DESKTOP); }
	private static function get_documentsDirectory ():String { return nme_filesystem_get_special_dir (DOCS); }
	private static function get_userDirectory ():String { return nme_filesystem_get_special_dir (USER); }
=======
	private static function get_applicationDirectory ():String { return lime_filesystem_get_special_dir (APP); }
	private static function get_applicationStorageDirectory ():String { return lime_filesystem_get_special_dir (STORAGE); }
	private static function get_desktopDirectory ():String { return lime_filesystem_get_special_dir (DESKTOP); }
	private static function get_documentsDirectory ():String { return lime_filesystem_get_special_dir (DOCS); }
	private static function get_userDirectory ():String { return lime_filesystem_get_special_dir (USER); }
>>>>>>> 406a89c414c45ff79a2b97135412ea1971d3b32e
	
	
	
	
	// Native Methods
	
	
	
	
	#if !android
	
<<<<<<< HEAD
	private static var nme_filesystem_get_special_dir = Lib.load ("nme", "nme_filesystem_get_special_dir", 1);
=======
	private static var lime_filesystem_get_special_dir = Lib.load ("lime", "lime_filesystem_get_special_dir", 1);
>>>>>>> 406a89c414c45ff79a2b97135412ea1971d3b32e
	
	#else
	
	private static var jni_filesystem_get_special_dir:Dynamic = null;
	
<<<<<<< HEAD
	private static function nme_filesystem_get_special_dir (inWhich:Int):String {
		
		if (jni_filesystem_get_special_dir == null) {
			
			jni_filesystem_get_special_dir = JNI.createStaticMethod ("org.haxe.nme.GameActivity", "getSpecialDir", "(I)Ljava/lang/String;");
=======
	private static function lime_filesystem_get_special_dir (inWhich:Int):String {
		
		if (jni_filesystem_get_special_dir == null) {
			
			jni_filesystem_get_special_dir = JNI.createStaticMethod ("org.haxe.lime.GameActivity", "getSpecialDir", "(I)Ljava/lang/String;");
>>>>>>> 406a89c414c45ff79a2b97135412ea1971d3b32e
			
		}
		
		return jni_filesystem_get_special_dir (inWhich);
		
	}
	
	#end
	
	
}