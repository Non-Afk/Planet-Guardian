package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class Bullet extends FlxSprite
{
    //set up the bullets
	var speed:Float = 50;

	public function new(_angle, X, Y)
	{
		super(X, Y);

		makeGraphic(4, 8, FlxColor.WHITE);

		angle = _angle;

		var vx = Math.cos((angle - 90) * (Math.PI / 180)) * speed;
		var vy = Math.sin((angle - 90) * (Math.PI / 180)) * speed;
		velocity.set(vx, vy);

		new FlxTimer().start(5, function(timer)
		{
			kill();
		});
	}
}
