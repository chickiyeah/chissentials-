import java.io.File
Import org.bukkit.Bukkit
import java.lang.Short
import org.bukkit.enchantments.Enchantment

uuid = player.getUniqueId().toString()
name = $playername
str = "./plugins/TriggerReactor/VirtualChest/uuid, name.yml"
str = str.replace("uuid",uuid)
str = str.replace("name",name)
file = File(str)
inv = Bukkit.createInventory(null,54,"§e§l"+$playername+"§b§l의 가상창고")
#MESSAGE "&6&l가상창고 : 인벤토리를 불러오는 중입니다. 잠시 기다려주시면 인벤토리가 곧 열립니다."
IF !file.exists()a
ELSE
item = $readall:str
size = item.size()
FOR i = 0:size
	tem = item.get(i)
	sptem = tem.split("/")
IF sptem[1] == "nulle"
ELSE
	lor = list()
	num = parseInt(sptem[0])
	tem = item(sptem[1], parseInt(sptem[2]))
	meta = tem.getItemMeta()
	IF sptem[4] == "nulle"
	ELSE
	lore = sptem[4].split(",")
	FOR j = 0:lore.length
	sds = lore[j].toString()
	lor.add(sds)
	ENDFOR
	meta.setLore(lor)
	tem.setItemMeta(meta)
	ENDIF
	
	IF sptem[5] == "nulle"
	ELSE
	ensize = sptem.length
	FOR k = 5:ensize
	enss = sptem[k].split(",")
	ends = Enchantment.getByName(enss[0])
	in = parseInt(enss[1])
	meta.addEnchant(ends, in, "true")

	ENDFOR
	ENDIF
	tem.setItemMeta(meta)
	tem.setDurability(Short.parseShort(sptem[3]))
inv.setItem(num ,tem)
ENDIF
ENDFOR
ENDIF
SYNC
player.openInventory(inv)
ENDSYNC 