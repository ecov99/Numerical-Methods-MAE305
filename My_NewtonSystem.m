function [v] = My_NewtonSystem(f,vi,tol,iteration)
%
% My_NewtonSystem uses Newton's method for solving a system of two
% nonlinear equations
%
% [p] = My_NewtonSystem(f,v) where
%   f is matrix of two nonlinear equations
%   vi is intial points near root
%   tol is accepted tolerance
%   iteration is number of iterations for finding root
%
%   v is the matrix for x and y cordinate of root

%% arguments input logic
if nargin < 3 || isempty(tol)
    tol = 10^-6;
end
if nargin < 4 || isempty(iteration)
    iteration = 20;
end
%% Newton's Method for nonlinear systems
v = vi;
syms x y
J = matlabFunction(jacobian(f,[x y]));
F = matlabFunction(f);
for k = 1:iteration
    J_evaluated = J(v(1),v(2));
    F_evaluated = -F(v(1),v(2))'; %Tranposed to turn matrix into 2x1
    %Determining if value is within tolerance
    if norm(F_evaluated,2) < tol
       break;
    end
    % Determine if root is found
    if det(J_evaluated) ==0
        break;
    end
    %Calculating delta v
    delta_v = J_evaluated\F_evaluated;
    %Calcuating new point
    for n = 1:2
        v(n) = v(n)+delta_v(n);
    end
end

