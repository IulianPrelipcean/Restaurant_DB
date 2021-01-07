from flask import Blueprint, render_template, session, redirect, request
from siteapp.config.db_connect import mydb

bp = Blueprint(__name__, __name__, template_folder='templates')


@bp.route('/restaurant_angajati', methods=['POST', 'GET'])



def show():

	mycursor = mydb.cursor()
	sql = "SELECT * FROM restaurant"
	#val = (id )
	mycursor.execute(sql)
	restaurante = mycursor.fetchall()
	

	# selectam toate detaliile despre angajati 
	mycursor = mydb.cursor()
	sql = "SELECT * FROM angajat inner join detalii_angajat on (id_angajat=angajat_id_angajat);"
	#val = (id )
	mycursor.execute(sql)
	angajati = mycursor.fetchall()
	#print("id_man " + str(angajati[0][9]))
	

	# selectam toate detaliile despre managerii restaurantelor
	mycursor = mydb.cursor()
	sql = "SELECT * FROM angajat inner join detalii_angajat on (id_angajat=angajat_id_angajat) where pozitie='manager';"
	#val = (id )
	mycursor.execute(sql)
	manageri = mycursor.fetchall()	

	

	# for res in result:
	# 	print(res)

	# print(result[0][0])
	# print(result[0][1])
	# print(result[0][2])
	# print(result[0][3])
	# print(result[0][4])
	# print(result[0][5])
	# print(result[0][6])


	# modificam detaliile despre angajat
	if request.method == 'POST':
		if request.form.get('modifica_angajat'):
			id_angajat = request.form.get('id_angajat')
			nume = request.form.get('nume')
			prenume = request.form.get('prenume')
			telefon = request.form.get('telefon')
			id_restaurant = request.form.get('id_restaurant')
			adresa = request.form.get('adresa')
			pozitie = request.form.get('pozitie')
			id_manager = request.form.get('id_manager')
			#data_angajare = request.form.get('data_angajare')
			email = request.form.get('email')

			# actualizam datele in tabela angajat
			sql = "UPDATE angajat SET nume=%s, prenume=%s, restaurant_id_restaurant=%s, telefon=%s, email=%s where id_angajat=%s;"
			val = (nume, prenume, id_restaurant, telefon, email, id_angajat, )
			mycursor.execute(sql, val)
			mydb.commit()

			# actualizam datele in tabela detalii_angajat
			sql = "UPDATE detalii_angajat SET angajat_id_angajat=%s, adresa=%s, pozitie=%s, id_manager=%s where angajat_id_angajat=%s"
			val = (id_angajat, adresa, pozitie, id_manager, id_angajat)
			mycursor.execute(sql, val)
			mydb.commit()
			
			return redirect('restaurant_angajati')


	# stergem un angajat
	if request.method == 'POST':
		if request.form.get('sterge_angajat'):
			id_angajat = request.form.get('id_angajat')

			sql = "DELETE FROM detalii_angajat where angajat_id_angajat=%s"
			val = (id_angajat, )
			mycursor.execute(sql, val)
			mydb.commit()

			sql = "DELETE FROM angajat where id_angajat=%s"
			val = (id_angajat, )
			mycursor.execute(sql, val)
			mydb.commit()

			
			return redirect('restaurant_angajati')



	# adaugam un nou restaurant
	if request.method == 'POST':
		if request.form.get('adauga_angajat'):
			nume = request.form.get('nume')
			prenume = request.form.get('prenume')
			telefon = request.form.get('telefon')
			id_restaurant = request.form.get('id_restaurant')
			adresa = request.form.get('adresa')
			pozitie = request.form.get('pozitie')
			id_manager = request.form.get('id_manager')
			#data_angajare = request.form.get('data_angajare')
			email = request.form.get('email')


			
			# print("nume " + str(nume))
			# print("id_restaurant " + str(id_restaurant))
			#print("data " + str(data_angajare))


			#print("aici " + str(adresa))

			# inseram datele in tabela angajat
			sql = "INSERT INTO angajat(nume, prenume, restaurant_id_restaurant, telefon, email) VALUES(%s, %s, %s, %s, %s)"
			val = (nume, prenume, id_restaurant, telefon, email, )
			mycursor.execute(sql, val)
			mydb.commit()

			# selectam angajatul introdus
			sql = "SELECT * FROM angajat order by id_angajat desc"
			#val = (nume, prenume, id_restaurant, telefon, email, )
			mycursor.execute(sql)
			angajat_temp = mycursor.fetchall()	
			id_angajat_temp = angajat_temp[0][0]


			if(id_manager == None):
				id_manager = id_angajat_temp

			# inseram datele in tabela detalii_angajat
			sql = "INSERT INTO detalii_angajat(angajat_id_angajat, adresa, pozitie, id_manager) VALUES(%s, %s, %s, %s)"
			val = (id_angajat_temp, adresa, pozitie, id_manager, )
			mycursor.execute(sql, val)
			mydb.commit()

			
			return redirect('restaurant_angajati')


	return render_template('restaurant_angajati.html', restaurante=restaurante, angajati=angajati, manageri=manageri)
