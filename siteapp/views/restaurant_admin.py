from flask import Blueprint, render_template, session, redirect, request
from siteapp.config.db_connect import mydb

bp = Blueprint(__name__, __name__, template_folder='templates')


@bp.route('/restaurant_admin', methods=['POST', 'GET'])



def show():

	# selectam toate detaliile despre restaurante 
	mycursor = mydb.cursor()
	sql = "SELECT * FROM restaurant"
	#val = (id )
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


	# modificam detaliile despre restaurant
	if request.method == 'POST':
		if request.form.get('modifica_restaurant'):
			id_restaurant = request.form.get('id_restaurant')
			nume = request.form.get('nume')
			adresa = request.form.get('adresa')
			telefon = request.form.get('telefon')
			email = request.form.get('email')
			program = request.form.get('program')
			oras = request.form.get('oras')

			sql = "UPDATE restaurant SET nume=%s, adresa=%s, telefon=%s, email=%s, program=%s, oras=%s where id_restaurant=%s"
			val = (nume, adresa, telefon, email, program, oras, id_restaurant, )
			mycursor.execute(sql, val)
			mydb.commit()
			
			return redirect('restaurant_admin')


	# stergem un restaurant
	if request.method == 'POST':
		if request.form.get('sterge_restaurant'):
			id_restaurant = request.form.get('id_restaurant')

			sql = "DELETE FROM restaurant where id_restaurant=%s"
			val = (id_restaurant, )
			mycursor.execute(sql, val)
			mydb.commit()

			
			return redirect('restaurant_admin')



	# adaugam un nou restaurant
	if request.method == 'POST':
		if request.form.get('adauga_restaurant'):
			nume = request.form.get('nume')
			adresa = request.form.get('adresa')
			telefon = request.form.get('telefon')
			email = request.form.get('email')
			program = request.form.get('program')
			oras = request.form.get('oras')

			sql = "INSERT INTO restaurant(nume, adresa, telefon, email, program, oras) VALUES(%s, %s, %s, %s, %s, %s)"
			val = (nume, adresa, telefon, email, program, oras, )
			mycursor.execute(sql, val)
			mydb.commit()

			
			return redirect('restaurant_admin')


	return render_template('restaurant_admin.html', result=result)