A readme file describing how I approached and completed the short task as part of my DeepMirror stage interview



Section 0.0: Setup (Time spend = 2hr)
- Install homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Install postgreSQL `brew install postgresql`
	-- Careful with installing by command line and by GUI, it can cause conflicts with servers and users.
- Generate github repository and initialise
- Download postgres version of ChEMBL from here https://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/latest/
- Access TDC API from python in section 1.1



Section 1.0: Create ChEMBL Database Instance (Time spent = 1hr)
- Follow instructions from `INSTALL_postgresql` file in ChEMBL postgres tarball
- Access postgres instance of ChEMBL using `psql chembl_31 -U <user>` (on local machine, see section 1.01 for AWS RDS instance).
- Generate `USER` access and permissions
- Maybe use `GROUP`s rather, i.e. create ML engineer group
- `CREATE GROUP ml_engineers;`
- `GRANT USAGE ON SCHEMA public TO ml_engineers;`
- `GRANT SELECT ON ALL TABLES IN SCHEMA public TO ml_engineers;`
- `CREATE USER name WITH password 'changeme';`
- `ALTER GROUP ml_engineers ADD USER name;`
- NB if extra permissions are required can add them in the same way
- This is all in script `01_add_new_basic_user.sql`



Section 1.01: Cloud-host the ChEMBL instance - AWS RDS (Time spent = 2hr):
- Had to make sure all the security group, internet gateways, subnet routes, and VPCs were currently configured.
- Can now connect using this command:
	`psql \                                                    
	--host=chembl-31.cxkbhq0cyqwz.eu-west-2.rds.amazonaws.com \
	--port=5432 \
	--username=postgres \
	--password \
	--dbname=chembl_31`

- To build db there was a "no 'user' role exists" error
- Running with --no-owner the build command seems to have eleviated the error message, but I wonder if that affects the security of the db. Also, it said many of the tables already exist, so now I need to check if there are empty, incorrectly constructed tables.
- The build script takes around 2hr on a regular WiFi connection.
- Ran it with 20Gb on the RDS server, but the script broke saying "out of storage space". On my local machine it says the ChEMBL database is 19.2GB.
- Allocated 22Gb now. Dropped and re-created DB to empty it and refilling it using code in script `INSTALL_postgresql`.



Section 1.1: Add ADME data from TDC (Time spent =  2hrs)
- Data from https://tdcommons.ai/single_pred_tasks/adme/
- Install data using `pip install PyTDC`
- Use python package `from tdc.single_pred import ADME`
- jupyter notebook `11_extract_ADME_data.ipynb` contains all the information and debugging steps.
- There are many ChEMBL IDs in the TDC data that are missing in the postgres dump of ChEMBL, which is really odd. For now I dropped them, but with more time would need to figure out what these molecules in TDC are and add some other identifier/ontology




Section 2.0: Generate Quickstart Instructions
- ChEMBL Schemas here: `https://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/latest/`
- Email me to add you as a user of the DB
- Login to the DB using:
`psql \                                                    
--host=chembl-31.cxkbhq0cyqwz.eu-west-2.rds.amazonaws.com \
--port=5432 \
--username=<user> \
--password \
--dbname=chembl_31`
- The password being 'changeme' to start; to change password type once into psql server:
	`ALTER USER <user> WITH PASSWORD '<new_password>';`



Notes:
- Write script to download all the software and dependencies? Command line download chembl?
