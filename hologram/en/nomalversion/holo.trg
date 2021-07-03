//triggerreactor hologram project
//Secondary modifiable Do Not Secondary Deployment "Maker" Command Delete/Unmodifiable
//Maker 치키이예#0032
IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.entity.EntityType

IF (($isop || $haspermission:"chi.holo.help") && (args.length == 0 || args[0] == "help"))
#MESSAGE "&a========Hologram &bTrigger Reactor ver&a========"
#MESSAGE "&a/holo create <name> (content)"
#MESSAGE "&a/holo addline <name> (content)"
#MESSAGE "&a/holo delete <name>"
#MESSAGE "&a/holo list"
#MESSAGE "&a/holo deleteline <name> <line (Starting with 1)>"
#MESSAGE "&a/holo editline <name> <line (Starting with 1)> <What to change>"
#MESSAGE "&a/holo insertline <name> <line (Starting with 1)> <content>"
#MESSAGE "&a/holo tphere <name>"
#MESSAGE "&a/holo reset"
#MESSAGE "&a/holo regen <name/all>"
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
	    #MESSAGE "&4It's a hologram that already exists."
	    #STOP
	    ENDIF
	ENDIF
		{"chi.holo."+args[1]+".line.line1"} = mergeArguments(args,2)
		loc = player.getLocation()
		loc.setY(loc.getY()-1)
		SYNC
		entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
		ENDSYNC
		{"chi.holo."+args[1]+".uuid.uuid1"} = entity.getUniqueId()
		entity.setGravity(false)
        entity.setVisible(false)
        entity.setSmall(true)
        entity.setCustomName(color({"chi.holo."+args[1]+".line.line1"}))
        entity.setCustomNameVisible(true)
        {"chi.holo."+args[1]+".location.location1"} = entity.getLocation()
        #MESSAGE "&aSuccessfully created hologram named &e"+args[1]
	ELSE
		{"chi.holo."+args[1]+".line.line1"} = color("&aContent is not set! Use /holo editline &e"+args[1]+"&a 1 <Contents> to modify the content!")
		loc = player.getLocation()
		loc.setY(loc.getY()-1)
		SYNC
		entity = world.spawnEntity(loc ,EntityType.ARMOR_STAND)
		ENDSYNC
		{"chi.holo."+args[1]+".uuid.uuid1"} = entity.getUniqueId()
		entity.setGravity(false)
        entity.setVisible(false)
        entity.setSmall(true)
        entity.setCustomName(color({"chi.holo."+args[1]+".line.line1"}))
        entity.setCustomNameVisible(true)
        {"chi.holo."+args[1]+".location.location1"} = entity.getLocation()
        #MESSAGE "&aSuccessfully created hologram named &e"+args[1]
	ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.delete") && args[0] == "delete"
	IF args.length == 0
		#MESSAGE "&a========Hologram &bTrigger Reactor ver&a========"
		#MESSAGE "&a/holo create <name> (content)"
		#MESSAGE "&a/holo addline <name> (content)"
		#MESSAGE "&a/holo delete <name>"
		#MESSAGE "&a/holo list"
		#MESSAGE "&a/holo deleteline <name> <line (Starting with 1)>"
		#MESSAGE "&a/holo editline <name> <line (Starting with 1)> <What to change>"
		#MESSAGE "&a/holo insertline <name> <line (Starting with 1)> <content>"
		#MESSAGE "&a/holo tphere <name>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <name/all>"
		#MESSAGE "&a/holo maker"
	ELSE
		list = {"chi.holo"}
	    IF list == null
	        #MESSAGE "&4There is no hologram on this server."
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
            #MESSAGE "&4A hologram with that name does not exist."
            #STOP
        ENDIF

        vuuid = {"chi.holo."+args[1]+".uuid"}
		uuid = {"chi.holo."+args[1]+".uuid.uuid1"}
		IF Bukkit.getEntity(uuid) != null && bvalue.contains(args[1])
		    FOR uuid = vuuid.values()
			Bukkit.getEntity(uuid).remove()
			ENDFOR
			{"chi.holo."+args[1]} = null
			#MESSAGE "&aFinished deleting holograms named &e"+args[1]
		ENDIF
	ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.list") && args[0] == "list"
kea = "&eHologram list&f : "
list = {"chi.holo"}
IF list != null
   IF list.toString() != "{}"
		FOR ke = list.keySet()
		IF kea == "&eHologram list&f : "
		    kea = kea + ke
		ELSE
		    kea = kea +", "+ke
    ENDIF
    ENDFOR
    #MESSAGE kea
   ELSE
       #MESSAGE kea + "&lNone"
   ENDIF
