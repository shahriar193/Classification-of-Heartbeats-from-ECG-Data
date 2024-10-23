clear;

Name = "data\119";




data_table_ml = cell2table(cell(0,9), 'VariableNames', {'postRR_1', 'preRR_1', 'Qpeaks_1', 'Rpeaks_1', 'Speaks_1', 'QRSinterval_1', 'QR_peak_distance_1','QRS_triangular_area_1', 'beat_type_2'});


% ecgsigs = load("data\119m.mat");
% s = ecgsigs.val(1,:);
% 
% s = s./200;

% [Rlocs, preRR, postRR, Qpeaks, Rpeaks, Speaks, QRSinterval, QR_peak_distance, QRS_triangular_area, ecgsig] = Rdetection_wavelet(Name);
% 
% [beat_sample, beat_type] = Annotation_reader(Name);
% [Rlocs_1, preRR_1, postRR_1, Qpeaks_1, Rpeaks_1, Speaks_1, QRSinterval_1, QR_peak_distance_1 , beat_sample_1,beat_type_1] = beat_synchronization(Rlocs, preRR, postRR, Qpeaks, Rpeaks, Speaks, QRSinterval, QR_peak_distance, QRS_triangular_area, beat_sample, beat_type);
% [beat_type_2] = beat_categorization_4(beat_type_1);
% 

[Rlocs, preRR, postRR, Qpeaks, Rpeaks, Speaks, QRSinterval, QR_peak_distance, QRS_triangular_area] = Rdetection_wavelet(Name);

[beat_sample_1, beat_type_1] = Annotation_reader(Name);

[Rlocs_1, preRR_1, postRR_1, Qpeaks_1, Rpeaks_1, Speaks_1, QRSinterval_1, QR_peak_distance_1 ,QRS_triangular_area_1,  beat_sample_1,beat_type_1] = beat_synchronization(Rlocs, preRR, postRR, Qpeaks, Rpeaks, Speaks, QRSinterval, QR_peak_distance, QRS_triangular_area, beat_sample_1, beat_type_1);

% [beat_type_2] = beat_categorization_4(beat_type_1);

% [data_table] = table_creationclear(preRR_1, postRR_1, Qpeaks_1, Rpeaks_1, Speaks_1, QRSinterval_1, QR_peak_distance_1 , beat_type_2);

[data_table] = table_creation_alt1(preRR_1, postRR_1, Qpeaks_1, Rpeaks_1, Speaks_1, QRSinterval_1, QR_peak_distance_1 , QRS_triangular_area_1, beat_type_1);

[data_table_ml] = table_edition_ml(data_table, data_table_ml);









% n = 1:length(ecgsig);


%% 
% temp = Rlocs(1)-50 : Rlocs(1) + 50;
% tempR = ecgsig(temp);
% 
% [R , n] = max(tempR);


%% 
% plot(n(42000:44000) , ecgsig(42000:44000));
% hold on;
% scatter(Rlocs(98:104), Rpeaks(98:104));
% hold on;
% scatter(Rlocs(98:104), Speaks(98:104));
% hold on 
% scatter(Rlocs(98:104), Qpeaks(98:104));

%% 
% rloc = 32877;
% temp = ecgsig(rloc -30 : rloc + 30);
% [tempmax tempin] = max(temp);
% tempin = rloc + tempin -31;
% rp = ecgsig(tempin); 
% 
% 
% 
% plot(ecgsig(1:2000));
% hold on
% scatter(Rlocs(1:5), Rpeaks(1:5));