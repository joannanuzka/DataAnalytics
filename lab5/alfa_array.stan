data {
   int N;
   array [N] real <lower = 0> ni;
}

generated quantities {
    real theta = normal_rng(0.0002, 0.00005);
   array [N] real alfa;
   
   array [N] real <lower = 0, upper = 80> y;
   for (i in 1:N) {
        alfa[i] = normal_rng(2.1, 0.01);
        y[i] = poisson_rng(exp(alfa[i] + theta * ni[i]));
   }
   
}