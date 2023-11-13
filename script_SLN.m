%% Simulate the average number of transmissions for different values of K and p
% Initialize variables
K_values = [1, 5, 15, 50, 100];
p_values = 0:0.1:1;
% Create empty matrices to store the results
calculatedResults = zeros(length(p_values), length(K_values));
simulatedResults = zeros(length(p_values), length(K_values));
% Simulate for each combination of K and p
for i = 1:length(K_values)
    for j = 1:length(p_values)
        % Calculate the average number of transmissions
        calculatedResults(j, i) = runSingleLinkSim(K_values(i), p_values(j), 1000);
        % Simulate the average number of transmissions using the function you provided
        simulatedResults(j, i) = runSingleLinkSim(K_values(i), p_values(j), 1000 * i);
    end
end
%% Create a single figure with all K values
figure;
for i = 1:length(K_values)
    % Plot the calculated results
    semilogy(p_values, calculatedResults(:, i), 'LineWidth', 2, 'Color', getColor(i));
    hold on;
    % Plot the simulated results
    semilogy(p_values, simulatedResults(:, i), 'o', 'MarkerSize', 10, 'Color', getColor(i));
    hold on;
end
% Set the x- and y-axis labels
xlabel('Probability of failure (p)');
ylabel('Average number of transmissions (log scale)');
% Set the title
title('Average number of transmissions for all K values');
% Add a legend
legend(string(K_values), 'Location', 'northeast');


%% Create a single figure per K value
for i = 1:length(K_values)
    figure;
    semilogy(p_values, calculatedResults(:, i), 'LineWidth', 2, 'Color', getColor(i));
    hold on;
    semilogy(p_values, simulatedResults(:, i), 'o', 'MarkerSize', 10, 'Color', getColor(i));
    hold off;
    xlabel('Probability of failure (p)');
    ylabel('Average number of transmissions (log scale)');
    title(sprintf('Average number of transmissions for K = %d', K_values(i)));
    legend('Calculated', 'Simulated');
end

% Define a function to return different colors for different K values
function color = getColor(i)
    switch i
        case 1
            color = 'blue';
        case 2
            color = 'red';
        case 3
            color = 'green';
        case 4
            color = 'black';
        case 5
            color = 'magenta';
        otherwise
            color = 'black';
    end
end
