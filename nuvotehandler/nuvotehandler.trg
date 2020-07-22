//nuvotifiter votehandler
vote = event.getVote()
{"cvname"} = vote.getUsername().toString()
{"cvservice"} = vote.getServiceName().toString()
{"cvaddress"} = vote.getAddress().toString()
{"cvtimestamp"} = vote.getTimeStamp().toString()
{"cvyear"} = $tstodate:{"cvtimestamp"}:"year"
{"cvmonth"} = $tstodate:{"cvtimestamp"}:"month"
day = $tstodate:{"cvtimestamp"}:"day"
{"cvdate"} = $tstodate:{"cvtimestamp"}:"date"
{"cvhour"} = $tstodate:{"cvtimestamp"}:"hour"
{"cvminute"} = $tstodate:{"cvtimestamp"}:"minute"
{"cvsec"} = $tstodate:{"cvtimestamp"}:"sec"
{"cvdaynum"} = day

IF {"cvhour"} >= 13
{"cvenap"} = "PM"
{"cvap"} = "오후"
{"cvapt"} = {"cvhour"} - 12
ELSE
{"cvenap"} = "AM"
{"cvap"} = "오전"
ENDIF


IF day == 0
day = "일"
{"cvenday"} = "Sunday"
ELSEIF day == 1
day = "월"
{"cvenday"} = "Monday"
ELSEIF day == 2
day = "화"
{"cvenday"} = "Tuesday"
ELSEIF day == 3
day = "수"
{"cvenday"} = "Wednesday"
ELSEIF day == 4
day = "목"
{"cvenday"} = "Thursday"
ELSEIF day == 5
day = "금"
{"cvenday"} = "Friday"
ELSEIF day == 6
day = "토"
{"cvenday"} = "Saturday"
ENDIF
{"cvday"} = day
#BROADCAST {"cvyear"}+"year "+{"cvmonth"}+"Month "+{"cvdate"}+"date "+{"cvenday"}+ ""+{"cvenap"}+" "+{"cvapt"}+"hour "+{"cvminute"}+"Minutes "+{"cvsec"}+"Second"