import random
# return a string stating a crime and if it was sucessful for not for some dollar value
def do_crime():
  
  crime0 = " robbed a bank for $"
  crime1 = " pick pocketed someones granny and ran off with $"
  crime2 = " stole a car and sold it to a chop shop for "
  crime3 = " became a hitman for hire and murdered someones wife for $"
  crime4 = " robbed a train for $"
  crime5 = " robbed the uber driver and took off with $"
  crime6 = " sold your kidney on the darknet for $"
  crime7 = " particiaped in dog fighting and won $"
  crime8 = " did a hit an run on a runner up olympic runner for $"
  crime9 = " beat up a 9 year old school bully and stole his lunch money for $"
  crime10 = " sold crack in newark for an hour and made $"
  crime11 = " performed a cyber attak on russia for $"
  crime12 = " was hired to do arson at the macys building in nyc for $"
  crime13 = " became a hitman and murdered the twitch streamer, Ninja for $"
  crime14 = " became a weed delaer for the day and made $"
  crime15 = " became an arms dealer for the day and made $"
  crime16 = " mugged a random jogger and tookoff with $"
  crime17 = " mugged the pizza driver and took off with $"
  crime18 = " setup a fake charity for kids on their death bed and ran off with $"

  crime100 = " tried to kill hitler but was arrested and fined $"
  crime101 = " tried to steal a car and hit a telephone pole was was shot 100 times by cops then fined $"
  crime102 = " tried selling dope in brookyln but was in the wrong block and got shot and mugged, they lost $"
  crime103 = " got hired as a hitman to wipe out pokimane but was thrarted by the FBI and fined $"
  crime104 = " tried being an arms dealer and was sent out to west africa to sell guns but got mugged by people from a nearby village, they lost $"
  crime105 = " got beat up for not paying nba youngboy's feature cost and lost $ "

  crimes = [crime0, crime1, crime2, crime3, crime4, crime5, crime6, crime7, crime8, crime9, crime10, crime11, crime12, crime13, crime14, crime15, crime16, crime17, crime18]
  notCrimes = [crime100, crime101, crime102, crime103, crime104, crime105]

  random_index = random.randint(0, len(crimes)-1)
  random_index1 = random.randint(0, len(notCrimes)-1)
  if crime_success() :
    return crimes[random_index]
  else:
    return notCrimes[random_index1]




def crime_success():
  rate = random.randint(0, 100)
  if rate > 30:
    newRate = random.randint(0, 100)
    if newRate > 15:
      return True
  return False

print(do_crime())

