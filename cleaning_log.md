# Data Quality Log: Titanic dataset

## Cleaning decisions

1. Found 866 missing values: Age (177), Cabin (687), Embarked (2).
2. Name: stripped extra whitespace from 2 names.
3. Sex: standardised to title case (male/female to Male/Female).
4. Embarked: expanded codes C, Q, S to Cherbourg, Queenstown, Southampton.
5. Age: IQR bounds -6.7 to 64.8. 11 values above the upper bound (oldest is 80). Kept, because these are real passengers.
6. Fare: IQR bounds -26.7 to 65.6. Capped 116 values to the upper bound (max was 512.3).
7. Age: filled 177 missing with median (28.0); mean was 29.7, median is less affected by the older passengers.
8. Embarked: filled 2 missing with mode (Southampton).
9. Cabin: forward-filled 5 within the same Ticket (people on one ticket usually share a cabin); the remaining 682 set to 'Unknown' (77% of rows, too many to guess).

## Before vs after

| Metric                      | Before | After |
| --------------------------- | ------ | ----- |
| rows                        | 891    | 891   |
| missing values              | 866    | 0     |
| Age missing                 | 177    | 0     |
| Cabin missing / Unknown     | 687    | 682   |
| Embarked missing            | 2      | 0     |
| Names with extra whitespace | 2      | 0     |
| max Fare                    | 512.33 | 65.63 |
| mean Fare                   | 32.2   | 24.05 |
