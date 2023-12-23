/*
Selecting Relevant Data:
Retrieve basic information about the housing data.
*/
 
SELECT * FROM US_House_Price;

/*
Filtering Data:
Filter data based on specific criteria, such as location or time period.
 */

SELECT * FROM US_House_Price
WHERE DATE BETWEEN '2022-01-01' AND '2023-01-01';

/*
Aggregating Data:
Calculate average values for key indicators.
 */
SELECT
  AVG(building_permits) AS avg_permits,
  AVG(const_price_index) AS avg_cpi,
  AVG(delinquency_rate) AS avg_delinquency,
  AVG(GDP) AS avg_gdp,
  AVG(house_for_sale_or_sold) AS avg_sales,
  AVG(housing_subsidies) AS avg_subsidies,
  AVG(income) AS avg_income,
  AVG(interest_rate) AS avg_interest_rate,
  AVG(mortgage_rate) AS avg_mortgage_rate
FROM US_House_Price;

/*
Temporal Analysis:
Analyze trends over time.
 */
SELECT DATE, AVG(building_permits) AS avg_permits
FROM US_House_Price
GROUP BY DATE
ORDER BY DATE;

/*
Comparative Analysis:
Compare interest rates and mortgage rates.
 */
SELECT
  DATE,
  interest_rate,
  mortgage_rate
FROM US_House_Price
ORDER BY DATE;


