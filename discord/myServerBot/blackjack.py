"""
1. enter blackjack game: user gets their card, and they are shown the bots card (just one card)
    your hand [5] [A]
    delers hand [7] []

2. see if the user wants to hit, add a new random card to the users hand, check for a bust

3. if the dealers hand is 18+ it will not hit, if not add a random card to the dealers hand, check for a bust

4. if theres a bust on either side add.remove funds for user

5. if theres a draw, ask user to play again


"""
import random
deck = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]*4

async def blackJack(message):
    await message.channel.send(deal(deck))

    if message.content.startswith("$hit"):
        await message.channel.send(hit(hand))


def deal(deck):
    hand = []
    for i in range(2):
        random.shuffle(deck)
        card = deck.pop()
        if card == 11:card = "J"
        if card == 12:card = "Q"
        if card == 13:card = "K"
        if card == 14:card = "A"
        hand.append(card)
    return hand

def hit(hand):
    total = 0
    for card in hand:
        if card == "J" or card == "Q" or card == "K":
            total +=10
        elif card == "A":
            if total >= 11: 
                total += 1
            else: 
                total+= 11
        else:
            total += card
    return total
    
