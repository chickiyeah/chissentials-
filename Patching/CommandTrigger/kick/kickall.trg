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
	
	configYml.set("PlayerList", list())
	configYml.set("kickmsg", list())
	configYml.save(configFile)
	msg = configYml.get("kickmsg")
	msg.add("&f&l전체인원 &a&l"+size+"명중 &f&l관리자를 제외한 인원 &e&l"+kickno+"명을 &f&l추방하였습니다")
	configYml.save(configFile)
ELSE
ENDIF

IF !logFile.exists()
#LOG "[chissentials module](kickall) 로그 파일을 생성중입니다"
	
	LogYml.set("log", list())
	LogYml.save(logFile)
ELSE
ENDIF

	msg = configYml.get("kickmsg")
kickplayer = list()
IF $isop || $haspermission:"chissentials.kickall" || $haspermission:"chissentials.admin"
	list = configYml.get("PlayerList")
	players = Bukkit.getOnlinePlayers()
	size = Bukkit.getOnlinePlayers().size()
	kickno = 0
	FOR i = 0:size
		nick = players.get(i)
		name = nick.getName()
		IF player(name).isOp()
		ELSE
		SYNC
		player(name).kickPlayer("킥올에 의하여 추방되었습니다")
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
IF kickplayer.size == 0
player.sendMessage(color("추방인원이 없습니다 (모든 인원이 관리자이거나 서버에 사용자 한명밖에 없습니다)"))
#LOG "관리자 "+$playername+"님이 전체 추방 명령어를 사용하였지만 추방인원이 없습니다 (모든 인원이 관리자이거나 서버에 사용자 한명밖에 없습니다)"
ELSE
player.sendMessage(color("추방인원 상세 : "+kickplayer+" 총 "+kickplayer.size+"명"))
#LOG "관리자 "+$playername+"이 전체인원 "+size+"명중 관리자를 제외한 인원 "+kickno+"명을 추방하였습니다"
ENDIF
		FOR i = 0:forsize
		nick = players.get(i)
		list.remove(nick.getName())
		ENDFOR
		configYml.save(configFile)
ELSE
player.sendMessage(color("&4&l이 명령어를 사용할 수 있는 권한이 없습니다"))
ENDIF