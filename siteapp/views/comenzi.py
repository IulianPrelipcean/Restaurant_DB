from flask import Blueprint, render_template, session, redirect, request
from siteapp.config.db_connect import mydb

bp = Blueprint(__name__, __name__, template_folder='templates')


@bp.route('/comenzi', methods=['POST', 'GET'])



def show():

	mycursor = mydb.cursor()

	# selectam toate restaurantele
	id_produs = 2
	sql = "SELECT * FROM restaurant "
	val = ( )
	mycursor.execute(sql)
	restaurante = mycursor.fetchall()


	# selectam produsele pentru a le afisa in tabel
	sql = "SELECT * FROM produs where stoc > 0 and restaurant_id_restaurant=(select id_restaurant from restaurant where oras='Suceava')"		#de modificat Iasi
	val = (id_produs, )
	mycursor.execute(sql)
	result = mycursor.fetchall()


	# selectam comenzile pentru a le afisa in tabel
	sql = "SELECT * FROM comanda;"
	val = (id_produs, )
	mycursor.execute(sql)
	comenzi = mycursor.fetchall()

	# selectam clientii pentru a-i afisa in tabel
	sql = "SELECT * FROM client;"
	val = (id_produs, )
	mycursor.execute(sql)
	clienti = mycursor.fetchall()
	#print(clienti)


	# selectam toate detaliile despre angajati 
	mycursor = mydb.cursor()
	sql = "SELECT * FROM angajat inner join detalii_angajat on (id_angajat=angajat_id_angajat) where pozitie = 'curier';"
	#val = (id )
	mycursor.execute(sql)
	angajati = mycursor.fetchall()


	# selectam toate comenzile cu detaliile lo
	id_produs = 2
	sql = "select id_comanda, comanda_id_comanda, produs.denumire, ingrediente, cantitate, pret from comanda inner join comanda_detalii on (id_comanda=comanda_id_comanda) inner join produs on (id_produs=produs_id_produs);"
 	#val = (,)
	mycursor.execute(sql)
	detalii_comanda = mycursor.fetchall()





	# adaugam produsul in tabela comanda_detalii
	if request.method == 'POST':
		if request.form.get('actualizeaza_comanda'):
			id_comanda = request.form.get('id_comanda')
			status_livrare = request.form.get('gata_de_livrare')
			id_produs = request.form.get('id_produs')

			#print("status: ", status_livrare)
			if(status_livrare == 'on'):
				status_db = 1
			else:
				status_db = 1
				
			sql = "UPDATE comanda SET status_livrare=%s where id_comanda=%s"
			val = (status_db, id_comanda, ) 
			mycursor.execute(sql, val)
			mydb.commit()

			return redirect('comenzi')


	

	# asignam comanda unui curier
	if request.method == 'POST':
		if request.form.get('preia_comanda'):
			id_angajat = request.form.get('id_angajat')
			id_comanda = request.form.get('id_comanda')
				

			sql = "UPDATE comanda SET angajat_id_angajat=%s where id_comanda=%s"
			val = (id_angajat, id_comanda, ) 
			mycursor.execute(sql, val)
			mydb.commit()

			return redirect('comenzi')



	return render_template('comenzi.html', detalii_comanda=detalii_comanda, result=result, clienti=clienti, angajati=angajati, restaurante=restaurante, comenzi=comenzi)