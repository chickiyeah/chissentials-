//치센셜 kick//
//Made by Chickiyeah//
import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
	chissentialspath = File("./plugins/TriggerReactor/chissentials")
	configpath = File("./plugins/TriggerReactor/chissentials/config")
	logpath = File("./plugins/TriggerReactor/chissentials/log")
	datepath = File("./plugins/TriggerReactor/Placeholder/realdate.js")

IF !datepath.exists()
	#LOG "[chissentials] 날짜 묘듈을 찾지 못하였습니다 로그파일에 날짜/시간을 표시하지 않습니다"
	#MESSAGE "&6[chissentials] &f날짜 묘듈을 찾지 못하였습니다 로그파일에 날짜/시간을 표시하지 않습니다"
	{"kicklogtime"} = "false"
ELSE
	{"kicklogtime"} = "true"
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

	logFile = File("./plugins/TriggerReactor/chissentials/log/log-kick-player.yml")
	LogYml = YamlConfiguration.loadConfiguration(logFile)
	
IF $isop || $haspermission:"chissentials.kick" || $haspermission:"chissentials.admin"
		list = list()
		players = Bukkit.getOnlinePlayers()
		size = Bukkit.getOnlinePlayers().size()
		FOR i = 0:size
			nick = players.get(i)
			list.add(nick.getName())
		ENDFOR
IF args.length == 0
	player.sendMessage(color("&f&l/kick <닉네임> [사유]"))
ELSEIF args.length == 1
	IF list.contains(args[0])
		SYNC
		player(args[0]).kickPlayer("관리자에 의해 추방되었습니다")
		ENDSYNC
	ELSE
		#MESSAGE "&4접속중인 플레이어가 아닙니다"
	ENDIF
ELSEIF args.length == 2
		IF list.contains(args[0])
		SYNC
		player(args[0]).kickPlayer(args[1])
		ENDSYNC
	ELSE
		#MESSAGE "&4접속중인 플레이어가 아닙니다"
	ENDIF
ELSE
	player.sendMessage(color("&f&l/kick <닉네임> [사유]"))
ENDIF
ELSE
#MESSAGE "이 명령어를 사용하기위한 권한이 없습니다."
ENDIF
	
	
	
	