IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.Bukkit
IMPORT javax.swing.JOptionPane
IMPORT org.bukkit.configuration.file.YamlConfiguration
IMPORT java.io.File
IMPORT java.lang.Character
IMPORT java.text.SimpleDateFormat
IMPORT java.util.Date
s = SimpleDateFormat("[yyyy/MM/dd a hh:mm:ss] ")
s = s.format(Date())

logfile = File("./plugins/TriggerReactor/Stock/log.yml")
lsfile = File("./plugins/TriggerReactor/Stock/list.yml")

f = File("./plugins/TriggerReactor/Stock")
IF !f.exists()
	f.mkdir()
ENDIF
IF !lsfile.exists()
	lsfile.createNewFile()
	ls = YamlConfiguration.loadConfiguration(lsfile)
	ls.set("list", list())
	ls.save(lsfile)
ELSE
	ls = YamlConfiguration.loadConfiguration(lsfile)
ENDIF
IF !logfile.exists()
	logfile.createNewFile()
	lo = YamlConfiguration.loadConfiguration(logfile)
	lo.set("add", list())
	lo.set("del", list())
	lo.set("buy", list())
	lo.set("sell", list())
	lo.set("etc", list())
	lo.save(logfile)
ELSE
	lo = YamlConfiguration.loadConfiguration(logfile)
ENDIF
	add = lo.get("add")
	del = lo.get("del")
	etc = lo.get("etc")
sls = ls.get("list")
IF args.length == 0
	IF $isop
		inventory = Bukkit.createInventory(null, 54, "(관리자) 주식")
		SYNC
		player.openInventory(inventory)
		ENDSYNC
		etc.add(s+""+$playername+" 님이 주식창을 열었습니다.")
		lo.save(logfile)
	ELSE
	IF {"ch주식.타이머"} == "false"
		 #MESSAGE ""
		 #MESSAGE "&4주식 타이머가 비활성화 되어있습니다! 주식 타이머가 돌아가지 않을땐 주식을 열수 없습니다!"
		 #MESSAGE ""
		 #STOP
	ENDIF
		IF {"ch주식.총개수"} >= 22
			inventory = Bukkit.createInventory(null, 54, "주식")
			SYNC
			player.openInventory(inventory)
			ENDSYNC
			etc.add(s+""+$playername+" 님이 주식창을 열었습니다.")
			lo.save(logfile)
		ENDIF
		IF {"ch주식.총개수"} >= 15
			inventory = Bukkit.createInventory(null, 45, "주식")
			SYNC
			player.openInventory(inventory)
			ENDSYNC
			etc.add(s+""+$playername+" 님이 주식창을 열었습니다.")
			lo.save(logfile)
		ENDIF
		IF {"ch주식.총개수"} >= 8
			inventory = Bukkit.createInventory(null, 36, "주식")
			SYNC
			player.openInventory(inventory)
			ENDSYNC
			etc.add(s+""+$playername+" 님이 주식창을 열었습니다.")
			lo.save(logfile)
		ENDIF
		IF {"ch주식.총개수"} < 8
			inventory = Bukkit.createInventory(null, 27, "주식")
			SYNC
			player.openInventory(inventory)
			ENDSYNC
			etc.add(s+""+$playername+" 님이 주식창을 열었습니다.")
			lo.save(logfile)
		ENDIF
	ENDIF
