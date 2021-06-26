IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.entity.EntityType

IF ($isop || $haspermission:"chi.holo.help") && (args.length == 0 || args[0] == "help")
#MESSAGE "&a========홀로그램 &b트리거리엑터 ver&a========"
#MESSAGE "&a/holo create <이름> (내용)"
#MESSAGE "&a/holo addline <이름> <내용>"
#MESSAGE "&a/holo delete <이름>"
#MESSAGE "&a/holo list"
#MESSAGE "&a/holo deleteline <이름> <라인 (1부터시작)>"
#MESSAGE "&a/holo editline <이름> <라인 (1부터시작)> <변경할 내용>"
#MESSAGE "&a/holo insertline <이름> <라인> <내용>"
ENDIF

IF ($isop || $haspermission:"chi.holo.create") && args[0] == "create"
	world = Bukkit.getWorld(player.getLocation().getWorld().getName())
	IF args.length >= 2
	    	list = {"chi.holo"}
	IF list != null
	    key = list()
        FOR ke = list.keySet()
		    key.add(ke)
	    ENDFOR
	    IF key.contains(args[1])
	    #MESSAGE "&a이미 존재하는 홀로그램입니다."
	    #STOP
	    ENDIF
	ENDIF
	ENDFOR

		{"chi.holo."+args[1]+".line.line1"} = mergeArguments(args,2)
		loc = player.getLocation()
		loc.setY(loc.getY()-1)
		SYNC
		entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
		ENDSYNC
		{"chi.holo."+args[1]+".uuid.uuid0"} = entity.getUniqueId()
		entity.setGravity(false)
        entity.setVisible(false)
        entity.setSmall(true)
        entity.setCustomName(color({"chi.holo."+args[1]+".line.line1"}))
        entity.setCustomNameVisible(true)
        #MESSAGE "&e"+args[1]+" &a홀로그램을 생성했습니다."
	ELSE
		{"chi.holo."+args[1]+".line.line1"} = color("&a내용이 설정되지 않았습니다! /holo editline &e"+args[1]+"&a 1 <내용> 으로 내용을 수정하세요!")
		loc = player.getLocation()
		loc.setY(loc.getY()-1)
		SYNC
		entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
		ENDSYNC
		{"chi.holo."+args[1]+".uuid.uuid0"} = entity.getUniqueId()
		entity.setGravity(false)
        entity.setVisible(false)
        entity.setSmall(true)
        entity.setCustomName(color({"chi.holo."+args[1]+".line.line1"}))
        entity.setCustomNameVisible(true)
        #MESSAGE "&e"+args[1]+" &a홀로그램을 생성했습니다."
	ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.delete") && args[0] == "delete"
	IF args.length == 0
		#MESSAGE "&a========홀로그램 &b트리거리엑터 ver&a========"
		#MESSAGE "&a/holo create <이름> (내용)"
		#MESSAGE "&a/holo addline <이름> <내용>"
		#MESSAGE "&a/holo deleteline <이름> <라인 (1부터시작)>"
		#MESSAGE "&a/holo editline <이름> <라인 (1부터시작)> <변경할 내용>"
		#MESSAGE "&a/holo insertline <이름> <라인> <내용>"
	ELSE
		list = {"chi.holo"}
	    IF list == null
	        #MESSAGE "&d이 서버엔 어느 홀로그램도 없습니다."
	        #STOP
	    ENDIF
		hololist = list()
		value = list()
		key = list()
		FOR ke = list.keySet()
		key.add(ke)
		ENDFOR
		FOR a = list.values()
		value.add(a)
		ENDFOR
		bvalue = list()
		FOR b = 0:value.size()
		cke = key.get(b)
		cke = cke.toString()
		c = value.get(b)
		c = c.toString()
		c = c.replace("{", "")
		c = c.replace("}", "")
	    c = c.split(",")
	    bvalue.add(cke)
	    ENDFOR
        IF !key.contains(args[1])
            #MESSAGE "&d해당 홀로그램은 존재하지 않습니다."
            #STOP
        ENDIF

        vuuid = {"chi.holo."+args[1]+".uuid"}
		uuid = {"chi.holo."+args[1]+".uuid.uuid0"}
		IF Bukkit.getEntity(uuid) != null && bvalue.contains(args[1])
		    FOR uuid = vuuid.values()
			Bukkit.getEntity(uuid).remove()
			ENDFOR
			{"chi.holo."+args[1]} = null
			#MESSAGE "&e"+args[1]+" &a홀로그램 삭제완료"
		ENDIF
	ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.list") && args[0] == "list"
