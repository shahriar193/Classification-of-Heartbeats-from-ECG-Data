function [data_table_ml] = creating_actual_ml_table(data_table_ml, Name)


% data_table_ml = cell2table(cell(0,8), 'VariableNames', {'postRR_1', 'preRR_1', 'Qpeaks_1', 'Rpeaks_1', 'Speaks_1', 'QRSinterval_1', 'QR_peak_distance_1', 'beat_type_2'});

% Name = "data\102" ;

[Rlocs, preRR, postRR, Qpeaks, Rpeaks, Speaks, QRSinterval, QR_peak_distance, QRS_triangular_area] = Rdetection_wavelet(Name);

[beat_sample_1, beat_type_1] = Annotation_reader(Name);

[Rlocs_1, preRR_1, postRR_1, Qpeaks_1, Rpeaks_1, Speaks_1, QRSinterval_1, QR_peak_distance_1 ,QRS_triangular_area_1,  beat_sample_1,beat_type_1] = beat_synchronization(Rlocs, preRR, postRR, Qpeaks, Rpeaks, Speaks, QRSinterval, QR_peak_distance, QRS_triangular_area, beat_sample_1, beat_type_1);

% [beat_type_2] = beat_categorization_4(beat_type_1);

% [data_table] = table_creationclear(preRR_1, postRR_1, Qpeaks_1, Rpeaks_1, Speaks_1, QRSinterval_1, QR_peak_distance_1 , beat_type_2);

[data_table] = table_creation_alt1(preRR_1, postRR_1, Qpeaks_1, Rpeaks_1, Speaks_1, QRSinterval_1, QR_peak_distance_1 , QRS_triangular_area_1, beat_type_1);

[data_table_ml] = table_edition_ml(data_table, data_table_ml);


% clearvars -except data_table_ml;

end