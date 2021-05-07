-- Populate Building_Information table
INSERT INTO Building_Information VALUES
	('A1', 'Monkey Cage', 'For keeping the monkeys', False),
    ('A2', 'Penguin Enclosure', 'For keeping the penguins', True),
    ('A3', 'Zebra Pasture', 'For keeping the zebras', True),
    ('A4', 'Lion Lair', 'For keeping the lion', False),
    ('A5', 'Tiger Cage', 'For keeping the tigers', False),
    ('A6', 'Dolphin Pool', 'For keeping the dolphins', False),
    ('A7', 'Owl Cage', 'For keeping the owls', False),
    ('B1', 'Food warehouse', 'For holding the foods for all animals', False),
    ('B2', 'Tool warehouse', 'For holding and maintaining tools', False),
    ('B3', 'Vehicle warehouse', 'For holding and maintaining vehicles', False),
    ('C1', 'Lion Exhibit', 'For showcasing lions', True),
    ('C2', 'Tiger Exhibit', 'For showcasing tigers', True),
    ('C3', 'Monkey Exhibit', 'For showcasing tigers', True),
    ('C4', 'Dolphin Pool', 'For exhibiting dolphins', False),
    ('C5', 'Owl Exhibit', 'For showcasing owls', True);
    
-- Populate Staff_Information table    
INSERT INTO Staff_Information VALUES
	('DEHXA', 'Long', 'Nguyen', True),  -- administrating member
    ('OBXSH', 'Jordan', 'Seiler', True),-- administrating member
    ('OHSBT', 'Huy', 'Nguyen', True),	-- administrating member
    ('SSNOF', 'Dylan', 'Victor', True), -- administrating member
    ('JRQNH', 'Owen', 'Grady', True),   -- recruited from Jurassic World
    ('SBZME', 'Tony', 'Stark', False),  -- recruited from Avenger, currently OOO
    ('UYARS', 'Bruce', 'Banner', False),-- recruited from Avenger, currently OOO
    ('KWJBM', 'Miles', 'Morales', True),-- recruited from Avenger
    ('RFWOI', 'Steve', 'Roger', False), -- recruited from Avenger, currently OOO
    ('ICIQW', 'Alan', 'Grant', True);   -- recruited from Jurassic Park
    
-- Populate Animal_Information table
INSERT INTO Animal_Information VALUES
	('A9KF0','Simpba', 'Lion', 'Meat'),
    ('OW2VK','Mufasa', 'Lion', 'Meat'),
    ('MD2OL','Aslan', 'Lion', 'Meat'),
    ('W65E4','Nala', 'Lion', 'Meat'),
    
    ('M12JK','Clawdia', 'Tiger', 'Meat'),
    ('M4R5G','Kitty', 'Tiger', 'Meat'),
    ('BF56V','Fuzzy', 'Tiger', 'Meat'),
    ('CZ51A','Tabby', 'Tiger', 'Meat'),
    
    ('K9L02','Pikachu', 'Penguin', 'Fish'),
    ('MP5JK','Squirtle', 'Penguin', 'Fish'),
    ('NCS09','Baymax', 'Penguin', 'Fish'),
    ('ICJ19','Fisher', 'Penguin', 'Fish'),
    
    ('OW2K3','Coco', 'Monkey', 'Vegetable'),
    ('KJFK1','Nanny', 'Monkey', 'Vegetable'),
    ('FQ23H','Beans', 'Monkey', 'Vegetable'),
    ('MDV90','Clownie', 'Monkey', 'Vegetable'),
    
    ('PK02J','Dale', 'Zebra', 'Grass'),
    ('JGK02','Gene', 'Zebra', 'Grass'),
    ('NVM39','Cash', 'Zebra', 'Grass'),
    ('JD9JL','Champ', 'Zebra', 'Grass'),
    
    ('9G2KM','Nemo', 'Dolphin', 'Fish'),
    ('KD92K','Sharkie', 'Dolphin', 'Fish'),
    ('JV981','Finley', 'Dolphin', 'Fish'),
    ('JVU19','Bubba', 'Dolphin', 'Fish'),
    
    ('O2PG2','Soren','Owl','Mice'),
    ('PL11Y','Gylfie','Owl','Mice'),
    ('3CWO6','Twilight','Owl','Mice'),
    ('MXK26','Digger','Owl','Mice');
    
