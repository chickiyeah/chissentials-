//Made By chickiyeah//
//Version : 1.0.0//
//lang : KR//

IF {"DO처음로드"} != "FALSE"
	{"DO최소숫자번"} = 3
	{"DO최소숫자+2~49번"} = 2
	{"DO최소숫대+50~최대숫자번"} = 1
	{"DO이름"} = "&6&l도박&f :"
	{"DO상태"} = "비활성화"
	{"DO최대금액"} = "-1"
	{"DO최소금액"} = parseInt("1000")
	{"DO성공"} = "도박을 성공하셨습니다"
	{"DO실패"} = "도박을 실패하셨습니다"
	{"DO최소숫자"} = 1
	{"DO최대숫자"} = 100
	#BROADCAST {"DO이름"} + "초기 설정 : 이름 = "+{"DO이름"}+"최소숫자 배율 = "+{"DO최소숫자번"}+"배 최소숫자+1~49번 배율 = "+{"DO최소숫자+2~49번"}+"배 최소숫자+50~최대숫자 배율 = "+{"DO최소숫대+50~최대숫자번"}+"배 도박 최소금액 : "+{"DO최소금액"}+"원 도박 최대금액 : 무제한"
	#BROADCAST {"DO이름"} + "메시지 기본상태 : 성공시 : "+{"DO성공"}+" 실패시 : "+{"DO실패"}+" 추첨 최소 숫자 : "+{"DO최소숫자"}+"번 추첨 최대 숫자 : "+{"DO최대숫자"}+"번"
	#BROADCAST "도박이 처음에는 비활성화 되어있습니다 &6&l/도박 활성화&f로 활성화 시키셔야 합니다! chidobak.admin 퍼미션이 필요합니다."
	{"DO처음로드"} = "FALSE"
	#STOP
ELSE
ENDIF


IF args.length == 0
	#MESSAGE "====== 도박 ======"
	#MESSAGE {"DO이름"}+" /도박 시작 <번호> <금액> - 도박을 시작합니다."
	#MESSAGE {"DO이름"}+" 도박 &a&l범위 배율 정보&f = 최소숫자 배율 = "+{"DO최소숫자번"}+"배 최소숫자+1~49번 배율 = "+{"DO최소숫자+2~49번"}+"배 최소숫자+50~최대숫자 배율 = "+{"DO최소숫대+50~최대숫자번"}+"배"
	IF $haspermission:"chidobak.manager" || $haspermission:"chidobak.admin"
		#MESSAGE "====== &6&l관리자 명령어 &f======"
		#MESSAGE {"DO이름"}+" /도박 배율설정 <번호> <배율(숫자만 입력)>"
		#MESSAGE {"DO이름"}+" /도박 범위배율설정 <최소번호/최소번호+2~49/최소번호+50~최대번호> <배율>"
		#MESSAGE {"DO이름"}+" 번호마다 각각 설정도 가능합니다. 각각 설정후 다시 범위의 배율을 기본값으로 되돌리려면 -1을 입력하세요."
		#MESSAGE {"DO이름"}+" /도박 최소번호 <숫자> - 최소번호를 설정합니다."
		#MESSAGE {"DO이름"}+" /도박 최대번호 <숫자> - 최대번호를 설정합니다."
		#MESSAGE {"DO이름"}+" /도박 최소금액 <금액> - 최소배팅금액을 설정합니다."
		#MESSAGE {"DO이름"}+" /도박 최대금액 <금액> - 최대배팅금액을 설정합니다."
		IF $haspermission:"chidobak.admin"
			#MESSAGE {"DO이름"}+" /도박 <활성화/비활성화>"
			#MESSAGE {"DO이름"}+" 도박을 활성화 하거나 비활성화합니다."
			#MESSAGE {"DO이름"}+" /도박 이름설정 <새이름> - 도박 이름(" + {"DO이름"} + ")을 수정합니다." 
			#MESSAGE {"DO이름"}+" /도박 성공메시지 <새로운메시지> - 도박 성공시 나오는 메시지를 설정합니다."
			#MESSAGE {"DO이름"}+" /도박 실패메시지 <새로운메시지> - 도박 실패시 나오는 메시지를 설정합니다."
		ELSE
		ENDIF
	ELSE
	ENDIF
