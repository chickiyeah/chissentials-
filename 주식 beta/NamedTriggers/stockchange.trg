IMPORT java.io.File
IMPORT java.lang.Math
IMPORT java.lang.String
IMPORT org.bukkit.configuration.file.YamlConfiguration

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
sls = ls.get("list")

dmax = {"ch주식.총개수"}
max = {"ch주식.변동최대치"}
max = max.toString()
max = parseInt(max)
FOR f = 0:dmax
name = sls.get(f)
a = $random:0:11
IF {"ch주식."+name+".현재금액"} <= 20000
k = $random:0:11
	IF k > 4
		d = $random:1:50000
		{"ch주식."+name+".현재금액"} = {"ch주식."+name+".현재금액"} + d
		format = String.format("%,d", d)
		{"ch주식."+name+".최근변동"} = "§a▲ "+format
	ELSEIF k == 0
		{"ch주식."+name+".최근변동"} = "§6- 0"
	ELSE
		g = Math.abs({"ch주식."+name+".현재금액"}/5)
		d = $random:1:g
		{"ch주식."+name+".현재금액"} = {"ch주식."+name+".현재금액"} - d
		format = String.format("%,d", d)
		{"ch주식."+name+".최근변동"} = "§4▼ "+format
	ENDIF
ENDIF
	


IF a < 5
	name = sls.get(f)
	g = Math.abs({"ch주식."+name+".현재금액"}/3)
	d = $random:1:g
	IF d > g
		{"ch주식."+name+".현재금액"} = {"ch주식."+name+".현재금액"} + g
		format = String.format("%,d", g)
		{"ch주식."+name+".최근변동"} = "§a▲ "+format
	ELSE
		{"ch주식."+name+".현재금액"} = {"ch주식."+name+".현재금액"} + d
		format = String.format("%,d", d)
		{"ch주식."+name+".최근변동"} = "§a▲ "+format
	ENDIF
ELSE
	g = Math.abs({"ch주식."+name+".현재금액"}/3)
	d = $random:1:g
	name = sls.get(f)
	IF {"ch주식."+name+".현재금액"} - g > 0
		B = $random:0:2
		IF B == 0
		IF d > g
			{"ch주식."+name+".현재금액"} = {"ch주식."+name+".현재금액"} - g
			format = String.format("%,d", g)
			{"ch주식."+name+".최근변동"} = "§4▼ "+format
		ELSE
			{"ch주식."+name+".현재금액"} = {"ch주식."+name+".현재금액"} - d
			format = String.format("%,d", d)
			{"ch주식."+name+".최근변동"} = "§4▼ "+format
		ENDIF
		ELSE
			{"ch주식."+name+".최근변동"} = "§6- 0"
		ENDIF
	ELSE
		{"ch주식."+name+".최근변동"} = "§6- 0"
	ENDIF
ENDIF
ENDFOR
#BROADCAST "&6주식이 변동되었습니다."
#LOG "§6주식이 변동되었습니다."