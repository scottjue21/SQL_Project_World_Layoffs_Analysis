import matplotlib.pyplot as plt
import pandas as pd

# Data for total layoffs by stage
data_total = [
    {"stage": "Post-IPO", "Total Laid Off": 204132},
    {"stage": "Unknown", "Total Laid Off": 40716},
    {"stage": "Acquired", "Total Laid Off": 27576},
    {"stage": "Series C", "Total Laid Off": 20017},
    {"stage": "Series D", "Total Laid Off": 19225},
    {"stage": "Series B", "Total Laid Off": 15311},
    {"stage": "Series E", "Total Laid Off": 12697},
    {"stage": "Series F", "Total Laid Off": 9932},
    {"stage": "Private Equity", "Total Laid Off": 7957},
    {"stage": "Series H", "Total Laid Off": 7244},
    {"stage": "Series A", "Total Laid Off": 5678},
    {"stage": "Series G", "Total Laid Off": 3697},
    {"stage": "Series J", "Total Laid Off": 3570},
    {"stage": "Series I", "Total Laid Off": 2855},
    {"stage": "Seed", "Total Laid Off": 1636},
    {"stage": "Subsidiary", "Total Laid Off": 1094}
]

# Data for average percentage layoffs by stage
data_percent = [
    {"stage": "Seed", "Average Percent Laid Off": 0.7017},
    {"stage": "Series A", "Average Percent Laid Off": 0.3840},
    {"stage": "Series B", "Average Percent Laid Off": 0.3222},
    {"stage": "Unknown", "Average Percent Laid Off": 0.3136},
    {"stage": "Acquired", "Average Percent Laid Off": 0.3074},
    {"stage": "Series C", "Average Percent Laid Off": 0.2390},
    {"stage": "Series D", "Average Percent Laid Off": 0.1836},
    {"stage": "Series E", "Average Percent Laid Off": 0.1828},
    {"stage": "Series G", "Average Percent Laid Off": 0.1608},
    {"stage": "Private Equity", "Average Percent Laid Off": 0.1590},
    {"stage": "Post-IPO", "Average Percent Laid Off": 0.1577},
    {"stage": "Series J", "Average Percent Laid Off": 0.1425},
    {"stage": "Series F", "Average Percent Laid Off": 0.1395},
    {"stage": "Series H", "Average Percent Laid Off": 0.1360},
    {"stage": "Series I", "Average Percent Laid Off": 0.0967},
    {"stage": "Subsidiary", "Average Percent Laid Off": 0.0567}
]

# Convert to DataFrames
df_total = pd.DataFrame(data_total)
df_percent = pd.DataFrame(data_percent)

# Merge the two dataframes
df = pd.merge(df_total, df_percent, on="stage")

# Sort stages for a better visualization
df = df.sort_values(by="Total Laid Off", ascending=False)

# Create the plot
fig, ax1 = plt.subplots(figsize=(14, 8))

# Bar chart for total laid off
color = 'tab:blue'
ax1.set_xlabel('Stage')
ax1.set_ylabel('Total Laid Off', color=color)
ax1.bar(df['stage'], df['Total Laid Off'], color=color)
ax1.tick_params(axis='y', labelcolor=color)
ax1.tick_params(axis='x', rotation=45)
ax1.get_yaxis().set_major_formatter(plt.FuncFormatter(lambda x, loc: "{:,}".format(int(x))))

# Create a second y-axis for the percentage laid off
ax2 = ax1.twinx()
color = 'tab:red'
ax2.set_ylabel('Average Percent Laid Off', color=color)
ax2.plot(df['stage'], df['Average Percent Laid Off'], color=color, marker='o', linestyle='-', linewidth=2)
ax2.tick_params(axis='y', labelcolor=color)

# Title and show
plt.title('Total Layoffs vs. Average Percentage Laid Off by Stage')
plt.tight_layout()
plt.show()
