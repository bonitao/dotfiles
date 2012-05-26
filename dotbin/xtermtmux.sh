#!/bin/sh
tmux has-session  2>/dev/null
        if [ $? -eq 0 ]; then
                aflag=$(tmux ls |grep attached )
                echo ${#aflag}
                if [ ${#aflag} -ge 5 ]; then
                        #killall xterm
                        xterm -e tmux new-session
                        echo already on
                else 
                        xterm -e tmux attach -d
                fi
        else
                xterm -e tmux new -s x
        fi
