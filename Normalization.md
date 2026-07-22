1\. First Normal Form (1NF)



Rule: Every column must contain only one value (atomic value).



| Member\_ID | First\_Name | Last\_Name | Hobby    |

| --------- | ---------- | --------- | -------- |

| 101       | Jayson     | Mark      | Cricket  |

| 101       | Jayson     | Mark      | Swimming |

| 101       | Jayson     | Mark      | Football |

| 102       | Ram        | Ganesh    | Swimming |

| 102       | Ram        | Ganesh    | Running  |

| 102       | Ram        | Ganesh    | Music    |

| 103       | Raj        | Kishore   | Dancing  |

| 103       | Raj        | Kishore   | Singing  |

| 103       | Raj        | Kishore   | Running  |

2\. Second Normal Form (2NF)



Rule: Remove partial dependency.



Employee Table



| Empno | Dept  |

| ----- | ----- |

| 101   | TT/BU |

| 102   | TT    |



Training Table



| Empno | Training   | Training\_Date |

| ----- | ---------- | ------------- |

| 101   | Oracle SQL | 12-Aug-2015   |

| 101   | Java       | 21-Aug-2015   |

| 102   | Oracle SQL | 18-Sep-2014   |



3\. Third Normal Form (3NF)



Rule: Remove transitive dependency.



Member Table



| Member\_ID | First\_Name | Last\_Name | Sports   |

| --------- | ---------- | --------- | -------- |

| 101       | Rajesh     | Chand     | Cricket  |

| 102       | Jayesh     | Raj       | Hockey   |

| 103       | Mark       | Dorson    | Football |



Sports\_Fees Table

| Sports   | Fees |

| -------- | ---- |

| Cricket  | 100  |

| Hockey   | 80   |

| Football | 90   |

