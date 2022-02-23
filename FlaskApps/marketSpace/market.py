from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
@app.route('/home')
def home_page():
    return render_template('home.html')
    
@app.route('/market')
def market_page():
    items = [
        {'id': 1, 'name': 'Knife Talk', 'artist': 'Drake & 21 Savage', 'barcode': '0000000001', 'price': 250},
        {'id': 2, 'name': 'Im Assumin', 'artist': 'Blac Youngsta', 'barcode': '0000000002', 'price': 250},
        {'id': 3, 'name': 'Hustlers Ambition', 'artist': '50 Cent', 'barcode': '0000000003', 'price': 300}, 
        {'id': 4, 'name': 'Having Our Way', 'artist': 'Drake & Migos', 'barcode': '0000000004', 'price': 250}, 
        {'id': 5, 'name': 'Roll In Peace', 'artist': 'Kodak Black', 'barcode': '0000000005', 'price': 300}, 
        {'id': 6, 'name': 'Dreams And Nightmares', 'artist': 'Meek Mill', 'barcode': '0000000006', 'price': 1000}

    ]
    return render_template('market.html', items=items)


# @app.route('/about/<username>')
# def about_page(username):
#     return f'<h1>This is the about page of {username}!!!</h1>'
