data {
    int<lower=1> N;
    array[N] real<lower=0> y;
    array[N] int<lower=1, upper=2> condition;
    array[N] int<lower=0, upper=1> choice;
}

parameters {
    real<lower=0> v1;
    real<lower=0> a1;
    real<lower=0, upper=1> beta1;
    real<lower=0> tau1;
    real<lower=0> v2;
    real<lower=0> a2;
    real<lower=0, upper=1> beta2;
    real<lower=0> tau2;
}

model {
    // Priors
    v1 ~ gamma(3, 1);
    a1 ~ gamma(3, 1);
    beta1 ~ beta(2, 2);
    tau1 ~ gamma(2, 1);
    v2 ~ gamma(3, 1);
    a2 ~ gamma(3, 1);
    beta2 ~ beta(2, 2);
    tau2 ~ gamma(2, 1);

    // Likelihood
    for (n in 1:N) {
        // Condition 1
        if (condition[n] == 1) {
            if (choice[n] == 1) {
                y[n] ~ wiener(a1, tau1, beta1, v1);
            }
            else {
                y[n] ~ wiener(a1, tau1, 1-beta1, -v1);
            }
        }
        // Condition 2
        if (condition[n] == 2) {
            if (choice[n] == 1) {
                y[n] ~ wiener(a2, tau2, beta2, v2);
            }
            else {
                y[n] ~ wiener(a2, tau2, 1-beta2, -v2);
            }
        }
    }
}