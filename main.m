%% Example usage of the function
% The parameters in order : data points, expected temporal distance between
% the peaks, number of points between each peaks, cutoff frequency for the PLOTTING
[short_peaks_x, short_peaks_y, S, enveloppe] = peaks_and_spectrum(load('shortosc1_mat.mat'),5e-9,1e4,200e6);
