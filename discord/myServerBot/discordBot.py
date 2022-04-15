import random
import os
from dotenv import load_dotenv
from crime import do_crime
from userCashDB import add_funds, getuserAmount, remove_funds, resetUserFunds
from ceelo import ceelo
from discord.ext import commands
from discord_components import DiscordComponents, Button, Select, SelectOption, ComponentsBot
from playBlackJack import blackJack
from blackjack import *
import discord

client = commands.Bot("$")
DiscordComponents(client)

@client.event
async def on_ready():
  print('bot is logged in as {0.user}'.format(client))

# does things when a user sends a message
@client.event
async def on_message(message):
  if message.author == client.user:
    return

  if message.content.startswith("$reset"):
    resetUserFunds(message.author.name)
    await message.channel.send("Your balance is now at $0")

  # do crime
  if message.content.startswith('$crime'):
    crimeTaken = do_crime() 
    randomCash = random.randint(100, 2000)

    if crimeTaken.startswith(" got") or crimeTaken.startswith(" tried"):
      remove_funds(message.author.name, randomCash)
      await message.channel.send('{}{}{}'.format(message.author.name, crimeTaken, randomCash))
    else:
      add_funds(message.author.name, randomCash)
      await message.channel.send('{}{}{}'.format(message.author.name, crimeTaken, randomCash))
    

  # check funds
  if message.content.startswith('$check'):
    if getuserAmount(message.author.name) < 0:
      await message.channel.send('You have negative ${}'.format(getuserAmount(message.author.name)))

    else:
      await message.channel.send('You have ${}'.format(getuserAmount(message.author.name)))

  # play ceelo
  if message.content.startswith('$ceelo'):
    userStr = message.content
    userBetAmt = userStr.split(" ")
    if(len(userStr) <= 6):
      await message.channel.send("enter a number to bet after $ceelo (i.e $ceelo 100)")
    else:
      
      await ceelo(message.author.name, message, int(userBetAmt[1]))

  # play blackjack
  if message.content.startswith('$blackjack'):
    await blackJack(message)

  if message.content.startswith("$embed"):
    dealerHand = deal(deck)
    userHand = deal(deck)
    embed = discord.Embed(description="hit - take another card\nstand - end game")
    embed.set_author(name=message.author.name)
    embed.add_field(name="Your hand  ➡️  {}".format(userHand), value="\u200b")
    embed.add_field(name="\u200b", value="Value: {}".format(total(userHand)), inline=True)

    embed.add_field(name="Dealer hand  ➡️  [{}]".format(dealerHand[0]), value="\u200b")
    embed.add_field(name="\u200b", value="Value: {}".format(total(dealerHand)))



    await message.channel.send(embed=embed)


    components = [
      [Button(label="Hit", style="3", custom_id="button1"), 
      Button(label="Stand", style="2", custom_id="button2")]
    ]

    await message.channel.send(components=components)
    # interaction = await client.wait_for("button_click")
    # await interaction.send(content="Button clicked", ephemeral=False)
   


load_dotenv()
client.run(os.getenv('token'))
