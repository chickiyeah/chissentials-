//치센셜 tpahere//
//Made by Chickiyeah//
import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
	configFile = File("./plugins/TriggerReactor/config-tpa-player.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
IF {"TPALOADBEFORE"} != "true"
	configYml.set("PlayerList", list())
	configYml.save(configFile)
	{"TPADLOADBEFORE"} = "true"
ELSE
ENDIF
IF $isop || $haspermission:chissentials.tpahere || $haspermission:chissentials.admin
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
		IF $playername != args[0]
			{"tpa"+args[0]} = "true"
			{"tpacancel"+$playername} = "false"
			player($playername).sendMessage(color("&6&l치센셜 &f&l: &e&l"+args[0]+" &f님에게 tpahere요청을 했습니다"))
			player(args[0]).sendMessage(color("&6&l치센셜 &f&l: &e&l"+$playername+" &f님으로부터 tpahere요청이 들어왔습니다"))
			player(args[0]).sendMessage(color("&6&l치센셜 &f&l: &a&l수락&f하려면 /tpaccept, /tpyes &4&l거절&f하려면 /tpdeny, /tpno"))
			player(args[0]).sendMessage(color("&6&l치센셜 &f&l: &f이 요청은 &6&l120 초후에 만료됩니다"))
			#CMDOP "tpatimer "+$playername+" "+args[0]
		FOR i = 0:size
			nick = players.get(i)
			list.remove(nick.getName())
		ENDFOR
			configYml.save(configFile)
		ELSE
			player(args[0]).sendMessage(color("&6&l치센셜 &f&l: &4&l자기 자신에겐 tpahere요청을 보낼수 없습니다"))
		ENDIF
	ELSE
		player.sendMessage(color("&6&l치센셜 &f&l: &e&l"+args[0]+"&f 님을 &4&l찾을수 없습니다"))
	ENDIF
ELSE
	player.sendMessage(color("&l명령어 &f: /tpahere <닉네임> - 지정한 플레이어에게 이쪽으로 오기를 물어봅니다"))
ENDIF
ELSE
	#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF