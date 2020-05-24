msg = event.getMessage()
#CANCELEVENT
IF {"칭호"+$playername} == "null"
IF {"직업"+$playername} == "null"
#BROADCAST "&f&l"+$playername+"&f : "+msg
ELSE
#BROADCAST "&b&l[ &7&l"+{"직업"+$playername}+" &b&l] &f&l"+$playername+" : "+msg
ENDIF
ELSE
IF {"직업"+$playername} == "null"
#BROADCAST "&6&l[ &f&l"+{"칭호"+$playername}+" &6&l] &f&l"+$playername+" : "+msg
ELSE
#BROADCAST "&6&l[ &f&l"+{"칭호"+$playername}+" &6&l] &b&l[ &7&l"+{"직업"+$playername}+" &b&l] &f&l"+$playername+" : "+msg
ENDIF
ENDIF