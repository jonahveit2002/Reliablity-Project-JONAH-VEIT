function transmissions = runCompoundNetworkSim(K, p, iterations)
    % Initialize variables to count transmissions
    transmissions = zeros(1, iterations);

    for i = 1:iterations
        successful_transmissions = 0;
        % Simulate transmitting K packets
        for j = 1:K
            % Node 1 to Node 2 (two parallel links)
            link1_success = rand() > p;
            link2_success = rand() > p;
            % Node 2 to Node 3 (series link)
            link3_success = rand() > p;

            % Determine if the packet is successfully transmitted through the network
            if link1_success && link2_success && link3_success
                successful_transmissions = successful_transmissions + 1;
            end
        end
        transmissions(i) = successful_transmissions;
    end
end
