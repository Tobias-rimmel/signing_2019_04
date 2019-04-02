#include <WinAPISys.au3>
#include <file.au3>

#cs ---------------------------------------------------------------------------

 AutoIt Version: 2.1.3
 Author: Tobias Rimmel - UCM

 Script Function: signing automation

    sleep: 1 sec == 1000

#ce ----------------------------------------------------------------------------

signing()

Func signing()

    sleep(6000)
    Send("{ALT DOWN}")
    Send("{TAB}")
    Send("{ALT UP}")
    sleep(5000)
    Send("{TAB}")
    sleep(1000)   
    Send("{SPACE}")
    sleep(1000)
    Send("+{TAB}")
    sleep(1000)
    Send("89070152")
    sleep(1000)
    Send("{Enter}")

EndFunc
