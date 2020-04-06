//치센셜 명령어//
//Made by Chickiyeah//
import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
	configFile = File("./plugins/TriggerReactor/chissentials/config-cmd-blacklist.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
	IF !configFile.exists()
	Bukkit.getConsoleSender().sendMessage("[bancommand] config 파일 생성중...")
	configYml.set("blacklist", list())
	configYml.save(configFile)
	Bukkit.getConsoleSender().sendMessage("[bancommand] config 파일 생성완료")
	#CMDOP "trg sync 커맨드"
	ELSE
	ENDIF
	list = configYml.get("blacklist")

IF $isop || $haspermission:"chissentials.명령어" || $haspermission:"chissentials.admin" || $haspermission:"chissentials.bancommand"
IF args.length == 0
	#MESSAGE "&l명령어 &f: /명령어 허용 <커맨드> , /명령어 금지 <커맨드>"
ELSE
	IF args[0] == "금지"
	IF list.contains($cmdline:2)
	#MESSAGE "&6&l[&4&l!&6&l] &f이미 금지된 명령어 입니다!"
	ELSE
	list.add($cmdline:2)
	#MESSAGE "&6&l[&4&l!&6&l] &e&l"+$cmdline:2+"를 &4&l금지 &f커맨드로 추가했습니다"
	configYml.save(configFile)
	ENDIF
	ELSE
	ENDIF
	
	IF args[0] == "허용"
	IF !list.contains($cmdline:2)
	#MESSAGE "&6&l[&4&l!&6&l] &f이미 허용된 명령어 입니다!"
	ELSE
	list.remove($cmdline:2)
	#MESSAGE "&6&l[&4&l!&6&l] &e&l"+$cmdline:2+"를 &a&l허용 &f커맨드로 추가했습니다"
	configYml.save(configFile)
	ENDIF
	ELSE
	ENDIF
	
	IF args[0] == "금지목록"
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
		#MESSAGE "&6&l금지된 명령어 &f: "+ a
	ELSE
		#MESSAGE "&6&l[&4&l!&6&l] &f: 금지된 명령어가 없습니다!"
	ENDIF
	ELSE
	ENDIF	
ENDIF
ELSE
	#MESSAGE "&6&l[&4&l!&6&l] &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF