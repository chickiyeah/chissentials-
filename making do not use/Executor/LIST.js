function LIST(args) {
	var String = Java.type('java.lang.String');
	var YamlConfiguration = Java.type('org.bukkit.configuration.file.YamlConfiguration');
	var File = Java.type('java.io.File');
	var ArrayList = Java.type('java.util.ArrayList')
	var folderpath = new File('./plugins/TriggerReactor/ListExecutor');
	var list = Java.type('java.util.List');
	if(!folderpath.exists()){
		print('creating folder LISTexecutor');
		folderpath.mkdir()
	}else{
	}
	
	if(args.length == 0){
			player.sendMessage('Invalid parameters');
	}else{
		if(typeof args[0] == 'object'){
			player.sendMessage('this type is object!!!!! where is "" ?');
			return null;
		}else{
		}
		
		if(args[0] == "help"){
			player.sendMessage('#LIST "<help/add/delete/get>" "<filename>" "<string>" "<line>"');
			player.sendMessage('#LIST "<remove> <obj or int>"');
			return null;
		}else{
		}
		
		if(args[0] == "add"){
			if(args.length < 3){
				player.sendMessage('Invalid parameters');
				return null;
			}else{
				var userfile = new File('./plugins/TriggerReactor/ListExecutor/'+args[1]+'.yml');
				var userYml = YamlConfiguration.loadConfiguration(userfile);
				if(userfile.exists()){
					var list = userYml.get('list');
					if(!list.contains(args[2])){
						list = list.add(args[2]);
						userYml.save(userfile);
						list = userYml.get('list');
						player.sendMessage('add success! new list! = '+list);
					}else{
						player.sendMessage('It already exists!! It cannot be added list = '+list);
						return null;
					}
				}else{
					userYml.set('list', new ArrayList());
					userYml.save(userfile);
					print('created new list file at '+userfile);
					var list = userYml.get('list');
					list = list.add(args[2]);
					userYml.save(userfile);
					list = userYml.get('list');
					player.sendMessage('add success! new list! = '+list);
				}
			}
		}else{
		}
		
		if(args[0] == "remove"){
			if(args.length < 3){
				player.sendMessage('Invalid parameters');
			}else{
				var userfile = new File('./plugins/TriggerReactor/ListExecutor/'+args[1]+'.yml');
				var userYml = YamlConfiguration.loadConfiguration(userfile);
				if(userfile.exists()){
					if(typeof args[2] == 'number'){
						var list = userYml.get('list');
						var size = list.size();
						if(size < args[2]){
							player.sendMessage('Input value is greater than maximum! maximum is '+size);
							return null;
						}else{
							list = list.remove(args[2]-1);
							userYml.save(userfile);
							list = userYml.get('list');
							player.sendMessage('remove success! new list! = '+list);
						}
					}else{
					}
				}else{
					player.sendMessage('file is not exists!!');
					return null;
				}
				
			}
		}else{
		}
		
	}
	
}