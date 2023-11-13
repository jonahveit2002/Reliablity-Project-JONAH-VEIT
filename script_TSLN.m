% Set the values of K to simulate
K_values = [1, 5, 15, 50, 100];

% Set the range of p values to simulate
p_range = 0:0.1:1;

% Set the number of iterations to run each simulation
num_iterations = 1000;

% Run the simulation and store the results using your functions
[calculated_results, simulated_results, p_values, K_values] = runTwoSeriesLinkSim(K_values, p_range, num_iterations);

% Create a figure for each K value showing the calculated result versus the simulated result
for k_index = 1:length(K_values)
    figure;
    plot(p_range, calculated_results(k_index, :), 'b-', 'LineWidth', 2);
    hold on;
    plot(p_range, simulated_results(k_index, :), 'ro', 'MarkerFaceColor', 'r');
    xlabel('p (Probability of Success)');
    ylabel('Average Number of Transmissions (log scale)');
    title(['K = ' num2str(K_values(k_index))]);
    legend('Calculated', 'Simulated');
    grid on;
    hold off;
end

% Create a single figure with calculated and simulated results from all five K values plotted
figure;
for k_index = 1:length(K_values)
    plot(p_range, calculated_results(k_index, :), '-', 'LineWidth', 2);
    hold on;
    plot(p_range, simulated_results(k_index, :), 'o', 'MarkerFaceColor', 'w');
end
xlabel('p (Probability of Success)');
ylabel('Average Number of Transmissions (log scale)');
title('Simulated vs Calculated Results for Different K Values');
legend('K=1 (Calculated)', 'K=1 (Simulated)', 'K=5 (Calculated)', 'K=5 (Simulated)', 'K=15 (Calculated)', 'K=15 (Simulated)', 'K=50 (Calculated)', 'K=50 (Simulated)', 'K=100 (Calculated)', 'K=100 (Simulated)');
grid on;
hold off;
