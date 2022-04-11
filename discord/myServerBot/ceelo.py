import random
from userCashDB import add_funds, remove_funds, getuserAmount
async def ceelo(user, message, betAmt):
    """
    The game starts with the user entering in $ceelo 250
    The bot will match you the 250 dollar amount

    a dice can have a roll of 1-6
    We need 3 dice with a random number from 1-6 each

    dice pairings:
        4-5-6: automatic win
        1-2-3: automatic lose
        triples: if you roll a 5-5-5 and the bot rolls a 4-4-4, you win
                 if the bot rolls a 6-6-6 you lose
                 if the bot rolls the same as you, roll again

        
        points:  if you roll a 4-4-5; you have 5 points
                 if the bot rools a 3-3-6; the bot has 6 points, you lose

        if you or the bot does not match 2 dice for a point, or a 123, 456; roll again


    steps: 
     #1 Have the user enter in $ceelo 250
        output should be: "user started a game of ceelo, the bet is $250"

    #2 then the dice should roll, see if theres a winner/loser or if we should roll again.
       ** if theres a match; see if the user wants to bet more money onto the pile, substract funds from DB

    #3 if the usr won/lost, we should add/subtract their funds from the database and tell them
       "you lost $x try again!", or if they won
       "you won $x!!!"
        

    """

    if getuserAmount(message.author.name) <= 0:
        await message.channel.send("YOU ARE BROKE! Go do some crime")
        return 
    elif getuserAmount(message.author.name) < betAmt:
        await message.channel.send("You are betting over the amount you have")
        return


    userDice1 = random.randint(1,6)
    userDice2 = random.randint(1,6)
    userDice3 = random.randint(1,6)
    userList = [userDice1, userDice2, userDice3]
    await message.channel.send('You rolled a: {} - {} - {}'.format(userDice1, userDice2, userDice3))

    botDice1 = random.randint(1, 6)
    botDice2 = random.randint(1, 6)
    botDice3 = random.randint(1, 6)
    botList = [botDice1, botDice2, botDice3]
    await message.channel.send('Traphouse rolled a: {} - {} - {}'.format(botDice1, botDice2, botDice3))

    userRoll = ""
    userRoll += str(userDice1)
    userRoll += str(userDice2)
    userRoll += str(userDice3)

    botRoll  = ""
    botRoll += str(botDice1)
    botRoll += str(botDice1)
    botRoll += str(botDice1)
    print(userRoll)
    print(botRoll)

    userDict = {}
    botDict = {}

    win = ["456", "654", "546", "645", "564", "465"]
    lose = ["123", "213", "321", "312", "132", "231"]

    if userRoll in win:
        add_funds(user,betAmt*2)
        await message.channel.send('You won ${}! You how have, ${}'.format(betAmt*2 ,getuserAmount(message.author.name)))
        return
    elif botRoll in win:
        remove_funds(user,betAmt)
        await message.channel.send('You lost ${}! You how have, ${}'.format(betAmt ,getuserAmount(message.author.name)))
        return


    if botRoll in lose:
        add_funds(user,betAmt*2)
        await message.channel.send('You won ${}! You how have, ${}'.format(betAmt*2 ,getuserAmount(message.author.name)))
        return
    elif userRoll in lose:
        remove_funds(user,betAmt)
        await message.channel.send('You lost ${}! You how have, ${}'.format(betAmt ,getuserAmount(message.author.name)))
        return



    userPoint = 0
    botPoint = 0

    # add nums to dictionary
    for i in userList:
        if not i in userDict:
            userDict[i] = 1
        else:
            userDict[i] += 1

    for i in botList:
        if not i in botDict:
            botDict[i] = 1
        else:
            botDict[i] += 1 


    if len(userDict) == 2:
        for i, j in userDict.items():
            if j == 1:
                userPoint = i
    elif len(userDict) == 1:
        for i, j in userDict.items():
            userPoint = i
    
    if len(botDict) == 2:
        for i, j in botDict.items():
            if j == 1:
                botPoint = i
    elif len(botDict) == 1:
        for i, j in botDict.items():
            botPoint = i
 
    if(userPoint > botPoint):
        add_funds(user, betAmt)
        await message.channel.send('You won ${}! You how have, ${}'.format(betAmt*2 ,getuserAmount(message.author.name)))
    elif (userPoint < botPoint):
        remove_funds(user, betAmt)
        await message.channel.send('You lost ${}! You how have, ${}'.format(betAmt ,getuserAmount(message.author.name)))
    else:
        await message.channel.send('Draw! Play again You still have, ${}'.format(getuserAmount(message.author.name)))