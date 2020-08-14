% part1 : to input a string and play the analogous dual tone to each of
% char for 250 ms

clc; clear;
load("DTMF_keypad_f.mat", "DTMF_table");

in = input("input a string constructed from DTMF available chars:\n", 's');

Fs = 16000;
Length = .25;
t = 0 : 1/Fs : Length;
first = 0;
second = 0;

for chr = in
   % first we determine the 2 tones for each of chars     
   if isletter(chr)
      first = DTMF_table(11+(upper(chr)-'A')).first;
      second = DTMF_table(11+(upper(chr)-'A')).second;
   elseif chr == '*'
       first = DTMF_table(15).first;
       second = DTMF_table(15).second;
   elseif chr == '#'
       first = DTMF_table(16).first;
       second = DTMF_table(16).second;
   else
       num = str2num(chr);
       if num > 0
           first = DTMF_table(num).first;
           second = DTMF_table(num).second;
       else
           first = DTMF_table(10).first;
           second = DTMF_table(10).second;
       end
   end
   % then we make two signals with those tones
   x1 = sin(2*pi*first*t);
   x2 = sin(2*pi*second*t);
   % and then play the sum of these signals and wait 250 ms   
   soundsc(x1+x2, Fs)
   pause(.25)
%    disp(chr)
end