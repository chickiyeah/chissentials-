//치센셜 warplist//
//Made by Chickiyeah//
import java.io.File
import java.util.Base64
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
IF $isop || $haspermission:chissentials.warplist || $haspermission:chissentials.admin
	configFile = File("./plugins/TriggerReactor/config-warp.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
	list = configYml.get("WarpList")
	IF list.size() != 0
		b = list.size()
		FOR i = 0:b
			name = list.get(i)
			IF i == 0
				a = name
			ELSE
				a = a + ", "+name
				i = i + 1
			ENDIF
		ENDFOR
		#MESSAGE "&6&l워프 목록 &f: "+ a 
	ELSE
		#MESSAGE "&6&l치센셜 &f: 워프가 없습니다. 지금 하나 만들어보세요!"
	ENDIF
ELSE
	#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF