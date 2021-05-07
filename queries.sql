-- List the names of all the animals who are diurnal(active during the day)
SELECT aName as Name, Species
FROM participates NATURAL JOIN animal_information
WHERE wakeTime > '06:00:00' AND wakeTime < '11:00:00';

-- List the names of all the animals who are nocturnal(active during the night)
SELECT aName as Name, Species 
FROM participates NATURAL JOIN animal_information
WHERE wakeTime > '18:00:00' AND wakeTime < '23:00:00';

-- All of the dolphins are being freed back into the ocean!
-- Delete all dolphins from the database
SET SQL_SAFE_UPDATES = 0;

Select species FROM animal_information
ORDER BY species;

DELETE FROM Animal_information
WHERE species = 'Dolphin';

Select species FROM animal_information
ORDER BY species;

-- The zoo is going green and all carnivores are being sent back into the wild.
-- Delete all carnivores from the database
Select species FROM animal_information
ORDER BY species;

DELETE FROM Animal_information
WHERE FoodType = 'Meat' OR FoodType = 'Fish' OR FoodType = 'Mice';

Select species FROM animal_information
ORDER BY species;

-- The dark rooms that all the nocturnal animals are in are not making a profit.
-- Delete all nocturnal animals
Select species FROM animal_information
ORDER BY species;

DELETE FROM Animal_information
WHERE species in (SELECT species
					FROM participates NATURAL JOIN animal_information
					WHERE wakeTime > '18:00:00' AND wakeTime < '23:00:00');

Select species FROM animal_information
ORDER BY species;

-- It is not sunny enough at our zoos location and all of of our diurnal animals have got depressed.
-- They must be moved to a new zoo
-- Delete all diurnal animals
Select species FROM animal_information
ORDER BY species;

DELETE FROM Animal_information
WHERE species in (SELECT species
					FROM participates NATURAL JOIN animal_information
					WHERE wakeTime > '06:00:00' AND wakeTime < '10:00:00');
                    
Select species FROM animal_information
ORDER BY species;

SET SQL_SAFE_UPDATES = 1;

-- Gather a list of all the animals currently on the loose throughout the zoo
SELECT aName, animalID, exhibitID
FROM Animal_Information NATURAL JOIN Animal_Exhibit_Information NATURAL JOIN On_the_loose
WHERE captured = FALSE;

-- Gather a list of buildings that can host an exhibit
SELECT buildingID AS Building
FROM Location NATURAL JOIN Animal_Exhibit_Information NATURAL JOIN Building_Information
WHERE habitat = TRUE;

-- Gather a list of exhibits in their assigned building
SELECT buildingID AS Building, exhibitID AS Exhibit
FROM Location NATURAL JOIN Animal_Exhibit_Information NATURAL JOIN Building_Information;

-- Gather a list of exhibits that will become vacant in May
SELECT eName AS Exhibit FROM Animal_Exhibit_Information
WHERE DateEnd BETWEEN '2021-04-30' AND '2021-06-01';

-- Gather a list of exhibits that have been closed all year, but could open later in the year
SELECT eName AS Exhibit FROM Animal_Exhibit_Information
WHERE ((DateStart < '2021-01-01') OR (DateStart > DATE(NOW())))
    AND (DateEnd < '2021-01-01') OR (DateEnd > DATE(NOW()));

-- Gather a list of certified trainers
SELECT DISTINCT(FirstName)
FROM Staff_Information NATURAL JOIN Animal_Information NATURAL JOIN Trainer;

-- Gather a list of trainer who trains Coco, the monkey
SELECT FirstName 
FROM Staff_Information NATURAL JOIN Animal_Information NATURAL JOIN Trainer
WHERE aName = "Coco";

-- Coco the monkey died, please remove her from the DB 
-- as well as the trainers that are assigned to her
DELETE FROM Animal_Information 
WHERE aName = "Coco";    

-- Gather a list of animals who has Long as a trainer
SELECT aName
FROM Staff_Information NATURAL JOIN Animal_Information NATURAL JOIN Trainer
WHERE FirstName = "Long";

-- Gather a list of trainers that does not train Penguins
SELECT DISTINCT(FirstName) 
FROM Staff_Information NATURAL JOIN Animal_Information NATURAL JOIN Trainer
	WHERE (FirstName) NOT IN (SELECT FirstName 
		FROM Staff_Information NATURAL JOIN Animal_Information NATURAL JOIN Trainer
			WHERE Species = "Penguin");
            
-- Clock Jordan out if it is 4:20
UPDATE Staff_Information SET ClockedIn = 
    IF (CURRENT_TIME() = '04:20:00', false, true)
WHERE (FirstName = 'Jordan' AND LastName = 'Seiler');

-- Clock Jordan in on if it is Monday, Wednesday, Friday, and Sunday
UPDATE Staff_Information SET CLOCKEDIN =
    WHEN WEEKDAY(CURDATE()) = 0 THEN true
    WHEN WEEKDAY(CURDATE()) = 1 THEN false
    WHEN WEEKDAY(CURDATE()) = 2 THEN true
    WHEN WEEKDAY(CURDATE()) = 3 THEN false
    WHEN WEEKDAY(CURDATE()) = 4 THEN true
    WHEN WEEKDAY(CURDATE()) = 5 THEN false
    WHEN WEEKDAY(CURDATE()) = 6 THEN true
WHERE (FirstName = 'Jordan' AND LastName = 'Seiler');
            
            


            
            
