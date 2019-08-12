import re
import hashlib
import pandas as pd

nfl_files = ['2017_NFL_PASSING.xlsx', '2017_NFL_RUSHING.xlsx', '2017_NFL_RECEIVING.xlsx',
             '2016_NFL_PASSING.xlsx', '2016_NFL_RUSHING.xlsx', '2016_NFL_RECEIVING.xlsx']

for file in nfl_files:
    print (file)
    a = pd.read_excel(file)

    a.Player = a.Player.apply(lambda x: re.sub(r'([^\s\w]|_)+', '', x.split('\\')[0]))

    a['Player_ID'] = a.Player.apply(lambda x: hashlib.sha1(x).hexdigest())

    cleaned_name = file[:-5] + '.csv'

    a.to_csv(cleaned_name)