% MATLAB controller for Webots
% File:          robot1_controller.m
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
FLwheel = wb_robot_get_device('FLwheel');
FRwheel = wb_robot_get_device('FRwheel');
BLwheel = wb_robot_get_device('BLwheel');
BRwheel = wb_robot_get_device('BRwheel');
throttle_right = [FRwheel, BRwheel];
throttle_left = [FLwheel, BLwheel];
throttle = [throttle_left, throttle_right];

wb_motor_set_position(FLwheel, Inf);
wb_motor_set_position(FRwheel, Inf);
wb_motor_set_position(BLwheel, Inf);
wb_motor_set_position(BRwheel, Inf);
wb_motor_set_velocity(throttle, 0.5);

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1

  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
