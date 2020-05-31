//치센셜 setworldspawn//
//Made by Chickiyeah//
import org.bukkit.World
IF $isop || $haspermission:"chissentials.setworldspawn" || $haspermission:"chissentials.admin"
	IF args.length == 0
		loc = player.getLocation()
		world = player.getLocation().getWorld()
		worldstr = player.getLocation().getWorld().getName().toString()
		{world+"x"} = player.getLocation().getX()
		{world+"y"} = player.getLocation().getY()
		{world+"z"} = player.getLocation().getZ()
		{world+"yaw"} = player.getLocation().getYaw()
		{world+"pitch"} = player.getLocation().getPitch()
		{world+"setworldspawn"} = "true"
		SYNC
			world.setSpawnLocation(loc)
		ENDSYNC
		#MESSAGE "&6&l치센셜 &f: "+worldstr+"의 스폰지점을 x = "+{world+"x"}+" y = "+{world+"y"}+" z = "+{world+"z"}+" yaw = "+{world+"yaw"}+" pitch = "+{world+"pitch"}+" 로 지정했습니다"
	ELSE
	ENDIF
ELSE
	#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF