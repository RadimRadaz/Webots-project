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

wb_motor_set_position(FLwheel, Inf);
wb_motor_set_position(FRwheel, Inf);
wb_motor_set_position(BLwheel, Inf);
wb_motor_set_position(BRwheel, Inf);
throttle(1,1,1,1,3)
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

function [] = throttle(FL,FR,BL,BR, timer)
start = wb_robot_get_time();
endtime = 0;
FLwheel = wb_robot_get_device('FLwheel');
FRwheel = wb_robot_get_device('FRwheel');
BLwheel = wb_robot_get_device('BLwheel');
BRwheel = wb_robot_get_device('BRwheel');

while((endtime - start) <= timer)
wb_motor_set_velocity(FLwheel, FL);
wb_motor_set_velocity(FRwheel, FR);
wb_motor_set_velocity(BRwheel, BR);
wb_motor_set_velocity(BLwheel, BL);
endtime = wb_robot_get_time();
end
wb_motor_set_velocity(FLwheel, 0);
wb_motor_set_velocity(FRwheel, 0);
wb_motor_set_velocity(BRwheel, 0);
wb_motor_set_velocity(BLwheel, 0);
pause(1)
end
% cleanup code goes here: write data to files, etc.
