CREATE DATABASE 'test.fdb' DEFAULT CHARACTER SET ISO8859_1;

/*******************************************************************************
 * Selected metadata objects
 * -------------------------
 * Extracted at 29-10-2003 15:55:26
 ******************************************************************************/

/*******************************************************************************
 * Generators
 * ----------
 * Extracted at 29-10-2003 15:55:26
 ******************************************************************************/

CREATE GENERATOR GEN_TEST1;

/*******************************************************************************
 * Tables
 * ------
 * Extracted at 29-10-2003 15:55:26
 ******************************************************************************/

CREATE TABLE TEST1
(
  ID                      INTEGER,
  LEEG                    INTEGER,
  VOORNAAM                VARCHAR(100)  COLLATE ISO8859_1,
  ACHTERNAAM              VARCHAR(100)  COLLATE ISO8859_1
);

/*******************************************************************************
 * Indices
 * -------
 * Extracted at 29-10-2003 15:55:26
 ******************************************************************************/

CREATE ASC INDEX I_TEST1_AN_ASC ON TEST1 (ACHTERNAAM);

CREATE UNIQUE ASC INDEX I_TEST1_ID_ASC ON TEST1 (ID);

CREATE ASC INDEX I_TEST1_LEEG_ASC ON TEST1 (LEEG);

CREATE ASC INDEX I_TEST1_VN_ASC ON TEST1 (VOORNAAM);

SET NAMES ISO8859_1;
SET ECHO ON;
INSERT INTO TEST1(ID, LEEG, VOORNAAM, ACHTERNAAM) VALUES (1, NULL, 'Kelly  ', '126 bytes Lusttttttttttttttttttttttttttttttt');
INSERT INTO TEST1(ID, LEEG, VOORNAAM, ACHTERNAAM) VALUES (2, NULL, 'Short  ', '');
INSERT INTO TEST1(ID, LEEG, VOORNAAM, ACHTERNAAM) VALUES (3, NULL, 'Silke  ', '127 bytes Alttttttttttttttttttttttttttttttttt');
INSERT INTO TEST1(ID, LEEG, VOORNAAM, ACHTERNAAM) VALUES (4, NULL, 'Short  ', '');
INSERT INTO TEST1(ID, LEEG, VOORNAAM, ACHTERNAAM) VALUES (5, NULL, 'Seweryn', '128 bytes Schaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
INSERT INTO TEST1(ID, LEEG, VOORNAAM, ACHTERNAAM) VALUES (6, NULL, 'Short  ', '');
INSERT INTO TEST1(ID, LEEG, VOORNAAM, ACHTERNAAM) VALUES (7, NULL, 'Arjen  ', '129 bytes Draaiorgellllllllllllllllllllllllllll');
INSERT INTO TEST1(ID, LEEG, VOORNAAM, ACHTERNAAM) VALUES (8, NULL, 'Short  ', '');
INSERT INTO TEST1(ID, LEEG, VOORNAAM, ACHTERNAAM) VALUES (9, NULL, 'Jasper ', 'Janssen');

drop database;
