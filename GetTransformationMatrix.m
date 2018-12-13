function transformationMatrix = GetTransformationMatrix (quat,pose)
%  rotation of the end-effector
%  quat             =  [ 0.034 0.706 -0.005 0.707 ]; % w x y z
 rotationalMatrix = quat2rotm(quat);
 
%  translation of the end-effector
%  position_csv =csvread('kachra.csv');
%  i = 2;
%  position =  [ position_csv(i,6);position_csv(i,7);position_csv(i,8) ]; % x Y z
%  position = [ 0.267 ; 0.551 ; 0.075 ];
position = pose;
%  last row of the transformation matrix
 constantRow      =  [ 0     0       0       1   ];
 
%  creating the transformation matrix with
 transformationMatrix = [ rotationalMatrix position  ; constantRow ];
end
