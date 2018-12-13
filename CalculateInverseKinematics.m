% defining the bounds for the actuator motors
lower_bound_l = [  -pi/2,  -pi/2,  0,  0, -2.80, -pi/2, -2.80]; 
upper_bound_l = [  0.78,    pi/2,  pi, 2.32, 2.80, pi/2, 2.80];

lower_bound_r = [  -0.78,  -pi/2,  0,  -2.32, -2.80, -pi/2, -2.80]; 
upper_bound_r = [   pi/2,    pi/2,  pi, 0, 2.80, pi/2, 2.80];

rng default % reproducible initial point
pub = rospublisher('/dynamics_project_','std_msgs/Float32MultiArray');
msg = rosmessage(pub);

x_last_l = [0 0 0 0 0 0 0];
x_last_r = [0 0 0 0 0 0 0];
    %% subscribe and get side and desired pose
    
quat = [ 1 0 0 0 ];
posi = [ 0.5 ; 0.2 ; 0.5 ];
pose = GetTransformationMatrix(quat,posi);

    
    %% 
while(1)  
    if side == 0
        x_last = x_last_l;
        lower_bound = lower_bound_l;
        upper_bound = upper_bound_l;
    else
        x_last = x_last_r;
        lower_bound = lower_bound_r;
        upper_bound = upper_bound_r;
    end
    
    initial_guess = x_last;

    % solve non-linear constrained equetion with the interior-point method
    x = fmincon(@(x)0,initial_guess,[],[],[],[],lower_bound,upper_bound,@(x)EquetionsVector(x,side,pose))
    
    if side == 0
        x_last_l = x;
    else
        x_last_r = x;
    end
    
    tough_things = [ side, x ];
    
    msg.Data = tough_things;
    send(pub,msg);
end