ELSE
    #MESSAGE kea + "&lNone"
ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.addline") && args[0] == "addline"
   IF args.length < 2
		#MESSAGE "&a========Hologram &bTrigger Reactor ver&a========"
		#MESSAGE "&a/holo create <name> (content)"
		#MESSAGE "&a/holo addline <name> (content)"
		#MESSAGE "&a/holo delete <name>"
		#MESSAGE "&a/holo list"
		#MESSAGE "&a/holo deleteline <name> <line (Starting with 1)>"
		#MESSAGE "&a/holo editline <name> <line (Starting with 1)> <What to change>"
		#MESSAGE "&a/holo insertline <name> <line (Starting with 1)> <content>"
		#MESSAGE "&a/holo tphere <name>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <name/all>"
		#MESSAGE "&a/holo maker"
        #STOP
    ENDIF
    list = {"chi.holo"}
	IF list == null
	   #MESSAGE  "&4There is no hologram on this server."
	   #STOP
	ENDIF
	key = list()
	FOR ke = list.keySet()
	    key.add(ke)
    ENDFOR
    lkey = list()
    IF !key.contains(args[1])
        #MESSAGE "&4A hologram with that name does not exist."
        #STOP
    ELSE
        IF {"chi.holo."+args[1]+".lineadding"} == true
            #MESSAGE "&4Add Line is already in progress for this hologram!"
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
		{"chi.holo."+args[1]+".uuid.uuid"+writeline} = entity.getUniqueId()
		{"chi.holo."+args[1]+".line.line"+writeline} = mergeArguments(args,2)
		entity.setGravity(false)
        entity.setVisible(false)
        entity.setSmall(true)
        entity.setCustomName(color({"chi.holo."+args[1]+".line.line"+writeline}))
        entity.setCustomNameVisible(true)
		#MESSAGE "&aSuccessfully added a line of "+mergeArguments(args,2)+"&a to the hologram called &b"+args[1]
        {"chi.holo."+args[1]+".lineadding"} = false
    ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.deleteline") && args[0] == "deleteline"
    IF args.length < 3
		#MESSAGE "&a========Hologram &bTrigger Reactor ver&a========"
		#MESSAGE "&a/holo create <name> (content)"
		#MESSAGE "&a/holo addline <name> (content)"
		#MESSAGE "&a/holo delete <name>"
		#MESSAGE "&a/holo list"
		#MESSAGE "&a/holo deleteline <name> <line (Starting with 1)>"
		#MESSAGE "&a/holo editline <name> <line (Starting with 1)> <What to change>"
		#MESSAGE "&a/holo insertline <name> <line (Starting with 1)> <content>"
		#MESSAGE "&a/holo tphere <name>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <name/all>"
		#MESSAGE "&a/holo maker"
        #STOP
    ELSE
        list = {"chi.holo"}
	    IF list == null
	        #MESSAGE "&4There is no hologram on this server."
	        #STOP
	    ENDIF
	    key = list()
	    FOR ke = list.keySet()
	        key.add(ke)
        ENDFOR
        lkey = list()
        IF !key.contains(args[1])
            #MESSAGE "&4A hologram with that name does not exist."
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
                #MESSAGE "&4There is only one line! Unable to delete line"
                #STOP
            ENDIF
            IF {"chi.holo."+args[1]+".linedeleting"} == true
                #MESSAGE "&4A deletion operation is already in progress for that hologram!"
                #STOP
            ENDIF
            IF lkey.size() < parseInt(args[2])
                #MESSAGE "&4The line does not exist. Current End Line "+lkey.size()
                #STOP
            ELSE
                {"chi.holo."+args[1]+".linedeleting"} = true
                FOR i = parseInt(args[2]):lkey.size()+1
                    j = i+1
                    entity = Bukkit.getEntity(uuid.get(i-1))
                    {"chi.holo."+args[1]+".line.line"+i} = {"chi.holo."+args[1]+".line.line"+j}
                    IF {"chi.holo."+args[1]+".line.line"+i} == null
                        #BREAK
                    ENDIF
                ENDFOR
                uid = {"chi.holo."+args[1]+".uuid.uuid"+lkey.size()}
                Bukkit.getEntity(uid).remove()
                {"chi.holo."+args[1]+".uuid.uuid"+lkey.size()} = null
                {"chi.holo."+args[1]+".line.line"+lkey.size()} = null
                {"chi.holo."+args[1]+".location.location"+lkey.size()} = null
                j = lkey.size() - 1
                 {"chi.holo."+args[1]+".location.adprevlocation"} = {"chi.holo."+args[1]+".location.location"+j}

            FOR ui = uuids.values()
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
                    entity = Bukkit.getEntity({"chi.holo."+args[1]+".uuid.uuid"+J})
                     entity.setCustomName(color({"chi.holo."+args[1]+".line.line"+J}))
                ENDFOR
                {"chi.holo."+args[1]+".linedeleting"} = false
            ENDIF
        ENDIF
    ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.tphere") && args[0] == "tphere"
	IF args.length < 2
		#MESSAGE "&a========Hologram &bTrigger Reactor ver&a========"
		#MESSAGE "&a/holo create <name> (content)"
		#MESSAGE "&a/holo addline <name> (content)"
		#MESSAGE "&a/holo delete <name>"
		#MESSAGE "&a/holo list"
		#MESSAGE "&a/holo deleteline <name> <line (Starting with 1)>"
		#MESSAGE "&a/holo editline <name> <line (Starting with 1)> <What to change>"
		#MESSAGE "&a/holo insertline <name> <line (Starting with 1)> <content>"
		#MESSAGE "&a/holo tphere <name>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <name/all>"
		#MESSAGE "&a/holo maker"		
        #STOP
    ENDIF
	list = {"chi.holo"}
	IF list == null
	   #MESSAGE "&4There is no hologram on this server."
	   #STOP
	ENDIF
	key = list()
	FOR ke = list.keySet()
	    key.add(ke)
    ENDFOR
    lkey = list()
    IF !key.contains(args[1])
        #MESSAGE "&4A hologram with that name does not exist."
        #STOP
    ELSE
		vline = {"chi.holo."+args[1]+".line"}
		holo = Bukkit.getEntity({"chi.holo."+args[1]+".uuid.uuid1"})
		FOR lke = vline.keySet()
			lkey.add(lke)
        ENDFOR
		nowline = lkey.size() + 1
		playerloc = player.getLocation()
		FOR i = 1:nowline
			holo = Bukkit.getEntity({"chi.holo."+args[1]+".uuid.uuid"+i})

			playerloc.setY(playerloc.getY()-0.25)

			holo.teleport(playerloc)
			#MESSAGE "&aYou moved the hologram &e"+args[1]+"&a under your feet!"
		ENDFOR
	ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.reset") && args[0] == "reset"
    IF args.length == 1
        #MESSAGE "&4Are you sure you want to delete both holograms and data?"
        #MESSAGE "&4Attention This operation cannot be cancelled!!"
        #MESSAGE "&aEnter /holo reset confirm if you really want to initialize.."
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
                        Bukkit.getEntity(uid).remove()
		            ENDFOR
		        ENDFOR
            {"chi.holo"} = null
            #MESSAGE "&4Successfully deleted and initialized all holograms and data."
            #STOP
        ENDIF
    ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.editline") && args[0] == "editline"
    IF args.length < 3
		#MESSAGE "&a========Hologram &bTrigger Reactor ver&a========"
		#MESSAGE "&a/holo create <name> (content)"
		#MESSAGE "&a/holo addline <name> (content)"
		#MESSAGE "&a/holo delete <name>"
		#MESSAGE "&a/holo list"
		#MESSAGE "&a/holo deleteline <name> <line (Starting with 1)>"
		#MESSAGE "&a/holo editline <name> <line (Starting with 1)> <What to change>"
		#MESSAGE "&a/holo insertline <name> <line (Starting with 1)> <content>"
		#MESSAGE "&a/holo tphere <name>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <name/all>"
		#MESSAGE "&a/holo maker"
        #STOP
    ELSE
        list = {"chi.holo"}
	    IF list == null
	        #MESSAGE "&4There is no hologram on this server."
	        #STOP
	    ENDIF
	    key = list()
	    FOR ke = list.keySet()
	        key.add(ke)
        ENDFOR
        lkey = list()
        IF !key.contains(args[1])
            #MESSAGE "&4A hologram with that name does not exist."
            #STOP
        ELSE
            vline = {"chi.holo."+args[1]+".line"}
            key = list()
            FOR l = vline.keySet()
                key.add(l)
            ENDFOR
            IF {"chi.holo."+args[1]+".line.line"+args[2]} == null
                #MESSAGE "&4The line does not exist. Current End Line "+key.size()
                #STOP
            ELSE
                {"chi.holo."+args[1]+".line.line"+args[2]} = mergeArguments(args,3)
                uid = {"chi.holo."+args[1]+".uuid.uuid"+args[2]}
                Bukkit.getEntity(uid).setCustomName(color({"chi.holo."+args[1]+".line.line"+args[2]}))
				#MESSAGE "&aSuccessfully changed the contents of line "+args[2]+" to "+mergeArguments(args,3)
            ENDIF
        ENDIF
    ENDIF
