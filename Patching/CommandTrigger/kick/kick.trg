//치센셜 kick//
//Made by Chickiyeah//
import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
	configFile = File("./plugins/TriggerReactor/chissentials/config-kick-player.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
IF {"KICKLOADBEFORE"} != "true"
	configYml.set("PlayerList", list())
	configYml.save(configFile)
	{"KICKLOADBEFORE"} = "true"
ELSE
ENDIF
IF $isop || $haspermission:"chissentials.kick" || $haspermission:"chissentials.admin"
		list = configYml.get("PlayerList")
		players = Bukkit.getOnlinePlayers()
		size = Bukkit.getOnlinePlayers().size()
		FOR i = 0:size
			nick = players.get(i)
			list.add(nick.getName())
		ENDFOR
		configYml.save(configFile)
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
	
	
	
	