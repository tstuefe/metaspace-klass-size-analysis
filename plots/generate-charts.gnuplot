set encoding utf8

set key off

# See https://github.com/Gnuplotting/gnuplot-palettes
# line styles from ylorrd
# line styles
set style line 1 lw 1 lt 1 lc rgb '#FFFFCC' # very light yellow-orange-red
set style line 2 lw 1 lt 1 lc rgb '#FFEDA0' # 
set style line 3 lw 1 lt 1 lc rgb '#FED976' # light yellow-orange-red
set style line 4 lw 1 lt 1 lc rgb '#FEB24C' # 
set style line 5 lw 1 lt 1 lc rgb '#FD8D3C' # 
set style line 6 lw 1 lt 1 lc rgb '#FC4E2A' # medium yellow-orange-red
set style line 7 lw 1 lt 1 lc rgb '#E31A1C' #
set style line 8 lw 1 lt 1 lc rgb '#B10026' # dark yellow-orange-red

# greys
set style line 101 lt 1 lc rgb '#FFFFFF' # white
set style line 102 lt 1 lc rgb '#F0F0F0' # 
set style line 103 lt 1 lc rgb '#D9D9D9' # 
set style line 104 lt 1 lc rgb '#BDBDBD' # light grey
set style line 105 lt 1 lc rgb '#969696' # 
set style line 106 lt 1 lc rgb '#737373' # medium grey
set style line 107 lt 1 lc rgb '#525252' #
set style line 108 lt 1 lc rgb '#252525' # dark grey

# blues
set style line 201 lt 1 lc rgb '#F7FBFF' # very light blue
set style line 202 lt 1 lc rgb '#DEEBF7' # 
set style line 203 lt 1 lc rgb '#C6DBEF' # 
set style line 204 lt 1 lc rgb '#9ECAE1' # light blue
set style line 205 lt 1 lc rgb '#6BAED6' # 
set style line 206 lt 1 lc rgb '#4292C6' # medium blue
set style line 207 lt 1 lc rgb '#2171B5' #
set style line 208 lt 1 lc rgb '#084594' # dark blue

# Palette
set palette maxcolors 8
set palette defined ( 0 '#E41A1C', 1 '#377EB8', 2 '#4DAF4A', 3 '#984EA3',\
4 '#FF7F00', 5 '#FFFF33', 6 '#A65628', 7 '#F781BF' )

# Standard border
set style line 11 lc rgb '#808080' lt 1 lw 3
set border 0 back ls 11
set tics out nomirror

# Standard grid
set style line 12 lc rgb '#c0c0c0' lt 0 lw 1
set grid back ls 12
#unset grid

PNGFONT="FreeSerif, 12"
SVGFONT="FreeSerif, 14"

set xrange [16:1024]

########################################

set datafile separator ','

set key autotitle columnhead # use the first line as title
unset key
set ylabel "Number of allocations" # label for the Y axis
set xlabel 'Allocation size (in words)' # label for the X axis

# I limit range to expand the lower part of it (below 250), because
# the vast part of allocations is there. I also omit the lowest sizes
#set xrange [0:512] # in words: max size we print is 4K. Klass structures > that are rare.

#        "used metaspace",             		    # 1
#        "committed fragmentation 1.0",        # 2
#        "committed fragmentation 0.1",        # 2
#        "committed fragmentation 0.01",       # 2

#########################################

#CSV_FILE="JDK11-committed-metaspace-by-fragmentation/JDK11-committed-metaspace-by-fragmentation.csv"
#set yrange [0:300]
#
#set terminal svg enhanced size 800,500 font SVGFONT
#set title "JDK 11, Committed Metaspace by Fragmentation"
#set output "jdk11-committed-metaspace-by-fragmentation.svg"
#
#plot CSV_FILE \
#               using 0:(k2m($4)) with lines ls 6 title "committed, high frag", \
#            '' using 0:(k2m($3)) with lines ls 5 title "committed, med. frag", \
#            '' using 0:(k2m($2)) with lines ls 4 title "committed, no frag", \
#            '' using 0:(k2m($1)) with lines ls 103 title "used", \
#
#set terminal pngcairo enhanced size 800,500 font PNGFONT
#set output "jdk11-committed-metaspace-by-fragmentation.png"
#replot
#

set logscale x 2

set terminal svg enhanced size 1000,500 font SVGFONT
#########################################

CSV_FILE="simple-histo.csv"
set title "Simple Java program, Hello World"
set output "simple-histo.svg"

plot CSV_FILE

set terminal pngcairo enhanced size 700,300 font PNGFONT
set output "simple-histo.png"
replot

CSV_FILE="lambdas-histo.csv"
set title "Java program with lots of Lambdas (5000)"
set output "lambdas-histo.svg"

plot CSV_FILE

set terminal pngcairo enhanced size 700,300 font PNGFONT
set output "lambdas-histo.png"
replot

CSV_FILE="reflection-histo.csv"
set title "Java program which stresses reflection (5000 methods)"
set output "reflection-histo.svg"

plot CSV_FILE

set terminal pngcairo enhanced size 700,300 font PNGFONT
set output "reflection-histo.png"
replot

CSV_FILE="spring-petclinic-histo.csv"
set title "Sprint petclinic, after startup"
set output "spring-petclinic-histo.svg"

plot CSV_FILE

set terminal pngcairo enhanced size 700,300 font PNGFONT
set output "spring-petclinic-histo.png"
replot

