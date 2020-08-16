import internetarchive, sys
from internetarchive import get_item

userinput=(sys.argv[1])
print (userinput)
gameslist=open(userinput)

item = get_item('redumpSonyPlaystation2UsaGames2018Aug01')

lines = gameslist.readlines()

for line in lines:
  target_file = line.split('\"')[1::2]
  print(target_file)
  item.download(files=target_file, verbose=True, checksum=True, retries=10)


