import discord
import random
import os
from dotenv import load_dotenv

from crime import do_crime
from userCashDB import add_funds, getuserAmount, remove_funds, deleteAll
from ceelo import ceelo
from discord.ext import commands
from discord_components import DiscordComponents, Button, Select, SelectOption, ComponentsBot

client = commands.Bot("$")
DiscordComponents(client)


# @client.command()
# async def select(ctx):
    
# called when the bot is ready to be used

@client.event
async def on_ready():
  print('bot is logged in as {0.user}'.format(client))

# does things when a user sends a message
@client.event
async def on_message(message):
  if message.author == client.user:
    return

  # button (blackjack)
  if message.content.startswith('$restart'):
    await message.channel.send("do you want to die?? (this will reset your funds and change your nickname)", components = [
    [ Button(label="die", style="3", emoji='😈', custom_id='button1'),
      Button(label='live', style='4', emoji='🥴', custom_id='button2')
    ]
  ])
 
  interaction = await client.wait_for('button_click')
  await interaction.send(content = 'Button clicked!', ephemeral=False)
  

  # select
  if message.content.startswith('$select'):
    await message.channel.send("select", components = [
        Select(
            placeholder = "Select something!",
            options = [
                SelectOption(label="A", value="A"),
                SelectOption(label="B", value="B")
            ]
        )
    ])

    while True:
        try:
            select_interaction = await client.wait_for("select_option")
            await select_interaction.send(content = f"{select_interaction.values[0]} selected!", ephemeral = False)
        except:
            await message.channel.send("urmom")


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

    # check is user entered in a number to bet
    if(len(userStr) <= 6):
      await message.channel.send("enter a number to bet after $ceelo (i.e $ceelo 100)")
    else:
      
      await ceelo(message.author.name, message, int(userBetAmt[1]))




load_dotenv()
client.run(os.getenv('token'))
# bot.run(os.getenv('token'))
