import random
import time
import math
from colorama import Fore

print(Fore.RED + "Drecoin miner v beta\n")
time.sleep(1)
print(Fore.YELLOW + "Mine started!\n" + Fore.GREEN)
time.sleep(1)

zero_key = 0
new_key = zero_key + random.randint(1000, 9999)
new_key2 = new_key / 0.1 + random.randint(1, 9)
new_key3 = new_key2 + new_key + random.randint(10, 99)

key_fragment = new_key3 * math.pi


def new_coin(mine):
    while mine < new_key3 * 10000:
        print(Fore.MAGENTA + "####################" + Fore.RESET)
        print(mine)
        mine = mine + key_fragment
        time.sleep(0.05)
        print(new_key)
        if mine > mine + key_fragment:
            print(Fore.RED + "ERROR 1 THIS KEY_FRAGMENT IS HACKED OR INVALID")
        elif mine == mine + key_fragment:
            print(Fore.RED + "ERROR 2 MINE == MINE + KEY_FRAGMENT")
        elif mine / new_key3 < 0:
            print(Fore.RED + "ERROR 3 MINE/NEW_KEY3 < 0")
        elif new_key3 == 0:
            print(Fore.RED + "ERROR 4 NEW_KEY3 == 0")
        elif key_fragment == 0:
            print(Fore.RED + "ERROR 5 KEY_FRAGMENT = 0")
        elif key_fragment / new_key == 0:
            print(Fore.RED + "ERROR 6 KEY_FRAGMENT / NEW_KEY == 0")
        else:
            print(Fore.GREEN + "key_fragment is ok!")
            print(Fore.MAGENTA + "####################\n" + Fore.RESET)

        if mine > new_key3 * 10000:
            print(Fore.BLUE + "Congrats! " + Fore.GREEN + "You earned Drecoin")
            drecoin_wallet = 1
        elif mine == new_key3 * 10000:
            drecoin_wallet = 1
            print(Fore.BLUE + "Congrats! " + Fore.GREEN + "You earned Drecoin " + "Now your balance is : ")


new_coin(0)
