//치센셜 world//
//Made by Chickiyeah//
IF $isop || $haspermission:chissentials.world || $haspermission:chissentials.admin
	IF args.length == 0
		#MESSAGE "&l명령어 : &f/world <월드> [x] [y] [z]"
	ELSEIF args.length == 1
		IF {args[0]+"setworldspawn"} == "true"
			x = {args[0]+"x"}
			y = {args[0]+"y"}
			z = {args[0]+"z"}
			yaw = {args[0]+"yaw"}
			pitch = {args[0]+"pitch"}
			SYNC
			player.teleport(location(args[0], x, y, z, yaw, pitch))
			ENDSYNC
		ELSE
			SYNC
			player.teleport(location(args[0], 12, 64, 81))
			ENDSYNC
		ENDIF
	ELSEIF args.length == 2
		IF $isnumber:args[1]
			SYNC
			player.teleport(location(args[0], parseInt(args[1]), 64, 81))
			ENDSYNC
		ELSE
			#MESSAGE "&6&l치센셜 &f&l: &4&l좌표는 숫자만 입력해야합니다."
		ENDIF
	ELSEIF args.length == 3
		IF $isnumber:args[1] && $isnumber:args[2]
			SYNC
			player.teleport(location(args[0], parseInt(args[1]), parseInt(args[2]), 81))
			ENDSYNC
		ELSE
			#MESSAGE "&6&l치센셜 &f&l: &4&l좌표는 숫자만 입력해야합니다."
		ENDIF
	ELSEIF args.length == 4
		IF $isnumber:args[1] && $isnumber:args[2] && $isnumber:args[3]
			SYNC
			player.teleport(location(args[0], parseInt(args[1]), parseInt(args[2]), parseInt(args[3])))
			ENDSYNC
		ELSE
			#MESSAGE "&6&l치센셜 &f&l: &4&l좌표는 숫자만 입력해야합니다."
		ENDIF
	ELSEIF args.length == 5
		IF $isnumber:args[1] && $isnumber:args[2] && $isnumber:args[3] && $isnumber:args[4]
			SYNC
			player.teleport(location(args[0], parseInt(args[1]), parseInt(args[2]), parseInt(args[3]), parseInt(args[4])))
			ENDSYNC
		ELSE
			#MESSAGE "&6&l치센셜 &f&l: &4&l좌표는 숫자만 입력해야합니다."
		ENDIF
	ELSEIF args.length == 6
		IF $isnumber:args[1] && $isnumber:args[2] && $isnumber:args[3] && $isnumber:args[4] && $isnumber:args[5]
			SYNC
			player.teleport(location(args[0], parseInt(args[1]), parseInt(args[2]), parseInt(args[3]), parseInt(args[4]), parseInt(args[5])))
			ENDSYNC
		ELSE
			#MESSAGE "&6&l치센셜 &f&l: &4&l좌표는 숫자만 입력해야합니다."
		ENDIF
	ELSE
	ENDIF
ELSE
#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF