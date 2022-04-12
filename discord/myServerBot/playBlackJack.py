
from blackjack import *


async def blackJack(message):
    userHand = deal(deck)
    botHand = deal(deck)

    await message.channel.send("Your hand: [{}] [{}] ➡️ {}\nDealers hand: [{}]".format(userHand[0], userHand[1],total(userHand), botHand[0]))
    await game(message, userHand, botHand)



    
