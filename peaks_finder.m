function [ peaks_signal_x, peaks_signal_y ] = peaks_finder( signal, distance )
%PEAKS_FINDER Wrapper aroun matlab native function
%   signal Cell (Matlab data structure) containing the signal you want to find the peaks of
%   distance Expected temporal distance between the peaks
%   peaks_signal_* Output of the function in form of a cell

vars = fieldnames(signal); % Retrieving the names of the cells
% Initialization of the peaks holder variables (for speed purposes)
peaks_signal_x = cell(length(vars{1}),1); 
peaks_signal_y = cell(length(vars{1}),1);
for i = 1:length(vars)
    % Finding the location of the peaks (both X and Y)
    [peaks_signal_y{i},peaks_signal_x{i}] = findpeaks(signal.(vars{i})(:,2),signal.(vars{i})(:,1),'MinPeakDistance',distance);
    % Plotting the signal the peaks found
    figure; plot(signal.(vars{i})(:,1),signal.(vars{i})(:,2),peaks_signal_x{i},peaks_signal_y{i},'v');
end
end

