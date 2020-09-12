import org.bukkit.configuration.file.YamlConfiguration
import java.io.File

size = event.getInventory().getSize()
path = "./plugins/TriggerReactor/VirtualChest/{uuid}, {name}.yml"
uuid = player.getUniqueId().toString()
title = event.getView().getTitle()
name = $playername
path = path.replace("{uuid}", uuid)
path = path.replace("{name}", name)
file = File(path)

IF title == "§e§l" + $playername + "§b§l의 가상창고"
	FOR i = 0:size
		item = event.getInventory().getItem(i)
		yaml = YamlConfiguration.loadConfiguration(file)
		IF item != null
			yaml.set(""+i, item)
			yaml.save(file)
		ELSE
			yaml.set(""+i, null)
			yaml.save(file)
		ENDIF
	ENDFOR
ENDIF
