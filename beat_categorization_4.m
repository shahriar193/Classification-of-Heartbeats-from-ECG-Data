function [beat_type_2] = beat_categorization_4(beat_type_1)
beat_type_1;
beat_type_2 = zeros(1,length(beat_type_1));
beat_type_2 = categorical(beat_type_2);

for i = 1:length(beat_type_2)
    if beat_type_1(i) == "N" | beat_type_1(i) == "L" | beat_type_1(i) == "R" | beat_type_1(i) == "e" | beat_type_1(i) == "j"
        beat_type_2(i) = "N" ;
    elseif beat_type_1(i) == "A" | beat_type_1(i) == "a" | beat_type_1(i) == "J" | beat_type_1(i) == "S"
        beat_type_2(i) = "S";
    elseif beat_type_1(i) == "V" | beat_type_1(i) == "E"  
        beat_type_2(i) = "V";
    elseif beat_type_1(i) == "F"
        beat_type_2(i) = "F";
    else 
        beat_type_2(i) = "Q";
    end
end



end

