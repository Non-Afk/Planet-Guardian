package;

import PlayState;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var _highestScore:Int;
	var highestScoreText:FlxText;

	var playState:PlayState;

	override public function create()
	{
		super.create();

		var titleText = new FlxText(0, 50, FlxG.width, "GAME OVER");
		titleText.setFormat(null, 64, FlxColor.WHITE, "center");
		titleText.scrollFactor.set();
		add(titleText);

		var startText = new FlxText(0, 200, FlxG.width, "Press'SPACE' to START");
		startText.setFormat(null, 16, FlxColor.WHITE, "center");
		startText.scrollFactor.set();
		add(startText);

		/*
			highestScoreText = new FlxText(0, 100, FlxG.width, "Highest Score: 0");
			highestScoreText.setFormat(null, 32, FlxColor.WHITE, "center");
			highestScoreText.scrollFactor.set();
			add(highestScoreText);
		 */
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		// _highestScore = playState.highestScore;
		// highestScoreText.text = "Highest Score: " + _highestScore;
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new PlayState());
		}
	}
}
