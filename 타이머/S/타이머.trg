import java.io.File
timer = 0
playername = player.getName().toString()

IF $isop
datefile = File("./plugins/TriggerReactor/Placeholder/realdate.js")
IF args.length == 0
	#MESSAGE "올바르지 않는 명령어 입니다. "
	#MESSAGE "/타이머 M S 예) /타이머 55S"
	#MESSAGE "/타이머 중단 - 타이머를 중단합니다"
	#MESSAGE "/타이머 제거 - 타이머스코어보드를 지웁니다"
	#STOP
ELSE
ENDIF

IF args[0] == "중단"
{"Schitimerstop"} = "true"
#STOP
ELSE
ENDIF

IF args[0] == "제거"
IF {"Schitimerrun"} == "true"
	#MESSAGE "&4타이머가 흐르는 중에는 타이머 스코어보드를 제거 할 수 없습니다."
	#STOP
ELSE
	#SCOREBOARD "OBJ" "timerS" "SET" {"SchTmsg"} null
	#MESSAGE "타이머를 제거했습니다"
	#STOP
ENDIF
ELSE
ENDIF


IF args.length == 1

                IF args[0].contains("S")
                    text = args[0].replace("S", "")
                    num = parseInt(text)
                    timer = timer + num
                    IF {"Schitimerrun"} != "true"
					{"Schitimerrun"} = "true"
                    timerr = 0
						{"Mtimere1"} = timer / 10
                        {"Mtimere3"} = {"Mtimere1"} * 3
                        {"Mtimere5"} = {"Mtimere1"} * 5
					    #SCOREBOARD "OBJ" "timerS" "SLOT" "SIDEBAR"
						{"Schitimerstop"} = "false"
						name = "&b&l타이머"
                        name = name.replace("&", "§")
                        #SCOREBOARD "OBJ" "timerS" "NAME" name
                    FOR timerr = 0:timer+1
						IF {"Schitimerstop"} == "true"
						IF {"SchTmsg"} == "null"
						ELSE
							name = "&b&l타이머 &6&l- 중단됨"
							name = name.replace("&", "§")
							#SCOREBOARD "OBJ" "timerS" "SET" {"SchTmsg"} null
							#SCOREBOARD "OBJ" "timerS" "NAME" name
							msg = {"SchTmsg"}
							char = msg.charAt(1).toString()
							msg = msg.replace(char, "6")
							msg = msg.replace("남은 시간 : ", "")
							#SCOREBOARD "OBJ" "timerS" "SET" msg 1
							{"SchTmsg"} = msg
							#BROADCAST "타이머가 관리자 "+playername+"에 의하여 중단되었습니다."
							{"Schitimerrun"} = "stop"
							#STOP
						ENDIF
						ELSE
						ENDIF
                        S = timer
                        msg = "&a&l남은 시간 : "+ S + "초"    
                        IF timer > {"Mtimere5"}
						IF {"SchTmsg"} == "null"
						ELSE
                            #SCOREBOARD "OBJ" "timerS" "SET" {"SchTmsg"} null
						ENDIF
                            msg = msg.replace("&", "§")
                            #SCOREBOARD "OBJ" "timerS" "SET" msg 1
                            {"SchTmsg"} = msg
                        ELSE                        
                            msg = msg.replace("&a", "&e")
                            msg = msg.replace("&", "§")
							#SCOREBOARD "OBJ" "timerS" "SET" {"SchTmsg"} null
                            #SCOREBOARD "OBJ" "timerS" "SET" msg 1
                            {"SchTmsg"} = msg
                            IF timer < {"Mtimere1"}
							#SCOREBOARD "OBJ" "timerS" "SET" {"SchTmsg"} null
                            msg = msg.replace("§e", "§4")
                            #SCOREBOARD "OBJ" "timerS" "SET" msg 1
                            {"SchTmsg"} = msg
                            ELSE
                            ENDIF
                        ENDIF
                        IF timer == 0
							name = "&b&l타이머 &6&l- 만료됨"
							name = name.replace("&", "§")
							#SCOREBOARD "OBJ" "timerS" "NAME" name
							IF datefile.exists()
							#BROADCAST	$realdate+"&6&l타이머의 시간이 모두 지났습니다"
							#ACTIONBAR $realdate+"§6§l타이머의 시간이 모두 지났습니다"
							ELSE
							#BROADCAST	"&6&l타이머의 시간이 모두 지났습니다"
							#ACTIONBAR "§6§l타이머의 시간이 모두 지났습니다"							
							ENDIF
							{"Schitimerrun"} = "stop"
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
	#MESSAGE "올바르지 않는 명령어 입니다. /타이머 S 예) /타이머 55S"
ENDIF

ELSE
	#MESSAGE "&4이 명령어를 사용할수 있는 권한이 없습니다."
ENDIF