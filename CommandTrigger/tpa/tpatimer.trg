i=0
WHILE true
i=i+1
#WAIT 1
	IF {"tpacancel"+args[1]} != "true" || {"tpacancel"+args[0]} != "true"
		IF {"tpyes"+args[0]} != "true" || {"tpyes"+args[1]} != "true"
			IF {"tpno"+args[0]} != "true" || {"tpno"+args[1]} != "true"
				IF {"tpaccept"+args[0]} != "true" || {"tpaccept"+args[1]} != "true"
					IF {"tpdeny"+args[0]} != "true" || {"tpdeny"+args[1]} != "true"
						IF i == 60
							player(args[0]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청 만료까지 &e&l60초&f남았습니다."))
						ELSE
							IF i == 120
								player(args[1]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청이 &4&l만료&f되었습니다."))
								{"tpa"+args[0]} = null
								#STOP
							ELSE
							ENDIF
						ENDIF					
					ELSE
						player(args[0]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청이 &4&l거절&f처리 되었습니다."))
						player(args[1]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청이 &4&l거절&f처리 되었습니다."))
						{"tpdeny"+args[0]} = null
						{"tpa"+args[0]} = null
						#STOP
					ENDIF
				ELSE
					player(args[0]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청이 &a&l수락&f처리 되었습니다."))
					player(args[1]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청이 &a&l수락&f처리 되었습니다."))
					player(args[1]).teleport(player(args[0]).getLocation())
					{"tpaccept"+args[0]} = null
					{"tpa"+args[0]} = null
					#STOP
				ENDIF
			ELSE
				player(args[0]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청이 &4&l거절&f처리 되었습니다."))
				player(args[1]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청이 &4&l거절&f처리 되었습니다."))
				{"tpno"+args[0]} = null
				{"tpa"+args[0]} = null
				#STOP
			ENDIF
		ELSE
			player(args[0]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청이 &a&l수락&f처리 되었습니다."))
			player(args[1]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청이 &a&l수락&f처리 되었습니다."))
			player(args[1]).teleport(player(args[0]).getLocation())
			{"tpyes"+args[0]} = null
			{"tpa"+args[0]} = null
			#STOP
		ENDIF
	ELSE
		player(args[0]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청이 &4&l취소&f되었습니다."))
		player(args[1]).sendMessage(color("&6&l치센셜 &f: 텔레포트 요청을 &4&l취소&f했습니다."))
		{"tpacancel"+args[1]} = null
		{"tpa"+args[0]} = null
		#STOP
	ENDIF
ENDWHILE