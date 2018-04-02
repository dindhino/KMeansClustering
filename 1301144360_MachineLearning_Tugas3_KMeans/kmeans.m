% Nama : Dindin Dhino Alamsyah
% NIM  : 1301144360
function [centroid, label] = kmeans(data, centroid)
    label = zeros(size(data,1),1);
    %loop sampai centroidnya ga berubah
    while true
%         hitung tiap data deketnya ke centroid yang mana
        for i = 1:size(data,1)
           for j = 1:size(centroid,1)
%                euclidean distance
               jarak(j) = sqrt((centroid(j,1)-data(i,1))^2+(centroid(j,2)-data(i,2))^2);
           end
           [~, label(i)] = min(jarak);
        end
        temp_centroid = centroid;
%         update centroid
        centroid = objsse(data, label, centroid);
        if temp_centroid == centroid
            break;
        end
    end
end