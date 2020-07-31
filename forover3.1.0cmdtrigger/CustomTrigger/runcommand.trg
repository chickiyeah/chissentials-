import java.io.File
message = event.getMessage()
list1 = list()

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

message = message.replace("/" ,"")

// /trg 명령어를 사용할때 오류가 나는 점 수정

IF message == "trg"
#STOP
ENDIF

//커맨드가 다른 플러그인에 의해 강제 변경되는경우 이 사이에서 리플레이스 해주세요. 공백까지 리플레이스 해주어야합니다.

message = message.replace("cmi ", "")

//커맨드가 다른 플러그인에 의해 강제 변경되는경우 이 사이에서 리플레이스 해주세요. 공백까지 리플레이스 해주어야합니다.
split = message.split(" ")
size = split.length
FOR i = 0:size
split2 = split[i].toString()
split2 = split2.replace("/", "")
list1.add(split2)
ENDFOR

IF list.get(0).toString().contains("trg")|| list1.get(0).toString().contains("trgtriggers")||(list1.get(0).toString().contains("trg") && list1.get(1).toString().contains("cmd"))||(list1.get(0).toString().contains("trg") && list1.get(1).toString().contains("del"))
#STOP
ELSE
ENDIF

FOR i = 0:1
st = list1.get(i).toString()
IF list.contains(st)
#CANCELEVENT
player.chat("/trgtriggers:"+message)
ELSE
ENDIF
ENDFOR
