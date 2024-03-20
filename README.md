# mule-multi-batch-aggregation

## Overview
This mule application is a proof-of-concept (PoC) for an unique use case that I had to work for an esteemed client in the past.

## Use case
- Data from multiple source systems (say A, B) have to be processed and sent to a target system (C). In the real use case, system A has been a data warehouse, system B was data from a SFTP source.
- Data record formats are different for data coming from systems A and B.
- The data from both the systems have to transformed and place them into individual files (each file a batch of let's say 10K records).
- At the end, all the files (each file contains 10K records) that were created for the data from both the systems A and B are to be archived into one single zip file.

### PoC
For the sake of this PoC, I created two mock files using python **Faker** module. These are used as the source files mimicking two different sources.
I added those files in /resources folder (not the /src/main/resources).
Also, I used a batch-config.json file to drive the application execution.

In the real use case (which has 15 + 1 integrations), I actually abstracted all the common functionality that works for different scenarios into common reusable flows. So, batch-config file actually has the configuration set-up that drives the application for all integrations. You will understand once you walk through and understand the code.

In this PoC, I set 1K records for each output file and is configurable in the config.yaml file.

**Notes**: If you are trying to run this code locally, make sure you update the batch-config.json pointing to the correct ```destDir``` and filenames.

### Resources

**Python code for mock files**
```
from faker import Faker
import pandas as pd

faker = Faker()
list = []
for i in range(0, 10000):
    name = faker.name()
    email = faker.email()
    phone = faker.phone_number()
    dob = faker.date()
    list.append((name, email, phone, dob))

columns = ['Name', 'Email', 'Phone', 'DateOfBirth']
df = pd.DataFrame(list, columns = columns)
print(df)
df.to_csv("F:/temp/user_data_10K_2.csv", index = False)
```
