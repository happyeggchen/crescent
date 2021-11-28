#!/usr/bin/env fish
function crescent-choose -d "draw a tui for choosing"
crescent-gwsize
crescent-backend
set crescent_title $argv[1]
set crescent_title_menu $argv[2]
set crescent_menu_list $argv[3..-1]
if [ "$argv[1]" = "" ]
  set crescent_title crescent_title
end
if [ "$argv[2]" = "" ]
  set crescent_title_menu crescent_title_menu
end
if [ "$crescent_menu_list" = "" ]
  set_color red
  echo "$prefix nothing to list,abort"
  set_color normal
  exit
end
set crescent_output ($crescent_backend --title $crescent_title --menu $crescent_title_menu 0 0 0 $crescent_menu_list 3>&1 1>&2 2>&3 3>&-)
end
function crescent-gauge -d "progress bar"
crescent-backend
set crescent_title $argv[1]
set crescent_gauge_text $argv[2]
set crescent_gauge_percent $argv[3]
  if [ "$argv[1]" = "" ]
    set crescent_title crescent_title
  end
  if [ "$argv[2]" = "" ]
    set crescent_gauge_text crescent_gauge_text
  end
  if [ "$argv[3]" = "" ]
    set crescent_gauge_percent 0
  end
  echo $crescent_gauge_percent | $crescent_backend --title $crescent_title --gauge $crescent_gauge_text 0 0 0
end
function crescent-input -d "input box"
crescent-backend
set crescent_title $argv[1]
set crescent_title_text $argv[2]
set crescent_text_init $argv[3]
  if [ "$argv[1]" = "" ]
    set crescent_title crescent_title
  end
  if [ "$argv[2]" = "" ]
    set crescent_title_text crescent_title_text
  end
set crescent_output ($crescent_backend --title $crescent_title --inputbox $crescent_title_text 0 0 $crescent_text_init 3>&1 1>&2 2>&3 3>&-)
end
function crescent-inputmenu -d "draw a tui for input"
crescent-backend
set crescent_title $argv[1]
set crescent_title_text $argv[2]
set crescent_menu_text_list $argv[3..-1]
  if [ "$argv[1]" = "" ]
    set crescent_title crescent_title
  end
  if [ "$argv[2]" = "" ]
    set crescent_title_text crescent_title_text
  end
  if [ "$crescent_menu_text_list" = "" ]
    set_color red
    echo "$prefix nothing to list,abort"
    set_color normal
    exit
  end
  set crescent_output ($crescent_backend --title $crescent_title --inputmenu $crescent_menu_text_list 0 0 0 $crescent_menu_list_text 3>&1 1>&2 2>&3 3>&-)
end
function crescent-backend -d "detect backend for crescent"
  if command -q -v dialog
    echo "$prefix Using dialog tools for creating a tui"
    set -g crescent_backend (command -v dialog)
  else
    if command -v whiptail
      echo "$prefix Using whiptail tools for creating a tui"
      set -g crescent_backend (command -v whiptail)
    else
    set_color red
      echo "$prefix nothing found for creating a tui"
    set_color normal
    end
  end
end
function crescent-gwsize -d "get window size"
set crescent_gwsize (stty size)
echo "$prefix Grabbed window size $crescent_gwsize"
end
echo Build_Time_UTC=2021-11-28_06:25:17
function crescent
switch $argv[1]
case choose
  crescent-choose $argv[2] $argv[3] $argv[4..-1]
case input
  crescent-input $argv[2] $argv[3] $argv[4]
case inputmenu
  crescent-inputmenu $argv[2] $argv[3] $argv[4..-1]
case gauge
  crescent-gauge $argv[2] $argv[3] $argv[4]
end
#trash collection
set -e crescent_backend
end