package;

import Planet;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxAngle;

class Player extends FlxSprite
{
	var angleFromPlanet:Float;
	var planet:Planet;
	var speed:Float = 3;

	public function new(_angle, _planet)
	{
		super(0, 0);

		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);

		angleFromPlanet = _angle;
		planet = _planet;
		// load player image
		loadGraphic("assets/images/playerMovement.png", true, 16, 16);
		// add animation
		animation.add("Idle", [0], 1, false);
		animation.add("Move", [1, 2], 10, false);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		// player's movementcontrol
		var leftKey = FlxG.keys.anyPressed(["LEFT", "A"]);
		var rightKey = FlxG.keys.anyPressed(["RIGHT", "D"]);

		if (leftKey) // move to left
		{
			angleFromPlanet -= FlxG.elapsed * speed;
			animation.play("Move");
			facing = FlxObject.LEFT;
		}
		else if (rightKey) // move to right
		{
			angleFromPlanet += FlxG.elapsed * speed;
			animation.play("Move");
			facing = FlxObject.RIGHT;
		}
		else // play animation when play stand
		{
			animation.play("Idle");
		}

		calculatePosition();
	}

	function calculatePosition()
	{
		// make player move by a circle
		x = Math.cos(angleFromPlanet - 90 * Math.PI / 180) * (planet.planetRadius + 4) + planet.getMidpoint().x - 8;
		y = Math.sin(angleFromPlanet - 90 * Math.PI / 180) * (planet.planetRadius + 4) + planet.getMidpoint().y - 8;

		angle = FlxAngle.angleBetween(planet, this, true) + 90;
	}
}
