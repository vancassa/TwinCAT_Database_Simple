# TwinCAT Database Example
This is an example of storing and retrieving data between TwinCAT and MS SQL database, using TF6420 TwinCAT Database Server


## Usage

1. Setup your MS SQL database. ID is identifier.

```
CREATE TABLE myTable(
   ID    bigint IDENTITY(1,1) NOT NULL,
   Timestamp datetime,
   Temperature1    float,
   Temperature2    float,
   Temperature3	float,
   Status	bit,
   Comment	nvarchar(50)
)
```

2. Setup your TwinCAT Database Configurator (Start Menu > Beckhoff > TwinCAT3 Functions > TF6420 Database Server > Configurator)

![alt tag](https://puu.sh/siP0N/ed9876f89e.png)

![alt tag](https://puu.sh/siP4x/6e29c92a85.png)

(Might need to change the AdsPort number accordingly to the PLC program)

3. Run the TwinCAT program. Random values will be stored to the database every 5 seconds. The latest record ID is stored in "nId" variable.

![alt tag](https://puu.sh/siOvO/b3e76953dd.png)


  
## How it works

What's happening inside the program:

1. The MAIN program populates the dummy temperature variable with random values.
2. The CheckConnection program checks if there's connection to the database using FB_DBConnectionOpen function block.
3. The DatabaseRecord program constructs the SQL INSERT command and executes it using FB_DBRecordArraySelect function block. The ID of the latest record is stored in 'nId' global variable.
3. Using the ID of the latest record, the data is retrieved back to PLC variable 'stRecord'

TwinCAT Database Server function blocks:
https://infosys.beckhoff.com/espanol.php?content=../content/1034/tcdbserver/html/tcdbserver_intro%20lib.htm&id=21637

Error codes:
https://infosys.beckhoff.com/espanol.php?content=../content/1034/tcdbserver/html/tcdbserver_errorcodes.htm&id=21694


## Usage with MySQL

Setup your database

![alt tag](https://puu.sh/sjEsv/bb17f5307c.png)

Setup TwinCAT Database Configurator

![alt tag](https://puu.sh/sjG5o/6ed74ed9ec.png)

MySQL uses different syntax with MS SQL. In DatabaseRecord program, change the fbFormatString part to be:

```
fbFormatString(
		sFormat:= 'INSERT INTO myTable (Timestamp,Temperature1,Temperature2,Temperature3, Status, Comment) VALUES(CURRENT_TIMESTAMP,%0.5f,%0.5f,%0.5f,%d,$'%s$'); SELECT LAST_INSERT_ID();',  
		arg1:= F_REAL(rTemp1),
		arg2:= F_REAL(rTemp2),
		arg3:= F_REAL(rTemp3),
		arg4:= F_INT(bToggle),
		arg5:= F_STRING(sComment));
```


