//치센셜 setwarp//
//Made by Chickiyeah//
import java.io.File
import java.util.Base64
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
IF {"warptrigloadbefore"} == "true"
	IF $isop || $haspermission:"chissentials.setwarp" || $haspermission:"chissentials.admin"
	configFile = File("./plugins/TriggerReactor/config-warp.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
	list = configYml.get("WarpList")
		IF args.length == 0
			#MESSAGE "&l명령어 : &f/setwarp <워프이름>"
		ELSEIF args.length == 1
			IF {args[0]+"warp"} == true
				IF {args[0]+"warpover"} == "true"
					{args[0]+"world"} = player.getLocation().getWorld().getName().toString()
					{args[0]+"warpx"} = player.getLocation().getX()
					{args[0]+"warpy"} = player.getLocation().getY()
					{args[0]+"warpz"} = player.getLocation().getZ()
					{args[0]+"warpyaw"} = player.getLocation().getYaw()
					{args[0]+"warppitch"} = player.getLocation().getPitch()
					warpname = args[0]
					list.remove(warpname)
					list.add(warpname)
					configYml.set("Warplist."+warpcount+",WarpName", warpname)
					configYml.save(configFile)
					{args[0]+"warp"} = "true"
					{args[0]+"warpover"} = "false"
					#MESSAGE "&6&l치센셜 &f: &e&l"+args[0]+"&f라는 이름의 워프를 추가했습니다."
				ELSE
					#MESSAGE "&6&l치센셜 &f: &4이미 존재하는 워프입니다 &f덮어 씌우려면 다시 입력해주세요."
					{args[0]+"warpover"} = "true"
				ENDIF
			ELSE
				{args[0]+"warpx"} = player.getLocation().getX()
				{args[0]+"warpy"} = player.getLocation().getY()
				{args[0]+"warpz"} = player.getLocation().getZ()
				{args[0]+"warpyaw"} = player.getLocation().getYaw()
				{args[0]+"warppitch"} = player.getLocation().getPitch()
				{args[0]+"warp"} = "true"
				{args[0]+"warpname"} = args[0]
				warpname = args[0]
				list.add(warpname)
				configYml.save(configFile)
				//list.add(args[0])//
				#MESSAGE "&6&l치센셜 &f: &e&l"+args[0]+"&f라는 이름의 워프를 추가했습니다."
			ENDIF
		ELSEIF args.length >= 2
			IF {args[0]+"warp"} == true
				IF {args[0]+"warpover"} == "true"
					{args[0]+"world"} = player.getLocation().getWorld().getName().toString()
					{args[0]+"warpx"} = player.getLocation().getX()
					{args[0]+"warpy"} = player.getLocation().getY()
					{args[0]+"warpz"} = player.getLocation().getZ()
					{args[0]+"warpyaw"} = player.getLocation().getYaw()
					{args[0]+"warppitch"} = player.getLocation().getPitch()
					{args[0]+"warpmessage"} = $cmdline:2
					warpname = args[0]
					list.remove(warpname)
					list.add(warpname)
					configYml.set("Warplist."+warpcount+",WarpName", warpname)
					configYml.save(configFile)
					{args[0]+"warp"} = "true"
					{args[0]+"warpover"} = "false"
					#MESSAGE "&6&l치센셜 &f: &e&l"+args[0]+"&f라는 이름의 워프를 추가했습니다."
					#MESSAGE "&6&l치센셜 &f: &f 이제 이 워프로 이동시 "+{args[0]+"warpmessage"}+"&f라는 메시지를 출력합니다"
				ELSE
					#MESSAGE "&6&l치센셜 &f: &4이미 존재하는 워프입니다 &f덮어 씌우려면 다시 입력해주세요."
					{args[0]+"warpover"} = "true"
				ENDIF
			ELSE
				{args[0]+"warpx"} = player.getLocation().getX()
				{args[0]+"warpy"} = player.getLocation().getY()
				{args[0]+"warpz"} = player.getLocation().getZ()
				{args[0]+"warpyaw"} = player.getLocation().getYaw()
				{args[0]+"warppitch"} = player.getLocation().getPitch()
				{args[0]+"warp"} = "true"
				{args[0]+"warpname"} = args[0]
				warpname = args[0]
				list.add(warpname)
				configYml.save(configFile)
				{args[0]+"warpmessage"} = $cmdline:2
				#MESSAGE "&6&l치센셜 &f: &e&l"+args[0]+"&f라는 이름의 워프를 추가했습니다."
				#MESSAGE "&6&l치센셜 &f: &f 이제 이 워프로 이동시 "+{args[0]+"warpmessage"}+"&f라는 메시지를 출력합니다"
			ENDIF
		ENDIF
	ELSE
		#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
	ENDIF
ELSE
	//{"WarpList"} = list()//
	configFile = File("./plugins/TriggerReactor/config-warp.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
	IF !configFile.exists()
	Bukkit.getConsoleSender().sendMessage("[WARP] config 파일 생성중...")
	configYml.set("WarpCount", 0)
	configYml.set("WarpList", list())
	configYml.save(configFile)
	Bukkit.getConsoleSender().sendMessage("[WARP] config 파일 생성완료")
ENDIF
	#MESSAGE "&6&l치센셜 &f&l: 초기설정을 완료했습니다. 명령어를 다시 사용해주세요."
	{"warptrigloadbefore"} = "true"
ENDIF