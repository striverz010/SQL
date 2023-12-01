# `COALESCE`:
The SQL server's Coalesce function is used to handle the Null values. The null values are replaced with user-defined values during the expression evaluation process. This function evaluates arguments in a particular order from the provided arguments list and always returns the first non-null value.
## `Example`:
```
SELECT NAME FROM STUDENT WHERE COALESCE(ID,0)!=2;
```
The above command converts all the null values into zero before the execution or before checking with condition.


# `ROUND`:
In SQL, the ROUND() function is used to round a numeric value to a specific number of decimal places or to the nearest whole number. It takes two parameters: the number to be rounded and the number of decimal places to round to (optional).

## `EXAMPLE`:
```
SELECT ROUND(SUM(VALUES),4) FROM STATION WHERE VALES>130.5 AND VALUES<500.60;
```
The above command sum all the values with in the given range and give the output with 4 decimal values





