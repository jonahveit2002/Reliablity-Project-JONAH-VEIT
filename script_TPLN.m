% Define parameters
K_values = [1, 5, 15, 50, 100];
p_values = 0:0.01:1;
iterations = 1000;

% Initialize matrices to store simulation results for each K
all_results = zeros(length(K_values), length(p_values));

% Run simulations for each K value and p value
for i = 1:length(K_values)
    K = K_values(i);
    
    % Initialize matrices to store simulation results for each K
    results = zeros(1, length(p_values));

    for j = 1:length(p_values)
        p = p_values(j);
        transmissions = runTwoParallelLinkSim(K, p, iterations);
        average_transmissions = mean(transmissions);
        results(j) = average_transmissions;
    end

    % Store results for all K values
    all_results(i, :) = results;

    % Create a figure for each K value
    figure;
    loglog(p_values, results, 'o');
    title(['Average Transmissions for K = ' num2str(K)]);
    xlabel('p (Probability of Unsuccessful Transmission)');
    ylabel('Average Transmissions (log scale)');
    grid on;
end

% Create a single figure with results for all K values
figure;
for i = 1:length(K_values)
    loglog(p_values, all_results(i, :), 'o-', 'DisplayName', ['K = ' num2str(K_values(i))]);
    hold on;
end
title('Average Transmissions for Different K Values');
xlabel('p (Probability of Unsuccessful Transmission)');
ylabel('Average Transmissions (log scale)');
legend('Location', 'Best');
grid on;
