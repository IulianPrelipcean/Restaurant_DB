
CREATE TABLE restaurant (
    id_restaurant  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nume           VARCHAR(30) NOT NULL,
    adresa         VARCHAR(40) NOT NULL,
    telefon        VARCHAR(14) NOT NULL,
    email          VARCHAR(25),
    program        VARCHAR(20) NOT NULL,
    oras           VARCHAR(15) NOT NULL
);


CREATE TABLE produs (
    id_produs    INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    denumire     VARCHAR(30) NOT NULL,
    ingrediente  VARCHAR(100),
    pret         DECIMAL(4, 2) NOT NULL,
    gramaj       VARCHAR(10),
    tip          VARCHAR(20) NOT NULL,
    stoc         DECIMAL(5) NOT NULL,
    restaurant_id_restaurant INT,
    FOREIGN KEY  (restaurant_id_restaurant) REFERENCES restaurant(id_restaurant)
);

CREATE TABLE angajat (
    id_angajat                INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nume                      VARCHAR(30) NOT NULL,
    prenume                   VARCHAR(30) NOT NULL,
    restaurant_id_restaurant  INT NOT NULL,
    telefon                   VARCHAR(10) NOT NULL,
    email                     VARCHAR(30),
    FOREIGN KEY  (restaurant_id_restaurant) REFERENCES restaurant(id_restaurant)
);

CREATE TABLE detalii_angajat (
    angajat_id_angajat  INT NOT NULL,
    adresa              VARCHAR(50),
    pozitie             VARCHAR(20) NOT NULL,
    id_manager          INT,
    FOREIGN KEY  (angajat_id_angajat) REFERENCES angajat(id_angajat)
);

CREATE TABLE client (
    id_client  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nume       VARCHAR(25),
    telefon    VARCHAR(10) NOT NULL,
    adresa     VARCHAR(50) NOT NULL,
    email      VARCHAR(25)
);


CREATE TABLE comanda (
    id_comanda                INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_preluare             TIMESTAMP,
    data_livrare              TIMESTAMP,
    angajat_id_angajat        INT,
    client_id_client          INT,
    restaurant_id_restaurant  INT NOT NULL,
    status                    DECIMAL(1, 0),
    status_livrare            DECIMAL(2,0),
    suma_totala               DECIMAL(6,2),
	FOREIGN KEY  (angajat_id_angajat) REFERENCES angajat(id_angajat),
	FOREIGN KEY  (client_id_client) REFERENCES client(id_client),
	FOREIGN KEY  (restaurant_id_restaurant) REFERENCES restaurant(id_restaurant)
);


CREATE TABLE comanda_detalii (
    id_comanda_detalii  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cantitate           DECIMAL(3, 0) NOT NULL,
    comanda_id_comanda  INT,
    produs_id_produs    INT NOT NULL,
    status              DECIMAL(1, 0),
    FOREIGN KEY  (comanda_id_comanda) REFERENCES comanda(id_comanda),
    FOREIGN KEY  (produs_id_produs) REFERENCES produs(id_produs)
);


