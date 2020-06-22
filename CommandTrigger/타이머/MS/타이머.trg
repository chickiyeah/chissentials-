import java.io.File
timer = 0
playername = player.getName().toString()

IF $isop
datefile = File("./plugins/TriggerReactor/Placeholder/realdate.js")
IF args.length == 0
	#MESSAGE "올바르지 않는 명령어 입니다. "
	#MESSAGE "/타이머 M S 예) /타이머 1M 0S"
	#MESSAGE "/타이머 중단 - 타이머를 중단합니다"
	#MESSAGE "/타이머 제거 - 타이머스코어보드를 지웁니다"
	#STOP
ELSE
ENDIF

IF args[0] == "중단"
{"Mchitimerstop"} = "true"
#STOP
ELSE
ENDIF

IF args[0] == "제거"
IF {"Mchitimerrun"} == "true"
	#MESSAGE "&4타이머가 흐르는 중에는 타이머 스코어보드를 제거 할 수 없습니다."
	#STOP
ELSE
	#SCOREBOARD "OBJ" "timerM" "SET" {"MchTmsg"} null
	#MESSAGE "타이머를 제거했습니다"
	#STOP
ENDIF
ELSE
ENDIF


IF args.length == 2

            IF args[0].contains("M")
                text = args[0].replace("M", "")
                num = parseInt(text)
                num = num * 60
                timer = timer + num
                IF args[1].contains("S")
                    text = args[1].replace("S", "")
                    num = parseInt(text)
                    timer = timer + num
                    IF {"Mchitimerrun"} != "true"
					{"Mchitimerrun"} = "true"
                    timerr = 0
						{"Mtimere1"} = timer / 10
                        {"Mtimere3"} = {"Mtimere1"} * 3
                        {"Mtimere5"} = {"Mtimere1"} * 5
					    #SCOREBOARD "OBJ" "timerM" "SLOT" "SIDEBAR"
						{"Mchitimerstop"} = "false"
						name = "&b&l타이머"
                        name = name.replace("&", "§")
                        #SCOREBOARD "OBJ" "timerM" "NAME" name
                    FOR timerr = 0:timer+1
						IF {"Mchitimerstop"} == "true"
						IF {"MchTmsg"} == "null"
						ELSE
							name = "&b&l타이머 &6&l- 중단됨"
							name = name.replace("&", "§")
							#SCOREBOARD "OBJ" "timerM" "SET" {"MchTmsg"} null
							#SCOREBOARD "OBJ" "timerM" "NAME" name
							msg = {"MchTmsg"}
							char = msg.charAt(1).toString()
							msg = msg.replace(char, "6")
							msg = msg.replace("남은 시간 : ", "")
							#SCOREBOARD "OBJ" "timerM" "SET" msg 1
							{"MchTmsg"} = msg
							#BROADCAST "타이머가 관리자 "+playername+"에 의하여 중단되었습니다."
							{"Mchitimerrun"} = "stop"
							#STOP
						ENDIF
						ELSE
						ENDIF
                        M = timer / 60
                        Mm = timer % 60
                        S = Mm
                        msg = "&a&l남은 시간 : "+ M + "분 " + S + "초"    
                        IF timer > {"Mtimere5"}
						IF {"MchTmsg"} == "null"
						ELSE
                            #SCOREBOARD "OBJ" "timerM" "SET" {"MchTmsg"} null
						ENDIF
                            msg = msg.replace("&", "§")
                            #SCOREBOARD "OBJ" "timerM" "SET" msg 1
                            {"MchTmsg"} = msg
                        ELSE                        
                            msg = msg.replace("&a", "&e")
                            msg = msg.replace("&", "§")
							#SCOREBOARD "OBJ" "timerM" "SET" {"MchTmsg"} null
                            #SCOREBOARD "OBJ" "timerM" "SET" msg 1
                            {"MchTmsg"} = msg
                            IF timer < {"Mtimere1"}
							#SCOREBOARD "OBJ" "timerM" "SET" {"MchTmsg"} null
                            msg = msg.replace("§e", "§4")
                            #SCOREBOARD "OBJ" "timerM" "SET" msg 1
                            {"MchTmsg"} = msg
                            ELSE
                            ENDIF
                        ENDIF
                        IF timer == 0
							name = "&b&l타이머 &6&l- 만료됨"
							name = name.replace("&", "§")
							#SCOREBOARD "OBJ" "timerM" "NAME" name
							IF datefile.exists()
							#BROADCAST	$realdate+"&6&l타이머의 시간이 모두 지났습니다"
							#ACTIONBAR $realdate+"§6§l타이머의 시간이 모두 지났습니다"
							ELSE
							#BROADCAST	"&6&l타이머의 시간이 모두 지났습니다"
							#ACTIONBAR "§6§l타이머의 시간이 모두 지났습니다"							
							ENDIF
							{"Mchitimerrun"} = "stop"
							#STOP
                        ELSE
						#WAIT 1
						timer = timer - 1	
                        ENDIF
                        ENDFOR
                    ELSE
                        #MESSAGE "타이머가 이미 동작중입니다."
                    ENDIF
                        
                ELSE
                ENDIF
            ELSE 
            ENDIF   

ELSE
	#MESSAGE "올바르지 않는 명령어 입니다. /타이머 M S 예) /타이머 1M 0S"
ENDIF

ELSE
	#MESSAGE "&4이 명령어를 사용할수 있는 권한이 없습니다."
ENDIF