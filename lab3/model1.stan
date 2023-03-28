generated quantities {
   int N = 50;
   int <lower = 0, upper = 50> y;
   real <lower = 0, upper = 1> p = beta_rng(0.6, 3);
   y = binomial_rng(N, p);
}