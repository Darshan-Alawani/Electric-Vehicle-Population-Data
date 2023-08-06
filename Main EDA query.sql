--We have successfully imported the Excel file containing the Electric Vehicle Population Data from 2013 to 2023. Let us first study the data by querying all the columns.

SELECT * from Electric_Vehicle_Data;


--We shall now check if there are any blank or NULL values

SELECT * from Electric_Vehicle_Data
WHERE County is NULL;


--We do see 3 rows that don't have any values under the column county. We shall remove these blank rows.

DELETE from Electric_Vehicle_Data
WHERE COUNTY is Null;


--Now that we have deleted the empty rows, we shall further check for NULL values in other columns.

SELECT * from Electric_Vehicle_Data 
WHERE Model IS NULL;

--We again see some NULL values in the model column. Time to delete these rows with NULL values.

DELETE from Electric_Vehicle_Data
WHERE Model is Null;

--We have deleted the 286 rows where the Model values were blank. Let us check if there are any null values in the Electric Range column.

SELECT * from Electric_Vehicle_Data 
WHERE [Electric Range] = 0;

--We see a lot of rows where the Electric Range value is 0. These 0 values do not hold any meaning as they would imply that the vehicles cannot move even on a full charge. Let us remove those rows as well.

DELETE from Electric_Vehicle_Data
WHERE [Electric Range] = 0;

--We removed 59876 rows where the Electric Range values were 0. Checked all columns again to check for blank/0 values.
--Let us query all the data again.

SELECT * from Electric_Vehicle_Data 

--After the data cleaning, we now have 78,614 rows. Let us now begin the Exploratory Data Analysis (EDA) process to check for any insights/trends from the dataset.
--We shall check the total number of vehicles registered for each Electric Vehicle Type


SELECT COUNT(VIN) AS Total_Cars, Make
FROM Electric_Vehicle_Data
WHERE [Electric Vehicle Type] = 'Plug-in Hybrid Electric Vehicle (PHEV)'
GROUP BY Make
ORDER BY Total_Cars DESC;

--We see that CHEVROLET has the most number of registered cars for the Plug-in Hybrid Electric Vehicle (PHEV) type with 4871 units registered. Let us check the same for Battery Electric Vehicle (BEV) type and 

SELECT COUNT(VIN) AS Total_Cars, Make
FROM Electric_Vehicle_Data
WHERE [Electric Vehicle Type] = 'Battery Electric Vehicle (BEV)'
GROUP BY Make
ORDER BY Total_Cars DESC;

--We see that TESLA has the most number of registered cars for the Battery Electric Vehicle (BEV) type with 63185 units registered.
--Let us check the auto-maker with the most number of electric vehicles registered.

SELECT COUNT(VIN) AS Total_Cars, Make
FROM Electric_Vehicle_Data
GROUP BY Make
ORDER BY Total_Cars DESC;

--We see that TESLA has the most number of registered vehicles with 63185 vehicles registered beating Nissan, the 2nd highest maker with 11018 vehicles by a huge margin.
--We shall now check the models with the highest electric range. The electric range is the maximum distance a vehicle can travel on a single charge of the battery.

SELECT Max([Electric Range]) AS Max_Range, Model, Make
FROM Electric_Vehicle_Data
GROUP BY Model, Make
ORDER BY Max_Range DESC;

--We see that Tesla Model S has the highest range out of all the models present with a staggering range of 337 km.
--Let us check the states where we see the most number of electric vehicle users within the United States of America

SELECT COUNT(VIN) AS Total_Cars, State
FROM Electric_Vehicle_Data
GROUP BY State
ORDER BY Total_Cars DESC;

--We see Washington (WA) has the most number of registered electric vehicle users with 138464 cars registered. That is a significant number as the next state California (CA) has only 91 electric vehicle users.
--Let us now check the counties in Washington state where the most number of cars are used.

SELECT COUNT(VIN) AS Total_Cars, County
FROM Electric_Vehicle_Data
GROUP BY County
ORDER BY Total_Cars DESC;

--We see King County has the most number of registered electric vehicle users with 72919 cars registered. Let us check the same for the most number of vehicles in cities in Washington.

SELECT COUNT(VIN) AS Total_Cars, City
FROM Electric_Vehicle_Data
WHERE State = 'WA'
GROUP BY City
ORDER BY Total_Cars DESC;

--We see Seattle having the most number of electric vehicles with 13970 vehicles registered.
--Let us now check the electric vehicle population per electric utility. The electric utility is the company that is involved in electrical energy distribution to the public.

SELECT COUNT(VIN) AS Total_Cars, [Electric Utility], Make
FROM Electric_Vehicle_Data
GROUP BY Make, [Electric Utility]
ORDER BY Total_Cars DESC;

--We see that PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA) has the most users with Tesla being their top customer.
--We are now done with the Exploratory Data Analysis (EDA) process. The next step is to showcase the trends observed in the form of visualizations in Tableau. We shall export the cleaned data to Tableau for further analysis.

