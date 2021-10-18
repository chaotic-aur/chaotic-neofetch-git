#!/usr/bin/env bash
pacman -Sl chaotic-aur | awk '/\[installed\]/{print $2}'
