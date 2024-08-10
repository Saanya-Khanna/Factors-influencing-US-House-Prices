# Factors Influencing US House Prices

# Description:
This project explores various analytical techniques to understand trends and factors influencing the U.S. housing market over a period of 19 years (2003-2022). Using SQL queries, we perform filtering, aggregation, temporal analysis, and other advanced data analyses to gain insights into the housing market dynamics.

Key Components:
1. Filtering Data: We use a Common Table Expression (CTE) to filter the dataset for the specific time period from January 2003 to January 2022. This helps focus on a relevant timeframe for the analysis.
2. Aggregating Data: Calculate average values and standard deviations for key indicators such as building permits, construction price index, delinquency rates, GDP, house sales, housing subsidies, income, interest rates, and mortgage rates.
3. Temporal Analysis: Analyze trends over time by calculating a simple moving average for building permits. This smooths short-term fluctuations and highlights longer-term trends.
4. Comparative Analysis: Compare interest rates and mortgage rates over time, and calculate the difference between them. This analysis helps understand the relationship between these rates and how they might influence housing prices.
5. Time Series Decomposition: Decompose the housing price time series into trend, seasonal, and residual components to better understand underlying patterns and irregularities in the data.
6. Housing Affordability Index: Create an index to measure housing affordability by comparing average income to house prices. This index provides insights into the relative affordability of housing over time.
7. Interest Rate Elasticity: Calculate the elasticity of house prices in response to changes in interest rates. This analysis assesses how sensitive housing prices are to fluctuations in interest rates.
8. Demographic Analysis: Analyze the impact of urban population size on housing prices. By grouping data by urban population, we can identify correlations between population density and housing prices.
9. Government Intervention Impact: Evaluate how housing subsidies impact housing prices and sales. This analysis provides insights into the effectiveness of government interventions in the housing market.
10. Supply-Demand Analysis: Analyze the balance between housing supply (new constructions) and demand (house sales). By calculating the demand-supply ratio, we can assess market equilibrium.
11. Cohort Analysis: Group data by purchase year to analyze trends within specific cohorts. This analysis helps identify patterns and behaviors among different buyer groups.
12. Scenario Analysis: Simulate potential scenarios where interest rates change and assess the impact on housing prices. This scenario analysis provides a forecast of possible market outcomes under different interest rate conditions.
13. Seasonal Trends: Analyze seasonal trends by extracting the month from the date and aggregating key indicators. This helps in understanding how housing market indicators vary by season.
14. Income Level Segmentation: Segment data based on income levels to analyze how different income brackets are impacted by various factors. This segmentation allows for a more nuanced understanding of market dynamics across different socioeconomic groups.
15. Price Sensitivity Analysis: Analyze how sensitive house prices are to changes in interest rates by calculating the percentage change in prices relative to changes in interest rates. This analysis highlights the responsiveness of the housing market to monetary policy.

This project provides a comprehensive view of the U.S. housing market by applying a range of analytical methods to uncover trends, relationships, and potential impacts of various economic factors. The insights gained can be valuable for policymakers, investors, and researchers interested in housing market dynamics.

# Data Source:
The U.S. housing market data originates from [Factors influencing U.S. house prices](https://www.kaggle.com/datasets/jyotsnagurjar/factors-influencing-us-house-prices), providing up-to-date information on factors influencing house prices. The dataset encompasses fields such as DATE, building_permits, const_price_index, delinquency_rate, GDP, house_for_sale_or_sold, housing_subsidies, income, interest_rate, and mortgage_rate.

# Skills Used:
- Inner Joins
- SQL Querying
- Data Analysis
- Database Management
- Python (Data Visualization)

# Usage:
- Execute the SQL queries provided in this project within a SQL environment connected to a database housing U.S. housing market data. Driven by inner joins, these queries enable a seamless exploration of the interconnected dataset. 
- Python scripts, including the provided code, transform raw data into visually compelling representations, facilitating a deeper understanding of U.S. housing market trends.

# Python Code:
The Python code leverages pandas and matplotlib to visualize average house prices over the years. It reads data from the CSV file, converts the 'DATE' column to datetime format, extracts year and month information, and calculates mean prices grouped by year. The resulting trend visualization offers a clear depiction of average house price dynamics.


# Contributing:
Contributions to this project are encouraged. Submit pull requests or open issues for suggestions, improvements, or additional queries related to U.S. housing market analysis with inner joins and Python-based visualization.

# Acknowledgements:
Special thanks to the maintainers of the U.S. housing market dataset for their commitment to providing a valuable resource for analysis.
