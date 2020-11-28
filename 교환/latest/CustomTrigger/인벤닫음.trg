nam = event.getView().getTitle().toString()
type = event.getInventory().getType().toString()
IF nam.contains("교환")
	playerName = player.getName()
	playerUuid = player.getUniqueId()
	pl = nam.replace("교환 ","")
	pl = pl.split("/")
	pnm1 = player(pl[0])
	pnm2 = player(pl[1])
			green = item("LIME_WOOL", 1)
			greenmeta = green.getItemMeta()
			greenmeta.setDisplayName(color("&e&l거래준비 완료"))
			green.setItemMeta(greenmeta)
	p2inv = pnm2.getInventory()
	p1inv = pnm1.getInventory()
		inv = event.getInventory()
		IF inv != null && type == "CHEST"
			pl1itemm = inv.getItem(47).getItemMeta()
			pl2itemm = inv.getItem(51).getItemMeta()
		ENDIF
	{playerUuid+".trade"} = "ready"
	target = player({playerUuid+".tradeName"})
	IF type == "CHEST" && pl1itemm == greenmeta && pl2itemm == greenmeta
	ELSE
	
			pt19 = inv.getItem(9)
			pt110 = inv.getItem(10)
			pt111 = inv.getItem(11)
			pt112 = inv.getItem(12)
			
			pt118 = inv.getItem(18)
			pt119 = inv.getItem(19)
			pt120 = inv.getItem(20)
			pt121 = inv.getItem(21)
			
			pt128 = inv.getItem(27)
			pt129 = inv.getItem(28)
			pt130 = inv.getItem(29)
			pt131 = inv.getItem(30)
			
			pt137 = inv.getItem(36)
			pt138 = inv.getItem(37)
			pt139 = inv.getItem(38)
			pt140 = inv.getItem(39)

			pt214 = inv.getItem(14)
			pt215 = inv.getItem(15)
			pt216 = inv.getItem(16)
			pt217 = inv.getItem(17)
			
			pt223 = inv.getItem(23)
			pt224 = inv.getItem(24)
			pt225 = inv.getItem(25)
			pt226 = inv.getItem(26)
			
			pt233 = inv.getItem(32)
			pt234 = inv.getItem(33)
			pt235 = inv.getItem(34)
			pt236 = inv.getItem(35)
			
			pt241 = inv.getItem(41)
			pt242 = inv.getItem(42)
			pt243 = inv.getItem(43)
			pt244 = inv.getItem(44)			
			p2inv = pnm2.getInventory()
			p1inv = pnm1.getInventory()
			//p2
		IF pnm2 == player
			IF pt214 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt214)
			ENDIF
			IF pt215 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt215)
			ENDIF
			IF pt216 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt216)
			ENDIF
			IF pt217 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt217)
			ENDIF
			
			IF pt223 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt223)
			ENDIF
			IF pt224 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt224)
			ENDIF
			IF pt225 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt225)
			ENDIF
			IF pt226 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt226)
			ENDIF
			
			IF pt233 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt233)
			ENDIF
			IF pt234 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt234)
			ENDIF
			IF pt235 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt235)
			ENDIF
			IF pt236 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt236)
			ENDIF
			
			IF pt241 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt241)
			ENDIF
			IF pt242 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt242)
			ENDIF
			IF pt243 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt243)
			ENDIF
			IF pt244 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt244)
			ENDIF
		ENDIF
		
		IF pnm1 == player
			//p1
			IF pt19 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt19)
			ENDIF
			IF pt110 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt110)
			ENDIF
			IF pt111 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt111)
			ENDIF
			IF pt112 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt112)
			ENDIF
			
			IF pt118 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt118)
			ENDIF
			IF pt119 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt119)
			ENDIF
			IF pt120 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt120)
			ENDIF
			IF pt121 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt121)
			ENDIF
			
			IF pt128 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt128)
			ENDIF
			IF pt129 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt129)
			ENDIF
			IF pt130 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt130)
			ENDIF
			IF pt131 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt131)
			ENDIF
			
			IF pt137 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt137)
			ENDIF
			IF pt138 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt138)
			ENDIF
			IF pt139 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt139)
			ENDIF
			IF pt140 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt140)
			ENDIF
		ENDIF
	ENDIF
	SYNC
	target.closeInventory()
	target.sendMessage(color("&f[&6TRADE&f] &c거래가 완료되었거나 취소되었습니다."))
	ENDSYNC
ENDIF