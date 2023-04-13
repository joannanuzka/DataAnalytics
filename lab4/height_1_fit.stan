data {
   int N;
   array[N] real heights;
}

parameters {
   real <lower=135, upper=180> mu;
   real <lower=14, upper=16> sigma;
}

model {
   mu ~ normal(155, 7.5);
   sigma ~ normal(15, 0.05);
   heights ~ normal(mu, sigma);
}

generated quantities {
   real height = normal_rng(mu, sigma);
}