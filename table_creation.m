function [data_table] = table_creation(preRR_1, postRR_1, Qpeaks_1, Rpeaks_1, Speaks_1, QRSinterval_1, QR_peak_distance_1 ,dct_cof_, beat_type_2)


postRR_1;
preRR_1;
Qpeaks_1;
Rpeaks_1;
Speaks_1;
QRSinterval_1;
QR_peak_distance_1;
beat_type_2;
dct_cof_;

beat_type_2 = string(beat_type_2);

%%
postRR_1 = postRR_1';
preRR_1 = preRR_1';
Qpeaks_1 = Qpeaks_1';
Rpeaks_1 = Rpeaks_1';
Speaks_1 = Speaks_1';
QRSinterval_1 = QRSinterval_1';
QR_peak_distance_1 = QR_peak_distance_1';
beat_type_2 = beat_type_2';

%% dct cof 
dct_cof_1 = dct_cof_(:,1);
dct_cof_2 = dct_cof_(:,2);
dct_cof_3 = dct_cof_(:,3);
dct_cof_4 = dct_cof_(:,4);
dct_cof_5 = dct_cof_(:,5);
dct_cof_6 = dct_cof_(:,6);
dct_cof_7 = dct_cof_(:,7);
dct_cof_8 = dct_cof_(:,8);
dct_cof_9 = dct_cof_(:,9);
dct_cof_10 = dct_cof_(:,10);
dct_cof_11 = dct_cof_(:,11);
dct_cof_12 = dct_cof_(:,12);
dct_cof_13 = dct_cof_(:,13);
dct_cof_14 = dct_cof_(:,14);
 






%% 
data_table = array2table([postRR_1, preRR_1, Qpeaks_1, Rpeaks_1, Speaks_1, QRSinterval_1, QR_peak_distance_1, dct_cof_1, dct_cof_2, dct_cof_3, dct_cof_4, dct_cof_5, dct_cof_6, dct_cof_7, dct_cof_8, dct_cof_9, dct_cof_10, dct_cof_11, dct_cof_12, dct_cof_13, dct_cof_14, beat_type_2], "VariableNames", {'postRR_1', 'preRR_1', 'Qpeaks_1', 'Rpeaks_1', 'Speaks_1', 'QRSinterval_1', 'QR_peak_distance_1', 'dct_cof_1', 'dct_cof_2', 'dct_cof_3', 'dct_cof_4', 'dct_cof_5', 'dct_cof_6', 'dct_cof_7', 'dct_cof_8', 'dct_cof_9', 'dct_cof_10', 'dct_cof_11', 'dct_cof_12' 'dct_cof_13', 'dct_cof_14', 'beat_type_2'});

data_table.postRR_1 = double(data_table.postRR_1);
data_table.preRR_1 = double(data_table.preRR_1);
data_table.Qpeaks_1 = double(data_table.Qpeaks_1);
data_table.Rpeaks_1 = double(data_table.Rpeaks_1);
data_table.Speaks_1 = double(data_table.Speaks_1);
data_table.QRSinterval_1 = double(data_table.QRSinterval_1);
data_table.QR_peak_distance_1 = double(data_table.QR_peak_distance_1);

% dct coefficients
data_table.dct_cof_1 = double(data_table.dct_cof_1);
data_table.dct_cof_2 = double(data_table.dct_cof_2);
data_table.dct_cof_3 = double(data_table.dct_cof_3);
data_table.dct_cof_4 = double(data_table.dct_cof_4);
data_table.dct_cof_5 = double(data_table.dct_cof_5);
data_table.dct_cof_6 = double(data_table.dct_cof_6);
data_table.dct_cof_7 = double(data_table.dct_cof_7);
data_table.dct_cof_8 = double(data_table.dct_cof_8);
data_table.dct_cof_9 = double(data_table.dct_cof_9);
data_table.dct_cof_10 = double(data_table.dct_cof_10);
data_table.dct_cof_11 = double(data_table.dct_cof_11);
data_table.dct_cof_12 = double(data_table.dct_cof_12);
data_table.dct_cof_13 = double(data_table.dct_cof_13);
data_table.dct_cof_14 = double(data_table.dct_cof_14);

data_table.beat_type_2 = categorical(data_table.beat_type_2);

end


