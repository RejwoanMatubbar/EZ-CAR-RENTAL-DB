CREATE TABLE Customer 
(
DriverLicenseNum NUMBER(20) NOT NULL, 
DLExpDate DATE NOT NULL,
FirstName VARCHAR2(40) NOT NULL, 
LastName VARCHAR2(40) Not NULL, 
StreetAddress VARCHAR2(75) NOT NULL, 
City VARCHAR2(25) NOT NULL, 
State VARCHAR2(20) NOT NULL,
Country VARCHAR2(30) NOT NULL,
ZipCode VARCHAR2(10) NOT NULL, 
DOB DATE NOT NULL,
MobileNumber NUMBER(11) NOT NULL, 
Email VARCHAR2(60) NOT NULL, 
CustomerType VARCHAR2(30) NOT NULL, 
CONSTRAINT DriverLicenseNum_PK PRIMARY KEY(DriverLicenseNum)
);

CREATE TABLE CreditCard 
( 
CardNum NUMBER(16) NOT NULL, 
CardOwnerName VARCHAR2(50) NOT NULL, 
MerchantName VARCHAR2(60) NOT NULL, 
ExpDate DATE NOT NULL, 
CONSTRAINT CardNum_PK PRIMARY KEY(CardNum)
);
CREATE TABLE Customer_CreditCard
(
CardNum NUMBER(16)  NOT NULL, 
DriverLicense NUMBER(30) NOT NULL,

CONSTRAINT CardNumberDriverLicense_CPK 
PRIMARY KEY(CardNum, DriverLicense),

CONSTRAINT CardNum_FK 
FOREIGN KEY (CardNum) 
REFERENCES CreditCard (CardNum), 

CONSTRAINT DriverLicense_FK 
FOREIGN KEY (DriverLicense) 
REFERENCES Customer (DriverLicenseNum)
);

CREATE TABLE CompanyID
(
CompanyID NUMBER(15) NOT NULL, 
CompanyName VARCHAR2(40) NOT NULL, 
ContactName VARCHAR2(100) NOT NULL, 
ContactNumber NUMBER(11) NOT NULL, 

CONSTRAINT CompanyID_PK PRIMARY KEY (CompanyID)
); 

CREATE TABLE Corporate_Customer 
( CDriverLicenseNum NUMBER(30) NOT NULL,
CompanyID NUMBER(15) NOT NULL,  
CorporateRate DECIMAL(4,2) NOT NULL, 

CONSTRAINT CDriverLicenseNum_PK PRIMARY KEY( CDriverLicenseNum),

CONSTRAINT CDriverLicenseNum_FK
FOREIGN KEY (CDriverLicenseNum)
REFERENCES Customer (DriverLicenseNum), 

CONSTRAINT CompanyID_FK 
FOREIGN KEY (CompanyID)
REFERENCES CompanyID (CompanyID)

);

CREATE TABLE Discount
(
DiscountCode VARCHAR2(20) NOT NULL, 
DiscountDesc VARCHAR2(70) NOT NULL, 

CONSTRAINT DiscountCode_PK PRIMARY KEY (DiscountCode)
);

CREATE TABLE EZPlus
(
EZPlusNumber NUMBER(20) NOT NULL, 
EZPlusEarnedPoints NUMBER(10) NOT NULL,

CONSTRAINT EZPlusNumber_PK PRIMARY KEY (EZPlusNumber)
);

CREATE TABLE Private_Customer
(
PDriverLicenseNum NUMBER(30) NOT NULL, 
DiscountCode VARCHAR2(20) NOT NULL, 
EZPlusNumber NUMBER(30) NOT NULL, 

CONSTRAINT PDriverLicenseNumPK PRIMARY KEY (PDriverLicenseNum), 

CONSTRAINT PDriverLicenseNum_FK
FOREIGN KEY (PDriverLicenseNum)
REFERENCES Customer (DriverLicenseNum),

CONSTRAINT DiscountCode_FK 
FOREIGN KEY (DiscountCode) 
REFERENCES Discount (DiscountCode), 

CONSTRAINT EZPlusNumber_FK
FOREIGN KEY (EZPlusNumber)
REFERENCES EZPlus (EZPlusNumber)

);


 CREATE TABLE Reservation_Status
