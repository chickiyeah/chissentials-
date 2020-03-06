IF $isop || $haspermission:chissentials.tp || $haspermission:chissentials.admin
IF args.length == 0
	player.sendMessage(color("&f&l도움말 &f: /tp <닉네임> <다른닉네임>"))
ELSE
	IF args.length == 2
		SYNC
			player(args[0]).teleport(player(args[1]).getLocation())
		ENDSYNC
			player.sendMessage(color("&6&l치센셜 &f&l: &e&l"+args[0]+"&f님을 &a&l"+args[1]+"&f님에게 이동시켰습니다."))
	ELSE
		SYNC
			player.teleport(player(args[0]).getLocation())
		ENDSYNC
			player.sendMessage(color("&6&l치센셜 &f&l: &a&l"+args[0]+"&f님에게 이동했습니다."))
	ENDIF
ENDIF
ELSE
	player.sendMessage(color("&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."))
ENDIF