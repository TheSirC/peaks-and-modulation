function [ S, upper_enveloppe ] = enveloppe_spectre( signal, Ns, fc )
%ENVELOPPE_SPECTRE Function sending back the spectre of the input signal
%   signal are y-values of the signal
%   Ns is the number of points between each peaks
%   fc is the cutoff frequency for the PLOTTING

vars = fieldnames(signal); % Retrieving the names of the cells
S = cell(length(vars{1}),1);
upper_enveloppe = cell(length(vars{1}),1);
for i = 1:length(vars)
    [upper_enveloppe{i},~] = envelope(signal.(vars{i}),Ns,'peak');
    N = size(signal.(vars{i})(:,2),1);% Number of samples
    fs = 1/abs(signal.(vars{i})(2,1)-signal.(vars{i})(1,1)); % Sampling frequency
    S{i} = abs(fftshift(fft(signal.(vars{i})(:,2)'))/size(signal.(vars{i})(:,2),1));
    dF = fs/N;
    f = -fs/2:dF:fs/2-dF; % Frequencies
    figure; plot(f,S{i}); % Plotting spectrum
    xlim([0,fc])
    xlabel('f (in Hz)')
    ylabel('|S(f)|')
end
end