(
ReservationStatusID NUMBER(20) NOT NULL, 
ReservationStatus VARCHAR2(50) NOT NULL, 

CONSTRAINT ReservationStatusID_PK PRIMARY KEY(ReservationStatusID)
);

CREATE TABLE Vehicle_Rental_Category
(
CategoryID NUMBER(20) NOT NULL, 
CategoryName VARCHAR2(25) NOT NULL, 
CategoryRate Decimal(4,2) NOT NULL

);

CREATE TABLE Rental_Agency
(
AgencyID NUMBER(20) NOT NULL, 
AgencyName VARCHAR2(40) NOT NULL, 
StreetAddrees VARCHAR2(75) NOT NULL, 
City VARCHAR2(20) NOT NULL, 
State VARCHAR2(2) NOT NULL, 
Country VARCHAR2(25) NOT NULL, 
ZipCode VARCHAR2(10) NOT NULL, 
PhoneNumber NUMBER(11) NOT NULL, 
CONSTRAINT AgencyID_PK PRIMARY KEY (AgencyID)
);
CREATE TABLE Reservation
(
ConfirmationID NUMBER(20) NOT NULL, 
DriverLicenseNum NUMBER(30) NOT NULL, 
CategoryID NUMBER(20) NOT NULL, 
AgencyID NUMBER(20) NOT NULL, 
PickupAgencyID NUMBER(20) NOT NULL, 
DropOffAgencyID NUMBER(20) NOT NULL, 
RentalDate DATE NOT NULL, 
RentalTime NUMBER(4) NOT NULL, 
ReturnDate DATE NOT NULL, 
ReturnTime NUMBER(4) NOT NULL, 
ReservationStatusID NUMBER(20) NOT NULL, 
EstimatedCost Decimal(10,2) NOT NULL, 

CONSTRAINT ConfirmationID_PK PRIMARY KEY(ConfirmationID), 

CONSTRAINT DriverLicenseNum_FK 
FOREIGN KEY (DriverLicenseNum)
REFERENCES Customer (DriverLicenseNum ), 

CONSTRAINT CategoryID_FK 
FOREIGN KEY (CategoryID)
REFERENCES Vehicle_Rental_Category (CategoryID), 

CONSTRAINT AgencyID_FK 
FOREIGN KEY (AgencyID) 
REFERENCES Rental_Agency (AgencyID), 

CONSTRAINT PickupAgencyID_FK 
FOREIGN KEY (PickupAgencyID) 
REFERENCES Rental_Agency (AgencyID), 

CONSTRAINT DropOffAgencyID_FK 
FOREIGN KEY (DropOffAgencyID) 
REFERENCES Rental_Agency (AgencyID), 

CONSTRAINT ReservationStatusID_FK 
FOREIGN KEY (ReservationStatusID) 
REFERENCES Reservation_Status (ReservationStatusID)

);

ALTER TABLE Vehicle_Rental_Category
ADD CONSTRAINT CategoryID_PK PRIMARY KEY(CategoryID);


CREATE TABLE Fuel_Option 
(
FuelOptionID NUMBER(20) NOT NULL, 
FuelOptionDesc VARCHAR2(75) NOT NULL,

CONSTRAINT FuelOptionID_PK PRIMARY KEY (FuelOptionID)
);

CREATE TABLE Vehicle_Status
(
VehicleStatusID NUMBER(20) NOT NULL, 
VehicleStatus VARCHAR2(15) NOT NULL, 

CONSTRAINT VehicleStatusID_PK PRIMARY KEY (VehicleStatusID)
);

