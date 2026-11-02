#!/usr/bin/env bash
cur=$(powerprofilesctl get)

if [[ $1 == toggle ]]; then
    mapfile -t profs < <(powerprofilesctl list | grep -oE '(power-saver|balanced|performance):' | tr -d ':')
    for i in "${!profs[@]}"; do
        [[ ${profs[i]} == "$cur" ]] && next=${profs[(i+1)%${#profs[@]}]}
    done
    powerprofilesctl set "${next:-balanced}"
    pkill -RTMIN+8 waybar
    exit
fi

printf '{"text":"%s","alt":"%s","class":"%s","tooltip":"Perfil: %s\\nClique: alternar"}\n' "$cur" "$cur" "$cur" "$cur"
