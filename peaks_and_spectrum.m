function [ peaks_x, peaks_y, S, enveloppe, f] = peaks_and_spectrum( matrix, distance, Ns, fc)
%peaks_and_spectrum Wrapper routine for both finding peaks, enveloppe and spectrum
%   distance Expected temporal distance between the peaks
%   Ns is the number of points between each peaks
%   fc is the cutoff frequency for the PLOTTING
%   peaks_* Output of the function in form of a cell
%% Finding the peaks
[peaks_x, peaks_y] = peaks_finder(matrix, distance);
num_outputs = size(peaks_x,1);
peaks = cell(num_outputs,1);
for i = 1:num_outputs
    for p = 1:size(peaks_x{i},1)
        peaks{i}(:,1) = peaks_x{i};
        peaks{i}(:,2) = peaks_y{i};
    end
end
%% Finding the amplitude modulation
[S, enveloppe, f] = enveloppe_spectre(peaks, Ns, fc);
S = vertcat(f,S);
end