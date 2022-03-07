from pyautogui import typewrite, press
import argparse
from time import sleep

# Initialize the parser
parser = argparse.ArgumentParser(
    description="Repetitively send a message. After invoking the script, you have until the end of the timer to click the input field you want your messages to be written to!\r\nExample: python3 bing.py -c=10 -t=5 -m='Hello World'"
)

# Add the parameters positional/optional
parser.add_argument('-c','--count', help="Total number of messages to send.", type=int)
parser.add_argument('-t','--timer', help="Count down to fire.", type=int)
parser.add_argument('-m','--message', help="Message to be repetitively sent.", type=str)

# Parse the arguments
args = parser.parse_args()

print("Counting Down!")
for time in range(args.timer):
    print(time)
    sleep(1)

for loop in range(args.count):
    typewrite(args.message)
    press('enter')
