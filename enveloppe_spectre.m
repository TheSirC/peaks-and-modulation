function [ S, upper_enveloppe, f ] = enveloppe_spectre( signal, Ns, fc )
%ENVELOPPE_SPECTRE Function sending back the spectre of the input signal
%   signal are y-values of the signal
%   Ns is the number of points between each peaks
%   fc is the cutoff frequency for the PLOTTING

vars = size(signal); % Retrieving the names of the cells
N = cell(length(vars(1,1)),1); 
S = cell(length(vars(1,1)),1);
f = cell(length(vars(1,1)),1);
fs = cell(length(vars(1,1)),1);
dF = cell(length(vars(1,1)),1);

upper_enveloppe = cell(vars(1),1);
for i = 1:vars(1)
    % Calculating the enveloppe
    [upper_enveloppe{i},~] = envelope(signal{i}(:,2),Ns,'peak'); % Put a variable on the "~" to get the lower enveloppe
    upper_enveloppe{i}(:,1) = signal{i}(:,1); % Retrieving the timestamps of the peaks
    upper_enveloppe{i}(:,2) = upper_enveloppe{i};
    
    
    % Calculating the FFT to get the frequecy of the modulation
    N{i} = size(signal{i}(:,1),1);% Number of samples
    fs{i} = 1/abs(signal{i}(2,1)-signal{i}(1,1)); % Sampling frequency
    S{i} = abs(fftshift(fft(signal{i}(:,2)'))/size(signal{i}(:,2),1));
    dF{i} = fs{i}/N{i};
    f{i} = -fs{i}/2:dF{i}:fs{i}/2-dF{i}; % Frequencies
    figure; plot(f{i},S{i}); % Plotting spectrum
    xlim([0,fc])
    xlabel('f (in Hz)')
    ylabel('|S(f)|')
end
end

