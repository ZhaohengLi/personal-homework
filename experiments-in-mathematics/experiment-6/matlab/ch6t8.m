%% Global Variables
init_val = 0.5;

% chaos(@qt, init_val, [0, 2, 0.001], [1000, 1200]);

%% Find Fork Point
find_fork(@qt, init_val, 1000, 1.0:0.0001:1.1, 0, 1e-7)
find_fork(@qt, init_val, 1000, 0.93:0.0001:0.96, 1, 1e-7)
find_fork(@qt, init_val, 1000, 0.90:0.0001:1.93, 2, 1e-7)
find_fork(@qt, init_val, 1000, 0.88:0.0001:0.90, 3, 1e-7)
find_fork(@qt, init_val, 1000, 0.88:0.0001:0.90, 4, 1e-7)





%% Draw iteration graph.
% iter_count = 1000;
% c = 0.896;
% iter_vec = zeros(iter_count, 1); iter_vec(1) = init_val;
% for i = 2:iter_count
% iter_vec(i) = feval(@qt, iter_vec(i - 1), c);
% end
% plot(iter_vec);

%% Func
function [y] = qt(x,c)
y = 0.3/0.25*(c-atan(4.8*x))-(0.3-1)*x;
end

function chaos(iter_fun, x0, r, n)
    kr = 0;
    for rr = r(1):r(3):r(2)
        kr = kr + 1;
        y(kr, 1) = feval(iter_fun, x0, rr);
        for i = 2:n(2)
            y(kr,i) = feval(iter_fun, y(kr, i - 1), rr);
        end
    end
    plot([r(1):r(3):r(2)], y(:, n(1) + 1: n(2)), 'k.');
end

function [fp] = find_fork(iter_fun, init_val, converge_iter, search_range, level, tol)
    % Find the forkpoint of iter_fun.
    fp = -1;
    for c = search_range
        % First iterate.
        iter_val = init_val;
        for i = 1:converge_iter
            iter_val = feval(iter_fun, iter_val, c);
        end
        % Check if this is the fp level.
        % Get consecutive 2 ** level numbers.
        sample_count = 2 ^ (level + 1);
        sample_vector = zeros(sample_count, 1);
        for i = 1:sample_count
            sample_vector(i) = feval(iter_fun, iter_val, c);
            iter_val = sample_vector(i);
        end
        % Check if can converge in Level.
        converge_mat = reshape(sample_vector, [], 2);
        converge_mat = abs(converge_mat(:, 1) - converge_mat(:,2));
        if (sum(converge_mat < tol) == length(converge_mat))
            fp = c;
            break;
        end
    end
end