function plotAltitudeControl(time_lp, lp_z, lp_vz, dist_z, dist_vz, time_sp, sp_z, sp_vz, time_distance, current_distance, time_input_rc, input_rc, path)
  input_z = (input_rc(:,3)-1500)/500;  %rc roll channel set to 3
  h_alt = figure(3,'Position',[100,450,600,500]);
  subplot(211)
    plot(time_lp, -lp_z,'LineWidth',1.2);
    xlim( [ time_lp(1) time_lp(length(time_lp)) ]);
    ylim( [min(lp_z) 2.5]);
    grid on;
    set (gca, "xminorgrid", "on");  xlabel("Time(sec)");  ylabel("Distance (m)");  title("Position Z");
    hold on;
    plot(time_sp, -sp_z, 'LineWidth',1.5);
    plot(time_distance, current_distance, 'LineWidth',1.5);
    plot(time_input_rc, input_z, 'LineWidth',1);
    [hleg1 hobj1] = legend("Local Z", "Setpoint Z", "Current Distance", "Throttle Input");
    set(hleg1,'position',[0.77 0.77 0.13 0.21])
    hold off;
  subplot(212)
    plot(time_lp, -lp_vz,'LineWidth',1.5);  
    xlabel("Time(sec)");  ylabel("Velocity (m/s)");  title("Velocity Z");
    xlim( [ time_lp(1) time_lp(length(time_lp)) ]);
    grid on;
    set (gca, "xminorgrid", "on");
    hold on;  
    plot(time_sp, -sp_vz,'LineWidth',1.5);
    plot(time_input_rc, input_z, 'LineWidth',1.5);
    legend("LP Vz", "Setpoint Vz", "Throttle");
    hold off;
  saveName = sprintf("%sAltitude_Control.png", path)
  saveas(h_alt,saveName);
endfunction
