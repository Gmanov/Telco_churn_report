#1 | Percentage of customers that left last month
SELECT
	CASE WHEN Churn = "Yes" THEN "Customer Lost"
		 WHEN Churn = "No" THEN "Active Customer"
         ELSE "Unknown"
	END AS Churn_status,
    COUNT(*) AS Count,
    (COUNT(*) * 100 / (SELECT COUNT(*) FROM churn)) AS Percentage
    FROM churn
    GROUP BY churn;

#2 |Percentage of Churn By Gender and Group of Age
SELECT
CASE WHEN gender = "Female" AND SeniorCitizen = 0 THEN "Young Female"
WHEN gender = "Female" AND SeniorCitizen = 1 THEN "Senior Female"
WHEN gender = "Male" AND SeniorCitizen = 0 THEN "Young Male"
WHEN gender = "Male" AND SeniorCitizen = 1 THEN "Senior Male"
END AS genderCount,
COUNT(*) AS Count,
(COUNT(*) * 100 / (SELECT COUNT(*) FROM churn Where Churn = "Yes")) AS Percentage
FROM churn
WHERE Churn = "Yes"
GROUP BY gender, SeniorCitizen;

#3 |Percentage of Churn by Tenure
SELECT ROUND(tenure / 12) as Years, COUNT(*) AS Count,
(COUNT(*) * 100 / (SELECT COUNT(*) FROM churn WHERE Churn = "yes")) AS Percentage
FROM churn
WHERE Churn = "Yes"
GROuP BY Years;

#4 | Percentage of Churn If Customer Has Multiple Lines or Not
SELECT MultipleLines, COUNT(*) AS Count,
(COUNT(*) * 100 / (SELECT COUNT(*) FROM churn WHERE Churn = "Yes")) AS Percentage
FROM churn
WHERE Churn = "Yes"
GROUP BY MultipleLines;

#5 | Percentage of Churn By Service
SELECT InternetService, COUNT(*) AS Count,
(COUNT(*) * 100 / (SELECT COUNT(*) FROM churn WHERE Churn = "Yes")) AS Percentage
FROM churn
WHERE Churn = "Yes"
GROUP BY InternetService;

#6 | Percentage of Churn By Payment Method
SELECT PaymentMethod, COUNT(*) AS Count,
(COUNT(*) * 100 / (SELECT COUNT(*) FROM churn WHERE Churn = "Yes")) AS Percentage
FROM churn
WHERE Churn = "Yes"
GROUP BY PaymentMethod;


#7 | Percentage of Churn With Streaming TV and Streaming Movies
SELECT StreamingMovies, StreamimngTV, COUNT(*),
(COUNT(*) * 100 / (SELECT COUNT(*) FROM churn WHERE Churn = "Yes")) AS Percentage
FROM churn
WHERE Churn = "Yes"
GROUP BY StreamingMovies,StreamingTV;




