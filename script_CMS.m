% Define parameters
K_values = [1, 5, 15, 50, 100];
p_values = 0:0.01:1;
iterations = 1000;

% Initialize matrices to store simulation results
results = zeros(length(K_values), length(p_values));

% Run simulations for each K value and p value
for i = 1:length(K_values)
    K = K_values(i);
    
    % Initialize figure for the current K value
    figure;
    loglog(p_values, results(i, :), 'o-', 'DisplayName', ['K = ' num2str(K)]);
    title(['Average Transmissions for K = ' num2str(K)]);
    xlabel('p (Probability of Unsuccessful Transmission)');
    ylabel('Average Transmissions');
    legend('Location', 'Best');
    grid on;
    hold on;
    
    % Run simulations for each p value
    for j = 1:length(p_values)
        p = p_values(j);
        transmissions = runCompoundNetworkSim(K, p, iterations);
        average_transmissions = mean(transmissions);
        results(i, j) = average_transmissions;
    end
    
    % Plot simulated results on the current individual figure
    loglog(p_values, results(i, :), 'o-', 'DisplayName', ['K = ' num2str(K)]);
    hold off;
end

% Create a single combined figure with results for all K values
figure;
hold on;
for i = 1:length(K_values)
    % Plot simulated results on the combined figure
    loglog(p_values, results(i, :), 'o-', 'DisplayName', ['K = ' num2str(K_values(i))]);
end
title('Average Transmissions for Different K Values');
xlabel('p (Probability of Unsuccessful Transmission)');
ylabel('Average Transmissions');
legend('Location', 'Best');
grid on;
hold off;
