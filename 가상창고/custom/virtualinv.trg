import org.bukkit.inventory.ItemFlag
import java.lang.Integer
import java.lang.String
import java.lang.Short
import java.io.File
title = event.getView().getTitle()
dirpath = File("./plugins/TriggerReactor/VirtualChest")
IF !dirpath.exists()
dirpath.mkdir()
ELSE
ENDIF
IF title == "§e§l"+$playername+"§b§l의 가상창고"
size = event.getInventory().getSize()
i = 0
j = 0
k = 0
enchant = list()
#MESSAGE "&6&l가상창고 : 인벤토리를 저장중입니다. 최대 10초 소요됩니다."
#MESSAGE "&6&l가상창고 : 저장중에 가상창고를 열개되면 저장되지 않은 아이템이 삭제될수 있습니다."
FOR i = 0:size
IF event.getInventory().getItem(i) != null
amount = Integer.toString(event.getInventory().getItem(i).getAmount())
type = event.getInventory().getItem(i).getType().toString()
enchants = event.getInventory().getItem(i).getEnchantments()
meta = event.getInventory().getItem(i).getItemMeta()
enchants = enchants.toString().replace("{","")
enchants = enchants.toString().replace("}","")
enchants = enchants.split(", ")
durability = event.getInventory().getItem(i).getDurability()
durability = Short.toString(durability)
IF meta.getLore() != null
lore = meta.getLore()
loresize = lore.size()
FOR k = 0:loresize
IF k == 0
mssg = lore.get(k).toString()
ELSE
mssg = mssg+","+lore.get(k).toString()
ENDIF
ENDFOR
ELSE
ENDIF
size = enchants.length
q = 0
	FOR j = 0:size
		IF j%2 == 1
			enc = enchants[j].toString()
			enc = enc.replace("[","")
			enc = enc.replace("]","")
			enc = enc.split("=")
			enchantname = enc[0]
			enchantdur = enc[1]
			IF q == 0
			msssg = enchantname+","+enchantdur
			ELSE
			msssg = msssg+"/"+enchantname+","+enchantdur
			ENDIF
			q = q + 1
		ELSE
		ENDIF
	ENDFOR
msg = "i/type/amount/durability/lore/enchant"
stri = Integer.toString(i)
msg = msg.replace("durability", durability)
msg = msg.replace("type", type)
msg = msg.replace("i", stri)
msg = msg.replace("amount", amount)
IF enchants != null && msssg != null
msg = msg.replace("enchant", msssg)
ELSE
msg = msg.replace("enchant", "nulle")
ENDIF
IF lore != null
msg = msg.replace("lore", mssg)
ELSE
msg = msg.replace("lore", "nulle")
ENDIF
path = "./plugins/TriggerReactor/VirtualChest/uuid, name.yml"
uuid = player.getUniqueId().toString()
name = $playername
path = path.replace("uuid" ,uuid)
path = path.replace("name" ,name)
#writeinv path msg i
msssg = null
enchants = null
lore = null
mssg = null
ELSE
path = "./plugins/TriggerReactor/VirtualChest/uuid, name.yml"
uuid = player.getUniqueId().toString()
name = $playername
path = path.replace("uuid" ,uuid)
path = path.replace("name" ,name)
dmsg = "i/nulle"
stri = Integer.toString(i)
dmsg = dmsg.replace("i" ,stri)
#writeinv path dmsg i
msssg = null
enchants = null
lore = null
mssg = null
ENDIF
ENDFOR
ELSE
ENDIF