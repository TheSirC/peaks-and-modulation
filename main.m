%% Example usage of the function
% The parameters in order : data points, expected temporal distance between
% the peaks, number of points between each peaks, cutoff frequency for the PLOTTING
tic
[short_peaks_x, short_peaks_y, S, enveloppe, f] = peaks_and_spectrum(load('long1osc_mat.mat'),5e-9,1e4,200e6);
toc