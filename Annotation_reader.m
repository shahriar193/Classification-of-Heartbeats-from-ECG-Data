function [beat_sample_1, beat_type_1] = Annotation_reader(Name)



%fid = fopen("E:\3-1\lab 312\Project\codes\arrhythmia-ecg-analysis-pds-master\arrhythmia-ecg-analysis-pds-master\Code\data\119m.txt", "rt");

%Name = "102" ;

annotationName = strcat(Name, 'annotations.txt');
fid = fopen(annotationName, 'rt');
annotationsEcg = textscan(fid, '%*d:%*f %d %c %*d %*d %*d %*s', 'HeaderLines', 1, 'CollectOutput', 1);
fclose(fid);
% annotationsEcg = readAnnotationsFFFFFFFFFF("E:\3-1\lab 312\Project\codes\arrhythmia-ecg-analysis-pds-master\arrhythmia-ecg-analysis-pds-master\Code\data\119m");

beat_type = annotationsEcg{1,2};
beat_sample = annotationsEcg{1,1};
%beat_type  = beat_type';
beat_type = cellstr(beat_type);
beat_type = categorical(beat_type);
%beat_type = beat_type';
%beats = (beat_type);
%beats = beats(beats~=+);
%beats  = beats;
% for i = 1:length(beats)
%     if beats(i) == +
%         beat
%beats = beat_type ~= +;
% beat_type = beat_type(beat_type ~= "+");
% beat_sample = beat_sample(beat_type ~= "+");

beat_type_5 = beat_type(beat_type ~= "+" & beat_type~="~"  & beat_type~="|" );
beat_sample_5 = beat_sample(beat_type ~= "+" & beat_type~="~"  & beat_type~="|" );

beat_type = beat_type_5;
beat_sample = beat_sample_5;


beat_type_1 = zeros(1,length(beat_type));
beat_type_1 = categorical(beat_type_1);

beat_sample_2 = zeros(1,length(beat_type));

for i = 1:length(beat_type_1)
    if beat_type(i) == "N" | beat_type(i) == "L" | beat_type(i) == "R" | beat_type(i) == "e" | beat_type(i) == "j"
        beat_type_1(i) = "N" ;
    elseif beat_type(i) == "A" | beat_type(i) == "a" | beat_type(i) == "J" | beat_type(i) == "S"
        beat_type_1(i) = "S";
    elseif beat_type(i) == "V" | beat_type(i) == "E"  
        beat_type_1(i) = "V";
    elseif beat_type(i) == "F"
        beat_type_1(i) = "F";
    else 
        beat_type_1(i) = "Q";
    end
end

% deleting Q beats
beat_type_5 = beat_type_1(beat_type_1 ~= "Q");
beat_sample_5 = beat_sample_5(beat_type_1 ~= "Q");

beat_type_1 = beat_type_5;
beat_sample_1 = beat_sample_5;


% unknown beats { ! ,x ,[ ,] , |, " }  


end