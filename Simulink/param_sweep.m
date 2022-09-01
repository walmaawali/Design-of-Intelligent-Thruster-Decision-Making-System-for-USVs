%% parameter sweep using MATLAB
load_system('WG_Model_Complete')

%% Define parameter set
iterations = 6;
Pth_sweep = [0, 10, 20, 30, 40, 50];
simout = cell(1, iterations); 

%% Run simulation
tic
for idx=1:iterations
    set_param('WG_Model_Complete/Pth', 'Value', num2str(Pth_sweep(idx)))
    x = get(sim('WG_Model_Complete'), "v_fx_50");
    simout{idx} = mean(x(20000:50000,2));
end
toc