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

-- This table represents the buildings in the zoo.
-- They are identified by their unique buildingID.
-- They are given a name and brief description.
-- Each building tagged by the ability to host an exhibit or not.
-- If not, then you can assume it is something like a gift shop.
CREATE TABLE Building_Information ( 
	buildingID		CHAR(4) NOT NULL, 
	bName			VARCHAR(20), 
	description		VARCHAR(1000), 
	forExhibit		BOOLEAN, 

	PRIMARY KEY (buildingID) 
);

-- This table represents the staff, they are identified by their unique staffID
-- The table stores a first and last name.
-- The boolean signifies if that staff member is currently working or not.
CREATE TABLE Staff_Information ( 
	staffID			CHAR(5)	NOT NULL, 
	FirstName		VARCHAR(10), 
	LastName		VARCHAR(10), 
	ClockedIn		BOOLEAN, 

	PRIMARY KEY (staffID) 
);

-- This table represents the animals at the zoo.
-- Each animal is identified by their unique animalID.
-- The animal can further be classified by their name, species, or food type.
CREATE TABLE Animal_Information ( 
	animalID	CHAR(5)	NOT NULL, 
	aName		VARCHAR(10), 
	Species		VARCHAR(20), 
	FoodType	VARCHAR(20), 

	PRIMARY KEY (animalID)
); 

-- This table shows the relationship between the Animal_Information table
-- and the Staff_Information.
-- It signifies which animals have been assigned to which trainers
CREATE TABLE Trainer ( 
	staffID		CHAR(5) 	NOT NULL, 
	animalID	CHAR(5)		NOT NULL, 

	PRIMARY KEY (animalID, staffID), 
	FOREIGN KEY (animalID) REFERENCES Animal_Information(animalID)
	    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (staffID) REFERENCES Staff_Information(staffID)
	    ON DELETE CASCADE ON UPDATE CASCADE
); 

-- This table contains information regarding the exhibits in the zoo.
-- It identifies exhibits by their unique exhibitID
-- It contains other information such as name,
-- the time an animal spends in the exhibit,
-- and a boolean value to track if the exhibit is currently occupied or not
CREATE TABLE Animal_Exhibit_Information ( 
	exhibitID	CHAR(10) NOT NULL, 
	eName		VARCHAR(25) NOT NULL,	 
	vacancy		BOOLEAN, 
	DateStart 	DATE, 
	DateEnd		DATE, 

	PRIMARY KEY (exhibitID) 
); 

-- This table shows the relationship between Animal_Exhibit_Information
-- Animal_Information. It tells us which animals are in what exhibit.
-- The primary key is exhibitID & animalID because many animals can live in the
-- the same exhibit. This is a one-to-many relationship for exhibitID-animalID.
CREATE TABLE Participates ( 
	exhibitID	CHAR(10) NOT NULL, 
	animalID	CHAR(5)	NOT NULL, 
	wakeTime	TIME, 
	sleepTime	TIME,

	PRIMARY KEY (exhibitID, animalID), 
	FOREIGN KEY (exhibitID) REFERENCES Animal_Exhibit_Information(exhibitID)
	    ON DELETE CASCADE ON UPDATE CASCADE, 
	FOREIGN KEY (animalID) REFERENCES Animal_Information(animalID) 
	    ON DELETE CASCADE ON UPDATE CASCADE
); 

-- This table shows the location of the exhibit in the zoo.
-- It represents a relationship between Animal_Exhibit_Information
-- and Building_Information. Because many exhibits can reside in the same
-- building, we have a many-to-one relationship between exhibitID-buildingID.
CREATE TABLE Location ( 
	exhibitID	CHAR(10) NOT NULL, 
	buildingID	CHAR(4), 

	PRIMARY KEY (exhibitID,  buildingID), 
	FOREIGN KEY (exhibitID) REFERENCES Animal_Exhibit_Information(exhibitID)
	    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (buildingID) REFERENCES Building_Information(buildingID) 
	    ON DELETE CASCADE ON UPDATE CASCADE
); 
 
-- This table represents the relationship between animalID and exhibitID
-- It represents animals that have escaped their exhibit and holds a boolean
-- value if they have been captured. The relationship is many-to-one between
-- Animal_Information-Animal_Exhibit_Information.
CREATE TABLE On_the_Loose ( 
	animalID	CHAR(5)  	NOT NULL, 
	exhibitID	CHAR(10)  	NOT NULL, 
	captured	BOOLEAN     NOT NULL, 

	PRIMARY KEY (animalID, exhibitID),  
	FOREIGN KEY (animalID) REFERENCES Animal_Information(animalID)
	    ON DELETE CASCADE ON UPDATE CASCADE, 
	FOREIGN KEY (exhibitID) REFERENCES Animal_Exhibit_Information(exhibitID)
	    ON DELETE CASCADE ON UPDATE CASCADE
);