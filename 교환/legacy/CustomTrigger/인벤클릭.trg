import java.lang.Short
title = event.getView().getTitle()
IF event.getClickedInventory() != null
type = event.getClickedInventory().getType().toString()
ENDIF
IF title.contains("교환")
pname = title.replace("교환 ", "")
pname = pname.split("/")
pnm1 = player(pname[0])
pnm2 = player(pname[1])

playerUuid = player.getUniqueId()
slot = event.getSlot()
target = player({playerUuid+".tradeName"})
	pl = title.replace("교환 ","")
	pl = pl.split("/")
	pl1 = pl[0]
	pl2 = pl[1]
	
	IF (action == "SHIFT_LEFT" || action == "SHIFT_RIGHT") && type == "PLAYER" && player.getName().toString() == pl2
		#CANCELEVENT
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

		IF pt214 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(14, item)
		ELSEIF pt215 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(15, item)
		ELSEIF pt216 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(16, item)
		ELSEIF pt217 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(17, item)
		ELSEIF pt223 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(23, item)
		ELSEIF pt224 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(24, item)
		ELSEIF pt225 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(25, item)
		ELSEIF pt226 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(26, item)
		ELSEIF pt233 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(32, item)
		ELSEIF pt234 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(33, item)
		ELSEIF pt235 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(34, item)
		ELSEIF pt236 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(35, item)
		ELSEIF pt241 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(41, item)
		ELSEIF pt242 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(42, item)
		ELSEIF pt243 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(43, item)
		ELSEIF pt244 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(44, item)
		ENDIF
	ELSE
	ENDIF	
	
	IF (action == "SHIFT_LEFT" || action == "SHIFT_RIGHT") && type == "PLAYER" && player.getName().toString() == pl1
		#CANCELEVENT
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
			item = event.getCurrentItem()

			IF pt19 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(9, item)

			ENDIF
			IF pt110 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(10, item)
			ENDIF
			IF pt111 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(11, item)
			ENDIF
			IF pt112 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(12, item)
			ENDIF
			
			IF pt118 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(18, item)
			ENDIF
			IF pt119 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(19, item)
			ENDIF
			IF pt120 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(20, item)
			ENDIF
			IF pt121 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(21, item)
			ENDIF
			
			IF pt128 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(27, item)
			ENDIF
			IF pt129 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(28, item)
			ENDIF
			IF pt130 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(29, item)
			ENDIF
			IF pt131 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(30, item)
			ENDIF
			
			IF pt137 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(36, item)
			ENDIF
			IF pt138 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(37, item)
			ENDIF
			IF pt139 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(38, item)
			ENDIF
			IF pt140 == null
			item = event.getCurrentItem()
			pinv = player.getInventory().remove(item)
			inv.setItem(39, item)
			ENDIF
	ELSE
	ENDIF	
	
			redpane = item("STAINED_GLASS", 1)
			redpane.setDurability(Short.valueOf("14"))
			redpanem = redpane.getItemMeta()
			redpanem.setDisplayName(color("&4&l준비 안됨"))
			redpane.setItemMeta(redpanem)
			
			limepane = item("STAINED_GLASS", 1)
			limepane.setDurability(Short.valueOf("5"))
			limepanem = limepane.getItemMeta()
			limepanem.setDisplayName(color("&4&l준비 안됨"))
			limepane.setItemMeta(limepanem)
			
			red = item("WOOL" ,1)
			red.setDurability(Short.valueOf("14"))
			redmeta = red.getItemMeta()
			redmeta.setDisplayName(color("&4&l준비 안됨"))
			red.setItemMeta(redmeta)
			
			green = item("WOOL", 1)
			green.setDurability(Short.valueOf("5"))
			greenmeta = green.getItemMeta()
			greenmeta.setDisplayName(color("&e&l거래준비 완료"))
			green.setItemMeta(greenmeta)
	IF type == "CHEST" && player.getName().toString() == pl2 && slot == 51
		slot = event.getSlot()
		itemn = event.getCurrentItem().getItemMeta()
		inv = event.getClickedInventory()
		IF itemn == redmeta
			inv.setItem(50, limepane)
			inv.setItem(51, green)
			inv.setItem(52, limepane)
			inv.setItem(53, limepane)
		ENDIF
		
		IF itemn == greenmeta
			inv.setItem(50, redpane)
			inv.setItem(51, red)
			inv.setItem(52, redpane)
			inv.setItem(53, redpane)
		ENDIF
	ENDIF
	
	IF type == "CHEST" && player.getName().toString() == pl1 && slot == 47
		slot = event.getSlot()
		itemn = event.getCurrentItem().getItemMeta()
		inv = event.getClickedInventory()
		IF itemn == redmeta
			inv.setItem(45, limepane)
			inv.setItem(47, green)
			inv.setItem(46, limepane)
			inv.setItem(48, limepane)
		ENDIF
		
		IF itemn == greenmeta
			inv.setItem(45, redpane)
			inv.setItem(47, red)
			inv.setItem(46, redpane)
			inv.setItem(48, redpane)
		ENDIF
	ENDIF
	
	IF type == "CHEST" && player.getName().toString() == pl2 && (slot == 0 || slot == 1 || slot == 2 || slot == 3 || slot == 5 || slot == 6 || slot == 7 || slot == 8 || slot == 9 || slot == 10 || slot == 11 || slot == 12 || slot == 18 || slot == 19 || slot == 20 || slot == 21 || slot == 27 || slot == 28 || slot == 29 || slot == 30 || slot == 36 || slot == 37 || slot == 38 || slot == 39 || slot == 45 || slot == 46 || slot == 47 || slot == 48 || slot == 50 || slot == 51 || slot == 52 || slot == 53)
		item = event.getCursor()
		IF player.getInventory().firstEmpty() != -1
		player.getInventory().setItem(player.getInventory().firstEmpty(), item)
		ENDIF
		event.setCursor(null)	
		#CANCELEVENT
	ENDIF
	IF type == "CHEST" && player.getName().toString() == pl1 && (slot == 0 || slot == 1 || slot == 2 || slot == 3 || slot == 5 || slot == 6 || slot == 7 || slot == 8 || slot == 14 || slot == 15 || slot == 16 || slot == 17 || slot == 23 || slot == 24 || slot == 25 || slot == 26 || slot == 31 || slot == 32 || slot == 33 || slot == 34 || slot == 41 || slot == 42 || slot == 43 || slot == 44 || slot == 45 || slot == 46 || slot == 47 || slot == 48 || slot == 50 || slot == 51 || slot == 52 || slot == 53)
		item = event.getCursor()
		IF player.getInventory().firstEmpty() != -1
		player.getInventory().setItem(player.getInventory().firstEmpty(), item)
		ENDIF
		event.setCursor(null)
	#CANCELEVENT
	ENDIF
	
	IF type == "CHEST" && (slot == 1 || slot == 4 || slot == 7 || slot == 13 || slot == 22 || slot == 31 || slot == 40 || slot == 49)
	#CANCELEVENT
	ENDIF
		inv = event.getClickedInventory()
		IF inv != null && type == "CHEST"
			pl1itemm = inv.getItem(47).getItemMeta()
			pl2itemm = inv.getItem(51).getItemMeta()
		ENDIF
	IF type == "CHEST" && pl1itemm == greenmeta && pl2itemm == greenmeta
		//p1
			o = 0
			i = 0
			FOR q = 0:36
			IF player.getInventory().getItem(q) == null
			o = o + 1
			ENDIF
			ENDFOR
		
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
			IF pt19 != null
				i = i+1
			ENDIF
			IF pt110 != null
				i = i+1
			ENDIF
			IF pt111 != null
				i = i+1
			ENDIF
			IF pt112 != null
				i = i+1
			ENDIF
			
			IF pt118 != null
				i = i+1
			ENDIF
			IF pt119 != null
				i = i+1
			ENDIF
			IF pt120 != null
				i = i+1
			ENDIF
			IF pt121 != null
				i = i+1
			ENDIF
			
			IF pt128 != null
				i = i+1
			ENDIF
			IF pt129 != null
				i = i+1
			ENDIF
			IF pt130 != null
				i = i+1
			ENDIF
			IF pt131 != null
				i = i+1
			ENDIF
			
			IF pt137 != null
				i = i+1
			ENDIF
			IF pt138 != null
				i = i+1
			ENDIF
			IF pt139 != null
				i = i+1
			ENDIF
			IF pt140 != null
				i = i+1
			ENDIF
		//p2
			k = 0
			j = 0
			FOR d = 0:36
			IF target.getInventory().getItem(d) == null
			k = k + 1
			ENDIF
			ENDFOR
			
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
			IF pt214 != null
				j = j+1
			ENDIF
			IF pt215 != null
				j = j+1
			ENDIF
			IF pt216 != null
				j = j+1
			ENDIF
			IF pt217 != null
				j = j+1
			ENDIF
			
			IF pt223 != null
				j = j+1
			ENDIF
			IF pt224 != null
				j = j+1
			ENDIF
			IF pt225 != null
				j = j+1
			ENDIF
			IF pt226 != null
				j = j+1
			ENDIF
			
			IF pt233 != null
				j = j+1
			ENDIF
			IF pt234 != null
				j = j+1
			ENDIF
			IF pt235 != null
				j = j+1
			ENDIF
			IF pt236 != null
				j = j+1
			ENDIF
			
			IF pt241 != null
				j = j+1
			ENDIF
			IF pt242 != null
				j = j+1
			ENDIF
			IF pt243 != null
				j = j+1
			ENDIF
			IF pt244 != null
				j = j+1
			ENDIF
		// i - p1교환 아이템 갯수 ,o - p1플레이어인벤 빈공간수, j - p2교환 아이템 갯수, k - p2플레이어인벤 빈공간수

		IF i <= k && j <= o && k != 0 && o != 0
			p2inv = pnm2.getInventory()
			p1inv = pnm1.getInventory()
			//교환성공
			//p2 > p1
			IF pt214 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt214)
			ENDIF
			IF pt215 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt215)
			ENDIF
			IF pt216 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt216)
			ENDIF
			IF pt217 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt217)
			ENDIF
			
			IF pt223 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt223)
			ENDIF
			IF pt224 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt224)
			ENDIF
			IF pt225 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt225)
			ENDIF
			IF pt226 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt226)
			ENDIF
			
			IF pt233 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt233)
			ENDIF
			IF pt234 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt234)
			ENDIF
			IF pt235 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt235)
			ENDIF
			IF pt236 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt236)
			ENDIF
			
			IF pt241 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt241)
			ENDIF
			IF pt242 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt242)
			ENDIF
			IF pt243 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt243)
			ENDIF
			IF pt244 != null
				slot = p1inv.firstEmpty()
				p1inv.setItem(slot, pt244)
			ENDIF
			
			//p1 > p2
			IF pt19 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt19)
			ENDIF
			IF pt110 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt110)
			ENDIF
			IF pt111 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt111)
			ENDIF
			IF pt112 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt112)
			ENDIF
			
			IF pt118 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt118)
			ENDIF
			IF pt119 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt119)
			ENDIF
			IF pt120 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt120)
			ENDIF
			IF pt121 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt121)
			ENDIF
			
			IF pt128 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt128)
			ENDIF
			IF pt129 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt129)
			ENDIF
			IF pt130 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt130)
			ENDIF
			IF pt131 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt131)
			ENDIF
			
			IF pt137 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt137)
			ENDIF
			IF pt138 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt138)
			ENDIF
			IF pt139 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt139)
			ENDIF
			IF pt140 != null
				slot = p2inv.firstEmpty()
				p2inv.setItem(slot, pt140)
			ENDIF
			pnm1.closeInventory()
			pnm2.closeInventory()
		ELSE
			p2inv = pnm2.getInventory()
			p1inv = pnm1.getInventory()
			//p2
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
			pnm1.closeInventory()
			pnm2.closeInventory()
			pnm1.sendMessage(color("&f[&6TRADE&f] &c거래를 완료하기위한 인벤토리의 빈공간이 모자랍니다."))
			pnm2.sendMessage(color("&f[&6TRADE&f] &c거래를 완료하기위한 인벤토리의 빈공간이 모자랍니다."))
		ENDIF
	ENDIF
ENDIF 
