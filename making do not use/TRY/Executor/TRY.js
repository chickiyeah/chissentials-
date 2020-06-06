function TRY(args) {
	var String = Java.type('java.lang.String');

	if(args.length == 1){
		try{
			res = eval(args[0]);
			player.sendMessage(res)
		} catch (e) {
			player.sendMessage(e.name);
			player.sendMessage(e.message);
		}
	}else{
		try{
			res = eval(args[0]);
			player.sendMessage(res);
		} catch (e) {
			res = eval(args[1]);
			player.sendMessage(res);
		}
	}
}