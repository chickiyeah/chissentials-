import org.bukkit.enchantments.Enchantment
import org.bukkit.inventory.ItemFlag
import java.util.Arrays
import java.lang.Short

IF $isop || $haspermisson:"chissentials.itemset"
	IF args.length == 0
		#MESSAGE "&a&l<내용> &f&l- &6&l필수로 써야하는 것입니다. &e&l(내용) &f&l- &6&l선택적으로 사용할수 있습니다."
		#MESSAGE "&6&l/아이템 이름설정 &a&l<이름> &f&l- &6&l아이템의 이름을 설정합니다. 색깔 코드 가능"
		#MESSAGE "&6&l/아이템 설명 추가 &a&l<라인(그냥 추가시 -1 )> <설명> &f&l- &6&l아이템의 설명(로어)을 추가합니다. 색깔 코드 가능"
		#MESSAGE "&6&l/아이템 설명 삭제 &a&l<라인> &f&l- &6&l아이템의 설명(로어)를 삭제합니다."
                #MESSAGE "&6&l/아이템 플래그 <추가/삭제> <플래그>"
		#MESSAGE "&6&l/아이템 인첸트 &a&l<인첸트명> &e&l(레벨) &f&l- &6&l아이템을 인첸트합니다."
		#MESSAGE "&6&l/아이템 <파괴되지/부서지지> 않음 &f&l- &6&l아이템을 부서지지 않음 상태로 전환합니다. &d&l(재사용시 다시 내구도 상태로 돌아옵니다.)"
	ELSE
		IF args[0] == "이름설정"
			IF player.getInventory().getItemInHand().getType().toString() == "AIR"
				#MESSAGE "&6&l명령어 사용전 손에 아이템을 들어주세요!"
			ELSE
				IF args.length == 1
					beforename = player.getInventory().getItemInHand().getItemMeta().getDisplayName()
					IF beforename == "null"
						beforename = "&f&l없음"
					ELSE
						beforename = beforename.toString()
					ENDIF
					#MESSAGE "&6&l아이템의 이름으로 설정할 것을 명령어에 같이 입력해주세요!"
					#MESSAGE "&6&l현재 설정된 사설 이름 : "+beforename
				ELSE
					name = mergeArguments(args, 1)
					itemmeta = player.getInventory().getItemInHand().getItemMeta()
					itemmeta.setDisplayName(color(name))
					
					player.getInventory().getItemInHand().setItemMeta(itemmeta)
				ENDIF
				#STOP
			ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "설명"
			IF args.length == 1
				#MESSAGE "/아이템 설명 추가 <라인(그냥 추가시 -1 )> <설명> - 아이템의 설명(로어)을 추가합니다 색깔 코드 가능"
				#MESSAGE "/아이템 설명 삭제 <라인> - 아이템의 설명(로어)를 삭제합니다"
				beforelore = player.getInventory().getItemInHand().getItemMeta().getLore()
				#MESSAGE ""
					IF beforelore == "null"
						beforelore = "&f&l없음"
						#MESSAGE "&6&l현재 설정된 아이템 설정(로어) : "+beforelore
					ELSE
						size = beforelore.size()
						FOR i = 0:size
							IF i == 0 
								beforelo = "&f&l0. "+beforelore.get(i)
							ELSE
								beforelo = beforelo + "&f&l, "+i+". "+beforelore.get(i)
							ENDIF
						ENDFOR
						#MESSAGE "&6&l현재 설정된 아이템 설정(로어) : "+beforelo
					ENDIF
				#STOP
			ELSE
			ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "설명" && args[1] == "추가"
			IF player.getInventory().getItemInHand().getType().toString() == "AIR"
				#MESSAGE "&6&l명령어 사용전 손에 아이템을 들어주세요!"
			ELSE
				IF args.length == 2
					#MESSAGE "/아이템 설명 추가 <라인(그냥 추가시 -1 )> <설명> - 아이템의 설명(로어)을 추가합니다 색깔 코드 가능"
					#STOP
				ELSE
				ENDIF
				IF args.length == 3
					beforelore = player.getInventory().getItemInHand().getItemMeta().getLore()
					#MESSAGE "&6&l아이템의 설명(로어)로 추가할 것을 명령어에 같이 입력해주세요!"
					IF beforelore == "null"
						beforelore = "&f&l없음"
						#MESSAGE "&6&l현재 설정된 아이템 설정(로어) : "+beforelore
					ELSE
						size = beforelore.size()
						FOR i = 0:size
							IF i == 0 
								beforelo = "&f&l0. "+beforelore.get(i)
							ELSE
								beforelo = beforelo + "&f&l, "+i+". "+beforelore.get(i)
							ENDIF
						ENDFOR
						#MESSAGE "&6&l현재 설정된 아이템 설정(로어) : "+beforelo
					ENDIF
				ELSE
					beforelore = player.getInventory().getItemInHand().getItemMeta().getLore()
					IF beforelore == "null"
						beforelor = list()
					ELSE
						beforelor = beforelore
					ENDIF
					lore = "&f"+mergeArguments(args, 3)
					
					IF args[2] == "-1"
						itemmeta = player.getInventory().getItemInHand().getItemMeta()
						IF lore == "&fnull"
							beforelor.add(" ")
						ELSE
							beforelor.add(color(lore))
						ENDIF
						itemmeta.setLore(beforelor)
					ELSE
						size = beforelore.size()
						IF $isnumber:args[2]
						args2 = args[2].toString()
						args2 = parseInt(args2)
							IF args2 > size
								#MESSAGE "&6&l삽입 라인은 라인 최대치를 넘어설수 없습니다."
								#MESSAGE "&6&l현재 라인 최대치 : &e&l"+size
							ELSE
								itemmeta = player.getInventory().getItemInHand().getItemMeta()
								IF lore == "&fnull"
									beforelor.add(" ")
								ELSE
									beforelor.add(args2, color(lore))
								ENDIF						
								itemmeta.setLore(beforelor)
							ENDIF
						ELSE
							#MESSAGE "&6&l라인은 숫자만 작성되어야합니다."
						ENDIF
					ENDIF				
					player.getInventory().getItemInHand().setItemMeta(itemmeta)
				ENDIF				
			ENDIF
		ELSE
		ENDIF
			
		IF args[0] == "설명" && args[1] == "삭제"
			IF player.getInventory().getItemInHand().getType().toString() == "AIR"
				#MESSAGE "&6&l명령어 사용전 손에 아이템을 들어주세요!"
			ELSE
				IF args.length == 2
					#MESSAGE "&6&l아이템의 설명(로어)에서 삭제할 라인을 명령어에 같이 입력해주세요!"
				ELSE
					beforelore = player.getInventory().getItemInHand().getItemMeta().getLore()
					IF beforelore == "null"
						#MESSAGE "&6&l삭제할 수 있는 설명(로어)이(가) 없습니다."
					ELSE
						size = beforelore.size()
						args2 = args[2].toString()
						args2 = parseInt(args2)
						num = size - 1
						IF args2 > num
							#MESSAGE "&6&l삭제할 라인은 라인 최대치를 넘어설수 없습니다."
							#MESSAGE "&6&l현재 라인 최대치 : &e&l"+num
						ELSE
							beforelor = beforelore
							itemmeta = player.getInventory().getItemInHand().getItemMeta()
							beforelor.remove(args2)
							itemmeta.setLore(beforelor)
							player.getInventory().getItemInHand().setItemMeta(itemmeta)
						ENDIF
					ENDIF
				ENDIF
			ENDIF
		ELSE		
		ENDIF
		
		IF args[0] == "내구도" && args[1] == "설정"
			dur = Short.parseShort(args[2])
			player.getInventory().getItemInHand().setDurability(dur)
		ELSE
		ENDIF
		
		
		IF args[0] == "플래그" && args[1] == "추가"
			itemmeta = player.getInventory().getItemInHand().getItemMeta()
			flag = ItemFlag.valueOf(args[2])
			itemmeta.addItemFlags(flag)
			player.getInventory().getItemInHand().setItemMeta(itemmeta)
		ELSE
		ENDIF
		
		IF args[0] == "플래그" && args[1] == "삭제"
			itemmeta = player.getInventory().getItemInHand().getItemMeta()
			flag = ItemFlag.valueOf(args[2])
			itemmeta.removeItemFlags(flag)
			player.getInventory().getItemInHand().setItemMeta(itemmeta)
		ELSE
		ENDIF
		
		IF args[0] == "인첸트"
			itemmeta = player.getInventory().getItemInHand().getItemMeta()	
			enc = Enchantment.getByName(args[1])
			IF enc == "null"
				#MESSAGE "&6&l존재하지 않는 인첸트입니다."
			ELSE
				IF args.length == 2
					itemmeta.addEnchant(enc, 1, true)
				ELSE
					itemmeta.addEnchant(enc, parseInt(args[2]), true)
				ENDIF
				player.getInventory().getItemInHand().setItemMeta(itemmeta)
			ENDIF
		ELSE
		ENDIF
		
		IF args[0] == "파괴되지" || args[0] == "부서지지" && args[1] == "않음"
			itemmeta = player.getInventory().getItemInHand().getItemMeta()
			IF itemmeta.isUnbreakable() == false
				itemmeta.setUnbreakable(true)
				#MESSAGE "&6&l아이템을 부서지지 않음 상태로 설정하였습니다."
			ELSE
				itemmeta.setUnbreakable(false)
				#MESSAGE "&6&l아이템을 부서지지 않음 상태에서 헤제하였습니다."
			ENDIF
			player.getInventory().getItemInHand().setItemMeta(itemmeta)
		ELSE
		ENDIF
	ENDIF
ELSE
	#MESSAGE "&6&l이 명령어를 사용할 수 있는 권한이 없습니다."
ENDIF
