A quickstart guide for ML engineers to access the ChEMBL RDS server and start querying it for model building.

0. Setup:
	- Have postgresql downloaded, simplest way is via homebrew:
		- To install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
		- To install postgresql: `brew install postgresql`
	- Email me to set-up user role on server with correct permissions.
		- For testing purposes, there is the user `jdoe`



1. Login into RDS server:
	- Use following command with your username, it will ask you for your password
	`psql --host=chembl-31.cxkbhq0cyqwz.eu-west-2.rds.amazonaws.com --port=5432 --username=<user> --password --dbname=chembl_31`
   - After first login please change your password for security reasons. Do so as follows:
    `ALTER USER <user> WITH PASSWORD '<new_password>';`



2. Use database as required:
	- Your username will only have `SELECT` priviledges to start, query `chembl_31` using SQL as required.
	- ChEMBL Schemas here: `https://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/latest/`
