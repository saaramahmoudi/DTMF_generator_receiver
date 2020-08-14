%part2: to input an audio(DTMF signal) and decode to analogous string
clc; clear; close;

% reading the filepath from the prompt and reading the audiofile
audioName = input("Enter the file path: ", 's');
% audioName = '092AB863s0p.wav';
[tone, Fs] = audioread(audioName);
info = audioinfo(audioName);

load("decode.mat")
% trying to devide the whole voice to envelopes
env = envelope(tone,80,'rms');
[w, s, e] = pulsewidth(env,Fs);
s = [[.001]; s];
e = [s(2); e];
s = round(s * Fs);
e = round(e * Fs);

f = [x , y];
tones = cell(size(s));
for i = 1:size(s)
    tones(i,:) = {tone(s(i):e(i))};
end

for i=1:size(s)
    freq_indices = round(f./Fs*size(tones{i}, 1)) + 1; 
    dft_data = abs(goertzel(tones{i},freq_indices));
    [val, ind] = maxk(dft_data, 2);
    if (ind(1) > ind(2))
       disp(mat(ind(2),ind(1)-4))
    else
       disp(mat(ind(1),ind(2)-4))
    end
    disp("-----------------------")
    
    stem(f,abs(dft_data))
    ax = gca;
    ax.XTick = f;
    xlabel('Frequency (Hz)')
    title('DFT Magnitude')
    
    pause(3);
end
