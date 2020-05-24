import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
import org.bukkit.plugin.Plugin
import org.bukkit.plugin.PluginManager
import org.bukkit.command.PluginCommand
import org.bukkit.command.SimpleCommandMap
import org.bukkit.plugin.SimplePluginManager
import com.google.common.collect.Lists
import net.minecraftforge.fml.relauncher.ReflectionHelper
	configFile = File("./plugins/TriggerReactor/chissentials/config-pl-plugin.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
IF {"PLLOADBEFORE"} != "true"
	configYml.set("PluginList", list())
	configYml.set("ENABLE?", list())
	configYml.save(configFile)
{"PLLOADLOADBEFORE"} = "true"
ELSE 
ENDIF
manager = Bukkit.getServer().getPluginManager()
plugins = ReflectionHelper.getPrivateValue(SimplePluginManager, manager, "plugins")
#MESSAGE plugins
#MESSAGE Bukkit.getPluginManager().isPluginEnabled(plugins.get(1))
IF $isop || $haspermisson:"chissentials.pl" || $haspermisson:"chissentials.admin"
i = 0
enable = configYml.get("ENABLE?")
list = list()
plsize = plugins.size()
FOR i = 0:plsize
en = Bukkit.getPluginManager().isPluginEnabled(plugins.get(i))
enable.add(i, en)
en = null
ENDFOR
#MESSAGE enable
i = 0
#MESSAGE plugins.get(i).getName()
FOR plugin = Bukkit.getPluginManager().getPlugins()
list.add(plugins.get(i).getName())
i = i + 1
ENDFOR
#MESSAGE list

configYml.save(configFile)
FOR plugin = Bukkit.getPluginManager().getPlugins()
IF enable.get(i) == "true"
	IF i == 0
		res = "&a"+plugins.get(i)
	ELSE
		res = res+"&f, &a"+plugins.get(i)
	ENDIF
ELSE
	IF i == 0
		res = "&4"+plugins.get(i)
	ELSE
		res = res+"&f, &4"+plugins.get(i)
	ENDIF
ENDIF
i = i + 1
ENDFOR
i = 0
#MESSAGE "플러그인 (&e"+plsize+"개 확인됨&f): "+res
	

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