package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(500, 500, PlayState));
		// FlxG.switchState(new MenuState());
	}
}
