function crescent-choose -d "draw a tui for choosing"
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
echo $crescent_output
end
