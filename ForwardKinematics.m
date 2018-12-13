%% DH Parameter Table Definition

function Tfinal = ForwardKinematics(theta,side)
theta = num2cell(theta);
[theta_1, theta_2, theta_3, theta_4, theta_5, theta_6, theta_7] = deal(theta{:});
    
    
% Defining the DH parameter table, with values.
%       theta       d       a       alpha
DH_L=[    0       0.690   0.126    -pi/2
          0       0.226     0       pi/2
        theta_1  -0.245     0       pi/2
         pi/2    -0.110     0       pi/2
        theta_2     0    -0.016     pi/2
        theta_3   0.306   0.009    -pi/2
        theta_4     0    -0.009     pi/2
        theta_5   0.300     0      -pi/2
        theta_6     0       0       pi/2
        theta_7   0.300      0         0];

    %% please check
DH_R=[    0       0.690   0.126     pi/2
          0       0.226     0      -pi/2
        theta_1  -0.245     0       pi/2
         pi/2    -0.110     0       pi/2
        theta_2     0    -0.016     pi/2
        theta_3   0.306   0.009    -pi/2
        theta_4     0    -0.009     pi/2
        theta_5   0.300     0      -pi/2
        theta_6     0       0       pi/2
        theta_7   0.300      0         0];
    
if side == 0
    DH = DH_L;
else
    DH = DH_R;
end

% Homogeneous Transformation Matrix Calculation
Tfinal = TransformationMatrixMultiplication(DH);
end
