CREATE TABLE angajat (
    id_angajat                NUMBER(3) NOT NULL,
    nume                      VARCHAR2(30) NOT NULL,
    prenume                   VARCHAR2(30) NOT NULL,
    restaurant_id_restaurant  NUMBER(2) NOT NULL,
    telefon                   CHAR(10) NOT NULL,
    email                     VARCHAR2(30)
)
LOGGING;

ALTER TABLE angajat ADD CONSTRAINT angajat_pk PRIMARY KEY ( id_angajat );


CREATE TABLE client (
    id_client  NUMBER(4) NOT NULL,
    nume       VARCHAR2(25),
    telefon    CHAR(10) NOT NULL,
    adresa     VARCHAR2(50) NOT NULL,
    email      VARCHAR2(25)
)
LOGGING;

ALTER TABLE client ADD CONSTRAINT client_pk PRIMARY KEY ( id_client );


CREATE TABLE comanda (
    id_comanda                NUMBER(4) NOT NULL,
    data_preluare             DATE NOT NULL,
    data_livrare              DATE,
    angajat_id_angajat        NUMBER(3) NOT NULL,
    client_id_client          NUMBER(4) NOT NULL,
    restaurant_id_restaurant  NUMBER(2) NOT NULL
)
LOGGING;

ALTER TABLE comanda ADD CONSTRAINT comanda_pk PRIMARY KEY ( id_comanda );

CREATE TABLE comanda_detalii (
    cantitate           NUMBER(3) NOT NULL,
    comanda_id_comanda  NUMBER(4) NOT NULL,
    produs_id_produs    NUMBER(2) NOT NULL
)
LOGGING;

CREATE TABLE detalii_angajat (
    angajat_id_angajat  NUMBER(3) NOT NULL,
    serie               VARCHAR2(20) NOT NULL,
    numar               CHAR(6) NOT NULL,
    adresa              VARCHAR2(50),
    pozitie             VARCHAR2(20) NOT NULL,
    tura                VARCHAR2(10),
    id_manager          NUMBER(2)
)
LOGGING;

ALTER TABLE detalii_angajat ADD CONSTRAINT detalii_angajat_pk PRIMARY KEY ( angajat_id_angajat );

CREATE TABLE plata (
    comanda_id_comanda  NUMBER(4) NOT NULL,
    suma_totala         NUMBER(6, 2) NOT NULL,
    tip                 VARCHAR2(10),
    data_plata          DATE
)
LOGGING;

CREATE UNIQUE INDEX plata__idx ON
    plata (
        comanda_id_comanda
    ASC )
        LOGGING;

ALTER TABLE plata ADD CONSTRAINT plata_pk PRIMARY KEY ( comanda_id_comanda );

CREATE TABLE produs (
    id_produs    NUMBER(2) NOT NULL,
    denumire     VARCHAR2(30) NOT NULL,
    ingrediente  VARCHAR2(100),
    pret         NUMBER(4, 2) NOT NULL,
    gramaj       VARCHAR2(10),
    tip          VARCHAR2(20) NOT NULL,
    id_restaurant NUMBER(2) NOT NULL,
    stoc         NUMBER(5) NOT NULL
)
LOGGING;

ALTER TABLE produs ADD CONSTRAINT produs_pk PRIMARY KEY ( id_produs );

CREATE TABLE restaurant (
    id_restaurant  NUMBER(2) NOT NULL,
    nume           VARCHAR2(30) NOT NULL,
    adresa         VARCHAR2(40) NOT NULL,
    telefon        VARCHAR2(14) NOT NULL,
    email          VARCHAR2(25),
    program        VARCHAR2(20) NOT NULL,
    oras           VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE restaurant ADD CONSTRAINT restaurant_pk PRIMARY KEY ( id_restaurant );

ALTER TABLE angajat
    ADD CONSTRAINT angajat_restaurant_fk FOREIGN KEY ( restaurant_id_restaurant )
        REFERENCES restaurant ( id_restaurant )
    NOT DEFERRABLE;

ALTER TABLE comanda
    ADD CONSTRAINT comanda_angajat_fk FOREIGN KEY ( angajat_id_angajat )
        REFERENCES angajat ( id_angajat )
    NOT DEFERRABLE;

ALTER TABLE comanda
    ADD CONSTRAINT comanda_client_fk FOREIGN KEY ( client_id_client )
        REFERENCES client ( id_client )
    NOT DEFERRABLE;

ALTER TABLE comanda_detalii
    ADD CONSTRAINT comanda_detalii_comanda_fk FOREIGN KEY ( comanda_id_comanda )
        REFERENCES comanda ( id_comanda )
    NOT DEFERRABLE;

ALTER TABLE comanda_detalii
    ADD CONSTRAINT comanda_detalii_produs_fk FOREIGN KEY ( produs_id_produs )
        REFERENCES produs ( id_produs )
    NOT DEFERRABLE;

ALTER TABLE comanda
    ADD CONSTRAINT comanda_restaurant_fk FOREIGN KEY ( restaurant_id_restaurant )
        REFERENCES restaurant ( id_restaurant )
    NOT DEFERRABLE;

ALTER TABLE detalii_angajat
    ADD CONSTRAINT detalii_angajat_angajat_fk FOREIGN KEY ( angajat_id_angajat )
        REFERENCES angajat ( id_angajat )
    NOT DEFERRABLE;

ALTER TABLE plata
    ADD CONSTRAINT plata_comanda_fk FOREIGN KEY ( comanda_id_comanda )
        REFERENCES comanda ( id_comanda )
    NOT DEFERRABLE;


CREATE SEQUENCE id_angajat_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER id_angajat_trg BEFORE
    INSERT ON angajat
    FOR EACH ROW
    WHEN ( new.id_angajat IS NULL )
BEGIN
    :new.id_angajat := id_angajat_seq.nextval;
END;
/

CREATE SEQUENCE id_client_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER id_client_trg BEFORE
    INSERT ON client
    FOR EACH ROW
    WHEN ( new.id_client IS NULL )
BEGIN
    :new.id_client := id_client_seq.nextval;
END;
/

CREATE SEQUENCE id_comanda_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER id_comanda_trg BEFORE
    INSERT ON comanda
    FOR EACH ROW
    WHEN ( new.id_comanda IS NULL )
BEGIN
    :new.id_comanda := id_comanda_seq.nextval;
END;
/

CREATE SEQUENCE id_produs_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER id_produs_trg BEFORE
    INSERT ON produs
    FOR EACH ROW
    WHEN ( new.id_produs IS NULL )
BEGIN
    :new.id_produs := id_produs_seq.nextval;
END;
/

CREATE SEQUENCE id_restaurant_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER id_restaurant_trg BEFORE
    INSERT ON restaurant
    FOR EACH ROW
    WHEN ( new.id_restaurant IS NULL )
BEGIN
    :new.id_restaurant := id_restaurant_seq.nextval;
END;
/
