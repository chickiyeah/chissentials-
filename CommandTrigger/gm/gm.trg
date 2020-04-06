//치센셜 gm//
//Made by Chickiyeah//
import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
	configFile = File("./plugins/TriggerReactor/chissentials/config-gm-player.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
IF {"GMLOADBEFORE"} != "true"
	configYml.set("PlayerList", list())
	configYml.save(configFile)
	{"GMLOADBEFORE"} = "true"
ELSE
ENDIF
IF $isop || $haspermission:"chissentials.gm" || $haspermission:"chissentials.admin" || $haspermission:"chissentials.gmset"
	IF args.length == 0
		player.sendMessage(color("&l명령어 &f:/gm 0 [닉네임] - 서바이벌모드로 설정합니다."))
		player.sendMessage(color("&l명령어 &f:/gm 1 [닉네임] - 크리에이티브모드로 설정합니다."))
		player.sendMessage(color("&l명령어 &f:/gm 2 [닉네임] - 모험모드로 설정합니다."))
		player.sendMessage(color("&l명령어 &f:/gm 3 [닉네임] - 관전자모드로 설정합니다."))
	ELSEIF args.length == 2 && $isnumber:args[0]
		list = configYml.get("PlayerList")
		players = Bukkit.getOnlinePlayers()
		size = Bukkit.getOnlinePlayers().size()
		FOR i = 0:size
			nick = players.get(i)
			list.add(nick.getName())
		ENDFOR
		configYml.save(configFile)
		list = configYml.get("PlayerList")
		IF list.contains(args[1])
			IF args[0] == "0"
				SYNC
				player(args[1]).setGameMode("SURVIVAL")
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f&l: &e&l"+args[1]+"&f 님의 게임모드를 &e&l서바이벌&f모드로 설정했습니다."))
				FOR i = 0:size
				nick = players.get(i)
				list.remove(nick.getName())
				ENDFOR
				configYml.save(configFile)
			ELSEIF args[0] == "1"
				SYNC
				player(args[1]).setGameMode("CREATIVE")
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f&l: &e&l"+args[1]+"&f 님의 게임모드를 &e&l크리에이티브&f모드로 설정했습니다."))
				FOR i = 0:size
				nick = players.get(i)
				list.remove(nick.getName())
				ENDFOR
				configYml.save(configFile)
			ELSEIF args[0] == "2"
				SYNC
				player(args[1]).setGameMode("ADVENTURE")
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f&l: &e&l"+args[1]+"&f 님의 게임모드를 &e&l모험&f모드로 설정했습니다."))
				FOR i = 0:size
				nick = players.get(i)
				list.remove(nick.getName())
				ENDFOR
				configYml.save(configFile)
			ELSEIF args[0] == "3"
				SYNC
				player(args[1]).setGameMode("SPECTATOR")
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f&l: &e&l"+args[1]+"&f 님의 게임모드를 &e&l관전자&f모드로 설정했습니다."))
				FOR i = 0:size
				nick = players.get(i)
				list.remove(nick.getName())
				ENDFOR
				configYml.save(configFile)
			ELSE
				player.sendMessage(color("&l명령어 &f:/gm 0 [닉네임] - 서바이벌모드로 설정합니다."))
				player.sendMessage(color("&l명령어 &f:/gm 1 [닉네임] - 크리에이티브모드로 설정합니다."))
				player.sendMessage(color("&l명령어 &f:/gm 2 [닉네임] - 모험모드로 설정합니다."))
				player.sendMessage(color("&l명령어 &f:/gm 3 [닉네임] - 관전자모드로 설정합니다."))
			ENDIF
		ELSE
			IF player(args[1]).hasPlayedBefore()
				player.sendMessage(color("&6&l치센셜 &f&l: &e&l"+args[1]+"&f 님을 &4&l찾을수 없습니다"))
			ENDIF
		ENDIF
	ELSEIF args.length == 1
			IF args[0] == "0"
				SYNC
				player.setGameMode("SURVIVAL")
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f&l:&f 게임모드를 &e&l서바이벌&f모드로 설정했습니다."))
				#STOP
			ELSEIF args[0] == "1"
				SYNC
				player.setGameMode("CREATIVE")
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f&l: &f게임모드를 &e&l크리에이티브&f모드로 설정했습니다."))
				#STOP
			ELSEIF args[0] == "2"
				SYNC
				player.setGameMode("ADVENTURE")
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f&l: &f게임모드를 &e&l모험&f모드로 설정했습니다."))
				#STOP
			ELSEIF args[0] == "3"
				SYNC
				player.setGameMode("SPECTATOR")
				ENDSYNC
				player.sendMessage(color("&6&l치센셜 &f&l: &f게임모드를 &e&l관전자&f모드로 설정했습니다."))
				#STOP
			ELSE
				player.sendMessage(color("&l명령어 &f:/gm 0 [닉네임] - 서바이벌모드로 설정합니다."))
				player.sendMessage(color("&l명령어 &f:/gm 1 [닉네임] - 크리에이티브모드로 설정합니다."))
				player.sendMessage(color("&l명령어 &f:/gm 2 [닉네임] - 모험모드로 설정합니다."))
				player.sendMessage(color("&l명령어 &f:/gm 3 [닉네임] - 관전자모드로 설정합니다."))
				#STOP
			ENDIF	
	ENDIF
ELSE
	#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF	
		
		