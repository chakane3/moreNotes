from getpass import getuser
import sqlite3

from requests import delete

con = sqlite3.connect('cashDB')
# create a table
# cur.execute(''' CREATE TABLE usercash (username text, amount integer)''')



def add_funds(user, amount):
    cur = con.cursor()

    # check if the user exists in our DB
    if checkIfUserExists(user):
        # update funds
        # grab the amount the user has then add it to a new amount
        userCurrentFunds = getuserAmount(user)

        # insert the new amount to the users row
        cur.execute("UPDATE usercash SET amount=? WHERE username=?", (amount+userCurrentFunds, user))
        con.commit()
        cur.close()
        print("updated {}".format(user))

    else:
        # create a new user in the DB
        cur.execute('''INSERT INTO usercash (username, amount) VALUES (?,?)''', (user, amount))
        con.commit()
        cur.close()
        print("done!")

def remove_funds(user, amount):
    cur = con.cursor()
    #check if user exists inside the DB
    if checkIfUserExists(user):
        userCurrentFunds = getuserAmount(user)
        cur.execute("UPDATE usercash SET amount=? WHERE username=?", (userCurrentFunds-amount, user))
        con.commit()
        cur.close()

    else:
        cur.execute('''INSERT INTO usercash (username, amount) VALUES (?,?)''', (user, amount))
        con.commit()
        cur.close()
        print("done!")

def checkIfUserExists(user):
    cur = con.cursor()
    cur.execute('''SELECT * FROM usercash''')
    con.commit()
    rows = cur.fetchall()
    for row in rows:
        print(row)
        if row[0] == user:
            cur.close()
            return True
    cur.close()
    return False
    

def getuserAmount(user):
    cur = con.cursor()
    cur.execute("SELECT * FROM usercash")
    con.commit()
    rows = cur.fetchall()
    for row in rows:
        if user == row[0]:
            return row[1]
        print(row)
    cur.close()

def deleteAll():
    cur = con.cursor()
    cur.execute("DELETE FROM usercash")
    con.commit()
    cur.close()

def printTable():
    cur = con.cursor()
    cur.execute("SELECT * FROM usercash")
    con.commit()
    rows = cur.fetchall()
    for row in rows:
        print(row)

    
# deleteAll() 
# update_funds("cs499", 200)
# update_funds("hwijj", 250)
printTable()


    
  