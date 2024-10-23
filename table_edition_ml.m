function [data_table_ml] = table_edition_ml(data_table, data_table_ml)

%data_table_ml = cell2table(cell(0,8), 'VariableNames', {'postRR_1', 'preRR_1', 'Qpeaks_1', 'Rpeaks_1', 'Speaks_1', 'QRSinterval_1', 'QR_peak_distance_1', 'beat_type_2'});

data_table_ml = [data_table_ml; data_table];

end