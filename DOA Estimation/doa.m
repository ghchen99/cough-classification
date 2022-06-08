% TDOA method   

delays = zeros(1, 8);
sum = 0.0;
sum_sq = 0.0;
sum_rmse = 0.0;
for i=1:20
    [s,Fs] = audioread(sprintf('Recordings/SE/SE%d.wav',i));
    audiowrite(sprintf('Recordings/phase %d_left.wav',i), s(:,1),Fs);
    audiowrite(sprintf('Recordings/phase %d_right.wav',i), s(:,2),Fs);
    x = audioread(sprintf('Recordings/phase %d_left.wav',i));
    y = audioread(sprintf('Recordings/phase %d_right.wav',i));
    delay = finddelay(x,y, 0.1*Fs); % positive delay implies left arrives before right
    sum = sum + delay;
    sum_sq = sum_sq + ((delay-23.6)^2);
end

delays(1) = sum/20;
disp(delay);
sum_rmse = sqrt(sum_sq/20);
disp(sum_rmse)

phase_delays = array2table(delays./Fs,"VariableNames",["Phase 7", "Phase 8", "Phase 9", "Phase 10", ...
    "Phase 11", "Phase 12", "Phase 13", "Phase 14"]);
   
disp(phase_delays); % theoretical max delay is 15.82 / 34300 = 0.00046122448

angles = zeros(1, 8);
angles(1) = delay_to_angle("Phase 7", phase_delays);

phase_angles = array2table(angles,"VariableNames",["Phase 7", "Phase 8", "Phase 9", "Phase 10", ...
    "Phase 11", "Phase 12", "Phase 13", "Phase 14"]);

disp(phase_angles); % theoretical max delay is 15.9 / 34300 = 0.00046355685


function angle = delay_to_angle(string, phase_delays)
    d = phase_delays.(string) * 343; % distance in metres
    d = d * 100; % distance in cm;
    if (d > 15.82)
        d = 15.80;
    elseif (d < -15.82)
        d = -15.80;
    end
    xb = 7.91;
    x = 50;
    y_val = sqrt( (d^2)/4 - (xb^2) + (x^2)*((4*xb^2)/(d^2) - 1) );
    angle = atan(y_val/x);
    angle = rad2deg(angle);
    if (d < 0)
        angle = 180 - angle;
    end
end