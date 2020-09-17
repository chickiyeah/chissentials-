//치센셜 kickall//
//Made by Chickiyeah//
import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
import java.io.BufferedWriter
import java.io.FileWriter
import java.lang.String
import java.lang.Integer
	chissentialspath = File("./plugins/TriggerReactor/chissentials")
	configpath = File("./plugins/TriggerReactor/chissentials/config")
	logpath = File("./plugins/TriggerReactor/chissentials/log")
	datepath = File("./plugins/TriggerReactor/Placeholder/realdate.js")

IF !datepath.exists()
	#LOG "[chissentials] 날짜 묘듈을 찾지 못하였습니다 로그파일에 날짜/시간을 표시하지 않습니다"
	#MESSAGE "&6[chissentials] &f날짜 묘듈을 찾지 못하였습니다 로그파일에 날짜/시간을 표시하지 않습니다"
	{"kickalllogtime"} = "false"
ELSE
	{"kickalllogtime"} = "true"
ENDIF

IF !chissentialspath.exists()
	chissentialspath.mkdir()
	#LOG "[chissentials] 트리거 폴더 (./plugins/TriggerReactor/chissentials)을/를 생성중입니다.)"
ELSE
ENDIF

IF !configpath.exists()
	configpath.mkdir()
	#LOG "[chissentials] 트리거 폴더 (./plugins/TriggerReactor/chissentials/config)을/를 생성중입니다.)"
ELSE
ENDIF

IF !logpath.exists()
	logpath.mkdir()
	#LOG "[chissentials] 트리거 폴터 (./plugins/TriggerReactor/chissentials/log)을/를 생성중입니다.)"
ELSE
ENDIF


	configFile = File("./plugins/TriggerReactor/chissentials/config/config-kickall-player.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
	logFile = File("./plugins/TriggerReactor/chissentials/log/log-kickall-player.yml")
	LogYml = YamlConfiguration.loadConfiguration(logFile)
	
IF !configFile.exists()
#LOG "[chissentials module](kickall) 컨피그 파일을 생성중입니다"
	
	configYml.set("아래 메시지의 변수 : size = 전체인원수 kickno = 추방당한인원수", list())
	configYml.set("kickmsg", list())
	configYml.set("아래 메시지는 추방당한 유저에게 보여지는 메시지 입니다", list())
	configYml.set("아래 메시지 설정은 변수와 색깔이 적용되지 않습니다", list())
	configYml.set("kickclient", list())
	configYml.save(configFile)
	kickclient = configYml.get("kickclient")
	kickclient.add("킥올에 의해 추방되었습니다 밴이 아닙니다 걱정하지마세요!")
	msg = configYml.get("kickmsg")
	msg.add("&f&l전체인원 &a&lsize명중 &f&l관리자를 제외한 인원 &e&lkickno명을 &f&l추방하였습니다")
	configYml.save(configFile)
ELSE
ENDIF

IF !logFile.exists()
#LOG "[chissentials module](kickall) 로그 파일을 생성중입니다"
	
	LogYml.set("log", list())
	LogYml.save(logFile)
ELSE
ENDIF

kickclient = configYml.get("kickclient")
log = LogYml.get("log")
msg = configYml.get("kickmsg")
kickplayer = list()
kickmsg = kickclient.get(0)
IF $isop || $haspermission:"chissentials.kickall" || $haspermission:"chissentials.admin"
	list = list()
	players = Bukkit.getOnlinePlayers()
	size = Bukkit.getOnlinePlayers().size()
	kickno = 0
	FOR i = 0:size
		nick = players.get(i)
		name = nick.getName()
		IF player(name).isOp()
		ELSE
		SYNC
		player(name).kickPlayer(kickmsg)
		kickplayer.add(name)
		ENDSYNC
		kickno = kickno + 1
		ENDIF
	ENDFOR
msg = msg.get(0)
forsize = size
size = Integer.toString(size)
kickno = Integer.toString(kickno)
msg = msg.replace("size", size)
msg = msg.replace("kickno", kickno)
player.sendMessage(color(msg))

LogYml.save(logFile)
IF kickplayer.size == 0
IF {"kickalllogtime"} == "true"
log.add($realdate+"  관리자 "+$playername+"이 전체인원 "+size+"명중 관리자를 제외한 인원 "+kickno+"명을 추방시도하였습니다")
log.add($realdate+" 관리자 "+$playername+"님이 전체 추방 명령어를 사용하였지만 추방인원이 없습니다 (모든 인원이 관리자이거나 서버에 사용자 한명밖에 없습니다)")
log.add($realdate+" 추방인원 상세 : "+kickplayer+" 총 "+kickplayer.size+"명 추방 실시자 : "+$playername)
ELSE
log.add("관리자 "+$playername+"이 전체인원 "+size+"명중 관리자를 제외한 인원 "+kickno+"명을 추방시도하였습니다")
log.add("관리자 "+$playername+"님이 전체 추방 명령어를 사용하였지만 추방인원이 없습니다 (모든 인원이 관리자이거나 서버에 사용자 한명밖에 없습니다)")
log.add("추방인원 상세 : "+kickplayer+" 총 "+kickplayer.size+"명 추방 실시자 : "+$playername)
ENDIF
player.sendMessage(color("추방인원이 없습니다 (모든 인원이 관리자이거나 서버에 사용자 한명밖에 없습니다)"))
#LOG "관리자 "+$playername+"님이 전체 추방 명령어를 사용하였지만 추방인원이 없습니다 (모든 인원이 관리자이거나 서버에 사용자 한명밖에 없습니다)"

ELSE

player.sendMessage(color("추방인원 상세 : "+kickplayer+" 총 "+kickplayer.size+"명"))
#LOG "관리자 "+$playername+"이 전체인원 "+size+"명중 관리자를 제외한 인원 "+kickno+"명을 추방하였습니다"
ENDIF
LogYml.save(logFile)
ELSE
player.sendMessage(color("&4&l이 명령어를 사용할 수 있는 권한이 없습니다"))
ENDIF