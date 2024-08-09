/*
Filtering Data:
Filter data based on a specific time period using a Common Table Expression (CTE).
This organizes the query and improves readability.
*/
WITH FilteredData AS (
    SELECT *
    FROM main."US_House_Price 2"
    WHERE DATE BETWEEN '2003-01-01' AND '2022-01-01'
)

/*
Aggregating Data:
Calculate average values and standard deviation for key indicators.
*/
SELECT
    AVG(building_permits) AS avg_permits,
    STDDEV(building_permits) AS stddev_permits,
    AVG(const_price_index) AS avg_cpi,
    STDDEV(const_price_index) AS stddev_cpi,
    AVG(delinquency_rate) AS avg_delinquency,
    AVG(GDP) AS avg_gdp,
    AVG(house_for_sale_or_sold) AS avg_sales,
    AVG(housing_subsidies) AS avg_subsidies,
    AVG(income) AS avg_income,
    AVG(interest_rate) AS avg_interest_rate,
    AVG(mortgage_rate) AS avg_mortgage_rate
FROM FilteredData;

/*
Temporal Analysis:
Analyze trends over time, using a simple moving average for building permits.
*/
SELECT 
    DATE, 
    AVG(building_permits) OVER (ORDER BY DATE ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS moving_avg_permits
FROM main."US_House_Price 2"
ORDER BY DATE;

/*
Comparative Analysis:
Compare interest rates and mortgage rates, and calculate the difference between them.
*/
SELECT
    DATE,
    interest_rate,
    mortgage_rate,
    (mortgage_rate - interest_rate) AS rate_difference
FROM FilteredData
ORDER BY DATE;


/*
Time Series Decomposition:
Decompose the housing price time series into trend, seasonal, and residual components.
*/
WITH TimeSeries AS (
    SELECT
        DATE,
        house_for_sale_or_sold,
        AVG(house_for_sale_or_sold) OVER (ORDER BY DATE ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS trend,
        house_for_sale_or_sold - AVG(house_for_sale_or_sold) OVER (ORDER BY DATE ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS seasonal,
        house_for_sale_or_sold - (AVG(house_for_sale_or_sold) OVER (ORDER BY DATE ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) 
                                  + (house_for_sale_or_sold - AVG(house_for_sale_or_sold) OVER (ORDER BY DATE ROWS BETWEEN 6 PRECEDING AND CURRENT ROW))) AS residual
    FROM main."US_House_Price 2"
)
SELECT
    DATE,
    house_for_sale_or_sold,
    trend,
    seasonal,
    residual
FROM TimeSeries
ORDER BY DATE;


/*
Housing Affordability Index:
Create an index to measure housing affordability by comparing income to house prices.
*/
SELECT
    DATE,
    (AVG(income) / AVG(house_for_sale_or_sold)) * 100 AS affordability_index
FROM main."US_House_Price 2"
GROUP BY DATE
ORDER BY DATE;

/*
Interest Rate Elasticity:
Calculate the elasticity of house prices in response to changes in interest rates.
*/
SELECT
    DATE,
    house_for_sale_or_sold,
    interest_rate,
    (house_for_sale_or_sold - LAG(house_for_sale_or_sold) OVER (ORDER BY DATE)) / LAG(house_for_sale_or_sold) OVER (ORDER BY DATE) / 
(interest_rate - LAG(interest_rate) OVER (ORDER BY DATE)) / LAG(interest_rate) OVER (ORDER BY DATE)
FROM main."US_House_Price 2"
ORDER BY DATE;

/*
Demographic Analysis:
Analyze the impact of urban population size on housing prices.
*/
SELECT
    urban_population,
    AVG(house_for_sale_or_sold) AS avg_sales
FROM main."US_House_Price 2"
GROUP BY urban_population
ORDER BY urban_population;

/*
Government Intervention Impact:
Analyze how housing subsidies impact housing prices and sales.
*/
SELECT
    housing_subsidies,
    AVG(house_for_sale_or_sold) AS avg_sales,
    AVG(house_for_sale_or_sold * housing_subsidies) AS weighted_sales
FROM main."US_House_Price 2"
GROUP BY housing_subsidies
ORDER BY housing_subsidies DESC;

/*
Supply-Demand Analysis:
Analyze the balance between housing supply (new constructions) and demand (house sales).
*/
SELECT
    DATE,
    SUM(construction_unit) AS total_supply,
    SUM(house_for_sale_or_sold) AS total_demand,
    (SUM(house_for_sale_or_sold) / SUM(construction_unit)) * 100 AS demand_supply_ratio
FROM main."US_House_Price 2"
GROUP BY DATE
ORDER BY DATE;

/*
Cohort Analysis:
Group data by purchase year to analyze trends within specific cohorts.
*/
WITH Cohorts AS (
    SELECT
        EXTRACT(YEAR FROM DATE::DATE) AS purchase_year,
        house_for_sale_or_sold,
        income,
        AVG(house_for_sale_or_sold) OVER (PARTITION BY EXTRACT(YEAR FROM DATE::DATE)) AS avg_sales_per_cohort
    FROM main."US_House_Price 2"
)
SELECT
    purchase_year,
    AVG(house_for_sale_or_sold) AS avg_sales,
    AVG(income) AS avg_income,
    avg_sales_per_cohort
FROM Cohorts
GROUP BY purchase_year, avg_sales_per_cohort
ORDER BY purchase_year;

/*
Scenario Analysis:
Simulate potential scenarios where interest rates change and assess the impact on housing prices.
*/
SELECT
    DATE,
    interest_rate,
    house_for_sale_or_sold,
    CASE
        WHEN interest_rate > 5 THEN house_for_sale_or_sold * 0.95
        WHEN interest_rate BETWEEN 3 AND 5 THEN house_for_sale_or_sold
        ELSE house_for_sale_or_sold * 1.05
    END AS simulated_sales
FROM main."US_House_Price 2"
ORDER BY DATE;

/*
Seasonal Trends:
Analyze seasonal trends by extracting the month from the date and aggregating key indicators.
*/
SELECT
    EXTRACT(MONTH FROM DATE::DATE) AS month,
    AVG(house_for_sale_or_sold) AS avg_sales,
    AVG(building_permits) AS avg_permits,
    AVG(interest_rate) AS avg_interest_rate
FROM main."US_House_Price 2"
GROUP BY month
ORDER BY month;


/*
Income Level Segmentation:
Segment data based on income levels to analyze how different income brackets are impacted by various factors.
*/
SELECT
    CASE 
        WHEN income < 40000 THEN 'Low Income'
        WHEN income BETWEEN 40000 AND 100000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_bracket,
    AVG(house_for_sale_or_sold) AS avg_sales,
    AVG(mortgage_rate) AS avg_mortgage_rate,
    AVG(delinquency_rate) AS avg_delinquency
FROM FilteredData
GROUP BY income_bracket;

/*
Price Sensitivity Analysis:
Analyze how sensitive house prices are to changes in interest rates by calculating percentage change.
*/
SELECT
    DATE,
    house_for_sale_or_sold,
    interest_rate,
    LAG(house_for_sale_or_sold) OVER (ORDER BY DATE) AS prev_house_price,
    LAG(interest_rate) OVER (ORDER BY DATE) AS prev_interest_rate,
    ((house_for_sale_or_sold - LAG(house_for_sale_or_sold) OVER (ORDER BY DATE)) / LAG(house_for_sale_or_sold) OVER (ORDER BY DATE)) * 100 AS price_change_pct,
    ((interest_rate - LAG(interest_rate) OVER (ORDER BY DATE)) / LAG(interest_rate) OVER (ORDER BY DATE)) * 100 AS rate_change_pct
FROM FilteredData
ORDER BY DATE;


