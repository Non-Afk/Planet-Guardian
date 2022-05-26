package;

import flixel.FlxSprite;

class Planet extends FlxSprite
{
	//set up the planet
	public var planetRadius = 100;

	public function new(X, Y)
	{
		super(X, Y);

		loadGraphic("assets/images/ground.png");
	}
}
