This repo is a collection of MATLAB functions commonly used in biomechanics and gait analysis data analysis. 

# `Thexton.m`
This function determines the threshold that best discriminates between signal and noise in a measured EMG signal. It is an implementation of the method desribed in 
[Thexton, A.J., 1996.](https://www.sciencedirect.com/science/article/abs/pii/0165027096000040) _A randomisation method for discriminating between signal and noise in recordings of rhythmic electromyographic activity. Journal of neuroscience methods, 66(2), pp.93-98._

## Example
Full wave rectified surface EMG signal from the abductor hallucis muscle of a human running at 0.77 Fr, recorded at 2000 Hz. The noise discriminating threshold found by the code is in red. ![](threshold.png)

# `ensembleAverage.m`
This function splits up continuous locomotion data (Kinetics, Kinematics, EMG etc.) into chunks between user provided heel strike and toe off events, normalizes each step to 100 points, and calculates the mean data over all steps. Events can be specified in seconds from the start of the time series or as frame numbers.
