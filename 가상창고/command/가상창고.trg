import java.io.File
import org.bukkit.Bukkit
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.inventory.ItemStack


uuid = player.getUniqueId().toString()
name = $playername
str = "./plugins/TriggerReactor/VirtualChest/uuid, name.yml"
str = str.replace("uuid",uuid)
str = str.replace("name",name)
file = File(str)
yaml = YamlConfiguration.loadConfiguration(file)
inv = Bukkit.createInventory(null,54,"§e§l"+$playername+"§b§l의 가상창고")
IF args.length == 0
#MESSAGE "&6&l가상창고 : 인벤토리를 불러오는 중입니다. 잠시 기다려주시면 인벤토리가 곧 열립니다."
IF !file.exists()a
ELSE
FOR i = 0:54
tem = yaml.get(""+i, null)
IF tem != null
inv.setItem(i ,tem)
ELSE
ENDIF
ENDFOR
ENDIF
SYNC
player.openInventory(inv)
ENDSYNC
ELSE
IF args[0] == "비우기"
FOR i = 0:54
yaml.set(""+i, null)
yaml.save(file)
ENDFOR
#MESSAGE "&6&l가상창고를 비웠습니다."
ELSE
ENDIF
ENDIF