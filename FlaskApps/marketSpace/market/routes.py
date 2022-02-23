from market import app
from flask import render_template
from market.models import Song
@app.route('/')
@app.route('/home')
def home_page():
    return render_template('home.html')
    
@app.route('/market')
def market_page():
    # """Thoughts for the future

    # Items can come from a DB/API
    # A seperate python script could load up our "items" list to generate new data


    # """
    items = Song.query.all()
    return render_template('market.html', items=items)