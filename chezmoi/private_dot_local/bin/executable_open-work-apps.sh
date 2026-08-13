#!/usr/bin/env bash


WORK_DOCUMENTS="/home/bremme/Sync/Work/Alliander/Documents/"
TEAM_PWA="msedge-cifhbcnohmdccbgoicgdjpfamggdegmo-Default.desktop"
WHATSAPP_PWA="msedge-hnpfjngllnobngcgfapefoaidbinmjnm-Default.desktop"

code "$WORK_DOCUMENTS"

pgrep firefox > /dev/null || firefox > /dev/null 2>&1 &
gtk-launch "$TEAM_PWA"
gtk-launch "$WHATSAPP_PWA"
