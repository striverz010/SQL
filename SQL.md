# `COALESCE`:
The SQL server's Coalesce function is used to handle the Null values. The null values are replaced with user-defined values during the expression evaluation process. This function evaluates arguments in a particular order from the provided arguments list and always returns the first non-null value.
## `Example`:
```
SELECT NAME FROM STUDENT WHERE COALESCE(ID,0)!=2;
```
The above command converts all the null values into zero before the execution or before checking with condition.





