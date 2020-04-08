import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
	configFile = File("./plugins/TriggerReactor/chissentials/config-pl-plugin.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
IF {"PLLOADBEFORE"} != "true"
	configYml.set("PluginList", list())
	configYml.set("ENABLE?", list())
	configYml.save(configFile)
{"PLLOADLOADBEFORE"} = "true"
ELSE 
ENDIF
IF $isop || $haspermisson:"chissentials.pl" || $haspermisson:"chissentials.admin"
i = 0
enable = configYml.get("ENABLE?")
list = configYml.get("PluginList")
FOR plugin = Bukkit.getPluginManager().getPlugins()
list.add(i, plugin.getName())
en = Bukkit.getPluginManager().isPluginEnabled(plugin.getName())
enable.add(i, en)
en = null
i = i + 1
ENDFOR
i = 0
configYml.save(configFile)
FOR plugin = Bukkit.getPluginManager().getPlugins()
IF enable.get(i) == "true"
	IF i == 0
		res = "&a"+list.get(i)
	ELSE
		res = res+"&f, &a"+list.get(i)
	ENDIF
ELSE
	IF i == 0
		res = "&4"+list.get(i)
	ELSE
		res = res+"&f, &4"+list.get(i)
	ENDIF
ENDIF
i = i + 1
ENDFOR
i = 0
#MESSAGE "플러그인 (&e"+list.size()+"개 확인됨&f): "+res
	

FOR plugin = Bukkit.getPluginManager().getPlugins()
en = Bukkit.getPluginManager().isPluginEnabled(plugin.getName())
list.remove(plugin.getName())
enable.remove(en)
i = i + 1
ENDFOR
configYml.save(configFile)
ELSE
#MESSAGE "이 명령어를 실행할 수 있는 권한이 없습니다"
ENDIF