# Factors Influencing US House Prices

# Description:
This project explores various analytical techniques to understand trends and factors influencing the U.S. housing market over a period of 19 years (2003-2022). Using SQL queries, we perform filtering, aggregation, temporal analysis, and other advanced data analyses to gain insights into the housing market dynamics.

Key Components:
1. **Filtering Data**: We use a Common Table Expression (CTE) to filter the dataset for the specific time period from January 2003 to January 2022. This helps focus on a relevant timeframe for the analysis.
   
2. **Aggregating Data**: Calculate average values and standard deviations for key indicators such as building permits, construction price index, delinquency rates, GDP, house sales, housing subsidies, income, interest rates, and mortgage rates.
   
3. **Temporal Analysis**: Analyze trends over time by calculating a simple moving average for building permits. This smooths short-term fluctuations and highlights longer-term trends.
   
4. **Comparative Analysis**: Compare interest rates and mortgage rates over time, and calculate the difference between them. This analysis helps understand the relationship between these rates and how they might influence housing prices.
   
4. **Time Series Decomposition**: Decompose the housing price time series into trend, seasonal, and residual components to better understand underlying patterns and irregularities in the data.
    
5. **Housing Affordability Index**: Create an index to measure housing affordability by comparing average income to house prices. This index provides insights into the relative affordability of housing over time.
    
6. **Interest Rate Elasticity**: Calculate the elasticity of house prices in response to changes in interest rates. This analysis assesses how sensitive housing prices are to fluctuations in interest rates.
    
7. **Demographic Analysis**: Analyze the impact of urban population size on housing prices. By grouping data by urban population, we can identify correlations between population density and housing prices.
    
8. **Government Intervention Impact**: Evaluate how housing subsidies impact housing prices and sales. This analysis provides insights into the effectiveness of government interventions in the housing market.
    
9. **Supply-Demand Analysis**: Analyze the balance between housing supply (new constructions) and demand (house sales). By calculating the demand-supply ratio, we can assess market equilibrium.
    
10. **Cohort Analysis**: Group data by purchase year to analyze trends within specific cohorts. This analysis helps identify patterns and behaviors among different buyer groups.
    
11. **Scenario Analysis**: Simulate potential scenarios where interest rates change and assess the impact on housing prices. This scenario analysis provides a forecast of possible market outcomes under different interest rate conditions.
    
12. **Seasonal Trends**: Analyze seasonal trends by extracting the month from the date and aggregating key indicators. This helps in understanding how housing market indicators vary by season.
    
13. **Income Level Segmentation**: Segment data based on income levels to analyze how different income brackets are impacted by various factors. This segmentation allows for a more nuanced understanding of market dynamics across different socioeconomic groups.
    
14. **Price Sensitivity Analysis**: Analyze how sensitive house prices are to changes in interest rates by calculating the percentage change in prices relative to changes in interest rates. This analysis highlights the responsiveness of the housing market to monetary policy.

This project provides a comprehensive view of the U.S. housing market by applying a range of analytical methods to uncover trends, relationships, and potential impacts of various economic factors. The insights gained can be valuable for policymakers, investors, and researchers interested in housing market dynamics.

# Data Source:
The U.S. housing market data originates from [Factors influencing U.S. house prices](https://www.kaggle.com/datasets/jyotsnagurjar/factors-influencing-us-house-prices), providing up-to-date information on factors influencing house prices. The dataset encompasses fields such as DATE, building_permits, const_price_index, delinquency_rate, GDP, house_for_sale_or_sold, housing_subsidies, income, interest_rate, and mortgage_rate.

# Skills Used:
1. **SQL**: For querying and manipulating the dataset, including filtering, aggregation, temporal analysis, and complex calculations.
2. **Time Series Analysis**: Techniques like moving averages and time series decomposition to understand trends, seasonality, and residuals.
3. **Statistical Analysis**: Calculation of averages, standard deviations, and elasticity to quantify relationships between different economic factors.
4. **Data Segmentation**: Grouping data based on different criteria, such as income levels and purchase years, to analyze patterns within specific cohorts.
5. **Scenario Analysis**: Simulating different scenarios to predict the impact of changing interest rates on housing prices.
7. **Econometric Analysis**: Assessing the impact of macroeconomic variables like interest rates, income, and housing subsidies on housing market trends.
8. **Descriptive Analytics**: Summarizing the main features of the data through various statistical measures and analyses.
9. **Data Cleansing**: Ensuring data quality and consistency before performing analyses, especially in the filtering and aggregation stages.

These skills collectively enabled a thorough exploration of the U.S. housing market, providing actionable insights into various factors influencing housing prices and market dynamics over time.

# How to Use the Code::

This SQL code provides a comprehensive analysis of the U.S. housing market over a specified period, leveraging various data analysis techniques. To use the code, start by running each section in your SQL environment, such as PostgreSQL, MySQL, or any other SQL-compatible database system. 

1. **Filtering Data**: Begin by filtering the dataset for the desired time period using the Common Table Expression (CTE). This allows you to focus the analysis on a specific date range.
2. **Aggregating Data**: Next, calculate key statistical measures like averages and standard deviations for important economic indicators to understand their central tendencies and variability.
3. **Temporal and Comparative Analysis**: Use temporal analysis to observe trends over time, such as using a moving average for building permits. Perform comparative analysis by evaluating the differences between interest rates and mortgage rates.
4. **Time Series Decomposition**: Decompose the housing price time series into trend, seasonal, and residual components to better understand underlying patterns.
5. **Advanced Analyses**: Execute various advanced analyses such as housing affordability index calculations, interest rate elasticity, demographic impacts on housing prices, and government intervention effects.
6. **Scenario and Sensitivity Analysis**: Run scenario simulations to assess potential changes in the housing market due to interest rate fluctuations. Additionally, conduct price sensitivity analysis to gauge the responsiveness of housing prices to interest rate changes.
7. **Cohort and Seasonal Analysis**: Group the data by purchase year or by month to analyze trends within specific cohorts or seasonal patterns.
8. **Segmentation**: Segment the data based on income levels to explore how different income brackets are affected by market changes.

This code is modular, so you can execute each section independently or in sequence depending on your analysis needs. It is designed to be flexible, allowing you to modify parameters such as date ranges or specific economic indicators to tailor the analysis to different datasets or market conditions.

# Contributing:
Contributions to this project are encouraged. Submit pull requests or open issues for suggestions, improvements, or additional queries related to U.S. housing market analysis with inner joins and Python-based visualization.

# Acknowledgements:
Special thanks to the maintainers of the U.S. housing market dataset for their commitment to providing a valuable resource for analysis.
