function transmissions = runTwoParallelLinkSim(K, p, iterations)
    % Initialize variables to count transmissions
    transmissions = zeros(1, iterations);

    for i = 1:iterations
        successful_transmissions = 0;
        % Simulate transmitting K packets
        for j = 1:K
            % Randomly determine if a packet is successfully transmitted
            if rand() > p
                successful_transmissions = successful_transmissions + 1;
            end
        end
        transmissions(i) = successful_transmissions;
    end
end
