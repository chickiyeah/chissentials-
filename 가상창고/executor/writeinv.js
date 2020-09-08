function writeinv(args){
	var fw = Java.type("java.io.FileWriter");
	var buf = Java.type("java.io.BufferedWriter");
	var File = Java.type("java.io.File");
	file = new File(args[0]);
	if(!file.exists) {
		file.createNewFile()
	fe = new buf(new fw(file, false));
	fe.write(args[1]);
	fe.close();
		}else{
	if(args[2] == 0){
	fe = new buf(new fw(file, false));
	fe.write(args[1]);
	fe.close()}else{
	fe = new buf(new fw(file, true));
	fe.write("\n"+args[1]);
	fe.close();
	}
	    }

}