# Reformat dates in Employee.csv to the correct DATE format (YYYY-MM-DD)
import pandas as pd

# Read the CSV file into a DataFrame
input_csv_path = 'employees.csv'
output_csv_path = 'employees_formatted_dates.csv'

df = pd.read_csv(input_csv_path)

# Convert the date columns to datetime format and then format it to 'yyyy-mm-dd'
df['birth_date'] = pd.to_datetime(df['birth_date'], format='%m/%d/%Y').dt.strftime('%Y-%m-%d')
df['hire_date'] = pd.to_datetime(df['hire_date'], format='%m/%d/%Y').dt.strftime('%Y-%m-%d')


# Save the updated DataFrame to a new CSV file
df.to_csv(output_csv_path, index=False)
