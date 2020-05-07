//치센셜 tpacancel//
//Made by Chickiyeah//
IF $isop || $haspermission:"chissentials.tpacancel" || $haspermission:"chissentials.admin" || $haspermission:"chissentials.user"
	IF {"tpa"+$playername} == "true"
		{"tpacancel"+$playername} = "true"
	ELSE
		player($playername).sendMessage(color("&6&l치센셜 &f&l: &4&l취소할 TPA요청이 없습니다"))
	ENDIF
ELSE
	#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF