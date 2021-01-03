
-- selectam toti manageri
select nume, prenume from angajat a 
    join detalii_angajat d on(a.id_angajat=d.angajat_id_angajat and d.pozitie='manager');

--selectam angajatii a caror email incepe cu 'ma'
select nume, prenume from angajat where email like 'ma%';

-- afisam clientii care au dat comanda de la restaurantul din Suceava
select cl.nume, cl.adresa, cl.telefon, cl.email from client cl
    join comanda c on (c.id_comanda=cl.id_client)
    join restaurant r on (c.restaurant_id_restaurant=r.id_restaurant)
    where r.oras='Suceava';

--selectam numele, prenumele si pozitia angajatiilor restaurantului din Iasi
select a.nume, a.prenume, d.pozitie from angajat a
    join restaurant r on (a.restaurant_id_restaurant=r.id_restaurant)
    join detalii_angajat d on (a.id_angajat=d.angajat_id_angajat)    
    where r.oras='Iasi';
    

-- afisam toti angajatii care locuiesc pe strada Creanga
select a.nume, a.prenume, a.telefon, a.email from angajat a
    join detalii_angajat d on (a.id_angajat=d.angajat_id_angajat)
    where d.adresa like '%Creanga%';

--selectam denumirea si pretul produselor care sunt de tipul 'paste'
select denumire, pret from produs where tip='paste';

--afisam toti clientii al caror numar de telefon contine '54'
select nume, telefon from client where telefon like'%54%';

-- afisam agajatii care lucreaza in tura de dimineata
select a.nume, a.prenume from angajat a
    join detalii_angajat d on (a.id_angajat=d.angajat_id_angajat)
    where d.tura='dimineata';

-- afisam toti angajatii care au pozitia de curier
select a.nume, a.prenume from angajat a
    join detalii_angajat d on (a.id_angajat=d.angajat_id_angajat)
    where d.pozitie='curier';


--afisam suma si id-ul comenzilor a caror valoare totala depaseste 50 lei
select id_comanda, p.suma_totala from comanda c 
    join plata p on (c.id_comanda=p.comanda_id_comanda)
    where p.suma_totala > 50;
    
-- afisam clientul cu cea mai scumpa comanda
select client.nume, p.suma_totala from client
    join comanda c on (c.id_comanda=client.id_client)
    join plata p on (p.comanda_id_comanda=c.id_comanda)
    where p.suma_totala=(select max(suma_totala) from plata);


-- afisam numarul de comenzi pe care le are angajatul Gavrilescu Marius
select count(id_comanda) nr_comenzi from angajat a
    join comanda c on (c.angajat_id_angajat=a.id_angajat)
    where a.nume='Gavrilescu' and a.prenume='Marius';

-- afisam numarul de comenzi livrate ale fiecarui angajat
select count(id_comanda) nr_comenzi, a.nume from comanda c 
    join angajat a on (c.angajat_id_angajat=a.id_angajat) 
    group by a.nume;


-- afisam comenzile preluate in zilele de 10 pana pe 15 din luna
select id_comanda, data_preluare from comanda where to_char(data_preluare, 'DD') between 10 and 15;

-- afisam toti angajatii a caror serie incepe cu 'H'
select a.nume, a.prenume, d.serie from angajat a
    join detalii_angajat d on (a.id_angajat=d.angajat_id_angajat)
    where serie like 'H%';
  
-- afisam numarul de comenzi ale restaurantului din Iasi
select count(*) numar_comenzi from restaurant r 
    join comanda c on (r.id_restaurant=c.restaurant_id_restaurant)
    where r.oras='Iasi';
    
    
-- afisam suma totala a comenzilor care au fost platite cu cardul
select sum(p.suma_totala) suma_totala from plata p
    where tip='card';

--afisam numele clientului, data de livrare si suma comenzilor care au fost livrate pe strada Garii
select client.nume, client.adresa, c.data_livrare, p.suma_totala  from client
    join comanda c on (id_client=c.client_id_client)
    join plata p on (p.comanda_id_comanda=c.id_comanda)
    where client.adresa like '%Garii%';
    
-- afisam numele si email-ul clientilor care au comandat pizza
select client.nume, client.email from client
    join comanda c on (id_client=c.client_id_client)
    join comanda_detalii d on (d.comanda_id_comanda=c.id_comanda)
    join produs p on (p.id_produs=d.produs_id_produs)
    where p.tip='pizza';
    
-- afisam numele si email-ul clientilor care au comandat cola
select client.nume, client.email from client
    join comanda c on (id_client=c.client_id_client)
    join comanda_detalii d on (d.comanda_id_comanda=c.id_comanda)
    join produs p on (p.id_produs=d.produs_id_produs)
    where p.denumire='cola';   
    
-- afisam valoarea totala a incasarilor facute de restaurante
select sum(p.suma_totala) total, r.oras from plata p
    join comanda c on(c.id_comanda=p.comanda_id_comanda)
    join restaurant r on (r.id_restaurant=c.restaurant_id_restaurant)
    group by r.oras;
    

-- afisam clientii si suma comenziilor din luna noiembrie
select client.nume, client.email, client.telefon, c.data_preluare, p.suma_totala from client
    join comanda c on (c.id_comanda=client.id_client)
    join plata p on (p.comanda_id_comanda=c.id_comanda)
    where to_char(c.data_preluare, 'MM') = '11';

-- afisam numele clientului si pretul comenzii care ara ca data de preluare 12-NOV-2020
select client.nume, p.suma_totala from client
    join comanda c on (c.id_comanda=client.id_client)
    join plata p on (p.comanda_id_comanda=c.id_comanda)
    where to_char(c.data_preluare, 'DD-MM-YYYY') = '12-11-2020';

-- afisam clientul, pretul si data de livrare a comenzii cu cel mai mare timp de prelucrare
select client.nume, p.suma_totala, c.data_livrare from client
    join comanda c on (c.id_comanda=client.id_client)
    join plata p on (p.comanda_id_comanda=c.id_comanda)
    where data_livrare-data_preluare=(select max(data_livrare-data_preluare) from comanda);


-- afisam valoarea totala a incasarilor facute de restaurantul din Iasi in luna noiembrie
select sum(p.suma_totala) total, r.oras, a.nume, a.prenume from plata p
    join comanda c on(c.id_comanda=p.comanda_id_comanda)
    join restaurant r on (r.id_restaurant=c.restaurant_id_restaurant)
    join angajat a on (a.restaurant_id_restaurant=r.id_restaurant)
    join detalii_angajat d on(d.angajat_id_angajat=a.id_angajat)
    where d.pozitie='manager' and r.oras='Iasi' and to_char(data_livrare, 'MM')='11' 
    group by r.oras, a.nume, a.prenume;


-- afisam angajatul cu cele mai multe comenzi livrate               
select count(nume), a.nume from angajat a 
    join comanda c on (c.angajat_id_angajat=a.id_angajat)
    where (select count(id_comanda) from comanda c join angajat d on (c.angajat_id_angajat=d.id_angajat) where a.nume = d.nume)
    = (select max(count(id_comanda)) from comanda c join angajat a on (c.angajat_id_angajat=a.id_angajat) group by a.nume) group by a.nume;



-- modificam pretul produsului cu denumirea 'paste cu ton'
update produs p 
    set p.pret = 30
    where p.denumire = 'paste cu ton';
    
-- modificam numele clientului cu numarul de telefon 0712345679
update client c
    set c.nume = 'Costel'
    where c.telefon = '0712345679';

    
-- stergem un produs din prima comanda
delete from comanda_detalii c 
    where c.comanda_id_comanda = 1 and c.produs_id_produs = 3;
    
-- stergem produsul care are denumirea de 'suc de portocale'
delete from produs 
    where denumire = 'suc de portocale';

