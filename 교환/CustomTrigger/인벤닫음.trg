nam = event.getView().getTitle().toString()
IF nam.contains("교환")
	playerName = player.getName()
	playerUuid = player.getUniqueId()
	{playerUuid+".trade"} = "ready"
	target = player({playerUuid+".tradeName"})
	SYNC
	target.closeInventory()
	target.sendMessage(color("&f[&6TRADE&f] &c거래가 완료되었거나 취소되었습니다."))
	ENDSYNC
ENDIF