kea = "&e홀로그램 목록&f : "
list = {"chi.holo"}
IF list != null
   IF list.toString() != "{}"
		FOR ke = list.keySet()
		IF kea == "&e홀로그램 목록&f : "
		    kea = kea + ke
		ELSE
		    kea = kea +", "+ke
		ENDIF
		ENDFOR
		#MESSAGE kea
    ELSE
        #MESSAGE kea + "&l없음"
    ENDIF
ELSE
    #MESSAGE kea + "&l없음"
ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.addline") && args[0] == "addline"
   IF args.length < 2
		#MESSAGE "&a========홀로그램 &b트리거리엑터 ver&a========"
		#MESSAGE "&a/holo create <이름> (내용)"
		#MESSAGE "&a/holo addline <이름> <내용>"
		#MESSAGE "&a/holo deleteline <이름> <라인 (1부터시작)>"
		#MESSAGE "&a/holo editline <이름> <라인 (1부터시작)> <변경할 내용>"
		#MESSAGE "&a/holo insertline <이름> <라인> <내용>"
        #STOP
    ENDIF
    list = {"chi.holo"}
	IF list == null
	   #MESSAGE "&d이 서버엔 어느 홀로그램도 없습니다."
	   #STOP
	ENDIF
	key = list()
	FOR ke = list.keySet()
	    key.add(ke)
    ENDFOR
    lkey = list()
    IF !key.contains(args[1])
        #MESSAGE "&d해당 홀로그램은 존재하지 않습니다."
        #STOP
    ELSE
        vline = {"chi.holo."+args[1]+".line"}
        uuids = {"chi.holo."+args[1]+".uuid"}
        uuid = list()
        world = Bukkit.getWorld("moneygame")
        FOR ui = uuids.values()
        uuid.add(ui)
        ENDFOR
        i = uuid.size()
        uuid = uuid.get(i-1)
        holo = Bukkit.getEntity(uuid)
        loc = holo.getLocation()
        FOR lke = vline.keySet()
        lkey.add(lke)
        ENDFOR
        nowline = lkey.size() + 1
        writeline = nowline + 1
        newy = loc.getY() - 0.25
        loc.setY(newy)
     	SYNC
		entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
		ENDSYNC
		{"chi.holo."+args[1]+".uuid.uuid"+writeline} = entity.getUniqueId()
		{"chi.holo."+args[1]+".line.line"+writeline} = mergeArguments(args,2)
		entity.setGravity(false)
        entity.setVisible(false)
        entity.setSmall(true)
        entity.setCustomName(color({"chi.holo."+args[1]+".line.line"+writeline}))
        entity.setCustomNameVisible(true)
        #MESSAGE "&e"+args[1]+" &a홀로그램에 "+mergeArguments(args,2)+"라고 추가했습니다."

    ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.deleteline") && args[0] == "deleteline"
       IF args.length < 3
		#MESSAGE "&a========홀로그램 &b트리거리엑터 ver&a========"
		#MESSAGE "&a/holo create <이름> (내용)"
		#MESSAGE "&a/holo addline <이름> <내용>"
		#MESSAGE "&a/holo deleteline <이름> <라인 (1부터시작)>"
		#MESSAGE "&a/holo editline <이름> <라인 (1부터시작)> <변경할 내용>"
		#MESSAGE "&a/holo insertline <이름> <라인> <내용>"
        #STOP
    ENDIF
ENDIF