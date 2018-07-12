INSERT into CREDITCARD 
Values (4256986523154896, 'Allen Smith', 'EZ-Car Rental', '13-Jan-17');

INSERT into CREDITCARD 
Values (5696552365748411, 'Dangelo Johnson', 'EZ-Car Rental', '25-May-15');

INSERT into CREDITCARD 
Values (1235986547859632, 'Ashley Woodson', 'EZ-Car Rental', '13-May-13');

INSERT into CREDITCARD 
Values (4207254899958963, 'Alex Jackson', 'EZ-Car Rental', '02-Nov-12');

INSERT into CREDITCARD 
Values (4207555420325899, 'Amanda Lugo', 'EZ-Car Rental', '01-Feb-18');


Select CARDNUM ,
CARDOWNERNAME ,
MERCHANTNAME ,
EXPDATE 
from CREDITCARD;


INSERT INTO Customer 
Values (123569852, '05-Sep-23', 'Allen', 'Smith', '1008 Green St', 'Brooklyn', 'NY','USA', '11222', '13-May-89', 9174536855, 'asmith@yahoo.com','Private');

INSERT INTO Customer 
Values (569854785, '12-Jan-21', 'Ashley', 'Woodson', '191 Kent St', 'Brooklyn', 'NY','USA', '11222', '10-Aug-93', 3475562132, 'awoodson@gmail.com','Corporate'); 

INSERT INTO Customer 
Values (475896958, '07-Sep-20', 'Dangelo', 'Johnson', '655 Java St', 'Brooklyn', 'NY','USA', '11222', '07-Jan-95', 7183896544, 'djohnson@yahoo.com','Private');

INSERT INTO Customer 
Values (986525214, '17-Jul-19', 'Amanda', 'Lugo', '1516 Broadway', 'Manhattan', 'NY','USA', '10036', '27-Mar-97', 2125644324, 'alugo@hotmail.com','Corporate');

INSERT INTO Customer 
Values (124587458, '22-Sep-18', 'Alex', 'Jackson', '1517 Broadway', 'Manhattan', 'NY','USA', '10036', '19-Feb-74', 2126958554, 'ajackson2145@gmail.com','Private');

Select DRIVERLICENSENUM ,
DLEXPDATE ,
FIRSTNAME ,
LASTNAME ,
STREETADDRESS ,
CITY ,
STATE ,
COUNTRY ,
ZIPCODE ,
DOB ,
MOBILENUMBER ,
EMAIL ,
CUSTOMERTYPE 
from Customer;

INSERT INTO Customer_CreditCard
Values (4256986523154896, 123569852);

INSERT INTO Customer_CreditCard
Values (5696552365748411, 475896958);

INSERT INTO Customer_CreditCard
Values (1235986547859632, 569854785);

INSERT INTO Customer_CreditCard
Values (4207555420325899, 986525214);

Select CARDNUM ,
DRIVERLICENSE 
from Customer_CreditCard;


Select DRIVERLICENSENUM ,
DLEXPDATE ,
FIRSTNAME ,
LASTNAME ,
STREETADDRESS ,
CITY ,
STATE ,
COUNTRY ,
ZIPCODE ,
DOB ,
MOBILENUMBER ,
EMAIL ,
CUSTOMERTYPE  
from Customer 
Where DRIVERLICENSENUM = 124587458;

Select CARDNUM ,
DRIVERLICENSE 
from Customer_CreditCard
Where cardnum = 1235986547859632;

Select Customer.Driverlicensenum, Customer_CreditCard.DriverLicense, Customer_CreditCard.CardNum, CREDITCARD.CardNum
from Customer
Inner Join Customer_CreditCard ON Customer.Driverlicensenum =  Customer_CreditCard.DriverLicense
Inner Join Customer_CreditCard ON Customer_CreditCard.CardNum = CREDITCARD.CardNum;


Update CREDITCARD 
Set cardownername = 'Lisa Simpson', EXPDATE = '13-Jul-18', MERCHANTNAME = 'EZ-Car'
Where cardnum= 4256986523154896;

Select CARDNUM ,
CARDOWNERNAME ,
MERCHANTNAME ,
EXPDATE 
from creditcard;

Update Customer
Set DOB = '05-Jun-90' 
Where driverlicensenum =  123569852;

Select DRIVERLICENSENUM ,
DLEXPDATE ,
FIRSTNAME ,
LASTNAME ,
STREETADDRESS ,
CITY ,
STATE ,
COUNTRY ,
ZIPCODE ,
DOB ,
MOBILENUMBER ,
EMAIL ,
CUSTOMERTYPE  
from Customer;

Delete from customer_creditcard
where DRIVERLICENSE = 123569852;

Delete from customer 
where driverlicensenum = 123569852;

Select DRIVERLICENSENUM ,
DLEXPDATE ,
FIRSTNAME ,
LASTNAME ,
STREETADDRESS ,
CITY ,
STATE ,
COUNTRY ,
ZIPCODE ,
DOB ,
MOBILENUMBER ,
EMAIL ,
CUSTOMERTYPE 
from customer;

select CARDNUM ,
DRIVERLICENSE  
from customer_creditcard;

Delete from customer_creditcard
where cardnum = 1235986547859632;

select CARDNUM ,
DRIVERLICENSE  
from customer_creditcard;