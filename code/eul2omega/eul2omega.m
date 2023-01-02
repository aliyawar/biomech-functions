function omega = eul2omega(eul,order,sampleRate)

    deltaT = 1/sampleRate;

    R = eul2rotm(eul,order);
    Rdot = gradient(R)/deltaT;

    omegaskew = Rdot*R';

    omega = [omegaskew(3,2,:) omegaskew(1,3,:) omegaskew(2,1,:)];