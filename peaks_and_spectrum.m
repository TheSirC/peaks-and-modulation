function [ peaks_x, peaks_y, S, enveloppe] = peaks_and_spectrum( matrix, distance, Ns, fc)
%peaks_and_spectrum Wrapper routine for both finding peaks, enveloppe and spectrum
%   distance Expected temporal distance between the peaks
%   Ns is the number of points between each peaks
%   fc is the cutoff frequency for the PLOTTING
%   peaks_* Output of the function in form of a cell
%% Finding the peaks
[peaks_x, peaks_y] = peaks_finder(matrix, distance);

%% Finding the amplitude modulation
[S, enveloppe]= enveloppe_spectre(matrix, Ns, fc);

end

