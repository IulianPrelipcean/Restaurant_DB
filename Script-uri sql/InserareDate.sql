

--inserare RESTAURANT
insert into restaurant(nume, adresa, telefon, email, oras, program) values('La Stejar', 'Str. Florilor, Nr.4', '0712345678', 'stejar_iasi@yahoo.com', 'Iasi', '8:00-24:00');
insert into restaurant(nume, adresa, telefon, email, oras, program) values('La Stejar', 'Calea Bucovinei, Nr.6', '0772638476', 'stejar_suceava@gmail.com', 'Suceava', '8:00-24:00');
insert into restaurant(nume, adresa, telefon, email, oras, program) values('La Stejar', 'Str. Trandafirilor, Nr.1', '0793817384', 'stejar_cluj@gmail.com', 'Cluj', '8:00-24:00');


    
-- -- inserare ANGAJAT
-- --manageri
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Popescu', 'Andrei', '0712309876', 'andrei_p@gmail.com', 1); 
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Pop', 'Mihai', '0712309875', 'mihai_pop@gmail.com', 2); 
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Ionescu', 'Andreea', '0712309874', 'andreea_ionescu@gmail.com', 3); 
-- --angajati
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Simion', 'Nicolae', '0712309873', 'nicolae_simion@gmail.com', 1); 
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Stefanescu', 'Alina', '0712309872', 'alina_stefanecu@gmail.com', 1); 
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Gavrilescu', 'Marius', '0756309872', 'marius_gavrilescu@gmail.com', 1); 
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Ursachi', 'Madalin', '0712309871', 'madalin_u@gmail.com', 2); 
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Voicu', 'Simona', '0712309870', 'simona_v@gmail.com', 2); 
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Voicu', 'Alexandra', '0712323370', 'alexandra_v@gmail.com', 2); 
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Radulescu', 'Costi', '0712309866', 'costi_r@gmail.com', 3); 
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Popa', 'Ana', '0712309654', 'ana_popa@gmail.com', 3); 
-- insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values('Popescu', 'Iulia', '0712239654', 'iulia_popescu@gmail.com', 3);

    
    

-- -- inserare DETALII_ANGAJAT     
-- insert into detalii_angajat(serie, numar, adresa, pozitie, angajat_id_angajat) values('MS', '123456', 'Str. Padurii, Nr.12', 'manager', 1);
-- insert into detalii_angajat(serie, numar, adresa, pozitie, angajat_id_angajat) values('MS', '987654', 'Str. Brancusi, Nr.2', 'manager', 2);
-- insert into detalii_angajat(serie, numar, adresa, pozitie, angajat_id_angajat) values('ST', '098765', 'Str. Crinului, Nr.6', 'manager', 3);
-- --restaurant_1
-- insert into detalii_angajat(serie, numar, adresa, pozitie, tura, angajat_id_angajat, id_manager) values('DB', '123098', 'Str. Mihai Eminescu, Nr.3', 'bucatar', 'dimineata', 4, 1);
-- insert into detalii_angajat(serie, numar, adresa, pozitie, tura, angajat_id_angajat, id_manager) values('TR', '123095', 'Str. Creanga, Nr. 2', 'curier', 'dupa masa', 5, 1);
-- insert into detalii_angajat(serie, numar, adresa, pozitie, tura, angajat_id_angajat, id_manager) values('DT', '123023', 'Str. Creanga, Nr. 24', 'curier', 'dimineata', 6, 1);
-- --restaurant_2
-- insert into detalii_angajat(serie, numar, adresa, pozitie, tura, angajat_id_angajat, id_manager) values('HT', '123543', 'Str. Kogalniceanu, Nr. 7', 'curier', 'dimineata', 7, 2);
-- insert into detalii_angajat(serie, numar, adresa, pozitie, tura, angajat_id_angajat, id_manager) values('HN', '123653', 'Str. Bucuriei, Nr. 1', 'ajutor de bucatar', 'dimineata', 8, 2);
-- insert into detalii_angajat(serie, numar, adresa, pozitie, tura, angajat_id_angajat, id_manager) values('HF', '165653', 'Str. Bucuriei, Nr. 19', 'bucatar', 'dimineata', 9, 2);
-- --restaurant_2
-- insert into detalii_angajat(serie, numar, adresa, pozitie, tura, angajat_id_angajat, id_manager) values('YT', '123876', 'Str. Stefan cel Mare, Nr 2', 'curier', 'dupa masa', 10, 3);
-- insert into detalii_angajat(serie, numar, adresa, pozitie, tura, angajat_id_angajat, id_manager) values('IU', '098456', 'Str. Viilor, Nr 18', 'curier', 'dupa masa', 11, 3);
-- insert into detalii_angajat(serie, numar, adresa, pozitie, tura, angajat_id_angajat, id_manager) values('BU', '098423', 'Str. Florilor, Nr 18', 'bucatar', 'dupa masa', 12, 3);


    
    

