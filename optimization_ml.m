%%

train_data = data_table_ml;


%%

rng(1)
Mdl = fitcknn(data_table_ml,'beat_type_2','OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',...
    %% 
    struct('AcquisitionFunctionName','expected-improvement-plus'))


%%
test_data = data_table_ml;