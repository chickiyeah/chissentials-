import org.bukkit.configuration.file.YamlConfiguration
import java.io.File

size = event.getInventory().getSize()
path = "./plugins/TriggerReactor/VirtualChest/inv/{uuid}, {name}.yml"
path1 = "./plugins/TriggerReactor/VirtualChest/inv/{uuid}, {name}1.yml"
uuid = player.getUniqueId().toString()
title = event.getView().getTitle()
name = $playername
path = path.replace("{uuid}", uuid)
path = path.replace("{name}", name)
file = File(path)
file1 = File(path1)
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

IF title == "§e§l" + $playername + "§b§l의 가상창고 2페이지"
	FOR i = 0:size
		item = event.getInventory().getItem(i)
		yaml = YamlConfiguration.loadConfiguration(file1)
		IF item != null
			yaml.set(""+i, item)
			yaml.save(file)
		ELSE
			yaml.set(""+i, null)
			yaml.save(file)
		ENDIF
	ENDFOR
ENDIF
