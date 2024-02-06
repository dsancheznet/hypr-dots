#!/bin/sh
#
# TODO:
#
#if [ $(hyprctl monitors -j | jq ".[]|select(.name==\"<output-name>\").dpmsStatus") = "true" ]; then hyprctl dispatch dpms off <output-name>; else hyprctl dispatch dpms on <output-name>; fi
