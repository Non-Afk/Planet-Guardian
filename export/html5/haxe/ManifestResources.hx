package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y26:assets%2Fimages%2Fball.pngR2i1963R3y5:IMAGER5R7R6tgoR0y30:assets%2Fimages%2Fboss%201.pngR2i2213R3R8R5R9R6tgoR0y30:assets%2Fimages%2Fboss%202.pngR2i2312R3R8R5R10R6tgoR0y30:assets%2Fimages%2Fboss%203.pngR2i2293R3R8R5R11R6tgoR0y30:assets%2Fimages%2Fboss%204.pngR2i2316R3R8R5R12R6tgoR0y34:assets%2Fimages%2FbossMovement.pngR2i1181R3R8R5R13R6tgoR0y28:assets%2Fimages%2Fbullet.pngR2i2043R3R8R5R14R6tgoR0y31:assets%2Fimages%2Fenemy%201.pngR2i1763R3R8R5R15R6tgoR0y31:assets%2Fimages%2Fenemy%202.pngR2i1789R3R8R5R16R6tgoR0y31:assets%2Fimages%2Fenemy%203.pngR2i1795R3R8R5R17R6tgoR0y31:assets%2Fimages%2Fenemy%204.pngR2i1811R3R8R5R18R6tgoR0y35:assets%2Fimages%2FenemyMovement.pngR2i537R3R8R5R19R6tgoR0y28:assets%2Fimages%2Fground.pngR2i3739R3R8R5R20R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R21R6tgoR0y32:assets%2Fimages%2Fplayer%201.pngR2i1512R3R8R5R22R6tgoR0y32:assets%2Fimages%2Fplayer%202.pngR2i1520R3R8R5R23R6tgoR0y32:assets%2Fimages%2Fplayer%203.pngR2i1513R3R8R5R24R6tgoR0y36:assets%2Fimages%2FplayerMovement.pngR2i254R3R8R5R25R6tgoR0y28:assets%2Fimages%2Fturret.pngR2i1979R3R8R5R26R6tgoR0y24:assets%2Fmusic%2FBGM.pkfR2i211004R3y6:BINARYR5R27R6tgoR2i6755416R3y5:SOUNDR5y24:assets%2Fmusic%2FBGM.wavy9:pathGroupaR30hR6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R32R6tgoR2i54764R3R29R5y35:assets%2Fsounds%2Fair_explosion.wavR31aR33hR6tgoR2i409736R3R29R5y63:assets%2Fsounds%2Fbullet_whizzing_by-Mike_Koenig-2005433595.wavR31aR34hR6tgoR2i130588R3R29R5y31:assets%2Fsounds%2Fexplosion.wavR31aR35hR6tgoR2i110624R3R29R5y52:assets%2Fsounds%2FLaser-SoundBible.com-602495617.wavR31aR36hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R37R6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3R31aR39y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R38R5y28:flixel%2Fsounds%2Fflixel.mp3R31aR41y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R29R5R40R31aR39R40hgoR2i33629R3R29R5R42R31aR41R42hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R43R44y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R8R5R49R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R8R5R50R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ball_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_boss_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_boss_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_boss_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_boss_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bossmovement_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemymovement_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_playermovement_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_turret_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_bgm_pkf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_bgm_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_air_explosion_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bullet_whizzing_by_mike_koenig_2005433595_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_explosion_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_laser_soundbible_com_602495617_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/ball.png") @:noCompletion #if display private #end class __ASSET__assets_images_ball_png extends lime.graphics.Image {}
@:keep @:image("assets/images/boss 1.png") @:noCompletion #if display private #end class __ASSET__assets_images_boss_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/boss 2.png") @:noCompletion #if display private #end class __ASSET__assets_images_boss_2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/boss 3.png") @:noCompletion #if display private #end class __ASSET__assets_images_boss_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/boss 4.png") @:noCompletion #if display private #end class __ASSET__assets_images_boss_4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bossMovement.png") @:noCompletion #if display private #end class __ASSET__assets_images_bossmovement_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bullet.png") @:noCompletion #if display private #end class __ASSET__assets_images_bullet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy 1.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy 2.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy 3.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy 4.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemyMovement.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemymovement_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ground.png") @:noCompletion #if display private #end class __ASSET__assets_images_ground_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/player 1.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player 2.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player 3.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/playerMovement.png") @:noCompletion #if display private #end class __ASSET__assets_images_playermovement_png extends lime.graphics.Image {}
@:keep @:image("assets/images/turret.png") @:noCompletion #if display private #end class __ASSET__assets_images_turret_png extends lime.graphics.Image {}
@:keep @:file("assets/music/BGM.pkf") @:noCompletion #if display private #end class __ASSET__assets_music_bgm_pkf extends haxe.io.Bytes {}
@:keep @:file("assets/music/BGM.wav") @:noCompletion #if display private #end class __ASSET__assets_music_bgm_wav extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/air_explosion.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_air_explosion_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/bullet_whizzing_by-Mike_Koenig-2005433595.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_bullet_whizzing_by_mike_koenig_2005433595_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/explosion.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_explosion_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Laser-SoundBible.com-602495617.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_laser_soundbible_com_602495617_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
