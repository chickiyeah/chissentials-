//치센셜 warp//
//Made by Chickiyeah//
import java.io.File
import java.util.Base64
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
IF $isop || $haspermission:chissentials.warp || $haspermission:chissentials.admin
	configFile = File("./plugins/TriggerReactor/config-warp.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
	list = configYml.get("WarpList")
	IF args.length == 0
		#MESSAGE "&l명령어 : &f/warp <워프이름>"
	ELSE
		IF list != null
			IF list.contains(args[0])
				IF {args[0]+"warpmessage"} == null
					world = {args[0]+"world"}
					x = {args[0]+"warpx"}
					y = {args[0]+"warpy"}
					z = {args[0]+"warpz"}
					yaw = {args[0]+"warpyaw"}
					pitch = {args[0]+"warppitch"}
					SYNC
					player.teleport(location(world, x, y, z, yaw, pitch))
					ENDSYNC
					#MESSAGE "&6&l치센셜 &f: &e&l"+args[0]+"&f이란 이름을 가진 워프로 이동했습니다"
				ELSE
					world = {args[0]+"world"}
					x = {args[0]+"warpx"}
					y = {args[0]+"warpy"}
					z = {args[0]+"warpz"}
					yaw = {args[0]+"warpyaw"}
					pitch = {args[0]+"warppitch"}
					SYNC
					player.teleport(location(world, x, y, z, yaw, pitch))
					ENDSYNC
					#MESSAGE {args[0]+"warpmessage"}
				ENDIF
			ELSE
				#MESSAGE "&6&l치센셜 &f: 입력하신 이름&e&l"+args[0]+"&f을 가진 워프는 없습니다"
			ENDIF
		ELSE
			#MESSAGE "&6&l치센셜 &f: 워프가 없습니다. 지금 하나 만들어보세요!"
		ENDIF
	ENDIF
ELSE
	#MESSAGE "&6&l치센셜 &f&l: &4&l이 명령어를 실행할 수 있는 권한이 없습니다."
ENDIF