ELSE
	IF args[0] == "추가"
		IF !$isop
			#MESSAGE "당신은 이것을 이용할수 있는 권한을 가지고 있지 않습니다!"
		ELSE
			IF args.length < 4
				#MESSAGE ""
				#MESSAGE "/주식 추가 이름 시작가격 총개수"
				#MESSAGE ""
			ELSE
				name = args[1]
				sp = args[2]
				to = args[3]
				IF !$isnumber:sp
					#MESSAGE "&4시작가격란에는 숫자만 입력해야합니다!"
					#STOP
				ENDIF
				IF !$isnumber:to
					#MESSAGE "&4최대갯수란에는 숫자만 입력해야합니다!"
					#STOP
				ENDIF
				IF sls.contains(name)
					#MESSAGE "&4이미 있는 주식입니다!"
				ELSE
					{"ch주식."+name+".현재금액"} = parseInt(sp)
					{"ch주식."+name+".현재갯수"} = parseInt(to)
					{"ch주식."+name+".최대갯수"} = parseInt(to)
					{"ch주식."+name+".최근변동"} = "§6변동없음"
					sls.add(name)
					ls.save(lsfile)
					#BROADCAST ""
					#BROADCAST "&e"+name+"주식&f이 시작가격 : &d"+sp+" 원&f, 총 갯수 : &6"+to+"개&f로 추가되었습니다."
					#BROADCAST ""
					{"ch주식.총개수"} = {"ch주식.총개수"} + 1
					add.add(s+""+$playername+"님이"+name+"주식을 시작가격 : "+sp+" 원, 총 갯수 : "+to+"개로 추가하였습니다.")
					lo.save(logfile)
				ENDIF
			ENDIF
		ENDIF
	ENDIF
	
	IF args[0] == "삭제"
		IF !$isop
			#MESSAGE "&4당신은 이것을 이용할수 있는 권한을 가지고 있지 않습니다!"
		ELSE
			IF sls.contains(args[1])
			sls.remove(args[1])
			ls.save(lsfile)
			{"ch주식.총개수"} = {"ch주식.총개수"} - 1
			#BROADCAST ""
			#BROADCAST "&e"+args[1]+"주식이 &4상장폐지 되었습니다."
			#BROADCAST ""
			del.add(s+""+$playername+"님이 "+args[1]+"주식을 상장폐지시켰습니다.")
			lo.save(logfile)
			ELSE
							#MESSAGE "제거에 실패했습니다(없는 주식입니다.)"
			ENDIF
		ENDIF

	ENDIF
	
	IF args[0] == "시간설정"
		IF !$isop
			#MESSAGE "&4당신은 이것을 이용할수 있는 권한을 가지고 있지 않습니다!"
		ELSE
			t = args[1]
			IF !$isnumber:t
				#MESSAGE "&4시간은 숫자만 입력해야합니다!"
			ELSE
				{"ch주식.변동시간"} = args[1]
				#MESSAGE "주식 변동 시간을 "+t+"초로 설정했습니다."
				etc.add(s+""+$playername+"님이 주식 변동시간을 "+t+"초로 설정했습니다.")
				lo.save(logfile)
			ENDIF
		ENDIF
	ENDIF
	
	IF args[0] == "타이머"
		{"ch주식.타이머"} = "true"
		etc.add($playername+"님에 의해 주식 타이머가 시작되었습니다.")
		lo.save(logfile)
		IF !$isop
			#MESSAGE "&4당신은 이것을 이용할수 있는 권한을 가지고 있지 않습니다!"
		ELSE
			{"ch주식.타이머중단"} = "false"
			t = {"ch주식.변동시간"}
			t = parseInt(t)
			WHILE true
				#WAIT 1 
				IF {"ch주식.타이머중단"} == "true"
					#BREAK
				ENDIF
				FOR d = 0:t
				#WAIT 1
				IF {"ch주식.타이머중단"} == "true"
					#BREAK
				ENDIF
					{"ch주식.남은시간"} = t-d
				ENDFOR
				#CALL "stockchange"
				etc.add(s+""+"정해진 시간이 되어 주식 시세가 변동되었습니다.")
				lo.save(logfile)
			ENDWHILE
		ENDIF
	ENDIF
	
	IF args[0] == "타이머중단"
		IF !$isop
			#MESSAGE "&4당신은 이것을 이용할수 있는 권한을 가지고 있지 않습니다!"
		ELSE
			{"ch주식.타이머중단"} = "true"
			{"ch주식.타이머"} = "false"
			etc.add(s+""+$playername+"님에 의해 주식 타이머가 중단되었습니다.")
			lo.save(logfile)
		ENDIF
	ENDIF
	
	IF args[0] == "가격변동"
		IF !$isop
			#MESSAGE "&4당신은 이것을 이용할수 있는 권한을 가지고 있지 않습니다!"
		ELSE
			#CALL "stockchange"
			etc.add($playername+"님에 의해 주식 시세가 변동되었습니다.")
			lo.save(logfile)
		ENDIF
	ENDIF
	
	IF args[0] == "변동최대값"
		IF !$isop
			#MESSAGE "&4당신은 이것을 이용할수 있는 권한을 가지고 있지 않습니다!"
		ELSE
			d = args[1]
			IF !$isnumber:d
				#MESSAGE "변동최대값은 숫자만 입력해야합니다!"
			ELSE
				{"ch주식.변동최대치"} = d
				#MESSAGE "&4주식의 변동 최대치를 "+d+"원으로 설정했습니다."
			ENDIF
		ENDIF
	ENDIF
	
	IF args[0] == "초기세팅"
		IF !$isop
			#MESSAGE "&4당신은 이것을 이용할수 있는 권한을 가지고 있지 않습니다!"
		ELSE
			d = args[1]
			IF !$isnumber:d
				#MESSAGE "변동최대값은 숫자만 입력해야합니다!"
			ELSE
				{"ch주식.변동최대치"} = 9999999
				{"ch주식.총개수"} = 0
				{"ch주식.최대개인소유"} = 10
				{"ch주식.남은시간"} = 3600
				{"ch주식.타이머중단"} = "false"
			ENDIF
		ENDIF
	ENDIF
ENDIF