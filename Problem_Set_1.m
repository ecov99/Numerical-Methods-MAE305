% MAE 305 Problem Set 1
% Written by: Ethan Covington

% Solve the nonlinear system
% {x^2 + y -2x = 0.4
% {2y + 3xy -2x^3 = 0

%% Part A Locate roots graphically
clc;clear;
%Graphing equations to locate root
syms x y
fun1 = x^2 + y -2*x - 0.4;
fun2 = 2*y + 3*x*y -2*x^3;
ezplot(fun1,[-1,2.5,-2,2]);
hold on
ezplot(fun2,[-1,2.5,-2,2]);
% 3 roots were located
% starting points for each roots
% (x11,y11) = [-0.55,-1]
v1 = [-0.55,-1];
% (x12,y12) = [0,0]
v2 = [0,0];
% (x13,y13) = [1.5,0]
v3 = [1.5,0];

%% Part B Find approxiate values for roots using Newtons method for systems
tol = 10^-6;
iterations = 20;
%System of nonlinear equations
f = [fun1,fun2];
p1 = My_NewtonSystem(f,v1,tol,iterations)
p2 = My_NewtonSystem(f,v2,tol,iterations)
p3 = My_NewtonSystem(f,v3,tol,iterations)

