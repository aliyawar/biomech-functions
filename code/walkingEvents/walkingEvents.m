function [frame_on, frame_off, time_on, time_off] = walkingEvents(force_z, forceThreshold,force_sampleRate,camera_sampleRate)

    footInContact = force_z >= forceThreshold;
    footInContact = footInContact(1:force_sampleRate/camera_sampleRate:end);

    footInContact_shift = [footInContact(1);footInContact(1:end-1)];
    delta = footInContact - footInContact_shift;
    
    
    force_start = find(delta == 1);
    force_end = find(delta == -1);
    
    if footInContact(1) == 1
        force_end = force_end(2:end);
    end
    
    if footInContact(end) == 1
        force_start = force_start(1:end-1);
    end

    frame_on = force_start-1;
    frame_off = force_end-1;

    time_on = frame_on./camera_sampleRate;
    time_off = frame_off./camera_sampleRate;
