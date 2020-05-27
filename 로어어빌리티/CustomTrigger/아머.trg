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
		IF slot == "38" || slot == "39" || slot == "37" || slot == "36"
		IF syncitemmeta.getLore().contains("§6§l착용중") == "true"
			size = synclore.size()
			
			//체력
			FOR i = 0:size
			synclore = syncitemmeta.getLore()
			synclore = synclore.get(i)
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
					IF synclore.contains("§6§l착용중")
						num = synclore.indexOf("§6§l착용중")
						synclore.set(num, color("&4&l비착용중"))
					ELSE
					ENDIF				
					syncitemmeta.setLore(synclore)
					num = parseInt(slot)
					player.getInventory().getItem(num).setItemMeta(syncitemmeta)
				ELSE
				ENDIF
			ELSE
			ENDIF
			ENDFOR
			
			synclore = syncitemmeta.getLore()
			//플라이
			IF synclore.contains("§b§l플라이") == "true"
				IF slot == "38" || slot == "39" || slot == "37" || slot == "36"
					player.setAllowFlight("false")
					synclore = syncitemmeta.getLore()
					IF synclore.contains("§6§l착용중")
						num = synclore.indexOf("§6§l착용중")
						synclore.set(num, color("&4&l비착용중"))
					ELSE
					ENDIF				
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
		ENDIF
	size = lore.size()
	FOR i = 0:size
	lore = itemmeta.getLore()
	lore = lore.get(i)
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
			IF lore.contains("§4§l비착용중")
				num = lore.indexOf("§4§l비착용중")
				lore.set(num, color("&6&l착용중"))
			ELSE
				lore.add(0, color("&6&l착용중"))
			ENDIF
			itemmeta.setLore(lore)
			num = parseInt(slot)
			player.getInventory().getItem(num).setItemMeta(itemmeta)
		ELSE
		ENDIF
	ELSE
	ENDIF
	ENDFOR
	
	lore = itemmeta.getLore()
	IF lore.contains("§b§l플라이") == "true"
		IF slot == "38" || slot == "39" || slot == "37" || slot == "36"
			player.setAllowFlight("true")
			lore = itemmeta.getLore()
			IF lore.contains("§4§l비착용중")
				num = lore.indexOf("§4§l비착용중")
				lore.set(num, color("&6&l착용중"))
			ELSE
				lore.add(0, color("&6&l착용중"))
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
