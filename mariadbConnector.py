# run "pip install mariadb" on your system first
import mariadb

# IMPORTANT: change credential according to each database before running this file.
conn = mariadb.connect(
    user="root",
    password="infiniti",
    database="zoo",
    port=3306
)

cur = conn.cursor()

# Info retrieving queries
print("\nRetrieve all clocked-in employees: ")
cur.execute("SELECT staffID,  FirstName, LastName "
            "   FROM staff_information "
            "       WHERE ClockedIn = TRUE;")
for(staffId, firstName, lastName) in cur:
    print(f"staffId: {staffId}, firstName: {firstName}, lastName: {lastName}")

print("\nRetrieve a list of all the animals currently on the loose throughout the zoo ")
cur.execute("SELECT aName, animalID, exhibitID "
            "   FROM Animal_Information NATURAL JOIN Animal_Exhibit_Information NATURAL JOIN On_the_loose "
            "       WHERE captured = FALSE;")
for(aName, animalID, exhibitID) in cur:
    print(f"aName: {aName}, animalID: {animalID}, exhibitID: {exhibitID}")

print("\nRetrieve a list of buildings that can host an exhibit")
cur.execute("SELECT buildingID AS Building "
            "   FROM Location NATURAL JOIN Animal_Exhibit_Information NATURAL JOIN Building_Information "
            "       WHERE habitat = TRUE;")
for(buildingID) in cur:
    print(f"Building: {buildingID}")

print("\nRetrieve a list of exhibits in their assigned building ")
cur.execute("SELECT buildingID AS Building, exhibitID AS Exhibit "
            "   FROM Location NATURAL JOIN Animal_Exhibit_Information NATURAL JOIN Building_Information;")
for(buildingID) in cur:
    print(f"Building: {buildingID}")

print("\nRetrieve a list of exhibits that will become vacant in May and Jun")
cur.execute("SELECT eName AS Exhibit FROM Animal_Exhibit_Information WHERE DateEnd BETWEEN '2021-04-30' AND '2021-06-20';;")
for(eName) in cur:
    print(f"Exhibit: {eName}")

conn.commit()

conn.close()
