data {
   int N;  
   array[N] real heights; 
   array[N] real weight;
}

parameters {
   real<lower=135, upper=180> alfa;
   real<lower=14, upper=16> sigma;
   real beta;
}

transformed parameters {
    array[N] real mu;
   for (i in 1:N) {
      mu[i] = alfa + beta * weight[i];
   }
}

model {
   alfa ~ normal(155, 7.5);
   beta ~ lognormal(0, 1);
   sigma ~ normal(15, 0.05);
   heights ~ normal(alfa, sigma);
}

generated quantities {
   array[N] real height;
   for (i in 1:N) {
      height[i] = normal_rng(mu[i], sigma);
   }
}