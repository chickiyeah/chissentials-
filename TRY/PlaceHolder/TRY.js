function TRY(args) {
	var String = Java.type('java.lang.String');

	if(args.length == 1){
		try{
			res = eval(args[0]);
			if(typeof res == "number"){
				res = res.toString();
				return res;
			}else{
				return res;
			}
			return res;
		} catch (e) {
			player.sendMessage(e.name);
			player.sendMessage(e.message);
		}
	}else{
		try{
			res = eval(args[0]);
			return res;
		} catch (e) {
			res = eval(args[1]);
			return res;
		}
	}
}