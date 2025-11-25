import pandas as pd
from faker import Faker

import random

fake = Faker()

# Faker.seed(0)

# Number of rows you want in your CSV
ROWS = 10  

data = []

for i in range(1, ROWS + 1):
    data.append([
        i,  # sale_id
        fake.name(),  #customer_name
        random.choice(["Headphones", "Laptop", "Backpack", "Charger", "Watch", "Speaker", "Camera"]),  # product_name
        random.choice(["Holiday Sale", "Flash Deal", "BOGO", "Clearance", "None"]), #promotion_name
        random.randint(1, 20),  # units_sold
        round(random.uniform(5.00, 500.00), 2),  #price
        fake.date_between(start_date='-1y', end_date='today')  #order_date
    ])

columns = [
    "sale_id",
    "customer_name",
    "product_name",
    "promotion_name",
    "units_sold",
    "price",
    "order_date"
]

df = pd.DataFrame(data, columns=columns)

# SAVE TO WINDOWS PATH — UPDATE THIS
output_path = r"C:\projects\data_warehouse_project\data\sales.csv"

df.to_csv(output_path, index=False)

print(f"CSV created at: {output_path}")
