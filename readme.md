# A data warehouse for movies

## Instructions

### Setup Environment and TOOLS

 - Install XAMPP
 - Run Apache and PhpMyAdmin
 - import sample_data_movies_mysql.sql
 
 - Install SSMS
 - Import Database using movies_dw.bak

 - Install Visual Studio 2019 with data warehouse tools
 - Install SSIS plugin
 - Install mysql-connector-odbc-8.0.29-win32


### Extraction

 - Open ODBC Data Sources ( 32 bit ) as Administrator
 - Create a MYSQL unicode connection with localhost mysql DB
 - Create a new SSIS Project in Visual Studio 2019
 - Create Data Flow
 - Create ODBC source
 - Create a new connection in ODBC source
 - Select the connection profile
 - Select the table from the database
 - perform tranformations in the next steps

## Dimensional Model
![Dimension Model](https://raw.githubusercontent.com/Th3Un1qu3M4n/movies_datawarehouse/main/Dimension_Diagram.png)
