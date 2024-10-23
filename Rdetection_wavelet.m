function [Rlocs, preRR, postRR, Qpeaks, Rpeaks, Speaks, QRSinterval, QR_peak_distance, QRS_triangular_area, ecgsig] = Rdetection_wavelet(Name)

Name = strcat(Name, 'm.mat');
load(Name);
fs = 360;
ecgsig = val(1,:);
base = 0;
gain = 200;


%ecgsig = ecgsig./200;
%ecgsig = ecgsig(1, 1:1000);
ecgsig = (ecgsig - base)/gain;
t = 1:length(ecgsig);
tx = t./fs;

%low pass filter
b=1/32*[1 0 0 0 0 0 -2 0 0 0 0 0 1];
a=[1 -2 1];
ecgsig = filter(b, a, ecgsig);

% %highpass filter
% b=[-1/32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1/32];
% a=[1 -1];
% ecgsig = filter(b, a, ecgsig);

%derivative base filter
% b=[1/4 1/8 0 -1/8 -1/4];
% a=[1];
%ecgsig = filter(b, a, ecgsig);




wt = modwt(ecgsig, 4, "sym4"); % wavelet transformation
wtrec = zeros(size(wt));

wtrec(3:4, :) = wt(3:4, :);

y = imodwt(wtrec, "sym4");
y2 = y.^2;

avg = mean(y2);

%finding R peaks
[Rpeaks Rlocs] = findpeaks(y2.*sign(y), t, "MinPeakHeight", 2.5*avg, "MinPeakDistance", 50);

Rlocs_ = Rlocs;     % storing Rlocs and Rpeaks in a new variable
Rpeaks_ = Rpeaks;

Rlocs = Rlocs(3:end-2); % First two and last two Rlocs create problems so removing those
Rpeaks = Rpeaks(3:end-2);


% making sure R peaks are right
for i = 1:length(Rlocs)
    temp = ecgsig(Rlocs(i) - 80 : Rlocs(i) + 80);
    [tempmax tempin] = max(temp);
    Rlocs(i) = Rlocs(i) + tempin - 81;
end

Rpeaks = ecgsig(Rlocs);


% Rlocs_(2:end-1) = Rlocs;       % Rlocs_ is now contain good values except first and last
% Rpeaks_(2:end-1) = Rpeaks;

% RR interval
for i = 1:length(Rpeaks)
    if i>1 %pre RR
        preRR(i) = Rlocs(i) - Rlocs(i-1);
    else
        preRR(i) = Rlocs(i+1) - Rlocs(i);
    end

    if i<length(Rpeaks) % post RR
        postRR(i) = Rlocs(i+1) - Rlocs(i);
    else
        postRR(i) = Rlocs(i) - Rlocs(i-1);
    end

end

% QS detection and interval
for i = 1:length(Rpeaks)
    temp1 = ecgsig(Rlocs(i):Rlocs(i) + 40);
    temp2 = ecgsig(Rlocs(i) - 40 :Rlocs(i));   % 100 deya silo

    [tempmin1 tempin1] = min(temp1);
    [tempmin2 tempin2] = min(temp2);
    Qpeaks(i) = tempmin2;
    Qlocs(i) = Rlocs(i) + tempin2 - 41;   %101 chilo
    Speaks(i) = tempmin1;
    Slocs(i) = Rlocs(i) + tempin1 - 1;


end

QRSinterval = Slocs - Qlocs;
QR_peak_distance = Speaks - Qpeaks;



% PS detection
% Plocs = zeros(1,length(Rlocs));
% Tlocs =  zeros(1,length(Rlocs));
% Ppeaks =  zeros(1,length(Rlocs));
% Tpeaks =  zeros(1,length(Rlocs));

% for i = 1:length(Rlocs)
%     temp_P = ecgsig(Qlocs(i) - 100: Qlocs - 10);
%     [tempmax, tempin] = max(temp_P);
%     Plocs(i) = Qlocs(i) + tempin - 101;
%     Ppeaks(i) = tempmax;
% 
%     temp_T = ecgsig(Slocs(i) + 10: Slocs(i) + 150);
%     [Tpeaks(i) Tlocs(i)] = max(temp_T);
%     Tlocs(i) = Slocs(i) + 10 + Tlocs(i);
% end
% 
% % PQ and TS interval
% PQinterval = Qlocs - Plocs;
% STinterval = Tlocs - Slocs;


% QRS triangular area

for i = 1:length(Rlocs)
QRS_triangular_area(i) = polyarea([Qlocs(i), Rlocs(i), Slocs(i)], [Qpeaks(i), Rpeaks(i), Speaks(i)]);

end













% Discreet cosine transformation

% for i=2:(length(Rpeaks_)-1)
%     minint = (Rlocs_(i) - Rlocs_(i-1))/2 ;
%     maxint = (Rlocs_(i+1) - Rlocs_(i)) / 2;
% %     Rbeat_interval_temp = Rlocs_(i) - minint : Rlocs_(i) + maxint;
% %     Beats_temp = ecgsig(Rbeat_interval_temp);
% %     dct_cof_temp = Beats_temp;
% %     Rbeat_interval(i-1,:) = Rlocs_(i) - 120 : Rlocs_(i) + 120;
% %     Beats(i-1, :) = ecgsig(Rbeat_interval(i-1, :));
% %     dct_cof_temp = dct(Beats(i-1, :));
% %     dct_cof(i-1,:) = dct_cof_temp(2:15);
% 
%       temp01 = Rlocs_(i) - 100 : Rlocs_(i) + 100;
%       temp02 = ecgsig(temp01);
% 
%       dct_cof_temp = dct(temp02);
%       dct_cof(i-1,:) = dct_cof_temp(2:15);
% 
% 
% end











% taking ratio values by dividing absolute average

preRR = preRR./ (mean(abs(preRR)));
postRR = postRR ./(mean(abs(postRR)));
Qpeaks = Qpeaks ./(mean(abs(Qpeaks)));
Rpeaks = Rpeaks ./(mean(abs(Rpeaks)));
Speaks = Speaks ./(mean(abs(Speaks)));
QRSinterval = QRSinterval ./(mean(abs(QRSinterval)));
QR_peak_distance = QR_peak_distance ./(mean(abs(QR_peak_distance)));
% Ppeaks = Ppeaks ./(mean(abs(Ppeaks)));
% Tpeaks = Tpeaks ./(mean(abs(Tpeaks)));
% PQinterval = PQinterval ./(mean(abs(PQinterval)));
% STinterval = STinterval ./(mean(abs(STinterval)));
QRS_triangular_area = QRS_triangular_area ./(mean(abs(QRS_triangular_area)));















% %plot(t, ecgsig(1,:));
% plot(t(5000:10000), ecgsig(1,5000:10000));
% hold on
% %scatter(Rlocs, Rpeaks);
% scatter(Rlocs(16:30), Rpeaks(16:30));
% %plot(t(1:5000), y(1,1:5000));
% hold on
% scatter(Qlocs(16:30), Qpeaks(16:30), "*")
% hold on
% scatter(Slocs(16:30), Speaks(16:30));
% hold off


end
