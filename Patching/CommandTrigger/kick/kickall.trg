//치센셜 kickall//
//Made by Chickiyeah//
import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
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
	configYml.save(configfile)
ELSE
ENDIF

IF !logFile.exists()
#LOG "[chissentials module](kickall) 로그 파일을 생성중입니다"
	
	LogYml.set("log", list())
	LogYml.save(logfile)
ELSE
ENDIF
	
	
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
		ENDSYNC
		kickno = kickno + 1
		ENDIF
	ENDFOR
player.sendMessage(color("&f&l전체인원 &a&l"+size+"명중 &f&l관리자를 제외한 인원 &e&l"+kickno+"명을 &f&l추방하였습니다"))
print("관리자 "+$playername+"이 전체인원 "+size+"명중 관리자를 제외한 인원 "+kickno+"명을 추방하였습니다")
		FOR i = 0:size
		nick = players.get(i)
		list.remove(nick.getName())
		ENDFOR
		configYml.save(configFile)
ELSE
player.sendMessage(color("&4&l이 명령어를 사용할 수 있는 권한이 없습니다"))
ENDIF