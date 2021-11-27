import java.io.File
import java.io.FileInputStream
import java.io.BufferedReader
import java.io.InputStreamReader
IMPORT java.lang.Character
IMPORT java.util.Base64
IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.configuration.file.YamlConfiguration
IMPORT io.github.wysohn.triggerreactor.core.main.TriggerReactorCore

plugin = TriggerReactorCore.getInstance()
commandTrigger = plugin.getCmdManager()
customTrigger = plugin.getCustomManager()
trTabcomplete = customTrigger.get("TR-Tabcomplete")



directory = File("./plugins/TriggerReactor/CommandTrigger")
cmdlist = list()
FOR f = directory.listFiles()
	f = f.toString()
	f = f.replace(".\\plugins\\TriggerReactor\\CommandTrigger\\", "")
	IF f.contains("trg")
		f = f.replace(".trg" ,"")
		cmdlist.add(f)
	ENDIF
ENDFOR
scriptlist = list()
script = "IMPORT org.bukkit.Bukkit\r\nfds = \" \"\r\nmsg = event.getBuffer()\r\nmsg = msg.replace(\"/\", \"\")\r\nspace = 0\r\nFOR i = 0:msg.length()\r\nIF msg.charAt(i) ==  == fds.charAt(0)\r\nspace = space + 1\r\nENDIF\r\nENDFOR\r\nmsg = msg.split(\" \")\r\namsg = msg[0]\r\nplayer = event.getSender()\r\ntablist = list()\r\ntablist2 = list()\r\n"
FOR i = 0:cmdlist.size()
name = cmdlist.get(i)
file = File("./plugins/TriggerReactor/CommandTrigger/"+name+".trg")
filereader = FileInputStream(file)
input = InputStreamReader(filereader, "UTF-8")
bufreader = BufferedReader(input)
argslist = list()
value = list()
	WHILE true
		scan = bufreader.readLine()
		IF scan == null
			#BREAK
		ELSE
			IF scan.contains("IF args[") || scan.contains("&& args[") || scan.contains("|| args[")
				scan = scan.replaceAll("IF " ,"")
				scan = scan.replaceAll("ELSE" ,"")
				scan = scan.replaceAll("ENDIF" ,"")
				scan = scan.replaceAll("\"" ,"")
				scan = scan.replaceAll("	" ,"")
				sin = scan.indexOf("args[")
				sam = scan.substring(sin,scan.length())
				fd = sam.indexOf("[")
				IF Character.isDigit(sam.charAt(fd+1))
					sam = sam.replaceAll("\\)","")
					sam = sam.replaceAll("\\(","")
					IF sam.contains("&&") || sam.contains("||")
						IF sam.contains("&&")
							samd = sam.split("&&")
								FOR i = 0:samd.length 
									IF samd[i].contains("args[")
										IF Character.isDigit(sam.charAt(fd+1))
											argslist.add(sam.charAt(fd+1))
										ENDIF
										string = samd[i].toString().substring(11, samd[i].length())
										string = string.replace(" ","")
										IF value == "null"									
											value.add(string)
										ENDIF
									ENDIF
								ENDFOR					
						ENDIF
						IF sam.contains("||")
							samd = sam.split("||")
								FOR i = 0:samd.length 
									IF samd[i].contains("args[")
										IF Character.isDigit(sam.charAt(fd+1))
											argslist.add(sam.charAt(fd+1))
										ENDIF
										string = samd[i].toString().substring(11, samd[i].length())
										string = string.replace(" ","")
										IF value == null		
											value.add(string)
										ENDIF
									ENDIF
								ENDFOR							
						ENDIF
					ELSE
						IF Character.isDigit(sam.charAt(fd+1))
							argslist.add(sam.charAt(fd+1))
						ENDIF
						string = sam.substring(11, sam.length())
						string = string.replace(" ","")
						value.add(string)
					ENDIF
					ENDIF
				ENDIF
				IF script == ""
					script = scan
				ELSE
				ENDIF
			ENDIF
		ENDIF
		
	ENDWHILE
	va = value
	args = argslist
	IF value.size() != 0
	value = value.toString()
	value = value.substring(1, value.length())
	value = value.replace("]" , "")
	argslist = argslist.toString()
	argslist = argslist.substring(1, argslist.length())
	argslist = argslist.replace("]" ,"")
	script = script+""+name+"list = \""+value+"\"\r\n"+name+"args = \""+argslist+"\"\r\n"+name+"argslist = list()\r\n"+name+"valuelist = list()\r\n"+name+"args = "+name+"args.split(\",\")\r\n"+name+"value = "+name+"list.split(\",\")\r\nFOR i = 0:"+name+"args.length\r\n"+name+"argslist.add("+name+"args[i])\r\nENDFOR\r\nFOR i = 0:"+name+"value.length\r\n"+name+"valuelist.add("+name+"value[i])\r\nENDFOR\r\n"
	FOR i = 0:args.size()
		IF hr == null
			hr = args.get(i)
			hr = parseInt(hr.toString())
		ELSE
			b = args.get(i)
			b = parseInt(b.toString())
			IF b > hr
				hr = b
			ENDIF		
		ENDIF
	ENDFOR
	FOR a = 1:hr+2
		dd = a+1
		script = script+"IF amsg == \""+name+"\"\r\nIF space == "+a+"\r\n"
				FOR d = 0:va.size()
						var = va.get(d)
						IF var.contains("-") || var.contains("+") || var.contains("*") || var.contains("/")
							IF var.contains("-")
								dvar = var.replaceAll("-", "nega")
							ENDIF

							IF var.contains("+")
								dvar = var.replaceAll("+", "posi")
							ENDIF
								
							IF var.contains("*")
								dvar = var.replaceAll("*", "multi")
							ENDIF					
												
							IF var.contains("/")
								dvar = var.replaceAll("/", "div")
							ENDIF
						ELSE
							dvar = var
						ENDIF

						script = script+" var"+dvar+" = \""+va.get(d)+"\"\r\n"
				ENDFOR
				script = script + "IF msg.length >= "+dd+"\r\n"
				FOR h = 0:va.size()
					IF parseInt(args.get(h).toString()) == a - 1
						fg = a - 1

						var = va.get(h)
						IF var.contains("-") || var.contains("+") || var.contains("*") || var.contains("/")
							IF var.contains("-")
								dvar = var.replaceAll("-", "nega")
							ENDIF

							IF var.contains("+")
								dvar = var.replaceAll("+", "posi")
							ENDIF
								
							IF var.contains("*")
								dvar = var.replaceAll("*", "multi")
							ENDIF					
												
							IF var.contains("/")
								dvar = var.replaceAll("/", "div")
							ENDIF
						ELSE
							dvar = var
						ENDIF
						IF !script.contains("IF var"+var)
						script = script+"IF var"+dvar+".contains(msg["+a+"])\r\ntablist.add(\""+va.get(h)+"\")\r\nevent.setCompletions(tablist)\r\nENDIF\r\n"
						ENDIF
					ENDIF
				ENDFOR
			script = script + "\r\nELSE\r\ntablist2 = list()\r\n"
				FOR s = 0:va.size()
				
					IF parseInt(args.get(s).toString()) == a - 1
					IF !script.contains("tablist2.add(\""+va.get(s)+"\")")
						script = script+"tablist2.add(\""+va.get(s)+"\")\r\n"
					ENDIF
					ENDIF
				ENDFOR
		script = script+"event.setCompletions(tablist2)\r\nENDIF\r\nENDIF\r\nENDIF\r\n"
	ENDFOR
ENDIF
ENDFOR
	script = script+"IF event.getCompletions().size() == 0\r\nplist = list()\r\nFOR p = Bukkit.getOnlinePlayers()\r\nplist.add(p.getName())\r\nENDFOR\r\nevent.setCompletions(plist)\r\nENDIF"
	#LOG script
	IF trTabcomplete == null
		Bukkit.getConsoleSender().sendMessage("[TR] CustomTrigger 생성중")
		customTrigger.createCustomTrigger("org.bukkit.event.server.TabCompleteEvent", "TR-Tabcomplete", script)
		plugin.saveAsynchronously(customTrigger)
		trTabcomplete = customTrigger.get("TR-Tabcomplete")
		trTabcomplete.setSync(true);
		plugin.saveAsynchronously(customTrigger)
		Bukkit.getConsoleSender().sendMessage("[TR] CustomTrigger 생성완료")
	ELSE
		customTrigger.get("TR-Tabcomplete").setScript(script)
		plugin.saveAsynchronously(customTrigger)
	ENDIF
