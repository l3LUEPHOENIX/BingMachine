<#
.Synopsis
   A quick and simple way to spam your friends in any text field that can be clicked on.
.DESCRIPTION
   The Bing Machine uses iterative functions to repeatedly input and submit text. Input needed from the user are as follows; the message, the count of total messages, the speed, and count down time. 
   The message can be any string. 
   The total count of messages will be an integer. 
   The speed will be determined by a string determined by an input of "Fast", "Medium", or "Slow". 
   The count down time is an integer that will be the total number of seconds before the script fires.

   Utilize this script at your own risk! Spamming anyone could do more than annoy your friends. There is a potential that your account is banned from whatever platform this script is utilized on.
   This script should not be used to cause a denial of service of any kind! It is a crime to cause a denial of service on any device you don't own, or have explicit permission from the owner. When in doubt, don't do it.
.EXAMPLE
   Write click the file and select, "Run with PowerShell". Then follow the prompts.
.EXAMPLE
   Another example of how to use this cmdlet
#>

Write-Host "
.===============================================================.
|  ____  _               __  __            _     _              |
| |  _ \(_)             |  \/  |          | |   (_)             |
| | |_) |_ _ __   __ _  | \  / | __ _  ___| |__  _ _ __   ___   |
| |  _ <| | '_ \ / _`  | | |\/| |/ _`  |/ __| '_ \| | '_ \ / _ \  |
| | |_) | | | | | (_| | | |  | | (_| | (__| | | | | | | |  __/  |
| |____/|_|_| |_|\__, | |_|  |_|\__,_|\___|_| |_|_|_| |_|\___|  |
|                 __/ |                                         |
|                |___/                                          |
|===============================================================|
|       By: BluePhoenix | Version: 2.0 | Date: 4/25/2022        |
-----------------------------------------------------------------
Utilize this script at your own risk! Spamming anyone could do more 
than annoy your friends. There is a potential that your account is 
banned from whatever platform this script is utilized on. This 
script should not be used to cause a denial of service of any kind! 
It is a crime to cause a denial of service on any device you don't 
own, or have explicit permission from the owner. When in doubt, 
don't do it!

Follow the prompts! When the count down starts, click on the input
field of the program you want to spam. For example, if you're
spamming discord, click on the box you'd type your message in, then
wait for the count down to finish.
"

try {[string]$message = Read-Host "Write a message, then press enter"}
catch { Write-Host "SOMETHING WENT WRONG! Defaulting to 'Bing!'" -ForegroundColor Red; $message = 'Bing!'}

try {[int]$count = Read-Host "How many times do you want to send your message? E.g 5"}
catch { Write-Host "SOMETHING WENT WRONG! Defaulting to 5 messages." -ForegroundColor Red; $count = 5}

try {[string]$speed = Read-Host "How fast do you want to send them? [Fast|Medium|Slow]"}
catch { Write-Host "SOMETHING WENT WRONG! Defaulting to 'Medium'." -ForegroundColor Red; $speed = 'Medium'}

try {[int]$countdown = Read-Host "How long on the count down timer, in seconds? E.g 5"}
catch { Write-Host "SOMETHING WENT WRONG! Defaulting to 5 seconds." -ForegroundColor Red; $countdown = 5}

if ($speed -like "*fast*") {
    $rate = 125
} elseif ($speed -like "*medium*") {
    $rate = 250
} elseif ($speed -like "*slow*") {
    $rate = 500
} elseif ($speed -like "*extreme*") {
    $rate = 0
} else {
    Write-Host "SOMETHING WENT WRONG! Defaulting to 'Medium'" -ForegroundColor Red
    $rate = 500
}

$wshell = New-Object -ComObject wscript.shell;
Write-Host "
===================================
T-MINUS $countdown SECONDS TO FIRE!
-----------------------------------"
for ($i=$countdown; $i -gt 0; $i-=1){
    Sleep 1
    echo "$i"
}

echo "FIRE!"

for ($x=0; $x -lt $count; $x++){
    $wshell.SendKeys("$message")
    $wshell.SendKeys('{ENTER}')
    Start-Sleep -Milliseconds $rate
}