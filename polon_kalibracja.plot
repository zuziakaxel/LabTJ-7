reset
set terminal epslatex size 13cm,9cm color colortext
set output 'polon_kalibracja.tex'
set grid

set style line 1 linecolor rgb '#dd181f' linetype 1 linewidth 5 pt 2  # red
set style line 2 linecolor rgb '#7BE015' linetype 1 linewidth 5 pt 2 # green

set format '$%g$'
# set yrange [0:100]
set xlabel "Teoretyczna wartość równoważnika mocy dawki $ \mu \text{Sv} / \text{h}$"
set ylabel " Doświadczalna wartość równoważnika mocy dawki $ \mu \text{Sv} / \text{h}$"

f(x) = a*x + b
fit f(x) 'polon_kalibracja.dat' u 1:2 via a,b

ti = sprintf("f(x) = %.2fx %.2f", a, b)

plot "polon_kalibracja.dat" using 1:2 w p ls 1 title "Dane pomiarowe", f(x) w l ls 2 title ti