IF $isop || $haspermisson:"chissentials.lorepower"
	IF args.length == 0
		#MESSAGE "&6&l/로어어빌 &d&l체력 &e&l<값> - &6&l체력 추가값을 설정합니다."
		#MESSAGE "&6&l/로어어빌 &b&l플라이 - &b&l플라이를 온 오프 합니다."
	ELSE
		IF player.getInventory().getItemInHand().getType().toString() == "AIR"
			#MESSAGE "&l공기엔 &6&l어빌리티를 붙힐수 없습니다."
		ELSE
			itemmeta = player.getInventory().getItemInHand().getItemMeta()
			lore = player.getInventory().getItemInHand().getItemMeta().getLore()
			IF args[0] == "체력"
				IF lore == "null"
					lore = list()
				ELSE
				ENDIF
				size = lore.size()
				reslist = list()
					setlore = player.getInventory().getItemInHand().getItemMeta().getLore()
					IF setlore == "null"
						setlore = list()
					ELSE
					ENDIF
				FOR i = 0:size
				lore = player.getInventory().getItemInHand().getItemMeta().getLore()
				lore = lore.get(i)
					IF lore.contains("§d§l체력") == "true"					
						setlore.set(i, color("&d&l체력 &e&l+"+args[1]))
						reslist.add("true")
					ELSE
						reslist.add("false")
					ENDIF
				ENDFOR
				lore = player.getInventory().getItemInHand().getItemMeta().getLore()
				IF reslist.contains("true") == "true"
					itemmeta.setLore(setlore)
					player.getInventory().getItemInHand().setItemMeta(itemmeta)
				ELSE
					setlore.add(color("&d&l체력 &e&l+"+args[1]))
					itemmeta.setLore(setlore)
					player.getInventory().getItemInHand().setItemMeta(itemmeta)
				ENDIF
			ELSE
			ENDIF
			IF args[0] == "플라이"
				IF lore == "null"
					lore = list()
				ELSE
				ENDIF
				size = lore.size()
				reslist = list()
					setlore = player.getInventory().getItemInHand().getItemMeta().getLore()
					IF setlore == "null"
						setlore = list()
					ELSE
					ENDIF
				lore = player.getInventory().getItemInHand().getItemMeta().getLore()
				IF lore == "null"
					lore = list()
				ELSE
				ENDIF
					IF lore.contains("§b§l플라이") == "true"					
						num = lore.indexOf("§b§l플라이")
						setlore.remove(num)
						reslist.add("true")
					ELSE
						setlore.add(color("&b&l플라이"))
						reslist.add("false")
					ENDIF
					itemmeta.setLore(setlore)
					player.getInventory().getItemInHand().setItemMeta(itemmeta)
			ELSE
			ENDIF
		ENDIF
	ENDIF
ELSE
ENDIF