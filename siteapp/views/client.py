from flask import Blueprint, render_template, session, redirect, request
from siteapp.config.db_connect import mydb
import re

bp = Blueprint(__name__, __name__, template_folder='templates')


@bp.route('/client', methods=['POST', 'GET'])



def show():
	


	# array folosit pentru mesajele de eroare in cazul valorilor invalide din formular
	errors = {"telefon": ' ', "adresa": ' ', "email": ' '}

	# array folost in cazul in care se introduc date invalide(pentru a nu se reseta campurile(a nu se sterge datele din campuri))
	detalii_formular_invalid = {"nume":'', "telefon":'', "adresa": '', "email": '', "conditie":'0'}


	mycursor = mydb.cursor()

	# aflam id-ul comenzii 
	sql = "SELECT id_comanda from comanda order by id_comanda desc limit 1";
	mycursor.execute(sql)
	id_comanda = mycursor.fetchall()
	#print("comanda id : " + str(id_comanda[0][0]))

	# selectam produsele care apartin comenzii pentru a le afisa in tabel
	sql = "SELECT * from produs inner join comanda_detalii on (id_produs=produs_id_produs) where comanda_id_comanda = %s;"		#de modificat Iasi
	val = (id_comanda[0][0], )
	mycursor.execute(sql, val)
	result = mycursor.fetchall()



	# selectam numarul de telefon si adresa
	sql = "SELECT id_restaurant, telefon, adresa FROM restaurant where oras='Iasi'"		#de modificat Iasi
	mycursor.execute(sql)
	detalii_resturant = mycursor.fetchall()



	# stergem produsul din tabela comanda_detalii
	if request.method == 'POST':
		if request.form.get('sterge_produs'):
			id_comanda_detalii = request.form.get('id_comanda_detalii')

			# stergem produsul
			sql = "DELETE FROM comanda_detalii where id_comanda_detalii = %s "
			val = (id_comanda_detalii, ) 
			mycursor.execute(sql, val)
			mydb.commit()

			## ------ actualizam stocul pentru produsul sters  -----

			# aflam cantitatea deja existenta pentru produs
			id_produs = request.form.get('id_produs')
			sql = "SELECT stoc from produs where id_produs=%s"
			val = (id_produs, ) 
			mycursor.execute(sql, val)
			produs = mycursor.fetchall()
			stoc_cantitate = produs[0][0]

			# actualizam stocul pentru produs
			cantitate_de_sters = request.form.get('cantitate')
			noua_cantitate = int(stoc_cantitate) + int(cantitate_de_sters)
			sql = "UPDATE produs SET stoc=%s where id_produs=%s"
			val = (noua_cantitate, id_produs, ) 
			mycursor.execute(sql, val)
			mydb.commit()

			return render_template('client.html', detalii_formular_invalid=detalii_formular_invalid, result=result, detalii_resturant=detalii_resturant, errors=errors)


	# creeam o inregistrare in tabela client
	if request.method == 'POST':
		if request.form.get('termina_comanda'):
			
			id_restaurant = detalii_resturant[0][0]

			nume = request.form.get('nume')
			telefon = request.form.get('telefon')
			adresa = request.form.get('adresa')
			email = request.form.get('email')




			# stabilim toate conditiile necesare validarii formularului
			conditie = 0	# toate campurile sunt corecte

			# verificare numar telefon
			#telefon_validare = re.match('^0(2|7)\d{8}$', telefon)
			temp = re.compile('^0(2|7)\d{8}$')
			telefon_validare = temp.match(telefon)
			print("te : " , telefon_validare)
			if (telefon_validare == None):
				print('telefon invalid')
				errors['telefon'] = 'telefon invalid'
				conditie = 1

			# vericare adresa locatie
			if (len(adresa) == 0):
				print('adresa invalid')
				errors['adresa'] = 'adresa invalida'
				conditie = 1

			# vericare adresa email
			#temp = re.compile
			email_validare = re.match('[a-z0-9._%-]+@[a-z0-9._%-]+\.[a-z]{2,4}', email)
			if (email_validare == None and len(email)>0):
				print('email invalid')
				errors['email'] = 'adresa de email invalida'
				conditie = 1			

			# array folost in cazul in care se introduc date invalide(pentru a nu se reseta campurile(a nu se sterge datele din campuri))
			detalii_formular_invalid['nume'] = nume
			detalii_formular_invalid['telefon'] = telefon
			detalii_formular_invalid['adresa'] = adresa
			detalii_formular_invalid['email'] = email
			detalii_formular_invalid['conditie'] = conditie


			if(conditie == 0):		# datele sunt valide

				#creeam o inregistrare pentru client
				sql = "INSERT INTO client(nume, telefon, adresa, email) VALUES(%s, %s, %s, %s);"
				val = (nume, telefon, adresa, email,) 
				mycursor.execute(sql, val)
				mydb.commit()


				# extragem id-ul clientului creat mai sus
				sql = "SELECT id_client FROM client order by id_client desc limit 1;"
				mycursor.execute(sql)
				client = mycursor.fetchall()
				print("\n client_id : " + str(client[0][0]))

				# extragem id-ul comnezii 
				sql = "SELECT id_comanda FROM comanda order by id_comanda desc limit 1;"
				mycursor.execute(sql)
				comanda = mycursor.fetchall()
				id_comanda = comanda[0][0]
				print("\n comanda_id : " + str(comanda[0][0]))

				# adaugam id-ul clientului in tabela comanda [si data_prelucrare !!!!! ( de facut)]
				sql = "UPDATE comanda SET client_id_client=%s where id_comanda=%s"
				val = (client[0][0], comanda[0][0])
				mycursor.execute(sql, val)
				mydb.commit()

				# setam statusul comenzii ca fiind incheiat (status=0)
				status_incheiat = 0;
				sql = "UPDATE comanda SET status=%s where id_comanda=%s;"
				val = (status_incheiat, id_comanda, )
				mycursor.execute(sql, val)
				mydb.commit()

				errors['telefon'] = ''
				errors['adresa'] = ''
				errors['email'] = ''
				detalii_formular_invalid['nume'] = ''
				detalii_formular_invalid['telefon'] = ''
				detalii_formular_invalid['adresa'] = ''
				detalii_formular_invalid['email'] = ''
				detalii_formular_invalid['conditie'] = ''

				return redirect('/')

			else:
				return render_template('client.html',  detalii_formular_invalid=detalii_formular_invalid, result=result, detalii_resturant=detalii_resturant, errors=errors)





	return render_template('client.html',  result=result, detalii_resturant=detalii_resturant, errors=errors, detalii_formular_invalid=detalii_formular_invalid)