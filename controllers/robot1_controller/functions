function [] = throttle(FL,FR,BL,BR, time)

wb_motor_set_velocity(FLwheel, FL);
wb_motor_set_velocity(FRwheel, FR);
wb_motor_set_velocity(BRwheel, BR);
wb_motor_set_velocity(BLwheel, BL);
pause(time);

wb_motor_set_velocity(FLwheel, 0);
wb_motor_set_velocity(FRwheel, 0);
wb_motor_set_velocity(BRwheel, 0);
wb_motor_set_velocity(BLwheel, 0);
end