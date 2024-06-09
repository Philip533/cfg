# Set terminal to QT and make it a reasonable size
set term pdfcairo enhanced  font "Helvetica, 20"

# Encoding for symbols 
set encoding utf8

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

# For linepoints, leave a gap between the line join and the point
set pointintervalbox 3

# One minor tic between each main tic
set mxtics 2
set mytics 2
set grid

# Change the offset of the labels
set ylabel offset 0.5,0
set xlabel offset 0,0.3

# Makes a nice key with box around it
set key opaque box lw 2 spacing 1.2 height 0.5 width 1

# How much of the canvas to fill
# set size 0.98,0.98
# set size ratio 0.8

# Helpful macros
bigBlueDots = 'with linespoints lc "blue" pt 7 ps 4'
barLine = 'lw 2'
