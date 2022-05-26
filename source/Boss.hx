package;

import Planet;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxAngle;

class Boss extends FlxSprite
{
	var angleFromPlanet:Float;
	var planet:Planet;
	var speed:Float = 30;
	var distanceFromGround:Float = 300;
	var onTouchGround:Void->Void;

	public function new(_angle, _planet, onTouchMethod)
	{
		super(0, 0);
		onTouchGround = onTouchMethod;
		angleFromPlanet = _angle;
		planet = _planet;

		// load boss image
		// makeGraphic(16, 16, FlxColor.WHITE);
		loadGraphic("assets/images/bossMovement.png", true, 32, 32);

		animation.add("Move", [0, 1, 2, 3], 10, false);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		animation.play("Move");

		distanceFromGround -= FlxG.elapsed * speed;
		if (distanceFromGround < 1)
		{
			onTouchGround();
			kill();
		}
		calculatePosition();
	}

	// set position
	function calculatePosition()
	{
		// make player move by a circle
		x = Math.cos(angleFromPlanet - 90 * Math.PI / 180) * (planet.planetRadius + distanceFromGround + 8) + planet.getMidpoint().x - 8;
		y = Math.sin(angleFromPlanet - 90 * Math.PI / 180) * (planet.planetRadius + distanceFromGround + 8) + planet.getMidpoint().y - 8;

		angle = FlxAngle.angleBetween(planet, this, true) + 90;
	}
}
