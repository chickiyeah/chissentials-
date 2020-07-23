cmd = event.getMessage().toString().replace("/", "")
//만약 명령어 입력 앞에 cmi같은 이상한것이 붙으면 아래의 것처럼 리플레이스해주세요. 공백까지 해주셔야합니다.

cmd = cmd.replace("cmi ", "")


{"oncmd"} = cmd