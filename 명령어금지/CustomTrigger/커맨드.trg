import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
	configFile = File("./plugins/TriggerReactor/config-cmd-blacklist.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
list = configYml.get("blacklist")
IF list.contains($cmdline)
SYNC
#CANCELEVENT
ENDSYNC
#MESSAGE "&6&l[&4&l!&6&l] &f금지된 명령어 입니다! 서버 관리자에게 문의하세요!"
ELSE
ENDIF