from flask import Flask, session
from siteapp.views.index import bp as index_bp
from siteapp.views.meniu import bp as meniu_bp
from siteapp.views.client import bp as client_bp
from siteapp.views.restaurant_admin import bp as restaurant_admin_bp
from siteapp.views.comenzi import bp as comenzi_bp
from siteapp.views.restaurant_angajati import bp as restaurant_angajati_bp
from siteapp.views.restaurant_produse import bp as restaurant_produse_bp


app = Flask(__name__)

app.secret_key = 'acsd'

app.register_blueprint(index_bp)
app.register_blueprint(meniu_bp)
app.register_blueprint(client_bp)
app.register_blueprint(restaurant_admin_bp)
app.register_blueprint(comenzi_bp)
app.register_blueprint(restaurant_angajati_bp)
app.register_blueprint(restaurant_produse_bp)