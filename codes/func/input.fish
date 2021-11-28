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
