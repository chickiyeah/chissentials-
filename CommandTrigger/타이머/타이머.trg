import java.io.File
timer = 0
playername = player.getName().toString()

IF $isop
datefile = File("./plugins/TriggerReactor/Placeholder/realdate.js")
IF args.length == 0
	#MESSAGE "올바르지 않는 명령어 입니다. "
	#MESSAGE "/타이머 Y D H M S 예) /타이머 0Y 0D 0H 1M 0S"
	#MESSAGE "/타이머 중단 - 타이머를 중단합니다"
	#MESSAGE "/타이머 제거 - 타이머스코어보드를 지웁니다"
	#STOP
ELSE
ENDIF

IF args[0] == "중단"
{"chitimerstop"} = "true"
#STOP
ELSE
ENDIF

IF args[0] == "제거"
IF {"chitimerrun"} == "true"
	#MESSAGE "&4타이머가 흐르는 중에는 타이머 스코어보드를 제거 할 수 없습니다."
	#STOP
ELSE
	#SCOREBOARD "OBJ" "timer1" "SET" {"chTmsg"} null
	#MESSAGE "타이머를 제거했습니다"
	#STOP
ENDIF
ELSE
ENDIF


IF args.length == 5
IF args[0].contains("Y")
    text = args[0].replace("Y", "")
    num = parseInt(text)
    num = num * 31536000
    timer = timer + num
    IF args[1].contains("D")
        text = args[1].replace("D", "")
        num = parseInt(text)
        num = num * 86400
        timer = timer + num
        IF args[2].contains("H")
            text = args[2].replace("H", "")
            num = parseInt(text)
            num = num * 3600
            timer = timer + num
            IF args[3].contains("M")
                text = args[3].replace("M", "")
                num = parseInt(text)
                num = num * 60
                timer = timer + num
                IF args[4].contains("S")
                    text = args[4].replace("S", "")
                    num = parseInt(text)
                    timer = timer + num
                    IF {"chitimerrun"} != "true"
					{"chitimerrun"} = "true"
                    timerr = 0
						{"timere1"} = timer / 10
                        {"timere3"} = {"timere1"} * 3
                        {"timere5"} = {"timere1"} * 5
					    #SCOREBOARD "OBJ" "timer1" "SLOT" "SIDEBAR"
						{"chitimerstop"} = "false"
						name = "&b&l타이머"
                        name = name.replace("&", "§")
                        #SCOREBOARD "OBJ" "timer1" "NAME" name
                    FOR timerr = 0:timer+1
						IF {"chitimerstop"} == "true"
						IF {"chTmsg"} == "null"
						ELSE
							name = "&b&l타이머 &6&l- 중단됨"
							name = name.replace("&", "§")
							#SCOREBOARD "OBJ" "timer1" "SET" {"chTmsg"} null
							#SCOREBOARD "OBJ" "timer1" "NAME" name
							msg = {"chTmsg"}
							char = msg.charAt(1).toString()
							msg = msg.replace(char, "6")
							msg = msg.replace("남은 시간 : ", "")
							#SCOREBOARD "OBJ" "timer1" "SET" msg 1
							{"chTmsg"} = msg
							#BROADCAST "타이머가 관리자 "+playername+"에 의하여 중단되었습니다."
							{"chitimerrun"} = "stop"
							#STOP
						ENDIF
						ELSE
						ENDIF
                        Y = timer / 31536000
                        Yy = timer % 31536000
                        D = Yy / 86400
                        Dd = Yy % 86400
                        H = Dd / 3600
                        Hh = Dd % 3600
                        M = Hh / 60
                        Mm = Hh % 60
                        S = Mm
                        msg = "&a&l남은 시간 : " + Y + "년 " + D + "일 " + H + "시간 " + M + "분 " + S + "초"    
                        IF timer > {"timere5"}
						IF {"chTmsg"} == "null"
						ELSE
                            #SCOREBOARD "OBJ" "timer1" "SET" {"chTmsg"} null
						ENDIF
                            msg = msg.replace("&", "§")
                            #SCOREBOARD "OBJ" "timer1" "SET" msg 1
                            {"chTmsg"} = msg
                        ELSE                        
                            msg = msg.replace("&a", "&e")
                            msg = msg.replace("&", "§")
							#SCOREBOARD "OBJ" "timer1" "SET" {"chTmsg"} null
                            #SCOREBOARD "OBJ" "timer1" "SET" msg 1
                            {"chTmsg"} = msg
                            IF timer < {"timere1"}
							#SCOREBOARD "OBJ" "timer1" "SET" {"chTmsg"} null
                            msg = msg.replace("§e", "§4")
                            #SCOREBOARD "OBJ" "timer1" "SET" msg 1
                            {"chTmsg"} = msg
                            ELSE
                            ENDIF
                        ENDIF
                        IF timer == 0
							name = "&b&l타이머 &6&l- 만료됨"
							name = name.replace("&", "§")
							#SCOREBOARD "OBJ" "timer1" "NAME" name
							IF datefile.exists()
							#BROADCAST	$realdate+"&6&l타이머의 시간이 모두 지났습니다"
							#ACTIONBAR $realdate+"§6§l타이머의 시간이 모두 지났습니다"
							ELSE
							#BROADCAST	"&6&l타이머의 시간이 모두 지났습니다"
							#ACTIONBAR "§6§l타이머의 시간이 모두 지났습니다"							
							ENDIF
							{"chitimerrun"} = "stop"
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
        ENDIF    
    ELSE
    ENDIF
ELSE
ENDIF

ELSE
	#MESSAGE "올바르지 않는 명령어 입니다. /타이머 Y D H M S 예) /타이머 0Y 0D 0H 1M 0S"
ENDIF

ELSE
	#MESSAGE "&4이 명령어를 사용할수 있는 권한이 없습니다."
ENDIF