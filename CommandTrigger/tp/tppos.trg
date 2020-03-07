//치센셜 tppos//
//Made by Chickiyeah//
IF $isop || $haspermission:chissentials.tppos || $haspermission:chissentials.admin
	IF args.length == 0
		#MESSAGE "&l명령어 : &f/tppos <x> <y> <z> [world] [yaw] [pitch]"
	ELSE
		IF args.length == 3
			IF $isnumber:args[0] && $isnumber:args[1] && $isnumber:args[2]
				world = player.getLocation().getWorld().getName().toString()
				x = parseInt(args[0])
				y = parseInt(args[1])
				z = parseInt(args[2])
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && $isnumber:args[1] && $isnumber:args[2]
				world = player.getLocation().getWorld().getName().toString()
				x = player.getLocation().getX()
				y = parseInt(args[1])
				z = parseInt(args[2])
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[1] == "~" && $isnumber:args[0] && $isnumber:args[2]
				world = player.getLocation().getWorld().getName().toString()
				x = parseInt(args[0])
				y = player.getLocation().getY()
				z = parseInt(args[2])
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[2] == "~" && $isnumber:args[0] && $isnumber:args[1]
				world = player.getLocation().getWorld().getName().toString()
				x = parseInt(args[0])
				y = parseInt(args[1])
				z = player.getLocation().getZ()
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && args[1] == "~" && $isnumber:args[2]
				world = player.getLocation().getWorld().getName().toString()
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = parseInt(args[2])
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))	
			ELSEIF args[0] == "~" && args[2] == "~" && $isnumber:args[1]
				world = player.getLocation().getWorld().getName().toString()
				x = player.getLocation().getX()
				y = parseInt(args[1])
				z = player.getLocation().getZ()
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))		
			ELSEIF $isnumber:args[0] && args[1] == "~" && args[2] == "~"
				world = player.getLocation().getWorld().getName().toString()
				x = parseInt(args[0])
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && args[1] == "~" && args[2] == "~"
				world = player.getLocation().getWorld().getName().toString()
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ENDIF
		ELSEIF args.length == 4
			IF $isnumber:args[0] && $isnumber:args[1] && $isnumber:args[2]
				world = args[3]
				x = parseInt(args[0])
				y = parseInt(args[1])
				z = parseInt(args[2])
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && $isnumber:args[1] && $isnumber:args[2]
				world = args[3]
				x = player.getLocation().getX()
				y = parseInt(args[1])
				z = parseInt(args[2])
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[1] == "~" && $isnumber:args[0] && $isnumber:args[2]
				world = args[3]
				x = parseInt(args[0])
				y = player.getLocation().getY()
				z = parseInt(args[2])
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[2] == "~" && $isnumber:args[0] && $isnumber:args[1]
				world = args[3]
				x = parseInt(args[0])
				y = parseInt(args[1])
				z = player.getLocation().getZ()
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && args[1] == "~" && $isnumber:args[2]
				world = args[3]
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = parseInt(args[2])
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))	
			ELSEIF args[0] == "~" && args[2] == "~" && $isnumber:args[1]
				world = args[3]
				x = player.getLocation().getX()
				y = parseInt(args[1])
				z = player.getLocation().getZ()
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))		
			ELSEIF $isnumber:args[0] && args[1] == "~" && args[2] == "~"
				world = args[3]
				x = parseInt(args[0])
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && args[1] == "~" && args[2] == "~"
				world = args[3]
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ENDIF
		ELSEIF args.length == 5
			IF $isnumber:args[0] && $isnumber:args[1] && $isnumber:args[2] && $isnumber:args[4]
				world = args[3]
				x = parseInt(args[0])
				y = parseInt(args[1])
				z = parseInt(args[2])
				yaw = parseInt(args[4])
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && $isnumber:args[1] && $isnumber:args[2] && $isnumber:args[4]
				world = args[3]
				x = player.getLocation().getX()
				y = parseInt(args[1])
				z = parseInt(args[2])
				yaw = parseInt(args[4])
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[1] == "~" && $isnumber:args[0] && $isnumber:args[2] && $isnumber:args[4]
				world = args[3]
				x = parseInt(args[0])
				y = player.getLocation().getY()
				z = parseInt(args[2])
				yaw = parseInt(args[4])
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[2] == "~" && $isnumber:args[0] && $isnumber:args[1] && $isnumber:args[4]
				world = args[3]
				x = parseInt(args[0])
				y = parseInt(args[1])
				z = player.getLocation().getZ()
				yaw = parseInt(args[4])
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && args[1] == "~" && $isnumber:args[2] && $isnumber:args[4]
				world = args[3]
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = parseInt(args[2])
				yaw = parseInt(args[4])
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))	
			ELSEIF args[0] == "~" && args[2] == "~" && $isnumber:args[1] && $isnumber:args[4]
				world = args[3]
				x = player.getLocation().getX()
				y = parseInt(args[1])
				z = player.getLocation().getZ()
				yaw = parseInt(args[4])
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))		
			ELSEIF $isnumber:args[0] && args[1] == "~" && args[2] == "~" && $isnumber:args[4]
				world = args[3]
				x = parseInt(args[0])
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = parseInt(args[4])
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && args[1] == "~" && args[2] == "~" && $isnumber:args[4]
				world = args[3]
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = parseInt(args[4])
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && args[1] == "~" && args[2] == "~" && args[4] == "~"
				world = args[3]
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))				
			ENDIF
		ELSEIF args.length == 6
			IF $isnumber:args[0] && $isnumber:args[1] && $isnumber:args[2] && $isnumber:args[4] && $isnumber:args[5] 
				world = args[3]
				x = parseInt(args[0])
				y = parseInt(args[1])
				z = parseInt(args[2])
				yaw = parseInt(args[4])
				pitch = parseInt(args[5])
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && $isnumber:args[1] && $isnumber:args[2] && $isnumber:args[4] && $isnumber:args[5] 
				world = args[3]
				x = player.getLocation().getX()
				y = parseInt(args[1])
				z = parseInt(args[2])
				yaw = parseInt(args[4])
				pitch = parseInt(args[5])
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[1] == "~" && $isnumber:args[0] && $isnumber:args[2] && $isnumber:args[4] && $isnumber:args[5] 
				world = args[3]
				x = parseInt(args[0])
				y = player.getLocation().getY()
				z = parseInt(args[2])
				yaw = parseInt(args[4])
				pitch = parseInt(args[5])
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[2] == "~" && $isnumber:args[0] && $isnumber:args[1] && $isnumber:args[4] && $isnumber:args[5] 
				world = args[3]
				x = parseInt(args[0])
				y = parseInt(args[1])
				z = player.getLocation().getZ()
				yaw = parseInt(args[4])
				pitch = parseInt(args[5])
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && args[1] == "~" && $isnumber:args[2] && $isnumber:args[4] && $isnumber:args[5] 
				world = args[3]
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = parseInt(args[2])
				yaw = parseInt(args[4])
				pitch = parseInt(args[5])
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))	
			ELSEIF args[0] == "~" && args[2] == "~" && $isnumber:args[1] && $isnumber:args[4] && $isnumber:args[5] 
				world = args[3]
				x = player.getLocation().getX()
				y = parseInt(args[1])
				z = player.getLocation().getZ()
				yaw = parseInt(args[4])
				pitch = parseInt(args[5])
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))		
			ELSEIF $isnumber:args[0] && args[1] == "~" && args[2] == "~" && $isnumber:args[4] && $isnumber:args[5] 
				world = args[3]
				x = parseInt(args[0])
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = parseInt(args[4])
				pitch = parseInt(args[5])
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && args[1] == "~" && args[2] == "~" && $isnumber:args[4] && $isnumber:args[5] 
				world = args[3]
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = parseInt(args[4])
				pitch = parseInt(args[5])
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))
			ELSEIF args[0] == "~" && args[1] == "~" && args[2] == "~" && args[4] == "~" && $isnumber:args[5] 
				world = args[3]
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = parseInt(args[4])
				pitch = parseInt(args[5])
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))				
			ELSEIF args[0] == "~" && args[1] == "~" && args[2] == "~" && args[4] == "~" && args[5] == "~"
				world = args[3]
				x = player.getLocation().getX()
				y = player.getLocation().getY()
				z = player.getLocation().getZ()
				yaw = player.getLocation().getYaw()
				pitch = player.getLocation().getPitch()
				SYNC
				player.teleport(location(world, x, y, z, yaw, pitch))
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f: &1X = "+x+" &a&lY = "+y+" &d&lZ = "+z+"&f 로 이동했습니다!"))				
			ENDIF
		ENDIF
	ENDIF
ELSE
	#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF