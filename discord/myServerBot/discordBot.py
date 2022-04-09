import discord
import random
import sqlite3 as cashDB
import os
from dotenv import load_dotenv

from crime import do_crime
from userCashDB import add_funds, getuserAmount, remove_funds
from ceelo import ceelo

client = discord.Client()
    
# called when the bot is ready to be used
@client.event
async def on_ready():
  print('bot is logged in as {0.user}'.format(client))

# does things when a user sends a message
@client.event
async def on_message(message):
  if message.author == client.user:
    return

  if message.content.startswith('$crime'):
    crimeTaken = do_crime() 
    randomCash = random.randint(100, 2000)

    if crimeTaken.startswith(" got") or crimeTaken.startswith(" tried"):
      remove_funds(message.author.name, randomCash)
      await message.channel.send('{}{}{}'.format(message.author.name, crimeTaken, randomCash))
    else:
      add_funds(message.author.name, randomCash)
      await message.channel.send('{}{}{}'.format(message.author.name, crimeTaken, randomCash))
    

  if message.content.startswith('$check'):
    if getuserAmount(message.author.name) < 0:
      await message.channel.send('You have negative ${}'.format(getuserAmount(message.author.name)))

    else:
      await message.channel.send('You have ${}'.format(getuserAmount(message.author.name)))

  if message.content.startswith('$ceelo'):
    userStr = message.content
    userBetAmt = userStr.split(" ")

    # check is user entered in a number to bet
    if(len(userStr) <= 6):
      await message.channel.send("enter a number to bet after $ceelo (i.e $ceelo 100)")
    else:
      
      await ceelo(message.author.name, message, int(userBetAmt[1]))
    



load_dotenv()
client.run(os.getenv('token'))
