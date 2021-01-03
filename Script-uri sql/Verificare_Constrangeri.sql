

-- tabela RESTAURANT

-- numarul de telefon trebuie sa fie unic
insert into restaurant(nume, adresa, telefon, email, oras, program) values(
    'La Stejar', 
    'Str. Trandafirilor, Nr.1', 
    '0793817384',                   -- numarul de telefon deja este folosit
    'stejar_cluj@gmail.com', 
    'Cluj', 
    '8:00-24:00');
    
-- numarul de telefon trebuie sa contina 10 cifre
insert into restaurant(nume, adresa, telefon, email, oras, program) values(
    'La Stejar', 
    'Str. Trandafirilor, Nr.1', 
    '07938173',                   -- numarul de telefon este invalid
    'stejar_s@gmail.com', 
    'Cluj', 
    '8:00-24:00');

-- adresa de email trebuie sa aiba o structura valida
insert into restaurant(nume, adresa, telefon, email, oras, program) values(
    'La Stejar', 
    'Str. Trandafirilor, Nr.1', 
    '0793817312',                   
    'stejargmail.com',          -- adresa de email invalida
    'Cluj', 
    '8:00-24:00');


    
    
-- tabela ANGAJAT

-- numele si prenumele trebuie sa nu contina cifre
insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values(
    'Popescu123',          -- nume invalid, contine cifre      
    'Miha23i',             -- prenume invalid, contine cifre      
    '0712439654',             
    'popescu@gmail.com', 
    3);

-- numarul de telefon trebuie sa fie unic
insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values(
    'Popescu', 
    'Iulia',    
    '0712239654',               -- numarul de telefon este deja folosit
    'iulia_popescu@gmail.com', 
    3);
    
-- numarul de telefon trebuie sa contina 10 cifre si sa nu contina litere
insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values(
    'Popescu', 
    'Andrei',    
    '0712235aa',               -- numarul de telefon este invalid
    'iulia_popescu@gmail.com', 
    3);
    
-- adresa de email trebuie sa aiba o structura valida
insert into angajat(nume, prenume, telefon, email, restaurant_id_restaurant) values(
    'Popescu', 
    'Andrei',    
    '0712235411',               
    'iuligmail.com',        -- adresa de email invalida
    3);
    
    
    
    
    
-- tabela DETALII_ANGAJAT

-- seria trebuie sa fie unica 
insert into detalii_angajat(serie, numar, adresa, pozitie, tura, angajat_id_angajat, id_manager) values(
    'YT',                   -- seria deja exista
    '123876', 
    'Str. Stefan cel Mare, Nr 2', 
    'curier', 
    'dupa masa', 
    14, 
    3);
    
    
    
    
-- tabela CLIENT

-- numele trebuie sa contina doar litere
insert into client(nume, telefon, adresa, email) values(
    'Vlad12344',                    -- numele contine cifre - este invalid
    '0712348723',                   
    'Str. Zorilor, nr. 2, Bl. 2, Sc. A, Et. 6, Ap. 43', 
    'vlad_v@yahoo.com');
    
-- numarul de telefon trebuie sa fie unic
insert into client(nume, telefon, adresa, email) values(
    'Vlad', 
    '0712348765',                   -- numarul de telefon este deja folosit
    'Str. Zorilor, nr. 2, Bl. 2, Sc. A, Et. 6, Ap. 43', 
    'vlad_v@yahoo.com');

-- numarul de telefon trebuie sa contina 10 cifre si sa nu contina litere
insert into client(nume, telefon, adresa, email) values(
    'Vlad', 
    '071234rt',                   -- numarul de telefon este invalid
    'Str. Zorilor, nr. 2, Bl. 2, Sc. A, Et. 6, Ap. 43', 
    'vlad_v@yahoo.com');

-- adresa de email trebuie sa aiba o structura valida
insert into client(nume, telefon, adresa, email) values(
    'Vlad', 
    '0712348765',                   
    'Str. Zorilor, nr. 2, Bl. 2, Sc. A, Et. 6, Ap. 43', 
    'vlad_yahooom');                -- adresa de email invalida



-- tabela COMANDA

-- data de preluare a comenzii sa fie mai mica decat data de livrare
insert into comanda(data_preluare, data_livrare, angajat_id_angajat, client_id_client, restaurant_id_restaurant) values(
    to_date('24-12-2020 19:20:00', 'DD-MM-YYYY HH24:MI:SS'),            -- data_preluare este mai mare decat data_livrare ceea ce va genera eroare
    to_date('20-12-2020 21:00:00', 'DD-MM-YYYY HH24:MI:SS'),
    (select id_angajat from angajat where nume='Popa' and prenume='Ana'),
    5, 
    3); 
    
    
    
    
    
    