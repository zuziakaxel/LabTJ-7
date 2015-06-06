reset
set terminal epslatex size 13cm,9cm color colortext
set output 'oslona.tex'
set grid

set style line 1 linecolor rgb '#dd181f' linetype 1 linewidth 5 pt 2  # red
set style line 2 linecolor rgb '#7BE015' linetype 1 linewidth 5 pt 2 # green

set format '$%g$'
# set yrange [0:100]
set xlabel "Grubość osłony [cm]"
set ylabel "Równoważnik mocy dawki $\frac{\mu Sv}{h}$"

f(x) = a*exp(b*x)
fit f(x) 'oslona.dat' u 1:2 via a,b

ti = sprintf("$f(x) = %.2fe^{%.2fx}$", a, b)

plot "oslona.dat" using 1:2 w p ls 1 title "", f(x) w l ls 2 title ti