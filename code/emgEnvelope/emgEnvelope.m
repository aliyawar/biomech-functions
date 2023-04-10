function filteredSignal = emgEnvelope(signal, lowcutoff, highcutoff, sampleRate)

    [highb,higha] = butter(4,highcutoff/(sampleRate/2),'high');
    [lowb,lowa] = butter(4,lowcutoff/(sampleRate/2),'low');
    
    highpassed = filtfilt(highb, higha, signal);
    rectified  = abs(highpassed);
    
    filteredSignal = filtfilt(lowb, lowa, rectified);

end

