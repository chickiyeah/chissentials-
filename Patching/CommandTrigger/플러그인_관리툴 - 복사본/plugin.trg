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
	configFile = File("./plugins/TriggerReactor/chissentials/config-plugin-plugin.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
IF {"PLUGINLOADBEFORE"} != "true"
	configYml.set("PluginList", list())
	configYml.save(configFile)
{"PLUGINLOADLOADBEFORE"} = "true"
ELSE 
ENDIF
IF args.length < 2
#MESSAGE "도움말 : /plugin <load/unload/reload> <플러그인명>"
ELSE
ENDIF
list = configYml.get("PluginList")
i = 0
manager = Bukkit.getServer().getPluginManager()
plugins = ReflectionHelper.getPrivateValue(SimplePluginManager, manager, "plugins")
#MESSAGE plugins
configYml.save(configFile)
IF $isop || $haspermisson:"chissentials.plugin" || $haspermisson:"chissentials.admin"
IF args.length < 2
#MESSAGE "도움말 : /plugin <load/unload/reload> <플러그인명>"
ELSE
IF args[0] == "enable" || args[0] == "Enable" || args[0] == "ENABLE" || args[0] == "load"
	IF list.contains(args[1])
		plugin = Bukkit.getServer.getPluginManager().getPlugin(args[1])
		IF	Bukkit.getPluginManager().isPluginEnabled(plugin.getName())
			#MESSAGE "&4이미 활성화 되어있는 플러그인 입니다"
		ELSE
			#MESSAGE "플러그인 &e"+args[1]+"&f을/를 로드하는중입니다!"
			SYNC
				Bukkit.getPluginManager().enablePlugin(plugin)
			ENDSYNC
		ENDIF
	ELSE
		plugin = File("./plugins/"+args[1]+".jar")
		IF !plugin.exists()
			#MESSAGE "&6&l지정하신 파일이 없습니다. (플러그인의 이름이 아닌 파일의 이름을 입력해주세요.)"
		ELSE
			#MESSAGE "&6&l파일이 존재하며 플러그인 로드를 시도합니다 오류 발생시 파일이 올바르지 않거나 다른 플러그인에서 로드된 플러그인이거나 이미 활성화 된 플러그인 인지 확인해주세요!"
			loadPlugin = SYNC;Bukkit.getPluginManager().loadPlugin(plugin);ENDSYNC
			name = loadPlugin.getName()
			plugin = Bukkit.getPluginManager().getPlugin(name)
			Bukkit.getPluginManager().enablePlugin(plugin)
		ENDIF
	ENDIF
ELSEIF args[0] == "disable" || args[0] == "Disable" || args[0] == "DISABLE" || args[0] == "unload"
IF list.contains(args[1])
	plugin = Bukkit.getPluginManager().getPlugin(args[1])
	IF	Bukkit.getPluginManager().isPluginEnabled(plugin.getName())
		SYNC
			Bukkit.getPluginManager().disablePlugin(plugin)
		ENDSYNC
		#MESSAGE "플러그인 &e"+args[1]+"&f을/를 &4비활성화&f 했습니다."
		#MESSAGE "&6다시 로드를 할땐 파일 이름이 아닌 플러그인의 이름을 입력해주세요"
	ELSE
		#MESSAGE "&4이미 비활성화 되어있는 플러그인 입니다 &e로드를 하려면 /plugin load "+args[1]+"을/를 &4입력해주세요."
	ENDIF
ELSE
	#MESSAGE "&4존재하지 않는 플러그인이거나 불러오지 않은 플러그인인입니다 &e존재하는 플러그인 이라면 먼저 /plugin load "+args[1]+"을/를 &4입력해주세요."
ENDIF
ELSEIF args[0] == "reload"
IF list.contains(args[1])
	plugin = Bukkit.getPluginManager().getPlugin(args[1])
	IF	Bukkit.getPluginManager().isPluginEnabled(plugin.getName())
		SYNC
			Bukkit.getPluginManager().disablePlugin(plugin)
			Bukkit.getPluginManager().enablePlugin(plugin)
		ENDSYNC
	ELSE
		SYNC
			Bukkit.getPluginManager().enablePlugin(plugin)
		ENDSYNC
	ENDIF
	#MESSAGE "&e"+args[1]+"&f을/를 다시 불러왔습니다"
ELSE
	#MESSAGE "&4존재하지 않는 플러그인이거나 불러오지 않은 플러그인인입니다 &e존재하는 플러그인 이라면 먼저 /plugin load "+args[1]+"을/를 &4입력해주세요."
ENDIF
ENDIF
ENDIF
ELSE
#MESSAGE "이 명령어를 실행할 수 있는 권한이 없습니다"
ENDIF