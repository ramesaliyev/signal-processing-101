clc
clear
close

% Get path of script file to work with relative paths.
scriptfile = mfilename('fullpath');
[scriptpath,~,~] = fileparts(scriptfile);

% Our sampling frequency.
fs = 4000;

% DTMF frequencies.
rows = [697, 770, 852, 941];
cols = [1209, 1336, 1477, 1633];

% KeyName-(FrequencySum) HashMap to findout key names from frequencies.
Keys = containers.Map(cat(2, cols + rows(1), cols + rows(2), cols + rows(3), cols + rows(4)), ...
    {'1', '2', '3', 'A', '4', '5', '6', 'B', '7', '8', '9', 'C', '*', '0', '#', 'D'});

% Files to process.
filespath = "fs4kHz"; % examples | fs4kHz
files = {dir(fullfile(scriptpath, filespath, '*.data')).name};
filecount = length(files);

% Data to use for table.
keys = strings(filecount, 1);
rowfreqs = zeros(filecount, 1);
colfreqs = zeros(filecount, 1);

% Loop every file.
i = 1;
for file = files
    filename = file{1};
    filepath = fullfile(scriptpath, filespath, filename);
    
    data = readmatrix(filepath, 'FileType', 'text');
    freqs = analyze(data, fs);
    dtmfs = arrayfun(@(x) findDTMF(x, rows, cols), freqs);
    
    keys(i) = Keys(sum(dtmfs));
    rowfreqs(i) = dtmfs(1);
    colfreqs(i) = dtmfs(2);
    
    i = i + 1;
end

disp(table(keys, rowfreqs, colfreqs, 'RowNames', files, 'VariableNames', {'Keys', 'Row Freqs', 'Col Freqs'}));

% Analyze data on frequency domain and get frequencies with high amplitudes.
function freqs = analyze(data, fs)
   dft = fft(data);
   amplitudes = abs(dft);
   len = length(amplitudes);
   
   [~, locs] = findpeaks(amplitudes, 'Threshold', 1);
   freqcount = length(locs);
   locs = locs(1:freqcount/2);
   
   freqs = ((fs / 2) .* locs) / (len / 2);
end

% Findout exact DTMF from given frequency.
function dtmf = findDTMF(freq, rows, cols)
    dtmfs = cat(2, rows, cols);
    distances = abs(dtmfs - freq);
    [~, indexOfNearest] = min(distances);
    
    dtmf = dtmfs(indexOfNearest);
end