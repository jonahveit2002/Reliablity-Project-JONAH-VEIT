function [calculated_results, simulated_results, p_values, K_values] = runTwoSeriesLinkSim(K_values, p_range, num_iterations)
    % Initialize arrays to store results
    calculated_results = zeros(length(K_values), length(p_range));
    simulated_results = zeros(length(K_values), length(p_range));
    p_values = p_range;

    for k_index = 1:length(K_values)
        K = K_values(k_index);
        for p_index = 1:length(p_range)
            p = p_range(p_index);

            % Calculate the theoretical (calculated) average number of transmissions
            calculated_results(k_index, p_index) = calculateExpectedResultForTwoSeriesLink(K, p);

            % Simulate the average number of transmissions
            simulated_results(k_index, p_index) = simulateAverageTransmissionsForTwoSeriesLink(K, p, num_iterations);
        end
    end
end

function expected_result = calculateExpectedResultForTwoSeriesLink(K, p)
    % Calculate the expected result based on the two-series link network
    % Replace this with your calculation for the specific network topology
    % Example: Using a simple model
    expected_result = K / (1 - p)^2;
end

function simulated_result = simulateAverageTransmissionsForTwoSeriesLink(K, p, num_iterations)
    % Simulate the average number of transmissions for the two-series link network
    % Implement your simulation logic here
    % Example: Using a simple model with random success/failure
    transmissions = zeros(1, num_iterations);
    for iter = 1:num_iterations
        % Simulate a single transmission (example: 1 indicates success, 0 indicates failure)
        success = rand(K, 1) > p;
        num_transmissions = find(success, 1, 'last');
        if isempty(num_transmissions)
            num_transmissions = K; % All failed, K transmissions
        end
        transmissions(iter) = num_transmissions;
    end
    simulated_result = mean(transmissions);
end
