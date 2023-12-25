import pandas as pd
import matplotlib.pyplot as plt

# Read data from the CSV file
df = pd.read_csv('/Users/saanyakhanna/Downloads/US_House_Price.csv')

# Convert 'DATE' column to datetime format
df['DATE'] = pd.to_datetime(df['DATE'])

# Extract year and month
df['Year'] = df['DATE'].dt.year
df['Month'] = df['DATE'].dt.month

# Group by year and calculate mean prices
yearly_mean_prices = df.groupby('Year')['house_for_sale_or_sold'].mean()

# Visualize the trend
plt.figure(figsize=(10, 6))
plt.plot(yearly_mean_prices.index, yearly_mean_prices.values, marker='o')
plt.title('Average House Prices Over the Years')
plt.xlabel('Year')
plt.ylabel('Average House Price')
plt.grid(True)
plt.show()
