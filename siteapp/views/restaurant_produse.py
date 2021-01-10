from flask import Blueprint, render_template, session, redirect, request
from siteapp.config.db_connect import mydb

bp = Blueprint(__name__, __name__, template_folder='templates')


@bp.route('/restaurant_produse', methods=['POST', 'GET'])



def show():

	# selectam toate detaliile despre restaurante 
	mycursor = mydb.cursor()
	#sql = "SELECT * FROM produs inner join restaurant on (id_restaurant=restaurant_id_restaurant)"
	sql = "SELECT * FROM produs;"
	#val = (id )
	mycursor.execute(sql)
	result = mycursor.fetchall()

	# selectam toate  restaurantele
	mycursor = mydb.cursor()
	sql = "SELECT * FROM restaurant"
	#val = (id )
	mycursor.execute(sql)
	restaurante = mycursor.fetchall()


	# for res in result:
	# 	print(res)

	# print(result[0][0])
	# print(result[0][1])
	# print(result[0][2])
	# print(result[0][3])
	# print(result[0][4])
	# print(result[0][5])
	# print(result[0][6])


	# modificam detaliile despre restaurant
	if request.method == 'POST':
		if request.form.get('modifica_produs'):
			id_produs = request.form.get('id_produs')
			denumire = request.form.get('denumire')
			ingrediente = request.form.get('ingrediente')
			pret = request.form.get('pret')
			gramaj = request.form.get('gramaj')
			tip = request.form.get('tip')
			stoc = request.form.get('stoc')
			oras_restaurant_id = request.form.get('oras_restaurant_id')

			sql = "UPDATE produs SET denumire=%s, ingrediente=%s, pret=%s, gramaj=%s, tip=%s, stoc=%s, restaurant_id_restaurant=%s where id_produs=%s"
			val = (denumire, ingrediente, pret, gramaj, tip, stoc, oras_restaurant_id, id_produs, )
			mycursor.execute(sql, val)
			mydb.commit()
			
			return redirect('restaurant_produse')


	# stergem un restaurant
	if request.method == 'POST':
		if request.form.get('sterge_produs'):
			id_produs = request.form.get('id_produs')
			print("das " , id_produs)

			sql = "DELETE FROM produs where id_produs=%s"
			val = (id_produs, )
			mycursor.execute(sql, val)
			mydb.commit()

			
			return redirect('restaurant_produse')



	# adaugam un nou produs
	if request.method == 'POST':
		if request.form.get('adauga_produs'):
			denumire = request.form.get('denumire')
			ingrediente = request.form.get('ingrediente')
			pret = request.form.get('pret')
			gramaj = request.form.get('gramaj')
			tip = request.form.get('tip')
			stoc = request.form.get('stoc')
			oras_restaurant_id = request.form.get('oras_restaurant_id')

			sql = "INSERT INTO produs(denumire, ingrediente, pret, gramaj, tip, stoc, restaurant_id_restaurant) VALUES(%s, %s, %s, %s, %s, %s, %s)"
			val = (denumire, ingrediente, pret, gramaj, tip, stoc, oras_restaurant_id,  )
			mycursor.execute(sql, val)
			mydb.commit()

			
			return redirect('restaurant_produse')


	return render_template('restaurant_produse.html', result=result, restaurante=restaurante)