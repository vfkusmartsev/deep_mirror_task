CREATE TABLE adme_studies(
    id SERIAL PRIMARY KEY,
    study_name TEXT,
    study_purpose TEXT
);

CREATE TABLE adme_predictions(
    id SERIAL PRIMARY KEY,
    drug_id VARCHAR(20) REFERENCES molecule_dictionary(chembl_id) NOT NULL,
    study_id INTEGER REFERENCES adme_studies(id),
    predicted_value NUMERIC
);

-- molecule SMILE key already in ChEMBL in table compound_structures
-- some missing ChEMBL IDs present in TDC that aren't in ChEMBL, which is really odd, but need to handle
