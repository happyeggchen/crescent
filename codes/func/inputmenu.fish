function crescent-inputmenu -d "draw a tui for input"
crescent-backend
set crescent_title $argv[1]
set crescent_title_menu_text_input $argv[2]
set crescent_menu_list_text $argv[3..-1]
  if [ "$argv[1]" = "" ]
    set crescent_title crescent_title
  end
  if [ "$argv[2]" = "" ]
    set crescent_title_menu_text_input crescent_title_menu_text_input
  end
  if [ "$crescent_menu_list_text" = "" ]
    set_color red
    echo "$prefix nothing to list,abort"
    set_color normal
    exit
  end
  set crescent_output ($crescent_backend --title $crescent_title --inputmenu $crescent_title_menu_text_input 0 0 0 $crescent_menu_list_text 3>&1 1>&2 2>&3 3>&-)
end
