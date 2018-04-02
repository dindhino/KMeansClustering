% Nama : Dindin Dhino Alamsyah
% NIM  : 1301144360

close all;
clear;
clc;

% soal a
% load data
dataset = load('Aggregation.csv');
% visualisasi data dalam 1 warna
figure;
scatter(dataset(:,1), dataset(:,2));
xlabel('Atribut 1');
ylabel('Atribut 2');
title('Soal a');

% soal b
% visualisasi data sesuai label
figure;
gscatter(dataset(:,1), dataset(:,2), dataset(:,3));
xlabel('Atribut 1');
ylabel('Atribut 2');
title('Soal b');

% soal d
% run kmeans dengan random centroid dari semua data
k = size(unique(dataset(:,3)),1);
indeks = randperm(size(dataset,1));
centroid = dataset(indeks(1:k),1:2);
[centroid, label] = kmeans(dataset(:,1:2), centroid);
% visualisasi hasil dari soal d
figure;
gscatter(dataset(:,1), dataset(:,2), label);
xlabel('Atribut 1');
ylabel('Atribut 2');
title('Visualisasi hasil dari soal d');
hold on;
scatter(centroid(:,1), centroid(:,2), 50 , '+');
hold off;

% soal f
% run kmeans dengan random centroid dari masing2 label
centroid = zeros(k,2);
for i=1:k
    datapercentroid = dataset(dataset(:,3)==i,1:2);
    indeks = randi(size(datapercentroid,1),1);
    centroid(i,:) = datapercentroid(indeks,:);
end
[centroid, label] = kmeans(dataset(:,1:2), centroid);
% visualisasi hasil dari soal f
figure;
gscatter(dataset(:,1), dataset(:,2), label);
xlabel('Atribut 1');
ylabel('Atribut 2');
title('Visualisasi hasil dari soal f');
hold on;
scatter(centroid(:,1), centroid(:,2), 50 , '+');
hold off;