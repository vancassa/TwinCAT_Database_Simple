CREATE TABLE myTable2(
	ID		INTEGER	PRIMARY KEY AUTOINCREMENT,
	Timestamp	datetime,
	Temperature1	float,
	Temperature2	float,
	Temperature3	float,
	Status	bit,
	Comment	nvarchar(50)
)