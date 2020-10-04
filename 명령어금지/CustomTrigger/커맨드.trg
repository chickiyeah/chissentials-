import java.io.File
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
Command = event.getMessage()
Command = Command.replace("/","")

	configFile = File("./plugins/TriggerReactor/config/chissentials/config-cmd-blacklist.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
list = configYml.get("blacklist")
IF list.contains(Command)
IF $isop
#MESSAGE "&6&l[&4&l!&6&l] &f금지된 명령어 이지만 서버 관리자 권한으로 실행합니다"
ELSE
SYNC
#CANCELEVENT
ENDSYNC
#MESSAGE "&6&l[&4&l!&6&l] &f금지된 명령어 입니다! 서버 관리자에게 문의하세요!"
ENDIF
ELSE
ENDIF
