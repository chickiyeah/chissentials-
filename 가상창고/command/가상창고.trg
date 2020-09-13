import java.io.File
import org.bukkit.Bukkit
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.inventory.ItemStack


uuid = player.getUniqueId().toString()
name = $playername
chifs = ""+$random:1:100
chitw = ""+$random:1:100
chith = ""+$random:1:100
chifr = ""+$random:1:100
chifi = ""+$random:1:100
chisi = ""+$random:1:100
chise = ""+$random:1:100
bakstr = "./plugins/TriggerReactor/VirtualChest/bak/uuid, name, chifschitwchithchifrchifichisichise.yml"
bakstr = bakstr.replace("uuid",uuid)
bakstr = bakstr.replace("name",name)
bakstr = bakstr.replace("chifs",chifs)
bakstr = bakstr.replace("chitw",chitw)
bakstr = bakstr.replace("chith",chith)
bakstr = bakstr.replace("chifr",chifr)
bakstr = bakstr.replace("chifi",chifi)
bakstr = bakstr.replace("chisi",chisi)
bakstr = bakstr.replace("chise",chise)
str = "./plugins/TriggerReactor/VirtualChest/inv/uuid, name.yml"
str = str.replace("uuid",uuid)
str = str.replace("name",name)
bakfile = File(bakstr)
file = File(str)
bakyml = YamlConfiguration.loadConfiguration(bakfile)
yaml = YamlConfiguration.loadConfiguration(file)
inv = Bukkit.createInventory(null,54,"§e§l"+$playername+"§b§l의 가상창고")
IF args.length == 0
#MESSAGE "&6&l가상창고 : 인벤토리를 불러오는 중입니다. 잠시 기다려주시면 인벤토리가 곧 열립니다."
IF !file.exists()a
ELSE
FOR i = 0:54
tem = yaml.get(""+i, null)
IF tem != null
bakyml.set(""+i, tem)
bakyml.save(bakfile)
inv.setItem(i ,tem)
ELSE
bakyml.set(""+i, null)
bakyml.save(bakfile)
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