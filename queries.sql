SELECT * 
FROM participates NATURAL JOIN animal_information;

-- List the names of all the animals who are diurnal(active during the day)
SELECT aName as Name, Species
FROM participates NATURAL JOIN animal_information
WHERE wakeTime > '06:00:00' AND wakeTime < '10:00:00';

-- List the names of all the animals who are nocturnal(active during the night)
SELECT aName as Name, Species 
FROM participates NATURAL JOIN animal_information
WHERE wakeTime > '18:00:00' AND wakeTime < '23:00:00';

