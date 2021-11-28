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
