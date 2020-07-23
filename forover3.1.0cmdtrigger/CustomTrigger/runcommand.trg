import java.io.File
message = event.getMessage()
list1 = list()
split = message.split(" ")
size = split.length
FOR i = 0:size
split2 = split[i].toString()
split2 = split2.replace("/", "")
list1.add(split2)
ENDFOR
cmdlist = File("./plugins/TriggerReactor/CommandTrigger")
i=0

list = list()
FOR d = cmdlist.listFiles()
name = d.getName().toString()
IF name.endsWith(".trg")
name = name.replace(".trg", "")
list.add(name)
ELSE
ENDIF
i = i + 1
ENDFOR

IF list1.get(0).toString().contains("trgtriggers")||(list1.get(0).toString().contains("trg") && list1.get(1).toString().contains("cmd"))||(list1.get(0).toString().contains("trg") && list1.get(1).toString().contains("del"))
#STOP
ELSE
ENDIF

FOR i = 0:size
st = list1.get(i).toString()
IF list.contains(st)
#CANCELEVENT
player.chat("/trgtriggers:"+{"oncmd"})
ELSE
ENDIF
ENDFOR