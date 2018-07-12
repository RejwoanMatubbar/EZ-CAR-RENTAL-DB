
Select Mileage, MAKE, MODEL, YEAR
from Vehicle_Mileage 
Where Mileage < 1000 ;

Select Make, Model, VEHICLESTATUS, VEHICLESTATUSID
from Vehicle_Availability
Where VEHICLESTATUS = 'Available';

Select * 
from Customer_Type
Where CUSTOMERTYPE = 'Private';

Select City, Model, Make, CURRENTAGENCYID
from VehicleAgency_Location
Where CITY = 'Brooklyn';

Select Make, Model, Trunkcapacity
from Vehicle_Trunk 
Where Make = 'Ford';

Select * 
from CREDITCARD_NUM
Where CARDNUM = 1254789632154856;

select *
from EZPLUSPOINTS_NUMBER
where EZPLUSEARNEDPOINTS = 234;

Select * 
from DISCOUNT_CODE 
where DISCOUNTDESC = '10% off next rental';

Select SUM(ezplusearnedpoints)
from EZPLUSPOINTS_NUMBER;

Select *
from VEHICLE_INFO
Where Year = 2018;

