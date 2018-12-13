function [c,ceq] = EquetionsVector(x,side,pose)

c = []; % no nonlinear inequality
ceq = InverseKinematics(x,side,pose); % the fsolve objective is fmincon constraints
end