function crescent-gauge -d "progress bar"
crescent-backend
set crescent_title $argv[1]
set crescent_title_gauge $argv[2]
set crescent_gauge_percent $argv[3]
  if [ "$argv[1]" = "" ]
    set crescent_title crescent_title
  end
  if [ "$argv[2]" = "" ]
    set crescent_title_gauge crescent_title_gauge
  end
  if [ "$argv[3]" = "" ]
    set crescent_gauge_percent 0
  end
  echo $crescent_gauge_percent | $crescent_backend --title $crescent_title --gauge $crescent_title_gauge 0 0 0
end
