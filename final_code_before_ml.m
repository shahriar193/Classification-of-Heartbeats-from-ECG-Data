
% data_table_ml = cell2table(cell(0,22), 'VariableNames', {'postRR_1', 'preRR_1', 'Qpeaks_1', 'Rpeaks_1', 'Speaks_1', 'QRSinterval_1', 'QR_peak_distance_1',  'dct_cof_1', 'dct_cof_2', 'dct_cof_3', 'dct_cof_4', 'dct_cof_5', 'dct_cof_6', 'dct_cof_7', 'dct_cof_8', 'dct_cof_9', 'dct_cof_10', 'dct_cof_11', 'dct_cof_12', 'dct_cof_13', 'dct_cof_14', 'beat_type_2'});


% data_table_ml = cell2table(cell(0,9), 'VariableNames', {'postRR_1', 'preRR_1', 'Qpeaks_1', 'Rpeaks_1', 'Speaks_1', 'QRSinterval_1', 'QR_peak_distance_1','QRS_triangular_area_1', 'beat_type_2'});

data_table_ml_train = cell2table(cell(0,9), 'VariableNames', {'postRR_1', 'preRR_1', 'Qpeaks_1', 'Rpeaks_1', 'Speaks_1', 'QRSinterval_1', 'QR_peak_distance_1','QRS_triangular_area_1', 'beat_type_2'});

data_table_ml_test = cell2table(cell(0,9), 'VariableNames', {'postRR_1', 'preRR_1', 'Qpeaks_1', 'Rpeaks_1', 'Speaks_1', 'QRSinterval_1', 'QR_peak_distance_1','QRS_triangular_area_1', 'beat_type_2'});


% Name = [100 101 102 103 104 105 106 107 108 109 111 112 113 114 115 116 117 118 119 121 122 123 124 200 201 202 203 205 207 208 209 210 212 213 214 215 217 219 220 221 222 223 228 230 232 233 234];

% Name = [116 107 119];

% baaaad 118 121 122  219N 230N

% consider 124 203

% test maybe 210


% 123N(smallF), 100N(little S), 119VN, 107QV, 116NV, 200NV(very very small S) 201NV(small S) 
% 202NSV, 203NF, 205N, 207NQF, 208FNV, 209SV, 213FN, 214FN, 215FN, 217QVN,
% 220SN, 221VN, 222SN(faulty), 223NSV, 228NV, 232SNV, 233NV, 234NS

% Name = [123 100 119 116 200 201 205 207 208 209 213 214 215 217 220 223 228 232 233 234];
% 213 upore add kora lagbe

% 119V, 201S, 116V, 205N, 107Q, 118S, 208VF, 209S, 212QV, 213F, 214V, 215V,
% 223VS, 228V, 234S, 217QV, 233V, 222S(cant), 202S, 207QV, 
% 220S, 230F

Name1 = [230];

Name1 = [100 119 116 201 205 107 118 208 212 209  214 215 223 228 217 222 233 234 230]; %train 234 222 add kora lagbe

Name2 = [121 200 202 207 220 213];       % test add 200 210 here


%% trying from a paper
% Name = [101, 106, 108, 109, 112, 114, 115, 116, 118, 119, 122, 124, 201, 203, 205, 207, 208, 209, 215, 220, 223,230];
% 
% Name = [100, 103, 105, 111, 113, 117, 121, 123, 200, 202, 210, 212, 213, 214, 219, 221, 222, 228, 232, 233, 234];

%%

Name1 = string(Name1);
Name1 = strcat("data\",Name1);

for i = 1:length(Name1)
    data_table_ml_train = creating_actual_ml_table(data_table_ml_train, Name1(i));
end



Name2 = string(Name2);
Name2 = strcat("data\",Name2);

for i = 1:length(Name2)
    data_table_ml_test = creating_actual_ml_table(data_table_ml_test, Name2(i));
end


