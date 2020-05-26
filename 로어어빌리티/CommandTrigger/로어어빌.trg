IF $isop || $haspermisson:"chissentials.lorepower"
	IF args.length == 0
		#MESSAGE "&6&l/로어어빌 &d&l체력 &e&l<값>"
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
					IF lore.size() < 1
						lore.add(0, color("&d&l체력 &e&l+"+args[1]))
					ELSE
						lore.set(0, color("&d&l체력 &e&l+"+args[1]))
					ENDIF
				itemmeta.setLore(lore)
				player.getInventory().getItemInHand().setItemMeta(itemmeta)
			ELSE
				#MESSAGE "&6&l현재 로어어빌trgver은 체력증가만 지원하고 있습니다."
			ENDIF
		ENDIF
	ENDIF
ELSE
ENDIF