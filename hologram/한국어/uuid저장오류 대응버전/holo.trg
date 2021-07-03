//triggerreactor hologram project
//2차 수정가능 2차 배포금지 maker명령어 삭제/수정 금지
//제작자 치키이예#0032
IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.entity.EntityType
IMPORT java.util.UUID

IF (($isop || $haspermission:"chi.holo.help") && (args.length == 0 || args[0] == "help"))
#MESSAGE "&a========홀로그램 &b트리거리엑터 ver&a========"
#MESSAGE "&a/holo create <이름> (내용)"
#MESSAGE "&a/holo addline <이름> <내용>"
#MESSAGE "&a/holo delete <이름>"
#MESSAGE "&a/holo list"
#MESSAGE "&a/holo deleteline <이름> <라인 (1부터시작)>"
#MESSAGE "&a/holo editline <이름> <라인 (1부터시작)> <변경할 내용>"
#MESSAGE "&a/holo insertline <이름> <라인> <내용>"
#MESSAGE "&a/holo tphere <이름>"
#MESSAGE "&a/holo reset"
#MESSAGE "&a/holo regen <이름/all>"
#MESSAGE "&a/holo maker"
#STOP
ENDIF

IF ($isop || $haspermission:"chi.holo.create") && args[0] == "create"
	world = Bukkit.getWorld(player.getLocation().getWorld().getName())
	IF args.length > 2
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
		{"chi.holo."+args[1]+".line.line1"} = mergeArguments(args,2)
		loc = player.getLocation()
		loc.setY(loc.getY()-1)
		SYNC
		entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
		ENDSYNC
		{"chi.holo."+args[1]+".uuid.uuid1"} = entity.getUniqueId().toString()
		entity.setGravity(false)
        entity.setVisible(false)
        entity.setSmall(true)
        entity.setCustomName(color({"chi.holo."+args[1]+".line.line1"}))
        entity.setCustomNameVisible(true)
        {"chi.holo."+args[1]+".location.location1"} = entity.getLocation()
        #MESSAGE "&e"+args[1]+" &a홀로그램을 생성했습니다."
	ELSE
		{"chi.holo."+args[1]+".line.line1"} = color("&a내용이 설정되지 않았습니다! /holo editline &e"+args[1]+"&a 1 <내용> 으로 내용을 수정하세요!")
		loc = player.getLocation()
		loc.setY(loc.getY()-1)
		SYNC
		entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
		ENDSYNC
		{"chi.holo."+args[1]+".uuid.uuid1"} = entity.getUniqueId().toString()
		entity.setGravity(false)
        entity.setVisible(false)
        entity.setSmall(true)
        entity.setCustomName(color({"chi.holo."+args[1]+".line.line1"}))
        entity.setCustomNameVisible(true)
        {"chi.holo."+args[1]+".location.location1"} = entity.getLocation()
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
		#MESSAGE "&a/holo tphere <이름>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <이름/all>"
		#MESSAGE "&a/holo maker"
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
		uuid = {"chi.holo."+args[1]+".uuid.uuid1"}
		uuid = UUID.fromString(uuid)
		IF Bukkit.getEntity(uuid) != null && bvalue.contains(args[1])
		    FOR uuid = vuuid.values()
			uuid = UUID.fromString(uuid)
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
		#MESSAGE "&a/holo tphere <이름>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <이름/all>"
		#MESSAGE "&a/holo maker"
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
        IF {"chi.holo."+args[1]+".lineadding"} == true
            #MESSAGE "&4이미 이 홀로그램에 대한 라인 추가 작업이 진행중입니다!"
            #STOP
        ENDIF
        {"chi.holo."+args[1]+".lineadding"} = true
        vline = {"chi.holo."+args[1]+".line"}
        uuids = {"chi.holo."+args[1]+".uuid"}
        uuid = list()
        FOR ui = uuids.values()
        uuid.add(ui)
        ENDFOR
        i = uuid.size()
        uuid = uuid.get(i-1)
		uuid = UUID.fromString(uuid)
        holo = Bukkit.getEntity(uuid)
        loc = holo.getLocation()
        world = loc.getWorld()
        FOR lke = vline.keySet()
        lkey.add(lke)
        ENDFOR
        nowline = lkey.size() + 1
        writeline = nowline
        IF {"chi.holo."+args[1]+".location.location"+lkey.size()} == loc
        {"chi.holo."+args[1]+".location.adprevlocation"} = loc
            newy = loc.getY() - 0.25
            loc.setY(newy)
        ELSE
            IF ({"chi.holo."+args[1]+".location.adprevlocation"} == {"chi.holo."+args[1]+".location.location"+lkey.size()}) != null
               prevloc = {"chi.holo."+args[1]+".location.adprevlocation"}
               newy = prevloc.getY() - 0.25
               loc.setY(newy)
                {"chi.holo."+args[1]+".location.adprevlocation"} = loc
            ENDIF
        ENDIF

        {"chi.holo."+args[1]+".location.location"+writeline} = loc
     	SYNC
		entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
		ENDSYNC
		{"chi.holo."+args[1]+".uuid.uuid"+writeline} = entity.getUniqueId().toString()
		{"chi.holo."+args[1]+".line.line"+writeline} = mergeArguments(args,2)
		entity.setGravity(false)
        entity.setVisible(false)
        entity.setSmall(true)
        entity.setCustomName(color({"chi.holo."+args[1]+".line.line"+writeline}))
        entity.setCustomNameVisible(true)
        #MESSAGE "&e"+args[1]+" &a홀로그램에 "+mergeArguments(args,2)+"&a라고 추가했습니다."
        {"chi.holo."+args[1]+".lineadding"} = false
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
		#MESSAGE "&a/holo tphere <이름>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <이름/all>"
		#MESSAGE "&a/holo maker"
        #STOP
    ELSE
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
            FOR ui = uuids.values()
                uuid.add(ui)
            ENDFOR
            i = uuid.size()

            FOR lke = vline.keySet()
                lkey.add(lke)
            ENDFOR
            IF (lkey.size() == parseInt(args[2])) == 1
                #MESSAGE "&4라인이 하나밖에 없습니다! 라인을 삭제할수 없습니다!"
                #STOP
            ENDIF
            IF {"chi.holo."+args[1]+".linedeleting"} == true
                #MESSAGE "&4이미 해당 홀로그램에 대해 삭제작업이 진행중입니다!"
                #STOP
            ENDIF
            IF lkey.size() < parseInt(args[2])
                #MESSAGE "&d해당 라인은 존재하지 않습니다. 현재 끝라인 "+lkey.size()
                #STOP
            ELSE
                {"chi.holo."+args[1]+".linedeleting"} = true
                FOR i = parseInt(args[2]):lkey.size()+1
                    j = i+1
                    entity = Bukkit.getEntity(UUID.fromString(uuid.get(i-1)))
                    {"chi.holo."+args[1]+".line.line"+i} = {"chi.holo."+args[1]+".line.line"+j}
                    IF {"chi.holo."+args[1]+".line.line"+i} == null
                        #BREAK
                    ENDIF
                ENDFOR
                uid = {"chi.holo."+args[1]+".uuid.uuid"+lkey.size()}
				uid = UUID.fromString(uid)
                Bukkit.getEntity(uid).remove()
                {"chi.holo."+args[1]+".uuid.uuid"+lkey.size()} = null
                {"chi.holo."+args[1]+".line.line"+lkey.size()} = null
                {"chi.holo."+args[1]+".location.location"+lkey.size()} = null
                j = lkey.size() - 1
                 {"chi.holo."+args[1]+".location.adprevlocation"} = {"chi.holo."+args[1]+".location.location"+j}

            FOR ui = uuids.values()
				ui = UUID.fromString(ui)
                uuid.add(ui)
            ENDFOR
            i = uuid.size()

            FOR lke = vline.keySet()
                lkey.add(lke)
            ENDFOR

                FOR I = 0:lkey.size() - 1
                    J = I + 1
                    IF {"chi.holo."+args[1]+".uuid.uuid"+J} == null
                        #BREAK
                    ENDIF
					uuid = {"chi.holo."+args[1]+".uuid.uuid"+J}
					uuid = UUID.fromString(uuid)
                    entity = Bukkit.getEntity(uuid)
                     entity.setCustomName(color({"chi.holo."+args[1]+".line.line"+J}))
                ENDFOR
                {"chi.holo."+args[1]+".linedeleting"} = false
            ENDIF
        ENDIF
    ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.tphere") && args[0] == "tphere"
	IF args.length < 2
		#MESSAGE "&a========홀로그램 &b트리거리엑터 ver&a========"
		#MESSAGE "&a/holo create <이름> (내용)"
		#MESSAGE "&a/holo addline <이름> <내용>"
		#MESSAGE "&a/holo deleteline <이름> <라인 (1부터시작)>"
		#MESSAGE "&a/holo editline <이름> <라인 (1부터시작)> <변경할 내용>"
		#MESSAGE "&a/holo insertline <이름> <라인> <내용>"
		#MESSAGE "&a/holo tphere <이름>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <이름/all>"
		#MESSAGE "&a/holo maker"
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
		uuid = {"chi.holo."+args[1]+".uuid.uuid1"}
		uuid = UUID.fromString(uuid)
		holo = Bukkit.getEntity(uuid)
		FOR lke = vline.keySet()
			lkey.add(lke)
        ENDFOR
		nowline = lkey.size() + 1
		playerloc = player.getLocation()
		FOR i = 1:nowline
			uuid = {"chi.holo."+args[1]+".uuid.uuid"+i}
			uuid = UUID.fromString(uuid)
			holo = Bukkit.getEntity(uuid)

			playerloc.setY(playerloc.getY()-0.25)

			holo.teleport(playerloc)
			#MESSAGE "&e"+args[1]+"홀로그램을 발밑으로 이동시켰습니다!"
		ENDFOR
	ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.reset") && args[0] == "reset"
    IF args.length == 1
        #MESSAGE "&4정말 모든 홀로그램과 데이터를 삭제할까요?"
        #MESSAGE "&4이 작업은 취소할수 없습니다!!"
        #MESSAGE "&4정말 초기화할거면 /holo reset confirm 을(를) 입력해주세요."
        #STOP
    ELSE
        IF args[1] == "confirm"
        		list = {"chi.holo"}
        		key = list()
		            FOR ke = list.keySet()
		            key.add(ke)
		        ENDFOR
		        FOR i = 1:key.size()+1
		            j = i - 1
		            k = key.get(j)
		            value = {"chi.holo."+k+".line"}
		            avalue = list()
		            FOR uv = value.values()
		                avalue.add(uv)
		            ENDFOR
		            FOR I = 0:avalue.size()
		                J = I + 1
		                uid = {"chi.holo."+k+".uuid.uuid"+J}
						uid = UUID.fromString(uid)
                        Bukkit.getEntity(uid).remove()
		            ENDFOR
		        ENDFOR
            {"chi.holo"} = null
            #MESSAGE "&4모든 홀로그램과 데이터를 삭제하고 초기화 했습니다."
            #STOP
        ENDIF
    ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.editline") && args[0] == "editline"
    IF args.length < 3
		#MESSAGE "&a========홀로그램 &b트리거리엑터 ver&a========"
		#MESSAGE "&a/holo create <이름> (내용)"
		#MESSAGE "&a/holo addline <이름> <내용>"
		#MESSAGE "&a/holo deleteline <이름> <라인 (1부터시작)>"
		#MESSAGE "&a/holo editline <이름> <라인 (1부터시작)> <변경할 내용>"
		#MESSAGE "&a/holo insertline <이름> <라인> <내용>"
		#MESSAGE "&a/holo tphere <이름>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <이름/all>"
		#MESSAGE "&a/holo maker"
        #STOP
    ELSE
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
            key = list()
            FOR l = vline.keySet()
                key.add(l)
            ENDFOR
            IF {"chi.holo."+args[1]+".line.line"+args[2]} == null
                #MESSAGE "&4해당 라인은 존재 하지 않습니다. 현재 끝라인 : "+key.size()
                #STOP
            ELSE
                {"chi.holo."+args[1]+".line.line"+args[2]} = mergeArguments(args,3)
                uid = {"chi.holo."+args[1]+".uuid.uuid"+args[2]}
				uid = UUID.fromString(uid)
                Bukkit.getEntity(uid).setCustomName(color({"chi.holo."+args[1]+".line.line"+args[2]}))
                #MESSAGE "&a성공적으로 "+args[2]+"라인의 내용을 "+mergeArguments(args,3)+"로 변경했습니다."
            ENDIF
        ENDIF
    ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.regen") && args[0] == "regen"
    IF args.length < 2
		#MESSAGE "&a========홀로그램 &b트리거리엑터 ver&a========"
		#MESSAGE "&a/holo create <이름> (내용)"
		#MESSAGE "&a/holo addline <이름> <내용>"
		#MESSAGE "&a/holo deleteline <이름> <라인 (1부터시작)>"
		#MESSAGE "&a/holo editline <이름> <라인 (1부터시작)> <변경할 내용>"
		#MESSAGE "&a/holo insertline <이름> <라인> <내용>"
		#MESSAGE "&a/holo tphere <이름>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <이름/all>"
		#MESSAGE "&a/holo maker"
        #STOP
    ELSE
        IF args[1] == "all"
        	list = {"chi.holo"}
        	key = list()
		        FOR ke = list.keySet()
		        key.add(ke)
		    ENDFOR
		    FOR i = 1:key.size()+1
		         j = i - 1
		         k = key.get(j)
		         value = {"chi.holo."+k+".line"}
		         avalue = list()
		         FOR uv = value.values()
		             avalue.add(uv)
		         ENDFOR
		         FOR I = 0:avalue.size()
		             J = I + 1
		             uid = {"chi.holo."+k+".uuid.uuid"+J}
					 uid = UUID.fromString(uid)
		             IF Bukkit.getEntity(uid) != null
		                Bukkit.getEntity(uid).remove()
		             ENDIF
		             loc = {"chi.holo."+k+".location.location"+J}
						locy = loc.getY()
						K = J +1
						IF {"chi.holo."+args[1]+".location.location"+K} != null
						nextloc = {"chi.holo."+args[1]+".location.location"+K}
						nextlocy = nextloc.getY()
							IF locy - 0.25 != nextlocy
							y = locy - 0.25
							nextloc.setY(y)
							{"chi.holo."+args[1]+".location.location"+K} = nextloc
							ENDIF
						ENDIF
		             world = loc.getWorld()
                    SYNC
                    entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
                    ENDSYNC
                    {"chi.holo."+k+".uuid.uuid"+J} = entity.getUniqueId().toString()
                    entity.setGravity(false)
                    entity.setVisible(false)
                    entity.setSmall(true)
                    entity.setCustomName(color({"chi.holo."+k+".line.line"+J}))
                    entity.setCustomNameVisible(true)
		         ENDFOR
		    ENDFOR
		    #MESSAGE "&a모든 홀로그램을 재 소환했습니다!"
		ELSE
		    list = {"chi.holo"}
        	key = list()
		        FOR ke = list.keySet()
		        key.add(ke)
		    ENDFOR
		    IF key.contains(args[1])
                 value = {"chi.holo."+args[1]+".line"}
		         avalue = list()
		         FOR uv = value.values()
		             avalue.add(uv)
		         ENDFOR
		         FOR I = 0:avalue.size()
		             J = I + 1
		             uid = {"chi.holo."+args[1]+".uuid.uuid"+J}
					 uid = UUID.fromString(uid)
		             IF Bukkit.getEntity(uid) != null
					 LOC = Bukkit.getEntity(uid).getLocation()
		                Bukkit.getEntity(uid).remove()
		             ENDIF
		             loc = {"chi.holo."+args[1]+".location.location"+J}
						locy = loc.getY()
						K = J +1
						IF {"chi.holo."+args[1]+".location.location"+K} != null
						nextloc = {"chi.holo."+args[1]+".location.location"+K}
						nextlocy = nextloc.getY()
							IF locy - 0.25 != nextlocy
							y = locy - 0.25
							nextloc.setY(y)
							{"chi.holo."+args[1]+".location.location"+K} = nextloc
							ENDIF
						ENDIF
		             world = loc.getWorld()
                    SYNC
                    entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
                    ENDSYNC
                    {"chi.holo."+args[1]+".uuid.uuid"+J} = entity.getUniqueId().toString()
                    entity.setGravity(false)
                    entity.setVisible(false)
                    entity.setSmall(true)
                    entity.setCustomName(color({"chi.holo."+args[1]+".line.line"+J}))
                    entity.setCustomNameVisible(true)
		         ENDFOR
				 
		         #MESSAGE "&a"+args[1]+" 홀로그램을 재 소환했습니다!"
		    ELSE
		        #MESSAGE "&4해당 트리거는 존재하지 않습니다."
		    ENDIF
        ENDIF
    ENDIF
