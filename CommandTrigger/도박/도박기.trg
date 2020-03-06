IF {"DOBAKGO"+$playername} != "true"
#STOP
ELSE
{"DOBAKNUM"+$playername} = 1
WHILE true
	IF {"DOBAKGO"+$playername} == "true"
		b = $random:1:50
		IF {"DOBAKNUM"+$playername} >= {"DO최대숫자"}
		{"DOBAKNUM"+$playername} = 1
		ELSE
		{"DOBAKNUM"+$playername} = {"DOBAKNUM"+$playername} + b
		player($playername).sendTitle("설정하신 숫자 : "+{"DO"+$playername+"번"},"/도박 선택으로 멈추세요!")
		ENDIF
	ELSE
	#STOP
	ENDIF
ENDWHILE
ENDIF