from flask import Blueprint, render_template, session, redirect, request
from siteapp.config.db_connect import mydb

bp = Blueprint(__name__, __name__, template_folder='templates')


@bp.route('/', methods=['POST', 'GET'])
def show():

	mycursor = mydb.cursor()

	# selectam detaliile despre restaurante
	sql = "SELECT * from restaurant;"
	mycursor.execute(sql)
	restaurante = mycursor.fetchall()


	# select id_comanda pentru care status=1
	sql = "SELECT id_comanda from comanda where status=1;"
	mycursor.execute(sql)
	id_comanda = mycursor.fetchall()
	print (len(id_comanda))

	if (id_comanda):
		print("in comanda")
		# stergem produsele care apartin comenzii in desfasurare(a fost stearsa mai sus din tabela comanda) 
		sql = "DELETE FROM comanda_detalii where comanda_id_comanda=%s;"
		val = (id_comanda[0][0], )
		mycursor.execute(sql, val)
		mydb.commit()	

	# stergem inregistrarea cu status=1
	sql = "DELETE FROM comanda where status=1;"
	mycursor.execute(sql)
	mydb.commit()

	# stergem toate produsele cu status=1
	sql = "DELETE FROM comanda_detalii where status=1;"
	mycursor.execute(sql)
	mydb.commit()	


	# creeam o inregistrare pentru comanda si asignam comenzii toate produsele adaugate pana acum(care au status=1)
	if request.method == 'POST':
		if request.form.get('alege_restaurant'):
			
			#id_restaurant = request.form.get('id_restaurant')
			oras_temp = request.form.get('alege_restaurant')

			# extragem id-ul restaurantului ales
			sql = "SELECT id_restaurant FROM restaurant where oras = %s"
			val = (oras_temp, )
			mycursor.execute(sql, val)
			restaurant_temp = mycursor.fetchall()
			id_restaurant= restaurant_temp[0][0]

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
			#print("\n comanda_id : " + str(comanda[1][0]))
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
				print("sadsd ", status_temp)

				if (status_temp == None):
					status_temp = 0
					
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

			return redirect('meniu')




	return render_template('index.html',  restaurante=restaurante)