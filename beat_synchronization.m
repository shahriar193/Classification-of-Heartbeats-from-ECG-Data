function [Rlocs_1, preRR_1, postRR_1, Qpeaks_1, Rpeaks_1, Speaks_1, QRSinterval_1, QR_peak_distance_1 , QRS_triangular_area_1, beat_sample_1,beat_type_1] = beat_synchronization(Rlocs, preRR, postRR, Qpeaks, Rpeaks, Speaks, QRSinterval, QR_peak_distance,QRS_triangular_area, beat_sample_1,  beat_type_1)




Rlocs;
beat_sample = beat_sample_1;
beat_type = beat_type_1;

% j=1;
% for i = 1:length(Rlocs) 
%     tempj = j;
%     if j>length(beat_sample)
%             break
%     end
%     tempindex = Rlocs(i);
%     while j < tempj + 5
%     if beat_sample(j)<= (tempindex - 5) & beat_sample(j) >= (tempindex -40)
%         beat_sample_1(i) = beat_sample(j);
%         beat_type_1(i) = beat_type(j);
%         break;
%     else
%         j = j+1;   
%     end
%     end
%     j = j+1;
% end
beat_sample_1 = zeros(1,length(Rlocs));
beat_type_1 = zeros(1,length(Rlocs));
beat_type_1 = categorical(beat_type_1);

for i = 1:length(Rlocs)
    temp = Rlocs(i);
    for j=1:length(beat_sample)
        if beat_sample(j) >= temp - 30 & beat_sample(j) < temp
            beat_sample_1(i) = beat_sample(j);
            beat_type_1(i) = beat_type(j);
            break;
        end
    end
end

beat_sample_5 = beat_sample_1(beat_sample_1~=0);
beat_type_5 = beat_type_1(beat_sample_1~=0);

beat_sample_1 = beat_sample_5;
beat_type_1 = beat_type_5;


Rlocs_1 = zeros(1,length(beat_sample_1));
postRR_1 = zeros(1,length(beat_sample_1));
preRR_1 = zeros(1,length(beat_sample_1));
% Qlocs_1 = zeros(1,length(beat_sample_1));
Qpeaks_1 = zeros(1,length(beat_sample_1));
QR_peak_distance_1 = zeros(1,length(beat_sample_1));
QRSinterval_1 = zeros(1,length(beat_sample_1));
Rpeaks_1 = zeros(1,length(beat_sample_1));
% Slocs_1 = zeros(1,length(beat_sample_1));
Speaks_1 = zeros(1,length(beat_sample_1));
QRS_triangular_area_1 = zeros(1,length(beat_sample_1));
% dct_cof_ = zeros(length(beat_sample_1), 14);



for i = 1:length(beat_sample_1)
    temp = beat_sample_1(i);
    for j=1:length(Rlocs)
        if Rlocs(j) < temp + 30 & Rlocs(j) > temp
            Rlocs_1(i) = Rlocs(j) ;
            postRR_1(i) = postRR(j);
            preRR_1(i) = preRR(j) ;
            %Qlocs_1(i) = Qlocs(j) ;
            Qpeaks_1(i) = Qpeaks(j) ;
            QR_peak_distance_1(i) = QR_peak_distance(j) ;
            QRSinterval_1(i) = QRSinterval(j) ;
            Rpeaks_1(i) = Rpeaks(j) ;
            %Slocs_1(i) = Slocs(j) ;
            Speaks_1(i) = Speaks(j) ;
%             dct_cof_(i, :) = dct_cof(j, :);
            QRS_triangular_area_1(i) = QRS_triangular_area(j);
            break;
        end
    end
end

Rlocs_1 = Rlocs_1(Rlocs_1~= 0);


end