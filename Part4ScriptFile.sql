SELECT username, account_status, default_tablespace, temporary_tablespace
FROM DBA_USERS
WHERE username= 'USER1';

SELECT username, account_status, default_tablespace, temporary_tablespace
FROM DBA_USERS
WHERE username= 'USER2';

connect USER1/CashMoney1

select city from dbdeveloper1.customer where city='Brooklyn';
Delete from dbdeveloper1.customer where driverlicensenum= ‘569854785’;
Create table department (depid number(5) primary key, depname varchar2(25) not null );
