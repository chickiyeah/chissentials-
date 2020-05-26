IMPORT java.lang.String
IMPORT java.lang.Integer
IMPORT java.lang.Double
//ASYNC 장착확인
//SYNC 헤제확인

slottype = event.getSlotType()
slot = Integer.toString(event.getSlot())
syncitem = event.getCurrentItem()
IF syncitem == "null"
ELSE
	syncitemmeta = syncitem.getItemMeta()
ENDIF

IF syncitemmeta == "null"
ELSE
	synclore = syncitemmeta.getLore()
	IF synclore == "null"
	ELSE
		synclore = synclore.get(0)
		IF slot == "38" || slot == "39" || slot == "37" || slot == "36" && syncitemmeta.getLore().size() == 2
		IF syncitemmeta.getLore().get(1) == "§6§l착용중"
			IF synclore.contains("§d§l체력") == "true"	
			syncbonushealth = synclore.replace("§d§l체력 §e§l+","")
			syncbonushealth = syncbonushealth.replace("§f","")
			syncplayerhealth = player.getMaxHealth()
			syncbonushealth = parseInt(syncbonushealth)
			syncplayerhealth = Double.toString(syncplayerhealth)
			syncplayerhealth = syncplayerhealth.replace(".0","")
			syncplayerhealth = Integer.parseInt(syncplayerhealth)
			synctotalhealth = syncplayerhealth - syncbonushealth
				IF slot == "38" || slot == "39" || slot == "37" || slot == "36"
					player.setMaxHealth(synctotalhealth)
					synclore = syncitemmeta.getLore()
					synclore.set(1, color("&4&l비착용중"))
					syncitemmeta.setLore(synclore)
					num = parseInt(slot)
					player.getInventory().getItem(num).setItemMeta(syncitemmeta)
				ELSE
				ENDIF
			ELSE
			ENDIF
		ELSE
		ENDIF
		ELSE
		ENDIF
	ENDIF
ENDIF









ASYNC
IMPORT java.lang.String
IMPORT java.lang.Integer
IMPORT java.lang.Double
item = event.getCurrentItem()
IF item == "null"
ELSE
itemmeta = item.getItemMeta()
ENDIF
IF itemmeta == "null"
ELSE
	lore = itemmeta.getLore()
		IF lore == "null"
			#STOP
		ELSE
			lore = lore.get(0).toString()
		ENDIF
	IF lore.contains("§d§l체력") == "true"	
			bonushealth = lore.replace("§d§l체력 §e§l+","")
			bonushealth = bonushealth.replace("§f","")
			playerhealth = player.getMaxHealth()
			bonushealth = parseInt(bonushealth)
			playerhealth = Double.toString(playerhealth)
			playerhealth = playerhealth.replace(".0","")
			playerhealth = Integer.parseInt(playerhealth)
			totalhealth = playerhealth + bonushealth
		IF slot == "38" || slot == "39" || slot == "37" || slot == "36"
			player.setMaxHealth(totalhealth)
			lore = itemmeta.getLore()
			IF lore.size() < 2
			lore.add(1, color("&6&l착용중"))
			ELSE
			lore.set(1, color("&6&l착용중"))
			ENDIF
			itemmeta.setLore(lore)
			num = parseInt(slot)
			player.getInventory().getItem(num).setItemMeta(itemmeta)
		ELSE
		ENDIF
	ELSE
	ENDIF
ENDIF
ENDASYNC
