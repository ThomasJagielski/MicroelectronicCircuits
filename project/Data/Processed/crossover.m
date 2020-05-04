function crossover_index = crossover(data,crossover_point)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    for m=2:max(size(data))
        if (crossover_point == 0)
            if (data(m-1,2) > crossover_point)
                if (data(m,2) < crossover_point)
                    crossover_index = m;
                end
            end
        end
        if (crossover_point == -180)
            if (data(m-1,3) > crossover_point)
                if (data(m,3) < 180 + crossover_point)
                    crossover_index = m;
                end
            end
        end
    end
end

