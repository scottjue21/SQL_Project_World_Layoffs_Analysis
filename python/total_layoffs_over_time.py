import matplotlib.pyplot as plt
import pandas as pd
import matplotlib.dates as mdates
from matplotlib.ticker import FuncFormatter

# add month-to-month data
data = [
    {"MONTH": "2020-03", "SUM(total_laid_off)": 9628},
    {"MONTH": "2020-04", "SUM(total_laid_off)": 26710},
    {"MONTH": "2020-05", "SUM(total_laid_off)": 25804},
    {"MONTH": "2020-06", "SUM(total_laid_off)": 7627},
    {"MONTH": "2020-07", "SUM(total_laid_off)": 7112},
    {"MONTH": "2020-08", "SUM(total_laid_off)": 1969},
    {"MONTH": "2020-09", "SUM(total_laid_off)": 609},
    {"MONTH": "2020-10", "SUM(total_laid_off)": 450},
    {"MONTH": "2020-11", "SUM(total_laid_off)": 237},
    {"MONTH": "2020-12", "SUM(total_laid_off)": 852},
    {"MONTH": "2021-01", "SUM(total_laid_off)": 6813},
    {"MONTH": "2021-02", "SUM(total_laid_off)": 868},
    {"MONTH": "2021-03", "SUM(total_laid_off)": 47},
    {"MONTH": "2021-04", "SUM(total_laid_off)": 261},
    {"MONTH": "2021-06", "SUM(total_laid_off)": 2434},
    {"MONTH": "2021-07", "SUM(total_laid_off)": 80},
    {"MONTH": "2021-08", "SUM(total_laid_off)": 1867},
    {"MONTH": "2021-09", "SUM(total_laid_off)": 161},
    {"MONTH": "2021-10", "SUM(total_laid_off)": 22},
    {"MONTH": "2021-11", "SUM(total_laid_off)": 2070},
    {"MONTH": "2021-12", "SUM(total_laid_off)": 1200},
    {"MONTH": "2022-01", "SUM(total_laid_off)": 510},
    {"MONTH": "2022-02", "SUM(total_laid_off)": 3685},
    {"MONTH": "2022-03", "SUM(total_laid_off)": 5714},
    {"MONTH": "2022-04", "SUM(total_laid_off)": 4128},
    {"MONTH": "2022-05", "SUM(total_laid_off)": 12885},
    {"MONTH": "2022-06", "SUM(total_laid_off)": 17394},
    {"MONTH": "2022-07", "SUM(total_laid_off)": 16223},
    {"MONTH": "2022-08", "SUM(total_laid_off)": 13055},
    {"MONTH": "2022-09", "SUM(total_laid_off)": 5881},
    {"MONTH": "2022-10", "SUM(total_laid_off)": 17406},
    {"MONTH": "2022-11", "SUM(total_laid_off)": 53451},
    {"MONTH": "2022-12", "SUM(total_laid_off)": 10329},
    {"MONTH": "2023-01", "SUM(total_laid_off)": 84714},
    {"MONTH": "2023-02", "SUM(total_laid_off)": 36493},
    {"MONTH": "2023-03", "SUM(total_laid_off)": 4470}
]

# Convert data to DataFrame
df = pd.DataFrame(data)
df['MONTH'] = pd.to_datetime(df['MONTH'])
df['SUM(total_laid_off)'] = df['SUM(total_laid_off)'].astype(int)

# Create the plot
fig, ax = plt.subplots(figsize=(12, 6))

# Plot the line with markers
ax.plot(df['MONTH'], df['SUM(total_laid_off)'], label='Total Layoffs', color='blue', marker='o')

# Format the y-axis with commas
ax.get_yaxis().set_major_formatter(FuncFormatter(lambda x, p: format(int(x), ',')))

# Set x-axis major ticks to quarterly intervals
ax.xaxis.set_major_locator(mdates.MonthLocator(interval=3))
ax.xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m'))

# Highlight specific periods
highlight_periods = [
    (pd.Timestamp('2023-01-01'), pd.Timestamp('2023-02-28')),
    (pd.Timestamp('2022-10-01'), pd.Timestamp('2022-11-30')),
    (pd.Timestamp('2022-05-01'), pd.Timestamp('2022-08-31')),
    (pd.Timestamp('2020-04-01'), pd.Timestamp('2020-05-30'))
]

# Plot highlighted areas
for start, end in highlight_periods:
    subset = df[(df['MONTH'] >= start) & (df['MONTH'] <= end)]
    ax.fill_between(subset['MONTH'], 0, subset['SUM(total_laid_off)'], color='red', alpha=0.3)

# Adding labels and title
plt.title('Total Layoffs Over Time with Month Clusters Highlighted')
plt.xlabel('Date')
plt.ylabel('Total Layoffs')
plt.grid(True)
plt.legend()

# Show the plot
plt.tight_layout()
plt.show()
