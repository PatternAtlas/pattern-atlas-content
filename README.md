# Pattern Atlas Content

### Add example data to the data base in the right order:

Before adding a **qpu**:
  * add related *provider*
  * add related *sdk*
  
Before adding an **implementation**:
  * add related *algorithm*
  * add related *sdk*
  
**Hint:** *Required IDs of the related entities in the JSONs are marked with* "..." *and must be set accordingly.*

## Creating a new Data Set with PgAdmin
[PgAdmin](https://www.pgadmin.org/) can be used to inspect and backup postgres database. With the following steps, a backup .sql file can be created: 

- Download [PgAdmin 4](https://www.pgadmin.org/download/)
- Start PgAdmin, the application should open on a browser: http://127.0.0.1:61014/browser/
- Specifiy a master password
- Make sure that your postgres database is running
- Click "Object">"Create">"Server" to connect to your database 
![add Sever](docs/pictures/create-server.PNG)
    - General: Enter e.g. "Pattern Atlas postgres database" as Name
    - Connection for a local database: Host name address: localhost, Port: 5432, username: postgres, maintenance database: postgres (if you run the database in docker, these properties should match the docker(-compose) file definition)
![add Sever](docs/pictures/add-server.PNG)
- Make sure you have inserted the data that you want to backup into the database
- "Refresh" the database (right-click on your database instance (e.g. "Pattern Atlas postgres database"))
- Choose "Backup..." (right-click on postgres, which is located at "Pattern Atlas postgres database" > Databases (1) > postgres
In general, we store the schema separately from the data because this allows pgAdmin to preserve the insertion dependencies between tables. 
If the schema changed, you should backup a new version of the schema as well. 
![backup](docs/pictures/backup-click.PNG)

    - First select the appropriate file (schema or data) and chose "Plain" in the "Format" row
![plain](docs/pictures/format_plain.PNG)

    - To back up the schema, choose the following setup: 
![backup](docs/pictures/backup_schema.PNG)

    - To back up the data, choose the following setup: 
![backup](docs/pictures/backup_data.PNG)

 - Replace the appropriate file, whether you update data or scheme, found in the [pattern-atlas-content repository](https://github.com/PatternAtlas/pattern-atlas-content) located under pattern-atlas-content/db-backup-files/

  
