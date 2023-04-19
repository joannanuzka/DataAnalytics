data {
   int N;
   array[N] real <lower = 0> ni;
   array[N] int <lower = 0> accidents;
}

parameters {
   real alfa;
   real theta;
}

transformed parameters {
   array[N] real lambda;
   for (i in 1:N) {
      lambda[i] = exp(alfa + theta * ni[i]);
   }
}
model {
   alfa ~ normal(2.1, 0.005);
   theta ~ normal(0.0002, 0.00005);
   accidents ~ poisson(lambda);
}

generated quantities {
   array [N] real <lower = 0, upper = 80> y;
   for (i in 1:N) {
      y[i] = poisson_rng(lambda[i]);
   }
}