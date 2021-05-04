-- Drop tables if they already exist so that they can get recreated.
-- Drop the referencing tables first to respect referential integrity.
-- Notice that we get warnings if we try to drop tables that don't exist.
DROP TABLE IF EXISTS Building_Information;
DROP TABLE IF EXISTS Staff_Information;
DROP TABLE IF EXISTS Animal_Information;
DROP TABLE IF EXISTS Animal_Exhibit_Information;
DROP TABLE IF EXISTS Animal_Schedule_Informaiton;
DROP TABLE IF EXISTS Trainer;
DROP TABLE IF EXISTS Participates;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Feeding;
DROP TABLE IF EXISTS On_the_Loose;

CREATE TABLE Building_Information ( 
	buildingID		CHAR(4), 
	bName			VARCHAR(20), 
	description		VARCHAR(1000), 
	forExhibit		BOOLEAN, 

	PRIMARY KEY (buildingID) 
);

CREATE TABLE Staff_Information ( 
	staffID			CHAR(5)	NOT NULL, 
	FirstName		VARCHAR(10), 
	LastName		VARCHAR(10), 
	ClockedIn		BOOLEAN, 

	PRIMARY KEY (staffID) 
);

CREATE TABLE Animal_Information ( 
	animalID	CHAR(5)	NOT NULL, 
	aName		VARCHAR(10), 
	Species		VARCHAR(20), 
	FoodType	VARCHAR(20), 

	PRIMARY KEY (animalID)
); 

CREATE TABLE Trainer ( 
	staffID		CHAR(5) 	NOT NULL, 
	animalID	CHAR(5)		NOT NULL, 

	PRIMARY KEY (animalID, staffID), 
	FOREIGN KEY (animalID) REFERENCES Animal_Information(animalID),
	FOREIGN KEY (staffID) REFERENCES Staff_Information(staffID) 
); 

CREATE TABLE Animal_Exhibit_Information ( 
	exhibitID	CHAR(10) NOT NULL, 
	eName		VARCHAR(25) NOT NULL,	 
	vacancy		BOOLEAN, 
	DateStart 	DATE, 
	DateEnd		DATE, 

	PRIMARY KEY (exhibitID) 
); 

CREATE TABLE Participates ( 
	exhibitID	CHAR(10) NOT NULL, 
	animalID	CHAR(5)	NOT NULL, 
	wakeTime	TIME, 
	sleepTime	TIME, 

	PRIMARY KEY (exhibitID, animalID), 
	FOREIGN KEY (exhibitID) REFERENCES Animal_Exhibit_Information(exhibitID), 
	FOREIGN KEY (animalID) REFERENCES Animal_Information(animalID) 
); 

CREATE TABLE Location ( 
	exhibitID	CHAR(10) NOT NULL, 
	buildingID	CHAR(4), 

	PRIMARY KEY (exhibitID,  buildingID), 
	FOREIGN KEY (exhibitID) REFERENCES Animal_Exhibit_Information(exhibitID), 
	FOREIGN KEY (buildingID) REFERENCES Building_Information(buildingID) 
); 


CREATE TABLE On_the_Loose ( 
	animalID	CHAR(5)  	NOT NULL, 
	exhibitID	CHAR(10)  	NOT NULL, 
	captured	BOOLEAN     NOT NULL, 

	PRIMARY KEY (animalID),  
	FOREIGN KEY (animalID) REFERENCES Animal_Information(animalID) ON DELETE CASCADE ON UPDATE CASCADE, 
	FOREIGN KEY (exhibitID) REFERENCES Animal_Exhibit_Information(exhibitID)
); 

  