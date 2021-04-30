IMPORT java.io.File
IMPORT java.lang.String
IMPORT org.bukkit.configuration.file.YamlConfiguration

title = event.getView().getTitle()
pfile = File("./plugins/TriggerReactor/Stock/"+$playername+".yml")
lsfile = File("./plugins/TriggerReactor/Stock/list.yml")
f = File("./plugins/TriggerReactor/Stock")
IF !f.exists()
    f.mkdir()
ENDIF
IF !pfile.exists()
    pfile.createNewFile()
    pf = YamlConfiguration.loadConfiguration(pfile)
    pf.set("used", list())
    pf.set("buy", list())
    pf.set("sell", list())
    pf.save(pfile)
ELSE
    pf = YamlConfiguration.loadConfiguration(pfile)
ENDIF
IF !lsfile.exists()
    lsfile.createNewFile()
    ls = YamlConfiguration.loadConfiguration(lsfile)
    ls.set("list", list())
    ls.save(lsfile)
ELSE
    ls = YamlConfiguration.loadConfiguration(lsfile)
ENDIF
pay = pf.get("buy")
sls = ls.get("list")
IF title == "주식" || title == "(관리자) 주식"
    inv = event.getInventory()
    max = {"ch주식.총개수"}
    {"ch주식.인벤닫힘"} = "false"

	{$playername+"chclo"} = "opend"
    WHILE true
        #WAIT 1
        a = 0
		j=11
        FOR i = 0:max
			pf = YamlConfiguration.loadConfiguration(pfile)
			pay = pf.get("buy")
			fgglist = list()
			fggD = 0
			fggDf = 0
            IF {"ch주식.인벤닫힘"} == "true"
                #BREAK
            ENDIF
            name = sls.get(i)
            np = {"ch주식."+name+".현재금액"}
            ns = {"ch주식."+name+".현재갯수"}
            to = {"ch주식."+name+".최대갯수"}
            tc = {"ch주식."+name+".최근변동"}
            up = {$playeruuid+".소유중주식."+name}
			FOR f = 0:pay.size()
			fgg = pay.get(f)
			fgg = fgg.split("_")
			IF fgg[0] == name
				fggD = fggD + parseInt(fgg[1])
				fgglist.add(fgg[1])
			ENDIF
			ENDFOR
			IF fgglist.size != 0
			fggDf = fggD/fgglist.size()
			ENDIF
            clock = item("CLOCK", 1)
            clockmeta = clock.getItemMeta()
            clockmeta.setDisplayName("§6다음 변동까지 남은시간")
            lore = list()
            t = {"ch주식.남은시간"}
            m = t/60
            s = t%60
            lore.add("§f"+m+"분 "+s+"초")
            clockmeta.setLore(lore)
            clock.setItemMeta(clockmeta)
            tem = item("PAPER", 1)
            temmeta = tem.getItemMeta()
            temmeta.setDisplayName(name)
            lore = list()
            IF up == null
            up = 0
            ENDIF
			fggDf = String.format("%,d", fggDf)
            format = String.format("%,d", np)
            lore.add("§f현재 금액 : "+format)
            lore.add("§f갯수 : "+ns+"/"+to)
            lore.add("§f최근 변동 : "+tc)
            lore.add("§f소유중 : "+up+"개")
			lore.add("§f나의 평균구매금액 : "+fggDf+" 원")
            lore.add("§6구매 : 좌클, §b판매 : 우클")
            temmeta.setLore(lore)
            tem.setItemMeta(temmeta)
            inv.setItem(4 ,clock)
            
            inv.setItem(j ,tem)
            j = j + 1
        ENDFOR
        j = 11
		IF {$playername+"chclo"} == "closed"
			#BREAK
		ENDIF
    ENDWHILE
ENDIF

IF title == "소유중"
    inv = event.getInventory()
    max = {"ch주식.총개수"}
    j = 11
    WHILE true
        #WAIT 1
        FOR i = 0:max
            name = sls.get(i)
            np = {$playeruuid+".소유중주식."+name}
            clock = item("CLOCK", 1)
            clockmeta = clock.getItemMeta()
            clockmeta.setDisplayName("§6다음 변동까지 남은시간")
            lore = list()
            t = {"ch주식.남은시간"}
            m = t/60
            s = t%60
            lore.add("§f"+m+"분 "+s+"초")
            clockmeta.setLore(lore)
            clock.setItemMeta(clockmeta)
            tem = item("PAPER", 1)
            temmeta = tem.getItemMeta()
            temmeta.setDisplayName(name)
            lore = list()
            lore.add("§f소유중 갯수 : "+np)
            temmeta.setLore(lore)
            tem.setItemMeta(temmeta)
            inv.setItem(4 ,clock)
            
            inv.setItem(j ,tem)
            j = j + 1
        ENDFOR
        j = 11
    ENDWHILE
ENDIF