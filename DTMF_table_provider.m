clc; clear;
f1 = 'char';
f2 = 'first';
f3 = 'second';

DTMF_table(1) = struct(f1, '1', f2, 697, f3, 1209);
DTMF_table(2) = struct(f1, '2', f2, 697, f3, 1336);
DTMF_table(3) = struct(f1, '3', f2, 697, f3, 1477);
DTMF_table(4) = struct(f1, '4', f2, 770, f3, 1209);
DTMF_table(5) = struct(f1, '5', f2, 770, f3, 1336);
DTMF_table(6) = struct(f1, '6', f2, 770, f3, 1477);
DTMF_table(7) = struct(f1, '7', f2, 852, f3, 1209);
DTMF_table(8) = struct(f1, '8', f2, 852, f3, 1336);
DTMF_table(9) = struct(f1, '9', f2, 852, f3, 1477);
DTMF_table(10) = struct(f1, '0', f2, 941, f3, 1336);
DTMF_table(11) = struct(f1, 'A', f2, 697, f3, 1633);
DTMF_table(12) = struct(f1, 'B', f2, 770, f3, 1633);
DTMF_table(13) = struct(f1, 'C', f2, 852, f3, 1633);
DTMF_table(14) = struct(f1, 'D', f2, 941, f3, 1633);
DTMF_table(15) = struct(f1, '*', f2, 941, f3, 1209);
DTMF_table(16) = struct(f1, '#', f2, 941, f3, 1477);

save("DTMF_keypad_f", "DTMF_table");

