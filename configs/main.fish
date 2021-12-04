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
