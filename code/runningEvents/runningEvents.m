function [frame_on, frame_off, time_on, time_off] = runningEvents(force_z,foot_z, force_sampleRate, camera_sampleRate)


    
    forceThreshold = Fz >= 30;
    forceThreshold = forceThreshold(1:force_sampleRate/camera_sampleRate:end);

    forceThreshold_shift = [forceThreshold(1);forceThreshold(1:end-1)];
    delta = forceThreshold - forceThreshold_shift;
    
    
    force_start = find(delta == 1);
    force_end = find(delta == -1);
    
    if forceThreshold(1) == 1
        force_end = force_end(2:end);
    end
    
    if forceThreshold(end) == 1
        force_start = force_start(1:end-1);
    end
    
    if mean(foot_z(force_start(1):force_end(1))) < mean(foot_z(force_start(2):force_end(2)))
        frame_on = force_start(1:2:end)-1;
        frame_off = force_end(1:2:end)-1;
    else
        frame_on = force_start(2:2:end)-1;
        frame_off = force_end(2:2:end)-1;
    end

time_on = frame_on./camera_sampleRate;
time_off = frame_off./camera_sampleRate;