import matplotlib.pyplot as plt
import pandas as pd

# Data from 3_layoffs_by_company query
data = [
    {"company": "Amazon", "SUM(total_laid_off)": 18150},
    {"company": "Google", "SUM(total_laid_off)": 12000},
    {"company": "Meta", "SUM(total_laid_off)": 11000},
    {"company": "Salesforce", "SUM(total_laid_off)": 10090},
    {"company": "Microsoft", "SUM(total_laid_off)": 10000},
    {"company": "Philips", "SUM(total_laid_off)": 10000},
    {"company": "Ericsson", "SUM(total_laid_off)": 8500},
    {"company": "Uber", "SUM(total_laid_off)": 7585},
    {"company": "Dell", "SUM(total_laid_off)": 6650},
    {"company": "Booking.com", "SUM(total_laid_off)": 4601}
]

# Convert to DataFrame
df = pd.DataFrame(data)

# Sorting data for better visualization (optional)
df = df.sort_values(by="SUM(total_laid_off)", ascending=True)

# Create the bar chart
plt.figure(figsize=(10, 8))
plt.barh(df['company'], df['SUM(total_laid_off)'], color='skyblue')
plt.xlabel('Total Laid Off')
plt.title('Total Layoffs by Company')
plt.grid(True, which='both', linestyle='--', linewidth=0.5)
plt.tight_layout()  # Adjust layout to make room for the rotated company labels

# Show the plot
plt.show()
