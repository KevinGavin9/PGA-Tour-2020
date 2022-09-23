-- Which 10 players had the longest average drives on the PGA Tour in 2020?

SELECT * FROM drives
ORDER BY Average_Drive DESC

-- Which player had the longest average drive of all players who hit more than 60% of fairways?

SELECT * FROM drives
WHERE Fairway_Percentage > 60
ORDER BY Average_Drive DESC

-- What is the average driving distance of all players on tour?

SELECT AVG(Average_Drive) FROM drives

-- List of all players who played more than 60 rounds of golf in 2020.

SELECT Player, Rounds FROM strokesgained
WHERE rounds > 60 
ORDER BY rounds DESC

--  Combining the two data tables by matching the player’s names, the number of rounds, average driving distance, and fairway percentage columns.

SELECT strokesgained.player, strokesgained.rounds, drives.average_drive, drives.fairway_percentage
FROM strokesgained
INNER JOIN drives
ON strokesgained.player = drives.player
ORDER BY player

-- The number of yards on average that Bryson DeChambeau outdrives the average PGA tour player.

SELECT 
 (SELECT Average_Drive FROM drives WHERE Player = 'Bryson DeChambeau') - 
 (SELECT AVG(Average_Drive) FROM drives) AS "Difference"