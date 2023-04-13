data {
   int N;
   array[N] real weight;
}

generated quantities {
   real alfa = normal_rng(155, 7.5);
   real beta = normal_rng(0, 1);
   real sigma = normal_rng(15, 0.05);
   array[N] real height;
   for (i in 1:N) {
       height[i] = normal_rng(alfa + beta * weight[i], sigma);
    }
}