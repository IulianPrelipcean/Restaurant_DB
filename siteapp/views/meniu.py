from flask import Blueprint, render_template, session, redirect, request
from siteapp.config.db_connect import mydb

bp = Blueprint(__name__, __name__, template_folder='templates')


@bp.route('/meniu', methods=['POST', 'GET'])



def show():

	# selectam produsele pentru a le afisa in tabel
	id_produs = 2
	mycursor = mydb.cursor()
	sql = "SELECT * FROM produs where stoc > 0 and restaurant_id_restaurant=(select restaurant_id_restaurant from comanda order by id_comanda desc limit 1)"
	val = (id_produs, )
	mycursor.execute(sql)
	result = mycursor.fetchall()

	# for res in result:
	# 	print(res)

	# print(result[0][0])
	# print(result[0][1])
	# print(result[0][2])
	# print(result[0][3])
	# print(result[0][4])
	# print(result[0][5])
	# print(result[0][6])


	# selectam numarul de telefon si adresa
	sql = "SELECT id_restaurant, telefon, adresa FROM restaurant where oras='Iasi'"		#de modificat Iasi
	mycursor.execute(sql)
	detalii_resturant = mycursor.fetchall()



	# adaugam produsul in tabela comanda_detalii
	if request.method == 'POST':
		if request.form.get('adauga_produs'):
			cantitate = request.form.get('cantitate_val')
			id_produs = request.form.get('id_produs')
				
			if (int(cantitate) > 0):
				#verificam daca sunt suficiente stocuri
				sql = "SELECT stoc from produs where id_produs=%s"
				val = (id_produs, ) 
				mycursor.execute(sql, val)
				produs = mycursor.fetchall()
				stoc_cantitate = produs[0][0]

				if (int(cantitate) <= int(stoc_cantitate)):
					# adaugam produsul in comanda
					status = 1
					sql = "INSERT INTO comanda_detalii(cantitate, produs_id_produs, status) VALUES(%s, %s, %s);"
					val = (cantitate, id_produs, status, ) 
					mycursor.execute(sql, val)
					mydb.commit()

					# actualizam stocurile pentru produsul adaugat
					noua_cantitate = int(stoc_cantitate) - int(cantitate)
					sql = "UPDATE produs SET stoc=%s where id_produs=%s"
					val = (noua_cantitate, id_produs, ) 
					mycursor.execute(sql, val)
					mydb.commit()

				else:
					print("mesag de informare, cantitate insuficienta!!")

				

			else:
				print("\ncantiate nula\n")

			return redirect('iasi_meniu')


	# creeam o inregistrare pentru comanda si asignam comenzii toate produsele adaugate pana acum(care au status=1)
	if request.method == 'POST':
		if request.form.get('comanda_produse'):
			
			id_restaurant = detalii_resturant[0][0]

			# creeam comanda si punem id-ul restaurantului in ea
			sql = "INSERT INTO comanda(restaurant_id_restaurant) VALUES(%s);"
			val = (id_restaurant,) 
			mycursor.execute(sql, val)
			mydb.commit()


			###### ------ secventa pentru evitarea crearii mai multor comenzi fara a fi terminate ------#######

			# extragem id-ul comenzii create mai sus
			sql = "SELECT id_comanda FROM comanda order by id_comanda desc;"
			mycursor.execute(sql)
			comanda = mycursor.fetchall()
			print("\n comanda_id : " + str(comanda[1][0]))
			id_comanda = comanda[0][0]

			print("len = "+ str(len(comanda)))

			if (len(comanda) == 1):

				# pentru tabela comanda, setam campul status pe valoarea 1 ( va fi setata pe valoarea 0 la terminarea comenzii)
				status_comanda_modificat = 1
				sql = "UPDATE comanda SET status=%s where id_comanda=%s;"
				val = (status_comanda_modificat, id_comanda, )
				mycursor.execute(sql, val)
				mydb.commit()
			else:
				# extragem statusul penultimei comenzi pentru a vedea daca este terminata(status=0)
				sql = "SELECT status from comanda where id_comanda=%s;"
				val = (comanda[1][0],)
				mycursor.execute(sql, val)
				temp = mycursor.fetchall()
				status_temp = temp[0][0]

				if(int(status_temp) == 0):		# validam ultima inregistrare
					# pentru tabela comanda, setam campul status pe valoarea 1 ( va fi setata pe valoarea 0 la terminarea comenzii)
					status_comanda_modificat = 1
					sql = "UPDATE comanda SET status=%s where id_comanda=%s;"
					val = (status_comanda_modificat, id_comanda, )
					mycursor.execute(sql, val)
					mydb.commit()
				else:		# penultima comanda este in desfasurare si ultima inregistrare trebuie stearsa
					sql = "DELETE from comanda where id_comanda=%s;"
					val = (id_comanda, )
					mycursor.execute(sql, val)
					mydb.commit()

			###### ------ terminare secventa ------#######




			# extragem id-ul comnezii create mai sus
			sql = "SELECT id_comanda FROM comanda order by id_comanda desc limit 1;"
			mycursor.execute(sql)
			comanda = mycursor.fetchall()
			print("\n comanda_id : " + str(comanda[0][0]))


			# facem update pe toate inregistrarile din comanda_detalii care au staus=1
			status_modificat = 0
			sql = "UPDATE comanda_detalii SET comanda_id_comanda=%s, status=%s where status=1;"
			val = (comanda[0][0], status_modificat)
			mycursor.execute(sql, val)
			mydb.commit()



			#return redirect('comanda_client')
			return redirect('client')




	return render_template('meniu.html', result=result, detalii_resturant=detalii_resturant)