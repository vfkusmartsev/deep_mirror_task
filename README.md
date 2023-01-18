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
	- Access postgres instance of ChEMBL using `psql chembl_31`
	- Generate `USER` access and permissions
		-- Maybe use `GROUP`s rather, i.e. create ML engineer group
		-- `CREATE GROUP ml_engineers`
		-- `GRANT USAGE ON SCHEMA public TO ml_engineers`
		-- `GRANT SELECT ON ALL TABLES IN SCHEMA public TO ml_engineers`
		-- or:
		-- `GRANT SELECT ON chembl_31.* TO ml_engineers`
		-- (Need to figure out schema and database connections)
		-- `CREATE USER name WITH password 'changeme'`
		-- `ALTER GROUP ml_engineers ADD USER name`
		-- Don't need the line below anymore
		-- `GRANT SELECT ON chembl_31 TO name`
		-- NB if extra permissions are required can add them in the same way

Section 1.01: Cloud-host the ChEMBL instance - AWS RDS (2hr):
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
	- Ran it with 20Gb on the RDS server, but the script broke saying "out of storage space". On my local machine it says the ChEMBL database is 19.2GB.



Section 1.1: Add ADME data from TDC
	- Data from https://tdcommons.ai/single_pred_tasks/adme/
	- Install data using `pip install PyTDC`
	- Use python package `from tdc.single_pred import ADME`



Section 2.0: Generate Quickstart Instructions
	- ChEMBL Schemas here: `https://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/latest/`
	- 

Notes:

- Write script to download all the software and dependencies? Command line download chembl?
