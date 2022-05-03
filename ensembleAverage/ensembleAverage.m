function [ensembleMatrix, actualTime] = ensembleAverage(signal, sampleRate, footOn, footOff, eventsAreTimes)
    
    if footOn(1) > footOff(1)
        footOff = footOff(2:end);
    end
    
    if eventsAreTimes == true
        footOn = floor(sampleRate*footOn);
        footOff = floor(sampleRate*footOff);
    end
    
    strides = [footOn footOff];
    
    ensembleMatrix = zeros(length(strides),101);
    actualTime = zeros(length(strides),101);

    for i = 1:length(strides)
        values = signal(strides(i,1):strides(i,2));
        time = linspace(0,100,length(values));
        samplePoints = 0:1:100;
        ensembleMatrix(i,:) = interp1(time,values,samplePoints,'spline');
        actualTime(i,:) = (samplePoints/100).*length(values)/sampleRate;
    end