ENDIF

IF args[0] == "maker"
    #MESSAGE "&e제작자 : 치키이예#0032"
    #MESSAGE "&d제작자 트위치 : https://www.twitch.tv/ruddls030"
    #MESSAGE "&e제작에 도움을 주신분 : 콜다님"
    #MESSAGE "&e제작 이용 플러그인 : triggerreactor(트리거 리엑터)"
    #MESSAGE "&ahttps://github.com/TriggerReactor/TriggerReactor/releases"
    #MESSAGE "&e플러그인 디스코드 : https://discord.gg/U3pyUYc"
    #MESSAGE "&a버그/개선사항 제보는 디스코드 : &e치키이예#0032&a로 남겨주시면 감사하겠습니다."
    #MESSAGE "&e트리거 리엑터 플러그인을 만들어주신 wyshon님에게 다시한번 감사를 표합니다."
    #MESSAGE "&4본 트리거는 2차 배포가 금지되어있습니다. Secondary deployment is not allowed."
    #STOP
ENDIF

IF ($isop || $haspermission:"chi.holo.insertline") && args[0] == "insertline"
     IF args.length < 3
		#MESSAGE "&a========홀로그램 &b트리거리엑터 ver&a========"
		#MESSAGE "&a/holo create <이름> (내용)"
		#MESSAGE "&a/holo addline <이름> <내용>"
		#MESSAGE "&a/holo deleteline <이름> <라인 (1부터시작)>"
		#MESSAGE "&a/holo editline <이름> <라인 (1부터시작)> <변경할 내용>"
		#MESSAGE "&a/holo insertline <이름> <라인> <내용>"
		#MESSAGE "&a/holo tphere <이름>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <이름/all>"
		#MESSAGE "&a/holo maker"
        #STOP
    ELSE
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
            key = list()
            FOR l = vline.keySet()
                key.add(l)
            ENDFOR
                j = key.size()+1
                FOR i = parseInt(args[2]):key.size()+2
                    k = j-1
                    {"chi.holo."+args[1]+".line.line"+j} = {"chi.holo."+args[1]+".line.line"+k}
                    j = j-1
                ENDFOR
                {"chi.holo."+args[1]+".line.line"+args[2]} = mergeArguments(args,3)
                loc = {"chi.holo."+args[1]+".location.adprevlocation"}
                world = loc.getWorld()
                newy = loc.getY() - 0.25
                loc.setY(newy)
                {"chi.holo."+args[1]+".location.adprevlocation"} = loc
                SYNC
                entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
                ENDSYNC

                j = key.size()+1
                {"chi.holo."+args[1]+".uuid.uuid"+j} = entity.getUniqueId().toString()
                {"chi.holo."+args[1]+".location.location"+j} = loc
                entity.setGravity(false)
                entity.setVisible(false)
                entity.setSmall(true)
                entity.setCustomName(color("."))
                entity.setCustomNameVisible(true)
            vline = {"chi.holo."+args[1]+".line"}
            FOR lke = vline.keySet()
                lkey.add(lke)
            ENDFOR

                FOR I = 0:lkey.size()
                    J = I + 1
                    
                    IF {"chi.holo."+args[1]+".uuid.uuid"+J} == null
                        #BREAK
                    ENDIF
					uuid = {"chi.holo."+args[1]+".uuid.uuid"+J}
					uuid = UUID.fromString(uuid)
                    entity = Bukkit.getEntity(uuid)
                     entity.setCustomName(color({"chi.holo."+args[1]+".line.line"+J}))
                ENDFOR
        ENDIF
    ENDIF
ENDIF