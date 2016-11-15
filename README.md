# TwinCAT Database Example
This is an example of storing data from TwinCAT to MS SQL database, using TF6420 TwinCAT Database Server


## Usage

1. Setup your MS SQL database. ID is primary key and identifier.

![alt tag](https://puu.sh/siU53/a3ac68d7ae.png)

2. Setup your TwinCAT Database Configurator (Start Menu > Beckhoff > TwinCAT3 Functions > TF6420 Database Server > Configurator)

![alt tag](https://puu.sh/siP0N/ed9876f89e.png)

![alt tag](https://puu.sh/siP4x/6e29c92a85.png)

(Might need to change the AdsPort number accordingly to the PLC program)

3. Run the TwinCAT program. Random values will be stored to the database every 5 seconds. The latest record ID is stored in "nId" variable.

![alt tag](https://puu.sh/siOvO/b3e76953dd.png)


  
## How it works

What's happening inside the program:

1. The MAIN program populates the dummy temperature variable with random values.
2. The DatabaseRecord program firstly checked if there is connection to the database by executing FB_DBConnectionOpen function block. Then, it construct the SQL INSERT command and execute it using FB_DBRecordArraySelect function block. The ID of the latest record is stored in 'nId' variable.
3. Using the ID of the latest record, the data is retrieved back to PLC variable 'stRecord'

TwinCAT Database Server function blocks:
https://infosys.beckhoff.com/espanol.php?content=../content/1034/tcdbserver/html/tcdbserver_intro%20lib.htm&id=21637

Error codes:
https://infosys.beckhoff.com/espanol.php?content=../content/1034/tcdbserver/html/tcdbserver_errorcodes.htm&id=21694



