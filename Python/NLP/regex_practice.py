import re
from functools import reduce
def find_substring_n_times():
    n = int(input())
    text = "\n".join(input() for _ in range(n))
    t = int(input())
    for _ in range(t):
        print(len(re.findall(r'\B(%s)\B' % input().strip(),text)))
    
find_substring_n_times()