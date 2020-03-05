//치센셜 delwarp//
//Made by Chickiyeah//
import java.io.File
import java.util.Base64
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
IF $isop || $haspermission:chissentials.delwarp || $haspermission:chissentials.admin
	configFile = File("./plugins/TriggerReactor/config-warp.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
	list = configYml.get("WarpList")
	IF list.size() == 0
		#MESSAGE "&6&l치센셜 &f: 이 서버엔 어떠한 워프도 없습니다 치센셜로 워프를 추가한것이 맞나요?"
	ELSE
		IF args.length == 0
			IF list.contains(args[0])
				list.remove(args[0])
				configYml.save(configFile)
				#MESSAGE "&6&l치센셜 &f: &e&l"+args[0]+"&f라는 이름의 워프를 삭제했습니다."
			ELSE
				#MESSAGE "&6&l치센셜 &f: 입력하신 이름&e&l"+args[0]+"&f을 가진 워프는 없습니다"
			ENDIF
		ELSE
			#MESSAGE "&f&l명령어 &f: /delwarp <워프이름>"
		ENDIF
	ENDIF
ELSE
	#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF