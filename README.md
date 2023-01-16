A readme file describing how I approached and completed the short task as part of my DeepMirror stage interview

Section 0.0: Setup (Time spend = 30min)
	- Install homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
	- Install postgreSQL `brew install postgresql`
	- Generate github repository and initiate using cookiecutter `cookiecutter https://github.com/drivendata/cookiecutter-data-science`
	- Download postgres version of ChEMBL from here https://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/latest/
	- Download ADME data from https://tdcommons.ai/single_pred_tasks/adme/

Section 1.0: Create ChEMBL Database Instance
	- Follow instructions from `INSTALL_postgresql` file in ChEMBL postgres tarball



Section 1.1: Add ADME data from TDC
	- Data from https://tdcommons.ai/single_pred_tasks/adme/
	- Use python package `from tdc.single_pred import ADME`



Section 2.0: Generate Quickstart Instructions