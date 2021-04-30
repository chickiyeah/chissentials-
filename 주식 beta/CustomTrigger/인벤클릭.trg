IMPORT java.lang.Math
IMPORT javax.swing.JOptionPane
IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.configuration.file.YamlConfiguration
IMPORT java.io.File
IMPORT java.text.SimpleDateFormat
IMPORT java.util.Date
s = SimpleDateFormat("[yyyy/MM/dd a hh:mm:ss] ")
pfile = File("./plugins/TriggerReactor/Stock/"+$playername+".yml")
sellfile = File("./plugins/TriggerReactor/Stock/log-sell.yml")
buyfile = File("./plugins/TriggerReactor/Stock/log-buy.yml")
logfile = File("./plugins/TriggerReactor/Stock/log.yml")
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
IF !sellfile.exists()
    sellfile.createNewFile()
    se = YamlConfiguration.loadConfiguration(sellfile)
    se.set("sell", list())
    se.save(sellfile)
ELSE
    se = YamlConfiguration.loadConfiguration(sellfile)
ENDIF
IF !buyfile.exists()
    buyfile.createNewFile()
    bu = YamlConfiguration.loadConfiguration(buyfile)
    bu.set("buy", list())
    bu.save(buyfile)
ELSE
    bu = YamlConfiguration.loadConfiguration(buyfile)
ENDIF
IF !logfile.exists()
    logfile.createNewFile()
    lo = YamlConfiguration.loadConfiguration(logfile)
    lo.set("add", list())
    lo.set("del", list())
    lo.set("etc", list())
    lo.save(logfile)
ELSE
    lo = YamlConfiguration.loadConfiguration(logfile)
ENDIF
IF !lsfile.exists()
    lsfile.createNewFile()
    ls = YamlConfiguration.loadConfiguration(lsfile)
    ls.set("list", list())
    ls.save(lsfile)
ELSE
    ls = YamlConfiguration.loadConfiguration(lsfile)
ENDIF
title = event.getView().getTitle()
IF event.getClickedInventory() != null
type = event.getClickedInventory().getType().toString()
click = event.getClick().toString()
slot = event.getSlot()
    pay = pf.get("buy")
    get = pf.get("sell")
    pus = pf.get("used")
    buy = bu.get("buy")
    sell = se.get("sell")
ENDIF
IF slot == 4 && title.contains("주식") && type == CHEST
#CANCELEVENT
    #STOP
ENDIF
IF title.contains("주식")
    #CANCELEVENT 
    IF event.getCurrentItem() == null
        #STOP
    ENDIF
    iname = event.getCurrentItem().getItemMeta().getDisplayName()
    money = "money::name"
    money = money.replace("name", $playername)
    money = $skvar:money
    IF {$playeruuid+".소유중주식."+iname} == null
        {$playeruuid+".소유중주식."+iname} = 0
    ENDIF
IF {"ch주식."+iname+".현재금액"} > 0
    IF click == "LEFT"
        IF money >= {"ch주식."+iname+".현재금액"} && {"ch주식."+iname+".현재갯수"} >= 1
            IF {$playeruuid+".소유중주식."+iname} <= {"ch주식.최대개인소유"} - 1        
                {"ch주식."+iname+".현재갯수"} = {"ch주식."+iname+".현재갯수"} - 1
                IF {$playeruuid+".소유중주식."+iname} == null
                    {$playeruuid+".소유중주식."+iname} = 1
                ELSE
                    {$playeruuid+".소유중주식."+iname} = {$playeruuid+".소유중주식."+iname} + 1
                ENDIF
                #CMDOP "돈 빼기 "+$playername+" "+Math.abs({"ch주식."+iname+".현재금액"})
                #MESSAGE "&e"+iname+"&f주식을 1주 구매했습니다."
				pay.add(iname+"_"+Math.abs({"ch주식."+iname+".현재금액"}))
				pf.save(pfile)
                buy.add(s.format(Date())+""+$playername+"이 "+iname+"주식을 1주 구매했습니다. "+Math.abs({"ch주식."+iname+".현재금액"})+"원")
                bu.save(buyfile)
            ELSE
                #MESSAGE "&4최대 개인 소유 가능 갯수를 초과했습니다."
            ENDIF
        ELSE
            #MESSAGE "&4돈이 모자랍니다 주식의 갯수가 모자랍니다."
        ENDIF
    ENDIF    
    
    IF click == "RIGHT"
        IF {$playeruuid+".소유중주식."+iname} >= 1
            {"ch주식."+iname+".현재갯수"} = {"ch주식."+iname+".현재갯수"} + 1
            IF {$playeruuid+".소유중주식."+iname} == null
                {$playeruuid+".소유중주식."+iname} = 1
            ELSE
                {$playeruuid+".소유중주식."+iname} = {$playeruuid+".소유중주식."+iname} - 1
            ENDIF
            #CMDOP "돈 주기 "+$playername+" "+{"ch주식."+iname+".현재금액"}
            #MESSAGE "&e"+iname+"&f주식을 1주 판매했습니다."
			FOR h = 0:pay.size()
				IF pay.get(h).contains(iname)
				pay.remove(h)
				pf.save(pfile)
				#BREAK
				ENDIF
			ENDFOR
			get.add(iname+"_"+Math.abs({"ch주식."+iname+".현재금액"}))
			pf.save(pfile)
            sell.add(s.format(Date())+""+$playername+"이(가) "+iname+"주식을 1주 판매했습니다. "+Math.abs({"ch주식."+iname+".현재금액"})+"원")
            se.save(sellfile)
        ENDIF
    ENDIF
ELSE
#MESSAGE "-인 주식은 사고팔 수 없습니다!"
ENDIF    
ENDIF