ENDIF

IF ($isop || $haspermission:"chi.holo.regen") && args[0] == "regen"
    IF args.length < 2
		#MESSAGE "&a========Hologram &bTrigger Reactor ver&a========"
		#MESSAGE "&a/holo create <name> (content)"
		#MESSAGE "&a/holo addline <name> (content)"
		#MESSAGE "&a/holo delete <name>"
		#MESSAGE "&a/holo list"
		#MESSAGE "&a/holo deleteline <name> <line (Starting with 1)>"
		#MESSAGE "&a/holo editline <name> <line (Starting with 1)> <What to change>"
		#MESSAGE "&a/holo insertline <name> <line (Starting with 1)> <content>"
		#MESSAGE "&a/holo tphere <name>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <name/all>"
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
                    {"chi.holo."+k+".uuid.uuid"+J} = entity.getUniqueId()
                    entity.setGravity(false)
                    entity.setVisible(false)
                    entity.setSmall(true)
                    entity.setCustomName(color({"chi.holo."+k+".line.line"+J}))
                    entity.setCustomNameVisible(true)
		         ENDFOR
		    ENDFOR
			{"chi.holo."+k+".location.regenlocation"} = null
		    #MESSAGE "&aAll holograms have been recreated!"
			#MESSAGE "&eIf you are pushed down one space, please use /trg reload and use the regen command again."
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
		             IF Bukkit.getEntity(uid) != null
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
                    {"chi.holo."+args[1]+".uuid.uuid"+J} = entity.getUniqueId()
                    entity.setGravity(false)
                    entity.setVisible(false)
                    entity.setSmall(true)
                    entity.setCustomName(color({"chi.holo."+args[1]+".line.line"+J}))
                    entity.setCustomNameVisible(true)
		         ENDFOR
		         #MESSAGE "&aSuccessfully recreated hologram &e"+args[1]
				 #MESSAGE "&eIf you are pushed down one space, please use /trg reload and use the regen command again."
		    ELSE
		        #MESSAGE "&4A hologram with that name does not exist."
		    ENDIF
        ENDIF
    ENDIF