ELSE
		money = $money
		IF args[0] == "시작"
		IF {"DO상태"} == "활성화"
		IF args.length == 3
		IF $isnumber:args[1] && $isnumber:args[2]
		IF {"DOBAKGO"+$playername} == "true"
		#MESSAGE {"DO이름"}+" &4&l이미 도박을 하는중입니다"
		ELSE
			IF parseInt(args[1]) < {"DO최소숫자"}
			#MESSAGE {"DO이름"}+" 번호는 "+{"DO최소숫자"}+"번 이하로 지정할 수 없습니다!"
			ELSE
			IF parseInt(args[1]) > {"DO최대숫자"}
			#MESSAGE {"DO이름"}+" 번호는 "+{"DO최대숫자"}+"번 이상으로 지정할 수 없습니다!"
			ELSE
			IF parseInt(args[2]) < {"DO최소금액"}
				#MESSAGE {"DO이름"}+" 배팅금액을 최소금액("+{"DO최소금액"}+")원 이하로 배팅할 수 없습니다."
			ELSE
			IF {"DO최대금액"} != "-1"
			IF parseInt(args[2]) < {"DO최대금액"}
				#MESSAGE {"DO이름"}+" 배팅금액을 최대금액("+{"DO최대금액"}+")원 이상로 배팅할 수 없습니다."
			ELSE
			#STOP
			ENDIF
			ELSE
			ENDIF
			ELSE			
			IF parseInt(args[2]) >= {"DO최소금액"} && parseInt(args[2]) <= money
			IF args.length == 3
			money = parseInt(args[2])
			#MONEY -money//이 자리에 자신의 돈 플러그인의 돈 뺏는 명령어를 입력하세요 예시 : #CMDCON "eco take "+$playername+" "+money//
			{"DO"+$playername+"원"} = args[2]
			{"DO"+$playername+"번"} = args[1]
			#MESSAGE {"DO이름"}+" "+{"DO"+$playername+"번"} + "번에 "+{"DO"+$playername+"원"}+"원을 배팅하셨습니다."
			{"DOBAKGO"+$playername} = "true"
			#CMDOP "도박기 "+$playername
			ELSE
			#MESSAGE {"DO이름"}+" 올바르지 않은 명령어 입니다."
			ENDIF
			ELSE
			#MESSAGE {"DO이름"}+" 돈이 부족하거나 최소 금액 이하입니다"
			#MESSAGE {"DO이름"}+" 현재 최소금액 : "+{"DO최소금액"}+"원"
			ENDIF
			ENDIF
			ENDIF
		ENDIF
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+"&4&l 숫자가 아닌것은 번호로 지정할 수 없습니다!"
		ENDIF
		ELSE
			#MESSAGE {"DO이름"}+" 올바르지 않은 명령어 입니다."
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+" 도박이 비활성화 되어있습니다 서버 어드민에게 활성화를 요청하세요."
		ENDIF
		ELSE		
		ENDIF
		
		IF args[0] == "선택"
			IF {"DOBAKGO"+$playername} != "true"
			ELSE
			{"DOBAKGO"+$playername} = "false"
			IF {"DOBAKNUM"+$playername} >= {"DO최대숫자"}+1
			{"DOBAKNUM"+$playername} = $random:{"DO최소숫자"}:{"DO최대숫자"}+1
			ELSE
			ENDIF
			#MESSAGE {"DO이름"}+" 추첨 결과 : "+{"DOBAKNUM"+$playername}
			IF parseInt({"DO"+$playername+"번"}) == {"DOBAKNUM"+$playername}
			num = {"DOBAKNUM"+$playername}
			IF {"DO"+num+"번"} == null
			money = parseInt({"DO"+$playername+"원"})
				IF {"DOBAKNUM"+$playername} == {"DO최소숫자"}
					money = money*{"DO최소숫자번"}
					#MONEY money//이 자리에 자신의 돈 플러그인의 돈 주는 명령어를 입력하세요 예시 : #CMDCON "eco give "+$playername+" "+money//
					#MESSAGE {"DO이름"}+" "+{"DO성공"}
				ELSE
				ENDIF
				
				IF {"DOBAKNUM"+$playername} >= {"DO최소숫자"}+1 && {"DOBAKNUM"+$playername} <= {"DO최소숫자"}+49
					money = money*{"DO최소숫자+2~49번"}
					#MONEY money//이 자리에 자신의 돈 플러그인의 돈 주는 명령어를 입력하세요 예시 : #CMDCON "eco give "+$playername+" "+money//
					#MESSAGE {"DO이름"}+" "+{"DO성공"}
				ELSE
				ENDIF
				
				IF {"DOBAKNUM"+$playername} >= {"DO최소숫자"}+50 && {"DOBAKNUM"+$playername} <= {"DO최대숫자"}
					money = money*{"DO최소숫대+50~최대숫자번"}
					#MONEY money//이 자리에 자신의 돈 플러그인의 돈 주는 명령어를 입력하세요 예시 : #CMDCON "eco give "+$playername+" "+money//
					#MESSAGE {"DO이름"}+" "+{"DO성공"}
				ELSE
				ENDIF				
				
			ELSE
				IF {"DOBAKNUM"+$playername} == parseInt({"DO"+$playername+"번"})
					money = money*parseInt({"DO"+num+"번"})
					#MONEY money//이 자리에 자신의 돈 플러그인의 돈 주는 명령어를 입력하세요 예시 : #CMDCON "eco give "+$playername+" "+money//
					#MESSAGE {"DO이름"}+" "+{"DO성공"}
				ELSE
				ENDIF
			ENDIF
			ELSE
			#MESSAGE {"DO이름"}+" "+{"DO실패"}
			ENDIF
			ENDIF
		ELSE
		ENDIF
		IF args[0] == "활성화"
			IF $haspermission:"chidobak.admin"
				IF {"DO상태"} == "활성화"
				#MESSAGE {"DO이름"}+" &4&l도박이 이미 활성화 되어있습니다."
				#STOP
				ELSE
				{"DO상태"} = "활성화"
				#MESSAGE {"DO이름"}+" 도박을 활성화했습니다."
				#STOP
				ENDIF
			ELSE
			#MESSAGE {"DO이름"}+"&4&l 이 명령어를 실행할 수 있는 권한이 없습니다."
			#STOP
			ENDIF
		ELSE
		ENDIF

		IF args[0] == "비활성화"
			IF $haspermission:"chidobak.admin"
				IF {"DO상태"} == "비활성화"
				#MESSAGE {"DO이름"}+"&4&l 도박이 이미 비활성화 되어있습니다."
				#STOP
				ELSE
				{"DO상태"} = "비활성화"
				#MESSAGE {"DO이름"}+" 도박을 비활성화했습니다."
				#STOP
				ENDIF
			ELSE
			#MESSAGE {"DO이름"}+"&4&l 이 명령어를 실행할 수 있는 권한이 없습니다."
			#STOP
			ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "배율설정"
		IF $haspermission:"chidobak.manager" || $haspermission:"chidobak.admin"
			IF args.length == 3
			IF $isnumber:args[1] && $isnumber:args[2]
			IF parseInt(args[1]) < 0
				#MESSAGE {"DO이름"}+" &4&l배율을 0미만으론 설정할 수 없습니다."
			ELSE
				IF parseInt(args[1]) < {"DO최소숫자"}
					#MESSAGE {"DO이름"}+" &4&l최소번호 밑으로 배율을 설정할 수 없습니다."
				ELSEIF parseInt(args[1]) > {"DO최대숫자"}
					#MESSAGE {"DO이름"}+" &4&l최대번호 위로 배율을 설정할 수 없습니다."
				ELSE
					num = parseInt(args[1])
					{"DO"+num+"번"} = parseInt(args[2])
					#MESSAGE {"DO이름"}+" "+num+"번의 배율을 "+args[2]+"배로 설정했습니다."
				ENDIF
			ENDIF
			ELSE
				#MESSAGE {"DO이름"}+" &4&l입력값이 올바르지 않습니다 숫자로 번호와 배율을 설정해야합니다"
			ENDIF
			ELSE
				#MESSAGE {"DO이름"}+" &4&l명령어가 올바르지 않습니다."
			ENDIF
		ELSE
		#MESSAGE {"DO이름"}+"&4&l 이 명령어를 실행할 수 있는 권한이 없습니다."
		ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "범위배율설정"
		IF $haspermission:"chidobak.manager" || $haspermission:"chidobak.admin"
			IF args.length == 3
				IF args[1] == "최소번호"
					IF args[2] == "-1"
						{"DO최소숫자번"} = 3
						#MESSAGE {"DO이름"}+" 도박의 최소숫자의 배율을 기본(3배)으로 설정했습니다."
					ELSE
						IF $isnumber:args[1] && $isnumber:args[2]
							{"DO최소숫자번"} = parseInt(args[2])
							#MESSAGE {"DO이름"}+" 최소번호의 배율을 "+args[2]+"배로 설정했습니다."
						ELSE
							#MESSAGE {"DO이름"}+" &4&l입력값이 올바르지 않습니다 숫자로 배율을 설정해야합니다"
						ENDIF
					ENDIF
				ELSEIF args[1] == "최소번호+2~49"
					IF args[2] == "-1"
						{"DO최소숫자+2~49번"} = 2
						#MESSAGE {"DO이름"}+" 도박의 최소숫자의 배율을 기본(2배)으로 설정했습니다."
					ELSE
						IF $isnumber:args[1] && $isnumber:args[2]
							{"DO최소숫자+2~49번"} = parseInt(args[2])
							#MESSAGE {"DO이름"}+" 최소번호+2~49번의 배율을 "+args[2]+"배로 설정했습니다."
						ELSE
							#MESSAGE {"DO이름"}+" &4&l입력값이 올바르지 않습니다 숫자로 배율을 설정해야합니다"
						ENDIF
					ENDIF
				ELSEIF args[1] == "최소번호+50~최대번호"
					IF args[2] == "-1"
						{"DO최소숫대+50~최대숫자번"} = 1
						#MESSAGE {"DO이름"}+" 도박의 최소숫자의 배율을 기본(1배)으로 설정했습니다."
					ELSE
						IF $isnumber:args[1] && $isnumber:args[2]
							{"DO최소숫대+50~최대숫자번"} = parseInt(args[2])
							#MESSAGE {"DO이름"}+" 최소번호+50~최대번호의 배율을 "+args[2]+"배로 설정했습니다."
						ELSE
							#MESSAGE {"DO이름"}+" &4&l입력값이 올바르지 않습니다 숫자로 배율을 설정해야합니다"
						ENDIF
					ENDIF
				ELSE
					#MESSAGE {"DO이름"}+" 범위배율정보를 다시 확인해주세요"
				ENDIF
			ELSE
			ENDIF
		ELSE
		#MESSAGE {"DO이름"}+"&4&l 이 명령어를 실행할 수 있는 권한이 없습니다."
		ENDIF
		ELSE
		ENDIF

		IF args[0] == "최소금액"
		IF $haspermission:"chidobak.manager" || $haspermission:"chidobak.admin"
		IF args.length == 2
		IF $isnumber:args[1]
		IF parseInt(args[1]) < 0
			#MESSAGE {"DO이름"}+"&4&l 도박의 최소금액을 0원 미만으로 설정할 수 없습니다."
		ELSE
			{"DO최소금액"} = parseInt(args[1])
			#MESSAGE {"DO이름"}+" 도박의 최소금액을 "+{"DO최소금액"}+"원으로 설정했습니다."
		ENDIF
		ELSE
			#MESSAGE {"DO이름"}+" &4&l입력값이 올바르지 않습니다 숫자로 최소금액을 설정해야합니다"
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+" 명령어가 올바르지 않습니다."
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+"&4&l 이 명령어를 실행할 수 있는 권한이 없습니다."
		ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "최대금액"
		IF $haspermission:"chidobak.manager" || $haspermission:"chidobak.admin"
		IF args.length == 2
			IF args[1] == "-1"
				{"DO최대금액"} = "-1"
				#MESSAGE {"DO이름"}+" 도박의 최대금액을 무제한으로 지정했습니다."
			ELSE
				IF $isnumber:args[1]
					{"DO최대금액"} = parseInt(args[1])
					#MESSAGE {"DO이름"}+" 도박의 최대금액을 "+{"DO최대금액"}+"원으로 설정했습니다."
				ELSE
					#MESSAGE {"DO이름"}+" &4&l입력값이 올바르지 않습니다 숫자로 최대금액을 설정해야합니다"
				ENDIF
			ENDIF
		ELSE
		#MESSAGE {"DO이름"}+" 명령어가 올바르지 않습니다."
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+"&4&l 이 명령어를 실행할 수 있는 권한이 없습니다."
		ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "이름설정"
		IF $haspermission:"chidobak.manager" || $haspermission:"chidobak.admin"
		IF args.length >= 2
			{"DO이름"} = $cmdline:2
			#MESSAGE {"DO이름"}+" 표시이름을 "+{"DO이름"}+"으로 변경했습니다"
		ELSE
		#MESSAGE {"DO이름"}+" 명령어가 올바르지 않습니다."
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+"&4&l 이 명령어를 실행할 수 있는 권한이 없습니다."
		ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "성공메시지"
		IF $haspermission:"chidobak.manager" || $haspermission:"chidobak.admin"
		IF args.length >= 2
			{"DO성공"} = $cmdline:2
			#MESSAGE {"DO이름"}+" 도박 성공메시지를 "+{"DO성공"}+"으로 변경했습니다"
		ELSE
		#MESSAGE {"DO이름"}+" 명령어가 올바르지 않습니다."
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+"&4&l 이 명령어를 실행할 수 있는 권한이 없습니다."
		ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "실패메시지"
		IF $haspermission:"chidobak.manager" || $haspermission:"chidobak.admin"
		IF args.length >= 2		
			{"DO실패"} = $cmdline:2
			#MESSAGE {"DO이름"}+" 도박 실패메시지를 "+{"DO실패"}+"으로 변경했습니다"
		ELSE
		#MESSAGE {"DO이름"}+" 명령어가 올바르지 않습니다."
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+"&4&l 이 명령어를 실행할 수 있는 권한이 없습니다."
		ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "최소번호"
		IF $haspermission:"chidobak.manager" || $haspermission:"chidobak.admin"
		IF args.length == 2
		IF $isnumber:args[1]
		IF parseInt(args[1]) < 0
			#MESSAGE {"DO이름"}+" &4&l최소번호를 0미만으로 지정할 수 없습니다."
		ELSE
			{"DO최소숫자"} = parseInt(args[1])
			#MESSAGE {"DO이름"}+" 최소번호를 "+{"DO최소숫자"}+"로 설정했습니다."
		ENDIF
		ELSE
			#MESSAGE {"DO이름"}+" &4&l입력값이 올바르지 않습니다 숫자로 최소번호를 설정해야합니다"
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+" 명령어가 올바르지 않습니다."
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+"&4&l 이 명령어를 실행할 수 있는 권한이 없습니다."
		ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "최대번호"
		IF $haspermission:"chidobak.manager" || $haspermission:"chidobak.admin"
		IF args.length == 2
		IF $isnumber:args[1]
			{"DO최대숫자"} = parseInt(args[1])
			#MESSAGE {"DO이름"}+" 최대번호를 "+{"DO최대숫자"}+"로 설정했습니다."
		ELSE
			#MESSAGE {"DO이름"}+" &4&l입력값이 올바르지 않습니다 숫자로 최대번호을 설정해야합니다"
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+" 명령어가 올바르지 않습니다."
		ENDIF
		ELSE
		#MESSAGE {"DO이름"}+" &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
		ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "초기화"
		IF $haspermission:"chidobak.admin"
		{"DO처음로드"} = "true"
		#CMDOP "도박"
		ELSE
		#MESSAGE {"DO이름"}+" &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
		ENDIF
		ELSE
		ENDIF
ENDIF



