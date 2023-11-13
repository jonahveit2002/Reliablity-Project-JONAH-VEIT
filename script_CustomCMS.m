% Define parameters
K_values = [1, 5, 10];
probabilities = [
    0.1, 0.6, 0.01:0.01:0.99;
    0.6, 0.1, 0.01:0.01:0.99;
    0.1, 0.01:0.01:0.99, 0.6;
    0.6, 0.01:0.01:0.99, 0.1;
    0.01:0.01:0.99, 0.1, 0.6;
    0.01:0.01:0.99, 0.6, 0.1
];
iterations = 1000;

% Initialize matrices to store simulation results
results_custom = zeros(length(K_values), size(probabilities, 1), length(0:0.01:1));

% Loop through each K value
for i = 1:length(K_values)
    K = K_values(i);
    
    % Initialize figure for the current K value
    figure('Name', ['K = ' num2str(K)]);
    title(['Average Transmissions for K = ' num2str(K)]);
    xlabel('p (Probability of Unsuccessful Transmission)');
    ylabel('Average Transmissions');
    grid on;
    hold on;
    
    % Loop through each probability configuration
    for config_index = 1:size(probabilities, 1)
        current_probabilities = probabilities(config_index, :);
        
        % Run simulations for each p value
        for j = 1:length(0:0.01:1)
            p = 0.01 * (j - 1);
            transmissions = runCustomCompoundNetworkSim(K, current_probabilities, iterations);
            average_transmissions = mean(transmissions);
            results_custom(i, config_index, j) = average_transmissions;
        end
        
        % Plot simulated results for the current probability configuration
        loglog(0:0.01:1, squeeze(results_custom(i, config_index, :)), 'o-', 'DisplayName', ['Figure ' num2str(config_index)]);
    end
    
    % Add legend for the probability configurations
    legend('Location', 'Best');
    hold off;
end
