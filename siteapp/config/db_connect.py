 
import mysql.connector
import sys
# insert at 1, 0 is the script path (or '' in REPL)
sys.path.insert(1, '/home/iulian0user/Facultate/Anul 3/BD/BD-Tema/Tema_de_casa_bd')

from con import data as data

mydb = mysql.connector.connect(
	host="localhost",
	user="root",
	passwd=data,
	database="restaurant_db"
	)
