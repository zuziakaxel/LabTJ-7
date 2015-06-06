reset
set terminal epslatex size 13cm,9cm color colortext
set output 'polon.tex'
set grid

set style line 1 linecolor rgb '#dd181f' linetype 1 linewidth 5 pt 2  # red
set style line 2 linecolor rgb '#7BE015' linetype 1 linewidth 5 pt 2 # green

set format '$%g$'
# set yrange [0:100]
set xlabel "Odległość od źródła [m]"
set ylabel "Równoważnik mocy dawki $ \mu \text{Sv} / \text{h}$"


#fit f(x) 'wzor.dat' u 2:1 via a,b


plot "polon.dat" using 1:2 w lp ls 1 title "Dane pomiarowe", "polon.dat" using 1:3 w l ls 2 title "Dane teoretyczne"