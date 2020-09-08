#!/bin/bash

#!/bin/bash
teleg() {
        message="Alert Device Down%0A$1 Down Please Check%0ADate : `date +%Y-%m-%d`%0ATime : `date +%H:%M:%S`"
        curl -skL "https://api.telegram.org/bot666:api/sendMessage?chat_id=-666&text=$message"
}
while IFS= read -r ip; do #open file and store to variable ip

        ping -c 2 $ip &> /dev/null
        if [ $? -ne 0 ]; then
                echo "$ip is DOWN!"
                teleg $ip
        else
                echo "$ip is UP!"
        fi

#current_date_time="`date`";
#echo $current_date_time;
done </home/eLsavation/telebot/ip.txt

