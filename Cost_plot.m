function [ output_args ] = Cost_plot( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
close all;
clear all;
clc;
filename = 'Normal_gradient_descent_circle_nonconvex11.txt';
% filename = 'Normal_gradient_descent_circle_minus88.txt';
delimiterIn = ' ';
headerlinesIn = 1;
Old_file = importdata(filename,delimiterIn,headerlinesIn);
A_start_block =Old_file.data(:,1);
B_start_block =Old_file.data(:,2);
Eu_dist_block=Old_file.data(:,3);
plot3(A_start_block ,B_start_block ,Eu_dist_block);
title('Trial Gradient');
axis on;
xlabel('W1');
ylabel('W2');
zlabel('Loss Function')
print('NormalGradient_nonconvex11', '-dpng', '-r300');
% print('NormalGradient_minus88', '-dpng', '-r300');

end

