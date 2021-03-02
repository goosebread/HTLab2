%Alex Yeh 3/2/2021
%HT Lab 2

%plots n sets of data
%Assumes BITalino EMG raw data. Must be modified to support other
%calibration methods

%takes in arrays for dataFiles and titles
%all files must have the same sampling rate and time duration
function graphMany(dataFiles,n,sr,time,titles)
    datamV=zeros(time*sr,n);%time*sr points per set, n sets of data
    for i=1:n
        %open file
        fid=fopen(dataFiles(i));
        
        %loop through file
        r=1;
        while (~feof(fid)&&r<=time*sr)
            txtLine = fgetl(fid);

            %ignore headers that start with '#'
            if ~strncmpi(txtLine,'#',1)
              C=strsplit(txtLine);
              %bitalino raw data on 6th col
              %converts from raw data to mV
              datamV(r,i)=adcTomV(str2double(C(6)));
              r=r+1;
            end
        end
    fclose(fid);
        
    end  
    
    %time in seconds
    time_s = (0:time*sr-1)./sr;
    
    %frequency data
    dataP=fft(datamV);
    
    %time plots
    figure(1)
    hold on
    for i=1:n
        subplot(n,1,i)
        plot(time_s,datamV(:,i))
        xlabel('Time (s)')
        ylabel('Voltage (mV)')
        ylim([-2,2]);
        title(titles(i))
    end
    
    %power spectrum plots
    figure(2)
    hold on
    freq = (0:(time*sr/2))/time;
    for i=1:n
        P1=(dataP(:,i).*conj(dataP(:,i)))/(sr*time);
        
        subplot(n,1,i)
        plot(freq,P1(1:sr*time/2+1))
        xlabel('Frequency (Hz)')
        xlim([0 500]);
        ylim([0,10]);%30,000 for walking
        ylabel('Signal Power')
        title('Power Spectrum')
    end

end