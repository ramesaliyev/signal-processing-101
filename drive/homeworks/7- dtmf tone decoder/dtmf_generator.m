scriptfile = mfilename('fullpath');
[scriptpath,~,~] = fileparts(scriptfile);

fs=4000;

row_freqs = [697, 770, 852, 941];
col_freqs = [1209, 1336, 1477, 1633];

% KeyName-(FrequencySum) HashMap to findout key names from frequencies.
Keys = containers.Map(cat(2, cols + rows(1), cols + rows(2), cols + rows(3), cols + rows(4)), ...
    {'1', '2', '3', 'A', '4', '5', '6', 'B', '7', '8', '9', 'C', '*', '0', '#', 'D'});

for rf = row_freqs
    for cf = col_freqs
        orf  = 2 * pi * rf / fs;
        ocf  = 2 * pi * cf / fs;
        tone = zeros(256);
        
        for n = 0:255
            tone(n+1) = sin(orf * n) + sin(ocf * n);
        end
        
        filename = [Keys(rf+cf) '_' num2str(rf) 'x' num2str(cf) '_fs4kHz.data'];
        filepath = fullfile(scriptpath, 'examples', filename);
        file = fopen(filepath, 'w+');
        
        for t = 1:256
            fprintf(file, '%1.2f', tone(t));
            
            if t ~= 256
                fprintf(file, ',');
            end
        end
     
        fclose(file);
    end
end