# this is responsible to start our app
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///market.db'
app.config["SECRET_KEY"] = "637511ff445fa9b8197e0ec3"
db = SQLAlchemy(app) # pass our app to our db so we can start creating DB tables via classes
bcrypt = Bcrypt(app)
from market import routes