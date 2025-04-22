# DataCollector from EOPSAJ for SAJSEC!

The repository contains the first version of a simple script for pulling data from the new portal for SAJ inverters. The tool supports only the extraction of data transferred by the SAJ SEC module.


## Required modules:
* python3
* Selenium
* pickle
* time
* curl

## Files description

* **login.py** Python script for authentication at https://eop.saj-electric.com - script saves cookie file and bearer token
* **getLastOneData.sh** A bash script that retrieves the single most recent available SEC data record from the EOP.
* **getAllDataSpecDay.sh** A bash script that retrieves all available SEC data records for a specific day from EOP.

## 

## Script configuration:
* login credential - put your login and password in file login.py in this line:
```
#User credentials

username_field.send_keys("YOUR EMAIL") # YOUR EMAIL

password_field.send_keys("YOUR PASSWORD") # YOUR PASSWORD
```

* PLANT UID and SEC MODULE SN - put your plant uid and SEC MODULE SN in *.sh file in this line:
```
plantUid=YOUR_PLANT_UID
moduleSn=YOUT_SAJSEC_SN
```


## Getting one last record:

```
getLastOneData.sh
```

## Getting all data record from the specified date:

```
getAllDataSpecDay.sh YYYY-MM-DD


getAllDataSpecDay.sh 2025-01-01
```


### NOTE: the script runs slowly because of the way it authenticates. The script just works, but it is not efficient and needs to be expanded and optimized.