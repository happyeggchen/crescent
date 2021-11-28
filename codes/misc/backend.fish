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