ENDIF

IF args[0] == "maker"
    #MESSAGE "&eMaker : 치키이예#0032"
    #MESSAGE "&dMaker Twitch: https://www.twitch.tv/ruddls030"
    #MESSAGE "&eWho helped implement : Colda"
    #MESSAGE "&ePlug-in used to implement : TriggerReactor"
    #MESSAGE "&ahttps://github.com/TriggerReactor/TriggerReactor/releases"
    #MESSAGE "&ePlugin Discord : https://discord.gg/U3pyUYc"
    #MESSAGE "&aPlease leave the bug/improvement information in your personal discord message. 치키이예#0032"
    #MESSAGE "&eThank you once again for implementing the trigger reactor plug-in. wyshon"
    #STOP
ENDIF

IF ($isop || $haspermission:"chi.holo.insertline") && args[0] == "insertline"
     IF args.length < 3
		#MESSAGE "&a========Hologram &bTrigger Reactor ver&a========"
		#MESSAGE "&a/holo create <name> (content)"
		#MESSAGE "&a/holo addline <name> (content)"
		#MESSAGE "&a/holo delete <name>"
		#MESSAGE "&a/holo list"
		#MESSAGE "&a/holo deleteline <name> <line (Starting with 1)>"
		#MESSAGE "&a/holo editline <name> <line (Starting with 1)> <What to change>"
		#MESSAGE "&a/holo insertline <name> <line (Starting with 1)> <content>"
		#MESSAGE "&a/holo tphere <name>"
		#MESSAGE "&a/holo reset"
		#MESSAGE "&a/holo regen <name/all>"
		#MESSAGE "&a/holo maker"
        #STOP
    ELSE
        list = {"chi.holo"}
	    IF list == null
	        #MESSAGE "&4There is no hologram on this server."
	        #STOP
	    ENDIF
	    key = list()
	    FOR ke = list.keySet()
	        key.add(ke)
        ENDFOR
        lkey = list()
        IF !key.contains(args[1])
            #MESSAGE "&4A hologram with that name does not exist."
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
                {"chi.holo."+args[1]+".uuid.uuid"+j} = entity.getUniqueId()
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
                    entity = Bukkit.getEntity({"chi.holo."+args[1]+".uuid.uuid"+J})
                     entity.setCustomName(color({"chi.holo."+args[1]+".line.line"+J}))
                ENDFOR
			#MESSAGE "&aLine inserted successfully."
        ENDIF
    ENDIF
ENDIF