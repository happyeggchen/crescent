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
