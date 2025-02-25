import matplotlib.pyplot as plt
import pandas as pd

# Data from 6_layoffs_by_year query
data = [
    {"YEAR(date)": 2023, "SUM(total_laid_off)": 125677},
    {"YEAR(date)": 2022, "SUM(total_laid_off)": 160661},
    {"YEAR(date)": 2021, "SUM(total_laid_off)": 15823},
    {"YEAR(date)": 2020, "SUM(total_laid_off)": 80998}
]

# Convert to DataFrame
df = pd.DataFrame(data)

# Sorting data for chronological order
df = df.sort_values(by="YEAR(date)")

# Create the bar chart
plt.figure(figsize=(10, 6))
plt.bar(df['YEAR(date)'].astype(str), df['SUM(total_laid_off)'], color='teal')
plt.xlabel('Year')
plt.ylabel('Total Laid Off')
plt.title('Total Layoffs by Year')
plt.grid(True, linestyle='--', alpha=0.6)
plt.xticks(rotation=45)  # Rotate x-axis labels for better visibility if needed
plt.tight_layout()  # Adjust layout to make room for the rotated labels

# Show the plot
plt.show()
