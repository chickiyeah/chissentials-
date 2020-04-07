//치센셜 kickall//
//Made by Chickiyeah//
import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
	configFile = File("./plugins/TriggerReactor/chissentials/config-kickall-player.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
IF {"KICKALLLOADBEFORE"} != "true"
	configYml.set("PlayerList", list())
	configYml.save(configFile)
	{"KICKALLLOADBEFORE"} = "true"
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
ELSE
player.sendMessage(color("&4&l이 명령어를 사용할 수 있는 권한이 없습니다"))
ENDIF