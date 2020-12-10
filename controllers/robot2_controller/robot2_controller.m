% MATLAB controller for Webots
% File:          robot2_controller.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
%  motor = wb_robot_get_device('motor');
sensor = wb_robot_get_device('ds');
flag = wb_robot_get_device('flag');
wb_distance_sensor_enable(sensor, TIME_STEP);
% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1

  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);
  % Process here sensor data, images, etc.
actual_dist = wb_distance_sensor_get_value(sensor);
if actual_dist < 0.6
  wb_motor_set_velocity(flag, 5);
  wb_motor_set_position(flag, 0);
else
  wb_motor_set_velocity(flag, 5);
  wb_motor_set_position(flag, -pi/2.01);
end
  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
