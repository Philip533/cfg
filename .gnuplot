# Encoding for symbols 
set encoding utf8

###
### Default line colors and repeat cycle
###
# set linetype 1 lc rgb "dark-violet" lw 1
# set linetype 2 lc rgb "#009e73" lw 1
# set linetype 3 lc rgb "#56b4e9" lw 1
# set linetype 4 lc rgb "#e69f00" lw 1
# set linetype 5 lc rgb "#f0e442" lw 1
# set linetype 6 lc rgb "#0072b2" lw 1
# set linetype 7 lc rgb "#e51e10" lw 1
# set linetype 8 lc rgb "black"   lw 1
# set linetype cycle 8

# Moreland colours!
set linetype 1 pt 1 lw 4 lc rgb '#3b4cc0' ps 1.5 #
set linetype 8 pt 2 lw 4 lc rgb '#688aef' ps 1.5 #
set linetype 3 pt 3 lw 4 lc rgb '#99baff' ps 1.5 #
set linetype 6 pt 4 lw 4 lc rgb '#c9d8ef' ps 1.5 #
set linetype 5 pt 5 lw 4 lc rgb '#edd1c2' ps 1.5 #
set linetype 4 pt 6 lw 4 lc rgb '#f7a789' ps 1.5 #
set linetype 7 pt 7 lw 4 lc rgb '#e36a53' ps 1.5 #
set linetype 2 pt 8 lw 4 lc rgb '#b40426' ps 1.5
set linetype cycle 8

# Shared scripts
set loadpath "/usr/local/share/gnuplot/4.7/demo"

# Set terminal to QT and make it a reasonable size
set term qt size 1000,800 font "Helvetica, 20"

# For linepoints, leave a gap between the line join and the point
set pointintervalbox 3

# One minor tic between each main tic
set mxtics 2
set mytics 2

# Change the offset of the labels
set ylabel offset 0.5,0
set xlabel offset 0,0.3

# Makes a nice key with box around it
set key opaque box lw 2 spacing 1.2 height 0.5 width 1

# How much of the canvas to fill
set size 0.98,0.98
set size ratio 0.8