-- -- insert CLIENT
-- insert into client(nume, telefon, adresa, email) values('George', '0712345679', 'Str. Zorilor, Nr. 12, Bl. 10, Sc. A, Et. 3, Ap. 23', 'geo@gmail.com');
-- insert into client(nume, telefon, adresa, email) values('Ana', '0712345234', 'Str. Garii, nr. 5, Bl. 1, Sc. A, Et. 3, Ap. 12', 'ana_d@yahoo.com');
-- insert into client(nume, telefon, adresa, email) values('Mihai', '0712354322', 'Str. Plopilor, nr. 4, Bl. 4, Sc. A, Et. 2, Ap. 14', 'mihai_m@yahoo.com');
-- insert into client(nume, telefon, adresa, email) values('Alex', '0712354321', 'Str. Garii, nr. 5, Bl. 6, Sc. A, Et. 2, Ap. 9', 'alex_x@yahoo.com');
-- insert into client(nume, telefon, adresa, email) values('Vlad', '0712348765', 'Str. Zorilor, nr. 2, Bl. 2, Sc. A, Et. 6, Ap. 43', 'vlad_v@yahoo.com');




--insert PRODUS
insert into produs(denumire, ingrediente, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('paste cu ton', 'ceapa, ton, sos', 20, '400g', 'paste', 10, 1);
insert into produs(denumire, ingrediente, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('paste carbonara', 'ou, bacon, cascaval, smantana', 25, '440g', 'paste', 10, 1);
insert into produs(denumire, ingrediente, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('pizza antique', 'sos de rosii, sunca, ciuperci, marar', 26, '650g', 'pizza', 10, 1);
-- insert into produs(denumire, ingrediente, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('pizza rustica', 'sos de rosii, ardei, bacon, ceapa', 26, '580g', 'pizza');
-- insert into produs(denumire, ingrediente, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('pizza capricciosa', 'sos de rosii, sunca, salam, bacon, ciuperci', 24, '600g', 'pizza');
-- insert into produs(denumire, ingrediente, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('pizza quattro stagioni', 'sunca, ciuperci, ardei, salam', 26, '600g', 'pizza');
-- insert into produs(denumire, ingrediente, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('tort ciocolata', 'cu sos caramel', 16, '200g', 'desert');
-- insert into produs(denumire, ingrediente, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('tort fructe de padure', 'cu sos caramel', 16, '200g', 'desert');
-- insert into produs(denumire, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('cola', 7, '0.7L', 'bautura');
-- insert into produs(denumire, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('suc de portocale', 12, '0.7L', 'bautura');
-- insert into produs(denumire, pret, gramaj, tip, stoc, restaurant_id_restaurant) values('ceai', 9, '0.5L', 'bautura');




-- --inserare COMANDA

-- insert into comanda(data_preluare, data_livrare, angajat_id_angajat, client_id_client, restaurant_id_restaurant) values(
--     to_date('10-11-2020 9:20:00', 'DD-MM-YYYY HH24:MI:SS'), 
--     to_date('10-11-2020 11:00:00', 'DD-MM-YYYY HH24:MI:SS'),
--     (select id_angajat from angajat where nume='Gavrilescu' and prenume='Marius'),
--     2, 
--     1);

-- insert into comanda(data_preluare, data_livrare, angajat_id_angajat, client_id_client, restaurant_id_restaurant) values(
--     to_date('12-11-2020 9:30:00', 'DD-MM-YYYY HH24:MI:SS'), 
--     to_date('12-11-2020 12:00:00', 'DD-MM-YYYY HH24:MI:SS'),
--     (select id_angajat from angajat where nume='Gavrilescu' and prenume='Marius'),
--     1, 
--     1);
    
-- insert into comanda(data_preluare, data_livrare, angajat_id_angajat, client_id_client, restaurant_id_restaurant) values(
--     to_date('13-11-2020 10:20:00', 'DD-MM-YYYY HH24:MI:SS'), 
--     to_date('13-11-2020 12:00:00', 'DD-MM-YYYY HH24:MI:SS'),
--     (select id_angajat from angajat where nume='Gavrilescu' and prenume='Marius'),
--     3, 
--     1);    
    
-- insert into comanda(data_preluare, data_livrare, angajat_id_angajat, client_id_client, restaurant_id_restaurant) values(
--     to_date('10-12-2020 19:20:00', 'DD-MM-YYYY HH24:MI:SS'), 
--     to_date('10-12-2020 21:20:00', 'DD-MM-YYYY HH24:MI:SS'), 
--     (select id_angajat from angajat where nume='Ursachi' and prenume='Madalin'),
--     4, 
--     2); 
    
-- insert into comanda(data_preluare, data_livrare, angajat_id_angajat, client_id_client, restaurant_id_restaurant) values(
--     to_date('23-11-2020 18:20:00', 'DD-MM-YYYY HH24:MI:SS'), 
--     to_date('23-11-2020 18:20:00', 'DD-MM-YYYY HH24:MI:SS'),
--     (select id_angajat from angajat where nume='Ursachi' and prenume='Madalin'),
--     4, 
--     2);
    
-- insert into comanda(data_preluare, data_livrare, angajat_id_angajat, client_id_client, restaurant_id_restaurant) values(
--     to_date('20-12-2020 19:20:00', 'DD-MM-YYYY HH24:MI:SS'), 
--     to_date('20-12-2020 21:00:00', 'DD-MM-YYYY HH24:MI:SS'),
--     (select id_angajat from angajat where nume='Popa' and prenume='Ana'),
--     5, 
--     3); 




-- --insert COMANDA_DETALII
-- -- comanda 1
-- insert into comanda_detalii(cantitate, comanda_id_comanda, produs_id_produs) values(
--     2, 
--     1,
--     (select id_produs from produs where denumire = 'paste carbonara')
-- );

-- insert into comanda_detalii(cantitate, comanda_id_comanda, produs_id_produs) values(
--     3, 
--     1, 
--     (select id_produs from produs where denumire = 'pizza antique')
-- );

-- --comanda 2
-- insert into comanda_detalii(cantitate, comanda_id_comanda, produs_id_produs) values(
--     1, 
--     2,
--     (select id_produs from produs where denumire = 'pizza capricciosa')
-- );

-- insert into comanda_detalii(cantitate, comanda_id_comanda, produs_id_produs) values(
--     1, 
--     2,
--     (select id_produs from produs where denumire = 'cola')
-- );

-- --comanda 3
-- insert into comanda_detalii(cantitate, comanda_id_comanda, produs_id_produs) values(
--     5, 
--     3,
--     (select id_produs from produs where denumire = 'paste cu ton')
-- );

-- --comanda 4
-- insert into comanda_detalii(cantitate, comanda_id_comanda, produs_id_produs) values(
--     2, 
--     4,
--     (select id_produs from produs where denumire = 'tort ciocolata')
-- );

-- --comanda 5
-- insert into comanda_detalii(cantitate, comanda_id_comanda, produs_id_produs) values(
--     3, 
--     5,
--     (select id_produs from produs where denumire = 'pizza rustica')
-- );

-- --comanda 6
-- insert into comanda_detalii(cantitate, comanda_id_comanda, produs_id_produs) values(
--     4, 
--     6,
--     (select id_produs from produs where denumire = 'tort fructe de padure')
-- );



-- -- insert PLATA
-- --comanda 1
-- insert into  plata(comanda_id_comanda, suma_totala, tip) values(
--     1,
--     (select sum(p.pret*d.cantitate) from produs p join comanda_detalii d on (d.comanda_id_comanda=1 and d.produs_id_produs=p.id_produs)),
--     'cash'
-- );

-- update  plata  
--     set data_plata = (select case tip 
--         when 'card' then data_preluare
--         when 'cash' then data_livrare
--         end as data_plata
--         from comanda c join plata p on (c.id_comanda=1 and p.comanda_id_comanda=1))
--     where comanda_id_comanda=1;

-- --comanda 2
-- insert into  plata(comanda_id_comanda, suma_totala, tip) values(
--     2,
--     (select sum(p.pret*d.cantitate) from produs p join comanda_detalii d on (d.comanda_id_comanda=2 and d.produs_id_produs=p.id_produs)),
--     'cash'
-- );

-- select case tip 
--         when 'card' then data_preluare
--         when 'cash' then data_livrare
--         end as data_plata
--         from comanda c, plata where c.id_comanda=2;

-- update  plata  
--     set data_plata = (select case tip 
--         when 'card' then data_preluare
--         when 'cash' then data_livrare
--         end as data_plata
--         from comanda c join plata p on (c.id_comanda=2 and p.comanda_id_comanda=2))
--     where comanda_id_comanda=2; 

-- --comanda 3
-- insert into  plata(comanda_id_comanda, suma_totala, tip) values(
--     3,
--     (select sum(p.pret*d.cantitate) from produs p join comanda_detalii d on (d.comanda_id_comanda=3 and d.produs_id_produs=p.id_produs)),
--     'card'
-- );
-- update  plata  
--     set data_plata = (select case tip 
--         when 'card' then data_preluare
--         when 'cash' then data_livrare
--         end as data_plata
--         from comanda c join plata p on (c.id_comanda=3 and p.comanda_id_comanda=3))
--     where comanda_id_comanda=3;
 
-- --comanda 4
-- insert into  plata(comanda_id_comanda, suma_totala, tip) values(
--     4,
--     (select sum(p.pret*d.cantitate) from produs p join comanda_detalii d on (d.comanda_id_comanda=4 and d.produs_id_produs=p.id_produs)),
--     'card'
-- );
-- update  plata  
--     set data_plata = (select case tip 
--         when 'card' then data_preluare
--         when 'cash' then data_livrare
--         end as data_plata
--         from comanda c join plata p on (c.id_comanda=4 and p.comanda_id_comanda=4))
--     where comanda_id_comanda=4;  

-- --comanda 5
-- insert into  plata(comanda_id_comanda, suma_totala, tip) values(
--     5,
--     (select sum(p.pret*d.cantitate) from produs p join comanda_detalii d on (d.comanda_id_comanda=5 and d.produs_id_produs=p.id_produs)),
--     'cash'
-- );
-- update  plata  
--     set data_plata = (select case tip 
--         when 'card' then data_preluare
--         when 'cash' then data_livrare
--         end as data_plata
--         from comanda c join plata p on (c.id_comanda=5 and p.comanda_id_comanda=5))
--     where comanda_id_comanda=5;

-- --comanda 6
-- insert into  plata(comanda_id_comanda, suma_totala, tip) values(
--     6,
--     (select sum(p.pret*d.cantitate) from produs p join comanda_detalii d on (d.comanda_id_comanda=6 and d.produs_id_produs=p.id_produs)),
--     'card'
-- );
-- update  plata  
--     set data_plata = (select case tip 
--         when 'card' then data_preluare
--         when 'cash' then data_livrare
--         end as data_plata
--         from comanda c join plata p on (c.id_comanda=6 and p.comanda_id_comanda=6))
--     where comanda_id_comanda=6;
    



