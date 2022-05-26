package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

class Turret extends FlxSprite
{
	var reloadTimer:Float = 0;
	var bulletGroup:FlxGroup;
	var spread:Int = 45;

	public function new(_angle, X, Y, _bulletGroup)
	{
		super(X, Y);
		angle = _angle;
		bulletGroup = _bulletGroup;
		loadGraphic("assets/images/turret.png", false);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		reloadTimer += FlxG.elapsed;
		if (reloadTimer > 2)
		{
			reloadTimer = 0;
			bulletGroup.add(new Bullet(angle, getMidpoint().x, getMidpoint().y));
			bulletGroup.add(new Bullet(angle - spread, getMidpoint().x, getMidpoint().y));
			bulletGroup.add(new Bullet(angle + spread, getMidpoint().x, getMidpoint().y));
			FlxG.sound.play("assets/sounds/bullet_whizzing_by-Mike_Koenig-2005433595.wav");
		}
	}
}
