function [thresholdValue, thresholds] = thexton(signal, numSteps)

% This function is an implementation of the method desribed in: 
% Thexton, A.J., 1996. A randomisation method for discriminating between signal and noise in 
% recordings of rhythmic electromyographic activity. 
% Journal of neuroscience methods, 66(2), pp.93-98.

% Full wave rectification
signal = abs(signal);

% Pre-allocate arrays
runsSignal = zeros(1,numSteps);
runsRandom = zeros(1,numSteps);
thresholds = zeros(1,numSteps);

% Step increment of thresholds depends on the number of steps
thresholdStep = max(signal)/numSteps;


for i = 1:numSteps
    threshold = thresholdStep*(i-1);
    thresholds(i) = threshold;
    
    % Calculate the number of times sign(signal-threshold)
    % changes. This will be either 2, -2 or 0. 
    % Sum of the absolute value of changes divided by 2 is equal
    % to the number of runs.
    changes = diff(sign(signal - threshold));
    runsSignal(i) = sum(abs(changes))/2;
end

% Randomize the elementns of signal with respect to time
signalp = signal(randperm(length(signal)));

for i = 1:numSteps
    threshold = thresholdStep*(i-1);
    changes = diff(sign(signalp - threshold));
    runsRandom(i) = sum(abs(changes))/2;
end

% The optimal threshold is where the signal and random runs are
% maximally different
[~,idx] = max(runsRandom - runsSignal);
thresholdValue = thresholds(idx);