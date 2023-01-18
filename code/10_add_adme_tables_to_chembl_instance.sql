CREATE TABLE adme_predictions(
    id SERIAL PRIMARY KEY,
    drug_id VARCHAR(20) REFERENCES molecule_dictionary(chembl_id) NOT NULL,
    drug_smile VARCHAR(1000),
    study_id INTEGER REFERENCES adme_studies(id),
    predicted_value NUMERIC
);

CREATE TABLE adme_studies(
    id SERIAL PRIMARY KEY,
    study_name TEXT,
    study_purpose TEXT
);



CREATE TABLE administration(

)

CREATE TABLE distribution(

)

-- NB there is already a METABOLISM table in chembl for metabolic pathway membership
CREATE TABLE (

)