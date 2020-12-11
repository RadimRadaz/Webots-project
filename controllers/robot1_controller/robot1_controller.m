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
camera = wb_robot_get_device('camera');
wb_camera_enable(camera, TIME_STEP);
% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination

%% MAIN ACTIONS
for i = 0:2 %changeable loop
s=43*i;
disp("---------" + newline + "Palette " + (i+1));
  while wb_robot_step(TIME_STEP) ~= -1
    t = wb_robot_get_time();
    vidlice_down;
    throttle(-3,-3,-3,-3);
    if t > 8+s
    throttle(-1,-1,2,2);
    end
    if t > 11.205+s
    throttle(3,3,3,3);
    end
    if t > 17.205+s
    vidlice_up;
    end
    if t > 19.5+s
    throttle(-3,-3,-3,-3);
    end
    if t > 26+s
    throttle(2,2,-1,-1);
    end
    if t > 29.205+s
    throttle(3,3,3,3);
    end
    if t > 37.205+s
    vidlice_down;
    end
    if t> 40+s
    break
    end
  end
  % read the sensors, e.g.:
  %rgb = wb_camera_get_image(camera);
  % Process here sensor data, images, etc.
  % send actuator commands, e.g.:
  % if your code plots some graphics, it needs to flushed like this:
  drawnow;
end

reset = wb_robot_get_time();
while(wb_robot_step(TIME_STEP) ~= -1)
r = wb_robot_get_time()-reset;
throttle(-5,-5,-5,-5);
if r > 15
vidlice_up;
throttle(-10,-10,10,10); %easter egg
kloub1 = wb_robot_get_device('kloub1');
wb_motor_set_velocity(kloub1,10);
wb_motor_set_position(kloub1,randn(1)*(pi/2));
end
end

%%FUNCTIONS
function [] = vidlice_down()
throttle(0,0,0,0)
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

function [] = vidlice_up()
throttle(0,0,0,0)
vidlice = wb_robot_get_device('vidlice');
kloub1 = wb_robot_get_device('kloub1');
kloub2 = wb_robot_get_device('kloub2');

wb_motor_set_velocity(kloub1,0.5);
wb_motor_set_velocity(kloub2,0.5);
wb_motor_set_velocity(vidlice,0.5);

wb_motor_set_position(kloub1,-pi/4);
wb_motor_set_position(kloub2,pi/4);
wb_motor_set_position(vidlice,-pi/13);
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

function [] = turn(FL, BL, FR, BR) %optional
FLwheel = wb_robot_get_device('FLwheel');
FRwheel = wb_robot_get_device('FRwheel');
BLwheel = wb_robot_get_device('BLwheel');
BRwheel = wb_robot_get_device('BRwheel');

wb_motor_set_position(FLwheel, FL*2*pi);
wb_motor_set_position(FRwheel, FR*2*pi);
wb_motor_set_position(BLwheel, BL*2*pi);
wb_motor_set_position(BRwheel, BR*2*pi);
end

% cleanup code goes here: write data to files, etc.
