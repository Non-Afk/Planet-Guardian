package;

import Planet;
import Player;
import Turret;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	private var background:FlxSprite;
	var planet:Planet;
	var player:Player;

	var reloadTimer:Float = 0;

	var enemyGroup:FlxGroup = new FlxGroup();
	var bossGroup:FlxGroup = new FlxGroup();
	var bulletGroup:FlxGroup = new FlxGroup();
	var turretGroup:FlxGroup = new FlxGroup();

	var moneyText:FlxText;
	var healthText:FlxText;
	var turretText:FlxText;
	var scoreText:FlxText;
	var highestScoreText:FlxText;

	var lives:Int = 5;
	var money:Int = 0;
	var turretCost:Int = 10;
	var score:Int = 0;
	var comScore:Int = 10;
	var enemyHe:Int = 5;

	// var highestScore:Int;
	var creatEnemySpeed:Float = 4;
	var creatBossSpeed:Float = 10;

	override public function create()
	{
		super.create();
		// play BGM
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(AssetPaths.BGM__wav, 0.6, true);
		}
		// build world
		add(bulletGroup);
		add(turretGroup);

		planet = new Planet((FlxG.width / 2) - 100, (FlxG.height / 2) - 100);
		add(planet);

		add(enemyGroup);
		add(bossGroup);

		player = new Player(0, planet);
		add(player);

		// how how much money
		moneyText = new FlxText(0, 0, FlxG.width, "$0  Turret Cost: $10");
		moneyText.setFormat(null, 16, FlxColor.YELLOW);
		moneyText.scrollFactor.set();
		add(moneyText);
		// show health
		healthText = new FlxText(0, 0, FlxG.width, "Health: 5/5");
		healthText.setFormat(null, 16, FlxColor.GREEN, "right");
		healthText.scrollFactor.set();
		add(healthText);
		// show score
		scoreText = new FlxText(0, 0, FlxG.width, "SCORE: 0");
		scoreText.setFormat(null, 16, FlxColor.WHITE, "center");
		scoreText.scrollFactor.set();
		add(scoreText);

		// highestScoreText = new FlxText(0, FlxG.height - 16, "Highest SCORE: 0");
		// highestScoreText.setFormat(null, 16, FlxColor.WHITE, "right");
		// highestScoreText.scrollFactor.set();
		// add(highestScoreText);

		// add enemy
		new FlxTimer().start(creatEnemySpeed, createEnemy, 0);
		new FlxTimer().start(creatBossSpeed, createBoss, 0);

		FlxG.worldBounds.setSize(1000, 1000);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		// build turret
		if (FlxG.keys.justPressed.SHIFT)
		{
			createTurret();
		}
		reloadTimer += FlxG.elapsed;

		// shoot
		var shootKey = FlxG.keys.anyPressed(["SPACE", "UP", "W"]);
		if (shootKey)
		{
			if (reloadTimer > 0.2)
			{
				reloadTimer = 0;
				bulletGroup.add(new Bullet(player.angle, player.getMidpoint().x, player.getMidpoint().y));
				FlxG.sound.play("assets/sounds/Laser-SoundBible.com-602495617.wav");
			}
		}

		// killed enemy
		FlxG.overlap(enemyGroup, bulletGroup, function(e, b)
		{
			money += 1;
			e.kill();
			b.kill();
			FlxG.sound.play("assets/sounds/air_explosion.wav");
			score++;
		});
		FlxG.overlap(bossGroup, bulletGroup, function(boss, bullet)
		{
			if (enemyHe == 0)
			{
				money += 3;
				bullet.kill();
				boss.kill();
				enemyHe = 5;
				FlxG.sound.play("assets/sounds/air_explosion.wav");
				score += 2;
			}
			else
			{
				bullet.kill();
				enemyHe -= 1;
			}
		});

		showInfo();
		levelUp();
	}

	// create enemy and boss
	function createEnemy(timer)
	{
		enemyGroup.add(new Enemy(FlxG.random.int(1, 360), planet, onTouchGround));
	}

	function createBoss(timer)
	{
		bossGroup.add(new Boss(FlxG.random.int(1, 360), planet, _onTouchGround));
	}

	// when enemy hit the planet
	function onTouchGround()
	{
		lives--;
		FlxG.sound.play("assets/sounds/explosion.wav");
		checkLives();
	}

	function _onTouchGround()
	{
		lives -= 2;
		FlxG.sound.play("assets/sounds/explosion.wav");
		checkLives();
	}

	// build turret
	function createTurret()
	{
		if (money >= turretCost)
		{
			money -= turretCost;
			turretGroup.add(new Turret(player.angle, player.x, player.y, bulletGroup));
			turretCost += 5;
		}                                              
	}

	// check the health
	function checkLives()
	{
		if (lives == 0)
		{
			// if (score > highestScore)
			// {
			//	highestScore = score;
			// }
			FlxG.switchState(new MenuState());
		}
	}

	// show the information (health,money,and scorw)
	function showInfo()
	{
		healthText.text = "Health: " + lives + "/5";
		moneyText.text = "$" + money + " Turret Cost: $" + turretCost;
		if (lives >= 4)
		{
			healthText.color = FlxColor.GREEN;
		}
		else if (lives <= 2)
		{
			healthText.color = FlxColor.RED;
		}
		else
		{
			healthText.color = FlxColor.YELLOW;
		}
		scoreText.text = "SCORE: " + score;
		// highestScoreText.text = "Highest Score: " + highestScore;
	}

	// set more difficult
	function levelUp()
	{
		if (score == comScore)
		{
			creatBossSpeed * 0.8;
			creatEnemySpeed * 0.8;
			comScore += 10;
		}
	}
}
