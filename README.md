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


Section 1.1: Add ADME data from TDC
	- Data from https://tdcommons.ai/single_pred_tasks/adme/
	- Install data using `pip install PyTDC`
	- Use python package `from tdc.single_pred import ADME`



Section 2.0: Generate Quickstart Instructions


Notes:

- Write script to download all the software and dependencies? Command line download chembl?
