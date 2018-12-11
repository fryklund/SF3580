using Plots
using Polynomials
gr()

N = [10, 50, 100, 150, 200, 250, 300]
# Timings from 5.b. Unit: seconds
t_sp = [9.584e-3, 8.850e-3, 9.296e-3, 8.967e-3, 8.924e-3, 8.821e-3, 8.998e-3]
t_n = [928.333e-6, 3.585e-3, 7.494e-3, 11.124e-3, 14.992e-3, 18.269e-3, 22.311e-3]
# Estimate of order for
p = polyfit(N,t_n,1)
pval = polyval(p,N).-0.001
C = 1 / 13.5;
t_O = N * C



ys = Vector[t_n, t_sp, pval].*1000
plot(N,ys, color=[:blue :red :black], line=([:solid :dash :dot], 1), marker=([:xcross :circle :none], 5, 0.99),label=["Naive" "Schur-Pallett" "O(N)"],legend=:bottomright,title="Timings",xlabel="N",ylabel="CPU-time [ms]")
savefig("Task5bc")
