#!/bin/sh
cmd=$(basename ${0%%tmux.sh})
export TERM=screen-256color-bce
tmux -2 has-session  2>/dev/null
        if [ $? -eq 0 ]; then
                aflag=$(tmux -2 ls |grep attached )
                echo ${#aflag}
                if [ ${#aflag} -ge 5 ]; then
                        #killall $cmd
                        $cmd -e tmux -2 new-session
                        echo already on
                else 
                        $cmd -e tmux -2 attach -d
                fi
        else
                $cmd -e tmux -2 new -s x
        fi
