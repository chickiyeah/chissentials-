function TRY(args) {
	var String = Java.type('java.lang.String');

	if(args.length == 1){
		try{
			eval(args[0]);
		} catch (e) {
			player.sendMessage(e.name);
			player.sendMessage(e.message);
		}
	}else{
		try{
			eval(args[0]);
		} catch (e) {
			eval(args[1]);
		}
	}
}