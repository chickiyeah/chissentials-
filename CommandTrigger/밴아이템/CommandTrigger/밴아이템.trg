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
	{"banblock-placelogtime"} = "false"
ELSE
	{"banblock-placelogtime"} = "true"
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
	logFile = File("./plugins/TriggerReactor/chissentials/log/log-banitem.yml")
	LogYml = YamlConfiguration.loadConfiguration(logFile)
	configFile = File("./plugins/TriggerReactor/chissentials/config/config-banitem.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
IF !configFile.exists()
#LOG "[chissentials module](banitem) 컨피그 파일을 생성중입니다"
configYml.set("BanBlockList", list())
configYml.save(configFile)
ban = configYml.get("BanBlockList")
ban.add("ANVIL")
ban.add("TNT")
ban.add("ACTIVATOR_RAIL")
ban.add("REDSTONE")
ban.add("REDSTONE_WIRE")
ban.add("REDSTONE_TORCH_ON")
ban.add("REDSTONE_BLOCK")
ban.add("PISTON_STICKY_BASE")
ban.add("PISTON_BASE")
ban.add("DROPPER")
ban.add("DISPENSER")
configYml.save(configFile)
ELSE
ENDIF

IF !logFile.exists()
#LOG "[chissentials module](banitem) 로그 파일을 생성중입니다"
	
	LogYml.set("log", list())
	LogYml.save(logFile)
ELSE
ENDIF

log = LogYml.get("log")
ban = configYml.get("BanBlockList")
IF $isop || $haspermisson:"chissentials.banblock-place"
	IF args.length == 0
		#MESSAGE "/밴아이템 추가 - 손에 들고있는 블럭을 설치 금지 블럭으로 설정합니다"
		#MESSAGE "/밴아이템 삭제 - 손에 들고있는 블럭을 설치 금지 블럭에서 삭제합니다"	
	ELSE
		IF args[0] == "추가"
			item = player.getInventory().getItemInHand().getType().toString()
			IF ban.contains(item.toString())
				#MESSAGE "&4&l이미 밴아이템 으로 추가되어있는 아이템입니다."
			ELSE
				IF item == "REDSTONE"
					ban.add("REDSTONE_WIRE")
					log.add($realdate+"[밴 아이템 추가] REDSTONE_WIRE 추가자 "+$playername)
					#LOG $realdate+"[밴 아이템 추가] REDSTONE_WIRE 추가자 "+$playername
				ELSE
				ENDIF
				ban.add(item.toString())
				configYml.save(configFile)
				log.add($realdate+"[밴 아이템 추가] "+item.toString()+" 추가자 "+$playername)
				LogYml.save(logFile)
				#LOG $realdate+"[밴 아이템 추가] "+item.toString()+" 추가자 "+$playername
				#MESSAGE "&a&l성공적으로 &e&l"+item.toString()+"을/를 &a&l설치 금지아이템에 추가했습니다."
			ENDIF
		ELSEIF args[0] == "삭제"
			item = player.getInventory().getItemInHand().getType()
			IF ban.contains(item.toString())
				IF item == "REDSTONE"
					ban.remove("REDSTONE_WIRE")
					log.add($realdate+"[밴 아이템 제거] REDSTONE_WIRE 제거자 "+$playername)
					#LOG $realdate+"[밴 아이템 제거] REDSTONE_WIRE 제거자 "+$playername
				ELSE
				ENDIF
				ban.remove(item.toString())
				configYml.save(configFile)
				log.add($realdate+"[밴 아이템 제거] "+item.toString()+" 제거자 "+$playername)
				LogYml.save(logFile)
				#LOG $realdate+"[밴 아이템 제거] "+item.toString()+" 제거자 "+$playername
				#MESSAGE "&a&l성공적으로 &e&l"+item.toString()+"을/를 &a&l설치 금지아이템에서 제거했습니다."
			ELSE
				#MESSAGE "&4&l이미 밴아이템이 아닙니다"
			ENDIF			
		ENDIF
	ENDIF
ELSE
#MESSAGE "&4권한이 없습니다"
ENDIF