#!/bin/bash
### SAJ DATA COLLECTOR BY SEMATpl - Sebastian Matuszewski ###

plantUid=YOUR_PLANT_UID
moduleSn=YOUT_SAJSEC_SN
pageSize=1000



if [ -z "$1" ]; then
  echo "Date parameter is required. Exmple: ./command.sh 2025-01-01"
  exit 1
fi



bearer=`python3 login.py | grep Bearer | sort | uniq`
# Location of cookies file
cookies_file="cookies.pkl"

# Convert cookies from pickle to curl format
python3 -c "
import pickle
import json

# Load cookies from pickle file
with open('$cookies_file', 'rb') as f:
    cookies = pickle.load(f)

# Create cookies for curl
cookie_str = ''
for cookie in cookies:
    cookie_str += f'{cookie['name']}={cookie['value']}; '

print(cookie_str)
" > cookies.txt

date=$(date '+%Y-%m-%d')

curl --no-progress-meter "https://eop.saj-electric.com/dev-api/api/v1/monitor/sec/getSECHistoryDataList?pageNo=1&pageSize=$pageSize&plantUid=$plantUid&moduleSn=$moduleSn&chartDateType=1&chartDay=$1&appProjectName=elekeeper&clientDate=$date&lang=en&timeStamp=1745271622417&random=mBMYMh6Yt6ieM5PryFHatXKGkdhhhjw5&clientId=esolar-monitor-admin&signParams=pageNo,pageSize,plantUid,moduleSn,chartDateType,chartDay,appProjectName,clientDate,lang,timeStamp,random,clientId&signature=EE3F1BE42122FCB47BF941B6B4B881CABB04C767" \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H "Authorization: $bearer"\
  -H 'lang: en' \
  -H 'sec-ch-ua: "Not(A:Brand";v="99", "Google Chrome";v="133", "Chromium";v="133"' \
  -H 'enableSign: false' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Content-Language: zh_CN' -b cookies.txt