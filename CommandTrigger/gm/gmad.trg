//치센셜 gmad//
//Made by Chickiyeah//
import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
	configFile = File("./plugins/TriggerReactor/config-gmad-player.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
IF {"GMADLOADBEFORE"} != "true"
	configYml.set("PlayerList", list())
	configYml.save(configFile)
	{"GMADLOADBEFORE"} = "true"
ELSE
ENDIF
IF $isop || $haspermission:chissentials.gmad || $haspermission:chissentials.admin
IF args.length == 1
	list = configYml.get("PlayerList")
	players = Bukkit.getOnlinePlayers()
	size = Bukkit.getOnlinePlayers().size()
	FOR i = 0:size
		nick = players.get(i)
		list.add(nick.getName())
	ENDFOR
	configYml.save(configFile)
	list = configYml.get("PlayerList")
	IF list.contains(args[0])
		SYNC
		player(args[0]).setGameMode("ADVENTURE")
		ENDSYNC
		player.sendMessage(color("&6&l치센셜 &f&l: &e&l"+args[0]+"&f 님의 게임모드를 &e&l모험&f모드로 설정했습니다."))
		FOR i = 0:size
		nick = players.get(i)
		list.remove(nick.getName())
		ENDFOR
		configYml.save(configFile)
	ELSE
	player.sendMessage(color("&6&l치센셜 &f&l: &e&l"+args[0]+"&f 님을 &4&l찾을수 없습니다"))
	ENDIF
ELSE
	SYNC
	player.setGameMode("ADVENTURE")
	ENDSYNC
	player.sendMessage(color("&6&l치센셜 &f&l: &f게임모드를 &e&l모험&f모드로 설정했습니다."))
ENDIF
ELSE
	#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF