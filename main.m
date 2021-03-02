%Alex Yeh 3/2/2021
%HT Lab 2

sr=1000;%1000 Hz sample rate

time=30;%30 second samples

%obtains values needed to calibrate accelerometer readings
graphMany(["b_rest.txt","b_flex.txt","b_lift.txt"],3,sr,time,["resr","flex","lift"])