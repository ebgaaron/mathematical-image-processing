% Variance of gaussian noise:
variance = 0.05;

% Regularization:
lambda = 0.005;
eps = 0.0005;

% Amoji Rule:
beta = 0.5;

% Create example signal, noisy signal and denoise.
x = signal_example(100);
noisy_x = signal_gaussian_noise(x, variance);
[denoised_x, j_t] = gradient_descent(noisy_x, @j_a, @j_a_derivative, lambda, eps, beta);
[denoised_x_eps, j_t_eps] = gradient_descent(noisy_x, @j_b, @j_b_derivative, lambda, eps, beta);

% Plot:
figure;
subplot(1, 6, 1);
imagesc(x);
subplot(1, 6, 2);
imagesc(noisy_x);
subplot(1, 6, 3);
imagesc(denoised_x);
subplot(1, 6, 4);
plot(j_t);
subplot(1, 6, 5);
imagesc(denoised_x_eps);
subplot(1, 6, 6);
plot(j_t_eps);