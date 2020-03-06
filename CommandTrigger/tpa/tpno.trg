//치센셜 tpno//
//Made by Chickiyeah//
IF $isop || $haspermission:chissentials.tpno || $haspermission:chissentials.admin
IF {"tpa"+$playername} == "true"
	{"tpno"+$playername} = "true"
ELSE
	player($playername).sendMessage(color("&6&l치센셜 &f&l: &4&l대기중인 TPA요청이 없습니다"))
ENDIF
ELSE
	#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF