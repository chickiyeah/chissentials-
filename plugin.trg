import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
IF args[0] == "enable" || args[0] == "Enable" || args[0] == "ENABLE" || args[0] == "load"
plugin = File("./plugins/"+args[1]+".jar")
IF !plugin.exists()
#MESSAGE "&6&l지정하신 파일이 없습니다. (플러그인의 이름이 아닌 파일의 이름을 입력해주세요.)"
ELSE
#MESSAGE "&6&l파일이 존재하며 플러그인 로드를 시도합니다 오류 발생시 파일이 올바르지 않는지 확인해주세요!"
Bukkit.getPluginManager().loadPlugin(plugin)
name = Bukkit.getPluginManager().getPlugin(args[1]).getName()
#MESSAGE name
plugin = Bukkit.getPluginManager().getPlugin(name)
Bukkit.getPluginManager().enablePlugin(plugin)
ENDIF
ELSEIF args[0] == "disable" || args[0] == "Disable" || args[0] == "DISABLE" || args[0] == "unload"
plugin = Bukkit.getPluginManager().getPlugin(args[1])
Bukkit.getPluginManager().disablePlugin(plugin)
ELSEIF args[0] == "des"
plugin = File("./plugins/"+args[1]+".jar")
des = Bukkit.getPluginManager().getPluginDescription(plugin)
#MESSAGE des
ENDIF