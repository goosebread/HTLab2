%Alex Yeh 3/5/2021
%HT Lab 2

sr=1000;%1000 Hz sample rate

time=30;%30 second samples

%part 1
graphMany(["b_rest.txt","b_flex.txt","b_lift.txt"],3,sr,time,["Bicep at Rest","Bicep Flex","Bicep Lift"])

%part 2
graphMany(["t_rest.txt","t_flex.txt","t_pushup.txt","t_wave.txt"],4,sr,time,["Tricep at Rest","Tricep Flex","Tricep Lift","Tricep Wave"])

%part3
graphMany(["e_srp.txt","e_agr.txt"],2,sr,time,["Eyebrow Surprise","Eyebrow Anger"])