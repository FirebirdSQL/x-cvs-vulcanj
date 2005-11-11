 CREATE TABLE SIZ1_P (S1 CHAR(3) NOT NULL, S2 CHAR(3) NOT NULL, S3 DECIMAL(4) NOT NULL, S4 CHAR(3) NOT NULL, S5 DECIMAL(4) NOT NULL, S6 CHAR(3) NOT NULL, R1 CHAR(3), R2 CHAR(3), R3 DECIMAL(4), UNIQUE (S1,S2,S3,S4,S5,S6)); 
 CREATE TABLE SIZ1_F (F1 CHAR(3) NOT NULL, F2 CHAR(3), F3 DECIMAL(4), F4 CHAR(3), F5 DECIMAL(4), F6 CHAR(3), R1 CHAR(3), R2 DECIMAL(5), R3 DECIMAL(4), FOREIGN KEY (F1,F2,F3,F4,F5,F6) REFERENCES SIZ1_P(S1,S2,S3,S4,S5,S6));
 CREATE TABLE SIZ2_P (P1 CHAR(3) NOT NULL, P2 CHAR(3) NOT NULL, P3 DECIMAL(4) NOT NULL, P4 CHAR(3) NOT NULL, P5 DECIMAL(4) NOT NULL, P6 CHAR(3) NOT NULL, P7 CHAR(3) NOT NULL, P8 DECIMAL(4) NOT NULL, P9 DECIMAL(4) NOT NULL, P10 DECIMAL(4) NOT NULL, P11 CHAR(4), UNIQUE (P1), UNIQUE (P2), UNIQUE (P3), UNIQUE (P4), UNIQUE (P5), UNIQUE (P6), UNIQUE (P7), UNIQUE (P8), UNIQUE (P9), UNIQUE (P10)); 
 CREATE TABLE SIZ2_F1 (F1 CHAR(3) NOT NULL, F2 CHAR(8), FOREIGN KEY (F1) REFERENCES SIZ2_P(P1));
 CREATE TABLE SIZ2_F2 (F1 CHAR(3) NOT NULL, F2 CHAR(8), FOREIGN KEY (F1) REFERENCES SIZ2_P(P2));
 CREATE TABLE SIZ2_F3 (F1 DECIMAL(4) NOT NULL, F2 CHAR(8), FOREIGN KEY (F1) REFERENCES SIZ2_P(P3));
 CREATE TABLE SIZ2_F4 (F1 CHAR(3) NOT NULL, F2 CHAR(8), FOREIGN KEY (F1) REFERENCES SIZ2_P(P4));
 CREATE TABLE SIZ2_F5 (F1 DECIMAL(4) NOT NULL, F2 CHAR(8), FOREIGN KEY (F1) REFERENCES SIZ2_P(P5));
 CREATE TABLE SIZ2_F6 (F1 CHAR(3) NOT NULL, F2 CHAR(8), FOREIGN KEY (F1) REFERENCES SIZ2_P(P6));
 CREATE TABLE SIZ2_F7 (F1 CHAR(3) NOT NULL, F2 CHAR(8), FOREIGN KEY (F1) REFERENCES SIZ2_P(P7));
 CREATE TABLE SIZ2_F8 (F1 DECIMAL(4) NOT NULL, F2 CHAR(8), FOREIGN KEY (F1) REFERENCES SIZ2_P(P8));
 CREATE TABLE SIZ2_F9 (F1 DECIMAL(4) NOT NULL, F2 CHAR(8), FOREIGN KEY (F1) REFERENCES SIZ2_P(P9));
 CREATE TABLE SIZ2_F10 (F1 DECIMAL(4) NOT NULL, F2 CHAR(8), FOREIGN KEY (F1) REFERENCES SIZ2_P(P10));
 CREATE TABLE SIZ3_P1 (F1 CHAR(3) NOT NULL, F2 CHAR(8), UNIQUE (F1)); 
 CREATE TABLE SIZ3_P2 (F1 CHAR(3) NOT NULL, F2 CHAR(8), UNIQUE (F1));
 CREATE TABLE SIZ3_P3 (F1 DECIMAL(4) NOT NULL, F2 CHAR(8), UNIQUE (F1));
 CREATE TABLE SIZ3_P4 (F1 CHAR(3) NOT NULL, F2 CHAR(8), UNIQUE (F1));
 CREATE TABLE SIZ3_P5 (F1 DECIMAL(4) NOT NULL, F2 CHAR(8), UNIQUE (F1)); 
 CREATE TABLE SIZ3_P6 (F1 CHAR(3) NOT NULL, F2 CHAR(8), UNIQUE (F1)); 
 CREATE TABLE SIZ3_P7 (F1 CHAR(3) NOT NULL, F2 CHAR(8), UNIQUE (F1));
 CREATE TABLE SIZ3_P8 (F1 DECIMAL(4) NOT NULL, F2 CHAR(8), UNIQUE (F1));
 CREATE TABLE SIZ3_P9 (F1 DECIMAL(4) NOT NULL, F2 CHAR(8), UNIQUE (F1));
 CREATE TABLE SIZ3_P10 (F1 DECIMAL(4) NOT NULL, F2 CHAR(8), UNIQUE (F1));
 CREATE TABLE SIZ3_F (P1 CHAR(3) NOT NULL, P2 CHAR(3), P3 DECIMAL(4), P4 CHAR(3), P5 DECIMAL(4), P6 CHAR(3), P7 CHAR(3), P8 DECIMAL(4), P9 DECIMAL(4), P10 DECIMAL(4), P11 CHAR(4), FOREIGN KEY (P1) REFERENCES SIZ3_P1(F1), FOREIGN KEY (P2) REFERENCES SIZ3_P2(F1), FOREIGN KEY (P3) REFERENCES SIZ3_P3(F1), FOREIGN KEY (P4) REFERENCES SIZ3_P4(F1), FOREIGN KEY (P5) REFERENCES SIZ3_P5(F1), FOREIGN KEY (P6) REFERENCES SIZ3_P6(F1), FOREIGN KEY (P7) REFERENCES SIZ3_P7(F1), FOREIGN KEY (P8) REFERENCES SIZ3_P8(F1), FOREIGN KEY (P9) REFERENCES SIZ3_P9(F1), FOREIGN KEY (P10) REFERENCES SIZ3_P10(F1));
