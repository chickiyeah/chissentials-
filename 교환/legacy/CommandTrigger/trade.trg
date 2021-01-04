import org.bukkit.Material
import com.mojang.authlib.GameProfile
import java.lang.Short
import java.util.Base64
import org.bukkit.Bukkit

IF args.length == 1
	IF args[0].equals("help")
		SYNC
		player.sendMessage(color("&f[&6TRADE&f] &b/trade <name> &8- &7플레이어에게 거래를 요청합니다"))
		player.sendMessage(color("&f[&6TRADE&f] &b/trade accept &8- &7거래 요청을 승락합니다"))
		ENDSYNC
	ELSEIF args[0].equals("accept")
		SYNC
		IF {$playeruuid+".trade"} != "wait"
			player.sendMessage(color("&f[&6TRADE&f] &c수락할 거래가 없습니다"))
		ELSE
			{$playeruuid+".trade"} = "trading"
			target = player({$playeruuid+".tradeName"})
			targetUuid = target.getUniqueId()
			{targetUuid+".trade"} = "trading"
			{targetUuid+".tradeName"} = $playerName
			IF target == null
				player.sendMessage(color("&f[&6TRADE&f] &c요청 플레이어가 서버를 떠났습니다"))
				#STOP
			ENDIF
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
			
			redpane = item("STAINED_GLASS", 1)
			redpane.setDurability(Short.valueOf("14"))
			redpanem = redpane.getItemMeta()
			redpanem.setDisplayName(color("&4&l준비 안됨"))
			redpane.setItemMeta(redpanem)
			
			limepane = item("STAINED_GLASS", 5)
			limepanem = limepane.getItemMeta()
			limepanem.setDisplayName(color("&4&l준비 안됨"))
			limepane.setItemMeta(limepanem)
			
			glass = item("THIN_GLASS", 1)
			fence = item("IRON_FENCE", 1)
			head1 = headForName(player.getName())
			
			head2 = headForName(target.getName())
			
			inventory = Bukkit.createInventory(null, 54, "교환 "+$playerName+"/"+target.getName())
			inventory.setItem(0, fence)
			inventory.setItem(1, head1)
			inventory.setItem(2, fence)
			inventory.setItem(3, fence)
			inventory.setItem(4, glass)
			inventory.setItem(5, fence)
			inventory.setItem(6, fence)
			inventory.setItem(7, head2)
			inventory.setItem(8, fence)
			inventory.setItem(13, glass)
			inventory.setItem(22, glass)
			inventory.setItem(31, glass)
			inventory.setItem(40, glass)
			inventory.setItem(45, redpane)
			inventory.setItem(46, redpane)
			inventory.setItem(47, red)
			inventory.setItem(48, redpane)
			inventory.setItem(49, glass)
			inventory.setItem(50, redpane)
			inventory.setItem(51, red)
			inventory.setItem(52, redpane)
			inventory.setItem(53, redpane)
			player.openInventory(inventory)
			target.openInventory(inventory)
		ENDIF
		ENDSYNC
	ELSE
		SYNC
		target = player(args[0])
		IF target == player
			player.sendMessage(color("&f[&6TRADE&f] &c본인에게는 교환요청을 걸수 없습니다."))
			#STOP
		ENDIF	
		IF target == null
			player.sendMessage(color("&f[&6TRADE&f] &c해당 닉네임은 존재하지 않는 유저입니다."))
			#STOP
		ENDIF
		targetName = target.getName()
		targetUuid = target.getUniqueId()
		playerName = player.getName()
		playerUuid = player.getUniqueId()
		
		IF target == null
			player.sendMessage(color("&f[&6TRADE&f] &c해당 유저가 존재하지 않습니다"))
			#STOP
		ELSEIF {targetUuid+".trade"} != "ready"
			player.sendMessage(color("&f[&6TRADE&f] &c해당 플레이어는 이미 요청 수락 중이거나 거래 중입니다"))
			#STOP
		ENDIF
		
		{targetUuid+".trade"} = "wait"
		{targetUuid+".tradeName"} = playerName
		
		player.sendMessage(color("&f[&6TRADE&f] &a"+targetName+"&f님께 거래 요청을 보냈습니다"))
		target.sendMessage(color("&f[&6TRADE&f] &a"+playerName+"&f님께서 거래를 신청 하였습니다"))
		target.sendMessage(color("&f[&6TRADE&f] &f거래를 &a승락&f하시려면 10초 이내로 &b/trade accept &f명령어를 치세요"))
		ENDSYNC
		
		#WAIT 10
		IF {targetUuid+".trade"} == "wait"
			player.sendMessage(color("&f[&6TRADE&f] &c"+targetName+"님께서 거래 수락을 하지 않았습니다"))
			player.sendMessage(color("&f[&6TRADE&f] &c거래뒤에 발생하는 메시지라면 무시해주세요!"))
			target.sendMessage(color("&f[&6TRADE&f] &c"+playerName+"님의 거래요청을 수락하지 않았습니다"))
			target.sendMessage(color("&f[&6TRADE&f] &c거래뒤에 발생하는 메시지라면 무시해주세요!"))
			{targetUuid+".trade"} = "ready"
			{targetUuid+".tradeName"} = "nulle"
		ENDIF
	ENDIF
ELSE
	player.sendMessage(color("&f[&6TRADE&f] &c/trade help에서 도움말을 확인하세요"))
ENDIF
