function crescent-gwsize -d "get window size"
set crescent_gwsize (stty size)
echo "$prefix Grabbed window size $crescent_gwsize"
end