CREATE TABLE VEHICLE 
(
VINNumber NUMBER(10) NOT NULL, 
Make VARCHAR2(25) NOT NULL, 
Model VARCHAR2(30) NOT NULL, 
Year NUMBER(4) NOT NULL,
RentalCategoryID NUMBER(20) NOT NULL, 
Color VARCHAR2(12) NOT NULL, 
PlateNumber VARCHAR2(12) NOT NULL, 
Mileage NUMBER(5) NOT NULL, 
TransmissionType VARCHAR2(20) NOT NULL, 
SeatCapacity NUMBER(3) NOT NULL, 
DailyRentalCost NUMBER(5) NOT NULL, 
VehicleStatusID NUMBER(20) NOT NULL, 
AssignedAgencyID NUMBER(20) NOT NULL, 
CurrentAgencyID NUMBER(20) NOT NULL, 
VehicleType VARCHAR2(20) NOT NULL,

CONSTRAINT VINNumber_PK PRIMARY KEY (VINNumber),

CONSTRAINT RentalCategoryID_FK 
FOREIGN KEY (RentalCategoryID)
REFERENCES Vehicle_Rental_Category (CategoryID),

CONSTRAINT VehicleStatusID_FK 
FOREIGN KEY (VehicleStatusID)
REFERENCES Vehicle_Status (VehicleStatusID),

CONSTRAINT AssignedAgencyID_FK 
FOREIGN KEY (AssignedAgencyID)
REFERENCES Rental_Agency (AgencyID),

CONSTRAINT CurrentAgencyID_FK 
FOREIGN KEY (CurrentAgencyID )
REFERENCES Rental_Agency (AgencyID)
);


CREATE TABLE Rental 
(
RentalAgreementNumber NUMBER(10) NOT NULL, 
DriverLicenseNum NUMBER(30) NOT NULL, 
VINNumber NUMBER(10) NOT NULL, 
AgencyID NUMBER(20) NOT NULL, 
PickUpAgencyID NUMBER(20) NOT NULL, 
DropOffAgencyID NUMBER(20) NOT NULL, 
PickupDate DATE NOT NULL, 
PickupTime NUMBER(4) NOT NULL, 
DropOffDate DATE NOT NULL, 
DropOffTime NUMBER(4) NOT NULL, 
PickUpOdometer NUMBER(10) NOT NULL, 
DropOffOdometerValue NUMBER(10) NOT NULL, 
RentalCost DECIMAL(6,2) NOT NULL, 
FuelOptionID NUMBER(20) NOT NULL, 
InsuranceCost NUMBER(5) NOT NULL, 

CONSTRAINT RentalAgreementNumber_PK PRIMARY KEY (RentalAgreementNumber),

CONSTRAINT DriverLicenseNum_FK2
FOREIGN KEY (DriverLicenseNum )
REFERENCES Customer (DriverLicenseNum ),


CONSTRAINT VINNumber_FK2
FOREIGN KEY (VINNumber )
REFERENCES Vehicle (VINNumber),

CONSTRAINT AgencyID_FK2
FOREIGN KEY (AgencyID )
REFERENCES Rental_Agency (AgencyID),

CONSTRAINT PickUpAgencyID_FK2
FOREIGN KEY (PickUpAgencyID )
REFERENCES Rental_Agency (AgencyID),

CONSTRAINT DropOffAgencyID_FK2
FOREIGN KEY (DropOffAgencyID )
REFERENCES Rental_Agency (AgencyID),

CONSTRAINT FuelOptionID_FK
FOREIGN KEY (FuelOptionID )
REFERENCES Fuel_Option (FuelOptionID)

);

CREATE TABLE Car 
(
CVINNumber NUMBER(10) NOT NULL, 
TrunkCapacity DECIMAL(5,2) NOT NULL, 

CONSTRAINT CVINNumber_PK PRIMARY KEY (CVINNumber), 

CONSTRAINT CVINNumber_FK
FOREIGN KEY(CVINNumber)
REFERENCES Vehicle (VINNumber) 
);

CREATE TABLE Minivan_SUV 
(
MVINNumber NUMBER(10) NOT NULL, 
TowingCapacity DECIMAL(6,2) NOT NULL, 
IsAWD VARCHAR2(20) NOT NULL, 

CONSTRAINTS MVINNumber_PK PRIMARY KEY (MVINNumber),

CONSTRAINTS MVINNumber_FK 
FOREIGN KEY (MVINNumber)
REFERENCES Vehicle (VINNumber)
);

CREATE TABLE Van 
(
VVINNumber NUMBER(10) NOT NULL, 
CargoCapacity DECIMAL(6,2) NOT NULL, 
MaximumPayload DECIMAL(7,2) NOT NULL, 
CONSTRAINTS VVINNumber_PK PRIMARY KEY (VVINNumber),

CONSTRAINTS VVINNumber_FK 
FOREIGN KEY (VVINNumber) 
REFERENCES Vehicle (VINNumber)
); 


