#!/usr/bin/env bash

# Automatically install purchased apps from the Mac App Store

mas signout

read -r -t 60 -p "What is yout Apple ID?: " appleid
mas signin --dialog "$appleid"

# Mac App Store apps to install
apps=(
    "Telegram:747648890"
    "Notability:736189492"
    "Be Focused:973134470"
    "Slack:803453959"
)

for app in "${apps[@]}"; do
    name=${app%%:*}
    id=${app#*:}

    echo -e "Attempting to install $name"
    mas install "$id"
done