-- Populate Trainer table
INSERT INTO Trainer VALUES
	('DEHXA', 'K9L02'),
    ('DEHXA', 'MP5JK'),
    ('DEHXA', '9G2KM'),
    ('DEHXA', 'KD92K'),
    
    ('OHSBT', 'PK02J'),
    ('OHSBT', 'JGK02'),
    ('OHSBT', 'NCS09'),
    ('OHSBT', 'ICJ19'),
    
    ('OBXSH', 'NVM39'),
    ('OBXSH', 'JD9JL'),
    ('OBXSH', 'OW2K3'),
    ('OBXSH', 'KJFK1'),
    
    ('SSNOF', 'FQ23H'),
    ('SSNOF', 'MDV90'),
    ('SSNOF', 'OW2K3'),
    ('SSNOF', 'KJFK1'),
    
    ('ICIQW', 'A9KF0'),
    ('ICIQW', 'OW2VK'),
    ('ICIQW', 'M12JK'),
    ('ICIQW', 'M4R5G'),
    
    ('JRQNH', 'M12JK'),
    ('JRQNH', 'M4R5G'),
    ('JRQNH', 'BF56V'),
    ('JRQNH', 'CZ51A'),
    
    ('KWJBM', 'O2PG2'),
    ('KWJBM', 'PL11Y'),
    ('KWJBM', '3CWO6'),
    ('KWJBM', 'MXK26');

-- Populate Animal_Exhibit_Information table
INSERT INTO Animal_Exhibit_Information VALUES
	('AA00000001','Penguins Meet&Greet',True,'2021-02-12','2021-03-12'), 
    ('AA00000002','Dolphin Circuit',True,'2021-05-15','2021-06-15'), 
    ('AA00000003','Lion Showcase',False,'2021-06-12','2021-07-12'), 
    ('AA00000004','Tiger Showcase',True,'2021-06-21','2021-07-21'),
    ('AA00000005','Zebra Race',True,'2021-04-15','2021-06-12'), 
    ('AA00000006','Owl Showcase',True,'2021-05-20','2021-06-20');
    
-- Populate Participates table
INSERT INTO Participates VALUES
	('AA00000001','K9L02','08:30','12:30'),
    ('AA00000001','MP5JK','08:05','15:30'),
    ('AA00000001','NCS09','08:15','16:20'),
    ('AA00000001','ICJ19','09:30','14:30'),
    
    ('AA00000002','9G2KM','06:30','16:30'),
    ('AA00000002','KD92K','06:45','16:45'),
    ('AA00000002','JV981','07:15','17:30'),
    ('AA00000002','JVU19','07:20','17:10'),
    
    ('AA00000003','A9KF0','18:40','04:30'),
    ('AA00000003','OW2VK','19:10','04:00'),
    ('AA00000003','MD2OL','18:25','05:10'),
    ('AA00000003','W65E4','19:00','05:00'),
    
    ('AA00000004','M12JK','18:00','04:20'),
    ('AA00000004','M4R5G','18:20','04:50'),
    ('AA00000004','BF56V','19:25','05:15'),
    ('AA00000004','CZ51A','19:45','05:00'),
    
    ('AA00000005','PK02J','06:30','18:30'),
    ('AA00000005','JGK02','06:20','16:30'),
    ('AA00000005','NVM39','06:50','17:30'),
    ('AA00000005','JD9JL','07:10','19:30'),
    
    ('AA00000006','O2PG2','21:15','05:20'),
    ('AA00000006','PL11Y','21:00','05:30'),
    ('AA00000006','3CWO6','22:25','05:50'),
    ('AA00000006','MXK26','22:15','05:15');
    
-- Populate Location table
INSERT INTO Location VALUES
	('AA00000001','A2', True),
    ('AA00000002','C4', False),
    ('AA00000003','C1', False),
    ('AA00000004','C2', False),
    ('AA00000005','A3', True),
    ('AA00000006','C5', True);
    
-- Populate On_the_Loose table
INSERT INTO On_the_Loose VALUES
	('PK02J','AA00000005',False),
    ('JGK02','AA00000005',False),
    ('NVM39','AA00000005',True),
    ('JD9JL','AA00000005',True); 
    
    
    