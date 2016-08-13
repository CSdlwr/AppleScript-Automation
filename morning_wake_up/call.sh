
set -x

somebody=+11234567890

function send_iMessage() {
    if [[ $# != 2 ]];then
        echo "usage send_iMessage \"buddy\" \"message to send\", return 100"
        return 100
    fi

    osascript <<EOF
        tell application "Messages"
        send "$2" to buddy "$1" of (service 1 whose service type is iMessage)
        end tell
EOF
}

function quit_iMessage() {
    osascript <<EOF
        tell application "Messages" to quit
EOF
}

function activate_iMessage() {
    osascript <<EOF
        tell application "Messages" to activate
EOF
}

function main() {
    activate_iMessage
    sleep 2
    send_iMessage $somebody "大能!"
    sleep 5
    send_iMessage $somebody "醒醒!"
    sleep 5
    send_iMessage $somebody "到点了!"
    sleep 5
    send_iMessage $somebody "听见没,加油起来啊,起来吃饭!"
    sleep 5
    send_iMessage $somebody "安吧"
    sleep 2
    quit_iMessage
}

# program entry
main

