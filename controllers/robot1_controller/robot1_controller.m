% MATLAB controller for Webots
% File:          robot1_controller.m
% Date:
% Description: brain damage
% Author: 
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64; %ms

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination

%% MAIN ACTIONS
for i = 0:5
s=11*i
  while wb_robot_step(TIME_STEP) ~= -1
    t = wb_robot_get_time()
    throttle(0,0,0,0);
    vidlice_down;

    throttle(1,1,1,1);
    if t>3+s
    vidlice_up;
    end
    if t>5+s
    throttle(0,0,0,0);
    end
    if t>6+s
    vidlice_down;
    end
    if t>8+s
    throttle(-1,-1,-1,-1);
    end
    if t>11+s
    break
    end
  end
  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);
  % Process here sensor data, images, etc.
  % send actuator commands, e.g.:

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;
end

%%FUNCTIONS
function []=vidlice_down()
vidlice = wb_robot_get_device('vidlice');
kloub1 = wb_robot_get_device('kloub1');
kloub2 = wb_robot_get_device('kloub2');

wb_motor_set_velocity(kloub1,1);
wb_motor_set_velocity(kloub2,2);
wb_motor_set_velocity(vidlice,2);


wb_motor_set_position(kloub1,0);
wb_motor_set_position(kloub2,-pi/6);
wb_motor_set_position(vidlice,pi/3);
end

function []=vidlice_up()
vidlice = wb_robot_get_device('vidlice');
kloub1 = wb_robot_get_device('kloub1');
kloub2 = wb_robot_get_device('kloub2');

wb_motor_set_velocity(kloub1,0.5);
wb_motor_set_velocity(kloub2,0.5);
wb_motor_set_velocity(vidlice,0.5);

wb_motor_set_position(kloub1,-pi/4);
wb_motor_set_position(kloub2,pi/4);
wb_motor_set_position(vidlice,0);
end

function [] = throttle(FL, BL, FR, BR)
FLwheel = wb_robot_get_device('FLwheel');
FRwheel = wb_robot_get_device('FRwheel');
BLwheel = wb_robot_get_device('BLwheel');
BRwheel = wb_robot_get_device('BRwheel');

wb_motor_set_position(FLwheel, Inf);
wb_motor_set_position(FRwheel, Inf);
wb_motor_set_position(BLwheel, Inf);
wb_motor_set_position(BRwheel, Inf);

wb_motor_set_velocity(FLwheel, FL);
wb_motor_set_velocity(FRwheel, FR);
wb_motor_set_velocity(BRwheel, BR);
wb_motor_set_velocity(BLwheel, BL);
end

% cleanup code goes here: write data to files, etc.
